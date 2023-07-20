<?php

declare(strict_types=1);

use Phalcon\Config;

/* Pulling configuration variables from .env file */

return new Config([
    'database' => [
        'adapter' => getenv('DB_ADAPTER'),
        'host' => getenv('DB_HOST'),
        'username' => getenv('DB_USERNAME'),
        'password' => getenv('DB_PASSWORD'),
        'dbname' => getenv('DB_DBNAME'),
        'charset' => getenv('DB_CHARSET'),
    ],
    'application' => [
        'viewsDir' => getenv('VIEWS_DIR'),
        'controllersDir' => getenv('CONTROLLERS_DIR'),
        'modelsDir' => getenv('MODELS_DIR'),
        'pluginsDir' => getenv('PLUGINS_DIR'),
        'formsDir' => getenv('FORMS_DIR'),
        'baseUri' => getenv('BASE_URI'),
    ],
]);