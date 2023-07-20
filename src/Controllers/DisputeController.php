<?php

declare(strict_types=1);

namespace Invo\Controllers;

use Invo\Forms\ProductsForm;
use Invo\Models\Products;
use Invo\Models\Dispute;
use Invo\Models\Users;
use Phalcon\Db\RawValue;
use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Manager;
use Phalcon\Mvc\Model\Query;

/**
 * DisputeController (Dispute Controller)
 */

class DisputeController extends ControllerBase
{

    // Set public variables
    public $blockchain;
    public $address;
    public $type;
    public $reason;
    public $user_id;
    public $ip_address;
    public $describe_dispute;
    public $date_submit;
    public $resolution;
    public $id;

    /**
     * Index initializer
    */
    public function initialize()
    {
        parent::initialize();

        $this->tag->setTitle('Submit a dispute report for an address already reported.');
    }

    /**
     * Index Action
    */
    public function indexAction(): void
    {

        // if no post
        if (!$this->request->isPost()) {

            // do nothing 

        // If a new address is submitted via POST
        } else {

            // Grab the data from the post variables
            $blockchain = $this->request->getPost('blockchain', 'string');
            $address = $this->request->getPost('address', ['string', 'striptags', 'trim']);
            $type = $this->request->getPost('type', 'string');
            $reason = $this->request->getPost('reason', 'string');
            $describe_dispute = $this->request->getPost('describe_dispute', 'string');

            // Proceed if it is an ADDRESS they are submitting
            if ($type=="disputeAddress"){ 

                // Validate the google reCaptcha response
                $remoteIp = $_SERVER['REMOTE_ADDR'];
                $gRecaptchaResponse = $this->request->getPost('g-recaptcha-response');
                $secret = '6Lc5CMEcAAAAAF-1Ornp3orYV5jdZEjygb1YoHMy';
                $recaptcha = new \ReCaptcha\ReCaptcha($secret);
                $resp = $recaptcha->setExpectedHostname('scanblocks.io')
                                  ->setScoreThreshold(0.5)
                                  ->verify($gRecaptchaResponse, $remoteIp);

                if ($resp->isSuccess()) {

                    // google reCaptcha verified!

                    // Detect if we know the user or not, and if so set their session info
                    if ($this->session->get('auth')){

                        // Get users session info
                        $auth = $this->session->get('auth');

                        // Define the user variable
                        $user = Users::findFirst($auth['id']);

                        // Set the user_id
                        $user_id = $auth['id']; 

                        // Detect if this user has already submitted a dispute
                        $addressExists = Dispute::find(
                            [
                                'conditions' => 'address = :address: AND id = :id: AND blockchain = :blockchain:',
                                'bind'       => [
                                    'address' => $address,
                                    'blockchain' => $blockchain,
                                    'id' => $user_id,
                                ],
                                'order' => 'dispute_id desc',
                            ]
                        );
                        $addressCount = count($addressExists); 

                        // If no address is currently setup, then create a new record in the database table for that user 
                        if ($addressCount == 0 || $addressCount == NULL){

                            // Enter a new address and details into the products table
                            $dispute = new Dispute(); 
                            $dispute->id = $user_id; 
                            $dispute->address = $address; 
                            $dispute->date_submit = new RawValue('now()'); 
                            $dispute->blockchain = $blockchain; 
                            $dispute->ip_address = $remoteIp;
                            $dispute->reason = $reason; 
                            $dispute->describe_dispute = $describe_dispute; 

                            // Render error if one occurs
                            if (!$dispute->save()) {

                                foreach ($dispute->getMessages() as $message) {
                                    $this->flash->error((string) $message);
                                }

                            // Otherwise show results
                            } else {

                                $this->flash->success('We have successfully reported your dispute. Our team will review your request and get back to you in the near future after a thorough review. We may follow up to validate further information and have you answer additional questions before removal from ScanBlocks.');
                            }

                        // If they DO already have this address submitted, then display a message that they have already reported this address
                        } else {

                            $this->flash->warning('We have already received a dispute report for this address from you. Please patiently wait as our team investigates your current report. Someone will get back to you regarding your initial report in the near future.');
                        }

                    // Not authenticated
                    } else {

                        // Detect if this user has already submitted this address
                        $addressExists = Dispute::find(
                            [
                                'conditions' => 'address = :address: AND blockchain = :blockchain: AND ip_address = :ip_address:',
                                'bind'       => [
                                    'address' => $address,
                                    'blockchain' => $blockchain,
                                    'ip_address' => $remoteIp,
                                ],
                                'order' => 'dispute_id desc',
                            ]
                        );
                        $addressCount = count($addressExists); 

                        // If no address is currently setup, then create a new record in the database table for that user 
                        if ($addressCount == 0 || $addressCount == NULL){

                            // Enter a new address and details into the products table
                            $dispute = new Dispute(); 
                            $dispute->id = NULL; 
                            $dispute->address = $address; 
                            $dispute->date_submit = new RawValue('now()'); 
                            $dispute->blockchain = $blockchain; 
                            $dispute->describe_dispute = $describe_dispute; 
                            $dispute->ip_address = $remoteIp;
                            $dispute->reason = $reason; 

                            // Render error if one occurs
                            if (!$dispute->save()) {

                                foreach ($dispute->getMessages() as $message) {
                                    $this->flash->error((string) $message);
                                }

                            // Otherwise show results
                            } else {

                                $this->flash->success('We have successfully reported your dispute. Our team will review your request and get back to you in the near future after a thorough review. We may follow up to validate further information and have you answer additional questions before removal from ScanBlocks.');
                            }

                        // If they DO already have this address submitted, then display a message that they have already reported this address
                        } else {

                            $this->flash->warning('We have already received a dispute report for this address from you. Please patiently wait as our team investigates your current report. Someone will get back to you regarding your initial report in the near future.');
                        }
                    }
                
                } else {
                    // Render a reCaptcha error message 
                    $this->flash->error('We could not validate the google reCaptcha. Please try again later. Error code: '. $resp->getErrorCodes());
                }

            } else {
                // Render a reCaptcha error message 
                $this->flash->error('Something went wrong with your submission. Please try again later!');
            }
        }
    }
}
