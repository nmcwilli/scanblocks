<?php
declare(strict_types=1);

/**
 * Products Model
 * This is the products model
 * By Neil McWilliam
 */

namespace Invo\Models;

use Phalcon\Mvc\Model;
use Phalcon\Db\RawValue;

class Products extends Model
{

    /**
     * @var integer
     */
    public $crawl_id;

    /**
     * @var integer
     */
    public $id; // user id

    /**
     * @var timestamp
     */
    public $last_update;

    /**
     * @var string
     */
    public $url;

    /**
     * @var string
     */
    public $html;

    /**
     * @var string
     */
    public $sitemap;

    /**
     * @var integer
     */
    public $active;

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

    public function getActiveDetail(): string
    {
        return $this->active == '1' ? 'Yes' : 'No';
    }

    public function beforeCreate()
    {
        $this->last_update = new RawValue('now()');
    }
}
