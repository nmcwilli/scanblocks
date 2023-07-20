<?php

declare(strict_types=1);

namespace Invo\Controllers;

use Invo\Forms\ProductsForm;
use Invo\Models\Searches;
use Invo\Models\Products;
use Invo\Models\Users;
use Phalcon\Db\RawValue;
use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Manager;
use Phalcon\Mvc\Model\Query;

/**
 * SearchController (Main Search Controller)
 *
 * This contains the primary code for main publicly accessible search controller
 * Created by Neil McWilliam
 * 
 */

class SearchController extends ControllerBase
{

    // Set public variables
    public $blockchain;
    public $address;
    public $addressCount;
    public $active;
    public $ip_address;
    public $search_date;
    public $id; 

    /**
     * Search Initializer
    */
    public function initialize()
    {
        parent::initialize();

        $this->tag->setTitle('Blockchain address scan results');
    }

    /**
     * Search Action
    */
    public function indexAction(): void
    {
        // Submitted a GET
        if ($this->request->isGet()) {

            // Grab the data from the GET variables
            $blockchain = $this->request->get('blockchain', 'string');
            $address = $this->request->get('address', ['string', 'striptags', 'trim']);

            // If either the blockchain var or address is empty then, send them packin
            if ($blockchain=="" OR $address==""){

                // Send them back to the index page with an alert
                $this->flash->warning('When you search, you must select a Blockchain and provide an Address. Please try again!');

                $this->dispatcher->forward([
                    'controller' => 'index',
                    'action'     => 'index',
                ]);

                return;
            }

            // Grab their user ID if they are logged in
            // Get users session info
            $auth = $this->session->get('auth');
            // Define the user variable
            $user = Users::findFirst($auth['id']);
            // Set the user_id
            $user_id = $auth['id']; 

            // Grab their IP address
            $remoteIp = $_SERVER['REMOTE_ADDR'];

            // Document what they searched for in the searches table
            $searches = new Searches(); 
            $searches->id = $user_id; 
            $searches->search_date = new RawValue('now()'); 
            $searches->address = $address; 
            $searches->blockchain = $blockchain; 
            $searches->ip_address = $remoteIp; 

            // Render error if one occurs
            if (!$searches->save()) {
                
                // keep it on the DL. No notices to the end user

                /* foreach ($searches->getMessages() as $message) {
                    $this->flash->error((string) $message);
                } */
            } else {
                // keep it on the DL. No notices to the end user
            }

            // Search for the address in db
            $products = Products::find(
                [
                    'conditions' => 'address = :address: AND blockchain = :blockchain: AND active = :active:',
                    'bind'       => [
                        'address' => $address,
                        'blockchain' => $blockchain,
                        'active' => 1,
                    ],
                    'order' => 'address_id desc',
                ]
            );
            $addressCount = count($products); 

            // If there is an address count
            if ($addressCount>=1){ 

                // Render an error that there were no results 
                $this->flash->error('WARNING: There are flags/reports against this address. This may be a malicious actor and/or they may have participated in malicious activity in the past. Proceed with caution before transferring any cryptocurrency. Once you transfer your cryptocurrency, it is gone forever with no recourse or way to revert the transaction. See the details below for the number of reports.');

                // Grab the tabular results to render on the search results page 
                $this->view->setVar("addresses", Products::find(
                        [
                            'conditions' => 'address = :address: AND blockchain = :blockchain: AND active = :active:',
                            'bind'       => [
                                'address' => $address,
                                'blockchain' => $blockchain,
                                'active' => 1,
                            ],
                            'order' => 'address_id desc',
                        ]
                    )
                );

            // No results 
            } else {

                // Render an error that there were no results 
                $this->flash->success('There are currently no flags in our dataset for this address. It does NOT mean this is not a scammer or malicious actor, but merely that we do not have any current reports. If you would like to report this address, please sign up and report it for free under your account. Thanks for helping make blockchain ecosystems safer!');
            }

            // Set the data variables for the search results view 
            $this->view->blockchain = $blockchain; 
            $this->view->address = $address; 
            $this->view->addressCount = $addressCount; 

        } else {

            // nada
        }
    }
}
