<?php

declare(strict_types=1);

namespace Invo\Controllers;

use Invo\Forms\ProductsForm;
use Invo\Models\Products;
use Invo\Models\Users;
use Phalcon\Db\RawValue;
use Phalcon\Mvc\Model\Query;
// use Phalcon\Paginator\Adapter\Model as PaginatorModel;

/**
 * ProductsController 
 *
 * This contains the primary code for main Admin Control Panel controller
 * Created by Neil McWilliam
 * 
 */

class ProductsController extends ControllerBase
{
    // Set public variables
    public $blockchain;
    public $address;
    public $addressCount;
    public $active;
    public $user_id;
    public $addressSubmitted;
    public $type;
    public $address_id;
    public $reason;
    public $wallet;

    /**
     * Products initializer
    */
    public function initialize()
    {
        $this->tag->setTitle('Your account & submit malicious addresses.');

        parent::initialize();
    }

    /**
     * Main profile page (authenticated)
     */
    public function indexAction(): void
    {
        // Current page to show
        // In a controller/component this can be:
        // $this->request->getQuery('page', 'int'); // GET
        // $this->request->getPost('page', 'int'); // POST
        // $currentPage = (int) $_GET['page'];

        // Get users session info
        $auth = $this->session->get('auth');

        // Define the user variable
        $user = Users::findFirst($auth['id']);

        // Set the user_id
        $user_id = $auth['id']; 

        // If no auth, send them to index (they are not logged in)
        if (!$user) {

            // Dispatch them to the index
            $this->dispatcher->forward([
                'controller' => 'index',
                'action'     => 'index',
            ]);

            return;
        }

        // No POST
        if (!$this->request->isPost()) {

            // Show a list of the addresses they have submitted 
            $this->view->setVar("addresses", Products::find(
                    [
                        'conditions' => 'id = :id: AND active = :active:',
                        'bind'       => [
                            'id' => $user_id,
                            'active' => 1,
                        ],
                        'order' => 'address_id desc',
                    ]
                )
            );

            // Create a Model paginator, show 10 rows by page starting from $currentPage
            /* $paginator = new PaginatorModel(
                [
                    'data'  => $paginatedData,
                    'limit' => 10,
                    'page'  => $currentPage,
                ]
            );

            // Get the paginated results
            $page = $paginator->getPaginate(); */

        // POST submitted
        } else {

            // Grab the data from the post variables
            $blockchain = $this->request->getPost('blockchain', 'string');
            $address = $this->request->getPost('address', ['string', 'striptags', 'trim']);
            $type = $this->request->getPost('type', 'string');
            $reason = $this->request->getPost('reason', 'string');

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
                        $products->reason = $reason; 

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
                
                } else {
                    // Render a reCaptcha error message 
                    $this->flash->error('We could not validate the google reCaptcha. Please try again later. Error code: '. $resp->getErrorCodes());
                }

            // Proceed if it is an Address they are removing
            } else if ($type=="removeAddress"){ 

                // Set address_id
                $address_id = $this->request->getPost('address_id', 'id');

                // Detect if the address exists, is currently active and was reported before by the user
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

                // If the address does exist for the user and is active, then proceed
                if ($addressCount >= 1){

                    // Update the active field on the record 
                    $productsDisable = Products::findFirst(
                        [
                            'conditions' => 'address_id = :address_id:',
                            'bind'       => [
                                'address_id' => $address_id,
                            ],
                            'order' => 'address_id desc',
                        ]
                    );
                    
                    $productsDisable->active = 0;

                    // Render error if one occurs
                    if (!$productsDisable->update()) {

                        foreach ($productsDisable->getMessages() as $message) {
                            $this->flash->error((string) $message);
                        }

                    // Otherwise show results
                    } else {

                        $this->flash->success('You have successfully removed this address from our dataset.');
                    }
                
                // If something happened where we can't find the address, or maybe it's already deactivated, display a message 
                } else {

                    $this->flash->warning('It appears that this address was already deactivated or we could not find it in our system. Rest assured that it has been removed.');
                }
            }

            // Show a list of the addresses they have submitted 
            $this->view->setVar("addresses", Products::find(
                    [
                        'conditions' => 'id = :id: AND active = :active:',
                        'bind'       => [
                            'id' => $user_id,
                            'active' => 1,
                        ],
                        'order' => 'address_id desc',
                    ]
                )
            );
        }
    }

    /**
     * Edit the active user profile (Authenticated)
     */
    public function profileAction(): void
    {
        // Get users session info
        $auth = $this->session->get('auth');

        // Define their ID
        $user = Users::findFirst($auth['id']);

        // If no auth, send them to index
        if (!$user) {

            // Dispatch them to the index
            $this->dispatcher->forward([
                'controller' => 'index',
                'action'     => 'index',
            ]);

            return;
        }

        // No post - Set email and name
        if (!$this->request->isPost()) {

            $this->tag->setDefault('name', $user->name);
            $this->tag->setDefault('email', $user->email);

        // Post submitted - Update their information
        } else {

            // Grab name and email from post vars
            $user->name = $this->request->getPost('name', ['string', 'striptags']);
            $user->email = $this->request->getPost('email', 'email');

            // If no auth user can be detected, throw error
            if (!$user->save()) {
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }

            // Flash success message, if everything worked properly
            } else {
                $this->flash->success('Your profile information was updated successfully!');
            }
        }
    }

    /**
     * API Key section
     */
    public function apiAction(): void
    {
        // Get users session info
        $auth = $this->session->get('auth');

        // Define their ID
        $user = Users::findFirst($auth['id']);

        // If no auth, send them to index
        if (!$user) {

            // Dispatch them to the index
            $this->dispatcher->forward([
                'controller' => 'index',
                'action'     => 'index',
            ]);

            return;
        }

        // No post - Set api key 
        if (!$this->request->isPost()) {

            // render vars on page 
            $this->tag->setDefault('apikey', $user->apikey); 

            /* if ($this->tag->setDefault('apikey', $user->apikey) == NULL){
                $this->tag->setDefault('apikey', 'No API Key set'); 
            } else {
                $this->tag->setDefault('apikey', $user->apikey)
            } */

        // Post submitted - Update their information
        } else {

            // Leaving this code for later. For now have decided to manually create API keys.
            // This way we can approve access as needed. 

            /* generate a new random API key 
            $apiGenerated = bin2hex(random_bytes(10)); // 20 characters, only 0-9a-f 

            // Add username to the key
            $apiGenerated = $user->username.$apiGenerated; 

            // Add the API Key to the database
            $user->apikey = $this->request->getPost($apiGenerated, 'string'); 

            // If no auth user can be detected, throw error
            if (!$user->save()) {
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message); 
                }

            // Flash success message, if everything worked properly
            } else {
                $this->flash->success('We have successfully generated a new API key for your account.');
            } */

        }
    }

    /**
     * API Documentation section
     */
    public function apidocsAction(): void
    {
        // Get users session info
        $auth = $this->session->get('auth');

        // Define their ID
        $user = Users::findFirst($auth['id']);

        // If no auth, send them to index
        if (!$user) {

            // Dispatch them to the index
            $this->dispatcher->forward([
                'controller' => 'index',
                'action'     => 'index',
            ]);

            return;
        }

        // No post
        if (!$this->request->isPost()) {

            // 

        // Post submitted - Update their information
        } else {

            // 

        }
    }
}
