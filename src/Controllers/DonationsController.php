<?php
declare(strict_types=1);

namespace Invo\Controllers;

use Invo\Forms\ContactForm;
use Invo\Models\Contact;

/**
 * DonationsController
 *
 * Allows to contact the staff using a contact form
 */
class DonationsController extends ControllerBase
{
    public function initialize()
    {
        parent::initialize();

        $this->tag->setTitle('Donations');
    }

    public function indexAction(): void
    {
        $this->view->form = new ContactForm;
    }

}
