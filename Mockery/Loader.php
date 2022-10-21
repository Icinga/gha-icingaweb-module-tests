<?php

namespace Mockery;

class Loader
{
    public function register(): void
    {
        require_once 'Mockery/autoload.php';
    }
}
