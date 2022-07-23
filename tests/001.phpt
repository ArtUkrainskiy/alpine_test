--TEST--
Check if alpine_test is loaded
--EXTENSIONS--
alpine_test
--FILE--
<?php
echo 'The extension "alpine_test" is available';
?>
--EXPECT--
The extension "alpine_test" is available
