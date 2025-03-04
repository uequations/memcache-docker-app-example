<?php
$memcached = new Memcached();
$memcached->addServer('localhost', 11211);

$memcached->set('key', 'Hello, Memcached!');
$value = $memcached->get('key');

echo $value;
?>