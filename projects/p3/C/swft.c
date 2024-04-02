/*
 * File: swft.c
 *
 * Description:
 *   This is where you implement the C version of project 3 support.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* LLVM Header Files */
#include "llvm-c/Core.h"

/* Header file global to this project */
#include "cfg.h"
#include "dominance.h"
#include "transform.h"
#include "stats.h"

// Initialized in p3.cpp, do not re-initialize here
extern int bonus_flag;
extern int no_replicate_flag;
extern int no_control_protection_flag;

void SoftwareFaultTolerance(LLVMModuleRef Module)
{
  


}
