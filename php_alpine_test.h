/* alpine_test extension for PHP */

#ifndef PHP_ALPINE_TEST_H
# define PHP_ALPINE_TEST_H

extern zend_module_entry alpine_test_module_entry;
# define phpext_alpine_test_ptr &alpine_test_module_entry

# define PHP_ALPINE_TEST_VERSION "0.1.0"

# if defined(ZTS) && defined(COMPILE_DL_ALPINE_TEST)
ZEND_TSRMLS_CACHE_EXTERN()
# endif

#endif	/* PHP_ALPINE_TEST_H */
