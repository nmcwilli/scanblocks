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
 * RecentController (Main Recently submitted Controller)
 *
 * This contains the primary code for main recently submitted controller
 * Created by Neil McWilliam
 * 
 */

class RecentController extends ControllerBase
{

    /**
     * Initializer
    */
    public function initialize()
    {
        parent::initialize();

        $this->tag->setTitle('Recently reported blockchain addresses');
    }

    /**
     * indexAction
    */
    public function indexAction(): void
    {
        // Search for the address in db
        $this->view->setVar("addresses", Products::find(
                [
                    'conditions' => 'active = :active:',
                    'bind'       => [
                        'active' => 1,
                    ],
                    'order' => 'address_id DESC',
                    'limit' => 50,
                    'offset' => 10,
                ]
            )
        );
    }
}
