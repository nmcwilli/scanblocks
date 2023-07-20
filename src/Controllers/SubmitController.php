<?php

declare(strict_types=1);

namespace Invo\Controllers;

use Invo\Forms\ProductsForm;
use Invo\Models\Products;
use Invo\Models\Users;
use Phalcon\Db\RawValue;
use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Manager;
use Phalcon\Mvc\Model\Query;

/**
 * SubmitController (Submit Controller)
 */

class SubmitController extends ControllerBase
{

    // Set public variables
    public $blockchain;
    public $address;
    public $type;
    public $reason;
    public $user_id;
    public $ip_address;
    public $describe_report;
    public $url;

    /**
     * Index initializer
    */
    public function initialize()
    {
        parent::initialize();

        $this->tag->setTitle('Submit a blockchain addresses to report/flag a malicious scammer, hacker, spammer or other malicious actor.');
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
            $describe_report = $this->request->getPost('describe_report', 'string');
            $url = $this->request->getPost('url', 'string');

            // Proceed if it is an ADDRESS they are submitting
            if ($type=="submitAddress"){ 

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

                        // Detect if this user has already submitted this address
                        $addressExists = Products::find(
                            [
                                'conditions' => 'address = :address: AND id = :id: AND blockchain = :blockchain: AND active = :active:',
                                'bind'       => [
                                    'address' => $address,
                                    'blockchain' => $blockchain,
                                    'id' => $user_id,
                                    'active' => 1,
                                ],
                                'order' => 'address_id desc',
                            ]
                        );
                        $addressCount = count($addressExists); 

                        // If no address is currently setup, then create a new record in the database table for that user 
                        if ($addressCount == 0 || $addressCount == NULL){

                            // Enter a new address and details into the products table
                            $products = new Products(); 
                            $products->id = $user_id; 
                            $products->address = $address; 
                            $products->last_update = new RawValue('now()'); 
                            $products->blockchain = $blockchain; 
                            $products->active = '1'; 
                            $products->ip_address = $remoteIp; 
                            $products->reason = $reason; 
                            $products->describe_report = $describe_report; 
                            $products->url = $url; 

                            // Render error if one occurs
                            if (!$products->save()) {

                                foreach ($products->getMessages() as $message) {
                                    $this->flash->error((string) $message);
                                }

                            // Otherwise show results
                            } else {

                                $this->flash->success('Thanks for helping us grow a dataset of malicious actors. You may have just saved others from being scammed out of their hard earned crytocurrency. We have successfully added this address to our dataset.');
                            }

                        // If they DO already have this address submitted, then display a message that they have already reported this address
                        } else {

                            $this->flash->warning('You have already submitted this address. Do not worry as we have added it to our active dataset. Thanks so much for helping to prevent others from being scammed out of their hard earned cryptocurrency!');
                        }

                    // Not authenticated
                    } else {

                        // Detect if this user has already submitted this address
                        $addressExists = Products::find(
                            [
                                'conditions' => 'address = :address: AND blockchain = :blockchain: AND ip_address = :ip_address: AND active = :active:',
                                'bind'       => [
                                    'address' => $address,
                                    'blockchain' => $blockchain,
                                    'ip_address' => $remoteIp,
                                    'active' => 1,
                                ],
                                'order' => 'address_id desc',
                            ]
                        );
                        $addressCount = count($addressExists); 

                        // If no address is currently setup, then create a new record in the database table for that user 
                        if ($addressCount == 0 || $addressCount == NULL){

                            // Enter a new address and details into the products table
                            $products = new Products(); 
                            $products->id = NULL; 
                            $products->address = $address; 
                            $products->last_update = new RawValue('now()'); 
                            $products->blockchain = $blockchain; 
                            $products->active = '1'; 
                            $products->ip_address = $remoteIp;
                            $products->reason = $reason; 
                            $products->describe_report = $describe_report; 
                            $products->url = $url; 

                            // Render error if one occurs
                            if (!$products->save()) {

                                foreach ($products->getMessages() as $message) {
                                    $this->flash->error((string) $message);
                                }

                            // Otherwise show results
                            } else {

                                $this->flash->success('Thanks for helping us grow a dataset of malicious actors. You may have just saved others from being scammed out of their hard earned crytocurrency. We have successfully added this address to our dataset.');
                            }

                        // If they DO already have this address submitted, then display a message that they have already reported this address
                        } else {

                            $this->flash->warning('It appears that you have already submitted this address. Do not worry as we have added it to our active dataset. Thanks so much for helping to prevent others from being scammed out of their hard earned cryptocurrency!');
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
