<?php

declare(strict_types=1);

/**
 * 
 * This is the main IndexForm 
 * Created by Neil McWilliam
 * 
 */

namespace Invo\Forms;

use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Form;
use Phalcon\Validation\Validator\Numericality;
use Phalcon\Validation\Validator\PresenceOf;


class IndexForm extends Form
{
    /**
     * Initialize the Index form
     *
     * @param null $entity
     * @param array $options
     */
    public function initialize($entity = null, array $options = [])
    {
        
    }
}
