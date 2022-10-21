<?php

namespace Icinga\Module\Shortname_extractor\Clicommands;

use Icinga\Application\Icinga;
use Icinga\Cli\Command;
use Icinga\Module\Shortname_extractor\ModuleCheat;

class ModuleCommand extends Command
{
    public function shortnameAction(): void
    {
        echo (new ModuleCheat(Icinga::app(), 'unknown', getcwd()))->metadata()->shortname;
    }
}
