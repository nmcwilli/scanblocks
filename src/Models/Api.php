<?php
declare(strict_types=1);

/**
 * API Model
 * This is the API tracking table model
 * By Neil McWilliam
 */

namespace Invo\Models;

use Phalcon\Mvc\Model;
use Phalcon\Db\RawValue;

class Api extends Model
{

    public $api_id;

    public $apikey;

    public $date_submit;

    public $address;

    public $blockchain;

    /**
     * Products initializer
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

    public function beforeCreate()
    {
        $this->date_submit = new RawValue('now()');
    }
}
