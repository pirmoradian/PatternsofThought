/*
 * MATLAB Compiler: 4.1 (R14SP1)
 * Date: Thu Mar 03 10:41:25 2005
 * Arguments: "-B" "macro_default" "-m" "-W" "main" "-T" "link:exe" "think.m"
 * "-a" "c:\mind_data.mat" 
 */

#include <stdio.h>
#include "mclmcr.h"
#ifdef __cplusplus
extern "C" {
#endif
extern const unsigned char __MCC_think_public_data[];
extern const char *__MCC_think_name_data;
extern const char *__MCC_think_root_data;
extern const unsigned char __MCC_think_session_data[];
extern const char *__MCC_think_matlabpath_data[];
extern const int __MCC_think_matlabpath_data_count;
extern const char *__MCC_think_classpath_data[];
extern const int __MCC_think_classpath_data_count;
extern const char *__MCC_think_mcr_runtime_options[];
extern const int __MCC_think_mcr_runtime_option_count;
extern const char *__MCC_think_mcr_application_options[];
extern const int __MCC_think_mcr_application_option_count;
#ifdef __cplusplus
}
#endif

static HMCRINSTANCE _mcr_inst = NULL;


static int mclDefaultPrintHandler(const char *s)
{
    return fwrite(s, sizeof(char), strlen(s), stdout);
}

static int mclDefaultErrorHandler(const char *s)
{
    int written = 0, len = 0;
    len = strlen(s);
    written = fwrite(s, sizeof(char), len, stderr);
    if (len > 0 && s[ len-1 ] != '\n')
        written += fwrite("\n", sizeof(char), 1, stderr);
    return written;
}

bool thinkInitializeWithHandlers(
    mclOutputHandlerFcn error_handler,
    mclOutputHandlerFcn print_handler
)
{
    if (_mcr_inst != NULL)
        return true;
    if (!mclmcrInitialize())
        return false;
    if (!mclInitializeComponentInstance(&_mcr_inst, __MCC_think_public_data,
                                        __MCC_think_name_data,
                                        __MCC_think_root_data,
                                        __MCC_think_session_data,
                                        __MCC_think_matlabpath_data,
                                        __MCC_think_matlabpath_data_count,
                                        __MCC_think_classpath_data,
                                        __MCC_think_classpath_data_count,
                                        __MCC_think_mcr_runtime_options,
                                        __MCC_think_mcr_runtime_option_count,
                                        true, NoObjectType, ExeTarget, NULL,
                                        error_handler, print_handler))
        return false;
    return true;
}

bool thinkInitialize(void)
{
    return thinkInitializeWithHandlers(mclDefaultErrorHandler,
                                       mclDefaultPrintHandler);
}

void thinkTerminate(void)
{
    if (_mcr_inst != NULL)
        mclTerminateInstance(&_mcr_inst);
}

int main(int argc, const char **argv)
{
    int _retval;
    if (!mclInitializeApplication(__MCC_think_mcr_application_options,
                                  __MCC_think_mcr_application_option_count))
        return 0;
    
    if (!thinkInitialize())
        return -1;
    _retval = mclMain(_mcr_inst, argc, argv, "think", 0);
    if (_retval == 0 /* no error */) mclWaitForFiguresToDie(NULL);
    thinkTerminate();
    mclTerminateApplication();
    return _retval;
}
