<?php
declare(strict_types=1);

/**
 * Dispute Model - (Dispute Model)
 * This is the dispute model
 * By Neil McWilliam
 */

namespace Invo\Models;

use Phalcon\Mvc\Model;
use Phalcon\Db\RawValue;

class Dispute extends Model
{

    public $dispute_id;

    public $id; // user id

    public $date_submit;

    public $resolution;

    public $describe_dispute;

    public $reason;

    public $ip_address;

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
