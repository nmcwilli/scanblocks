<?php

declare(strict_types=1);

/**
 * 
 * This is the main Products Form 
 * Created by Neil McWilliam
 * 
 */

namespace Invo\Forms;

use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Form;
// use Phalcon\Validation\Validator\Numericality;
use Phalcon\Validation\Validator\PresenceOf;

class ProductsForm extends Form
{
    /**
     * Initialize the products form
     *
     * @param null $entity
     * @param array $options
     */
    public function initialize($entity = null, array $options = [])
    {
        /* if (!isset($options['edit'])) {
            $this->add((new Text('id'))->setLabel('Id'));
        } else {
            $this->add(new Hidden('id'));
        } */

        /**
         * The URL field
         
        $url = new Text('url');
        $url->setLabel('url');
        $url->setFilters(['striptags', 'string']);
        $url->addValidators([
            new PresenceOf(['message' => 'You must provide a url']),
        ]);

        $this->add($url); */

        /**
         * Product Type Id Select
         
        $type = new Select(
            'product_types_id',
            ProductTypes::find(),
            [
                'using'      => ['id', 'name'],
                'useEmpty'   => true,
                'emptyText'  => '...',
                'emptyValue' => '',
            ]
        );
        $type->setLabel('Type');

        $this->add($type); */ 

        /**
         * Price text field
         
        $price = new Text('price');
        $price->setLabel('Price');
        $price->setFilters(['float']);
        $price->addValidators([
            new PresenceOf(['message' => 'Price is required']),
            new Numericality(['message' => 'Price is required']),
        ]);

        $this->add($price); */
    }
}
