<?php

declare(strict_types=1);

namespace Invo\Controllers;

// use Invo\Forms\ProductsForm;
// use Phalcon\Db\RawValue;
// use Phalcon\Mvc\Model\Query;

use Invo\Forms\ProductsForm;
use Invo\Models\Products;
use Invo\Models\Users;
use Phalcon\Db\RawValue;
use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Manager;
use Phalcon\Mvc\Model\Query;

/**
 * IndexController (Main Index Controller)
 */

class IndexController extends ControllerBase
{

    /**
     * Index initializer
    */
    public function initialize()
    {
        parent::initialize();

        $this->tag->setTitle('Scan blockchain addresses to identify malicious actors');
    }

    /**
     * Index Action
    */
    public function indexAction(): void
    {

        /* Grab the total number of addresses in our db
        $addressTotal = Products::find(
            [
                'conditions' => 'active = :active:',
                'bind'       => [
                    'active' => 1,
                ],
                'order' => 'address_id desc',
            ]
        );
        $addressTotalCount = count($addressTotal); */

        // Set the total value for the view
        // $this->view->addressTotalCount = $addressTotalCount; 
    }
}
