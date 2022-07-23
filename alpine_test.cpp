/* alpine_test extension for PHP */

#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#include <iostream>
extern "C" {
#include "php.h"
#include "ext/standard/info.h"
#include "php_alpine_test.h"
#include "alpine_test_arginfo.h"
}

/* For compatibility with older PHP versions */
#ifndef ZEND_PARSE_PARAMETERS_NONE
#define ZEND_PARSE_PARAMETERS_NONE() \
    ZEND_PARSE_PARAMETERS_START(0, 0) \
    ZEND_PARSE_PARAMETERS_END()
#endif

/* {{{ void test1() */
PHP_FUNCTION(test1)
        {
                ZEND_PARSE_PARAMETERS_NONE();

        php_printf("The extension %s is loaded and working!\r\n", "alpine_test");
        }
/* }}} */

/* {{{ string test2( [ string $var ] ) */
PHP_FUNCTION(test2)
        {
                char *var = "World";
                size_t var_len = sizeof("World") - 1;
                zend_string *retval;

                ZEND_PARSE_PARAMETERS_START(0, 1)
                Z_PARAM_OPTIONAL
                Z_PARAM_STRING(var, var_len)
                ZEND_PARSE_PARAMETERS_END();

                retval = strpprintf(0, "Hello %s", var);

                RETURN_STR(retval);
        }
/* }}}*/

/* {{{ PHP_RINIT_FUNCTION */
PHP_RINIT_FUNCTION(alpine_test)
        {
#if defined(ZTS) && defined(COMPILE_DL_ALPINE_TEST)
                ZEND_TSRMLS_CACHE_UPDATE();
#endif
        std::cout << "test c++" << std::endl;
                return SUCCESS;
        }
/* }}} */

/* {{{ PHP_MINFO_FUNCTION */
PHP_MINFO_FUNCTION(alpine_test)
        {
                php_info_print_table_start();
        php_info_print_table_header(2, "alpine_test support", "enabled");
        php_info_print_table_end();
        }
/* }}} */

/* {{{ alpine_test_module_entry */
zend_module_entry alpine_test_module_entry = {
        STANDARD_MODULE_HEADER,
        "alpine_test",                    /* Extension name */
        ext_functions,                    /* zend_function_entry */
        NULL,                            /* PHP_MINIT - Module initialization */
        NULL,                            /* PHP_MSHUTDOWN - Module shutdown */
        PHP_RINIT(alpine_test),            /* PHP_RINIT - Request initialization */
        NULL,                            /* PHP_RSHUTDOWN - Request shutdown */
        PHP_MINFO(alpine_test),            /* PHP_MINFO - Module info */
        PHP_ALPINE_TEST_VERSION,        /* Version */
        STANDARD_MODULE_PROPERTIES
};
/* }}} */

#ifdef COMPILE_DL_ALPINE_TEST
# ifdef ZTS
ZEND_TSRMLS_CACHE_DEFINE()
# endif
ZEND_GET_MODULE(alpine_test)
#endif
