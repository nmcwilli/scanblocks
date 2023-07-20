<?php
declare(strict_types=1);

/**
 * Cron Model - (Main Crawler Cron that runs every hour)
 * This is the cron model that interfaces with the database products table
 * By Neil McWilliam
 */

namespace Invo\Models;

use Phalcon\Mvc\Model;
use Phalcon\Db\RawValue;

class Cron extends Model
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
