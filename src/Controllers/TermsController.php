<?php
declare(strict_types=1);

namespace Invo\Controllers;

class TermsController extends ControllerBase
{
    public function initialize()
    {
        parent::initialize();

        $this->tag->setTitle('Terms of Use');
    }

    public function indexAction(): void
    {
    }
}
