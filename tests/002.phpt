--TEST--
test1() Basic test
--EXTENSIONS--
alpine_test
--FILE--
<?php
$ret = test1();

var_dump($ret);
?>
--EXPECT--
The extension alpine_test is loaded and working!
NULL
