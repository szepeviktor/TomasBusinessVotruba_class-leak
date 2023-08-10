<?php

declare(strict_types=1);

use TomasVotruba\ClassLeak\Console\ClassLeakApplication;
use TomasVotruba\ClassLeak\DependencyInjection\ContainerFactory;

require_once dirname(__DIR__) . '/vendor/autoload.php';

$containerFactory = new ContainerFactory();
$container = $containerFactory->create();

/** @var ClassLeakApplication $application */
$application = $container->make(ClassLeakApplication::class);

$input = new Symfony\Component\Console\Input\ArgvInput();
$output = new Symfony\Component\Console\Output\ConsoleOutput();

$exitCode = $application->run($input, $output);
exit($exitCode);
