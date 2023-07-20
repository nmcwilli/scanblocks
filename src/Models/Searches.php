<?php
declare(strict_types=1);

/**
 * Searches Model
 * This is the searches model, which interfaces with the searches table in the database
 * By Neil McWilliam
 */

namespace Invo\Models;

use Phalcon\Mvc\Model;
use Phalcon\Db\RawValue;

class Searches extends Model
{

    /**
     * @var integer
     */
    public $search_id;

    /**
     * @var integer
     */
    public $id; // user id

    /**
     * @var timestamp
     */
    public $search_date;

    /**
     * @var string
     */
    public $address;

    /**
     * @var string
     */
    public $blockchain;

    /**
     * @var string
     */
    public $ip_address;

    /**
     * initializer
    */
    public function initialize()
    {
        // Optionally force naming the database table
        // $this->setSource('products');

        /* $this->belongsTo(
            'product_types_id',
            ProductTypes::class,
            'id',
            [
                'reusable' => true,
            ]
        ); */
    } 
    
}
