/*
 * main.h
 *
 *  Created on: Jan 26, 2022
 *      Author: ise
 */

#ifndef MAIN_H_
#define MAIN_H_

#include "xparameters.h"
#include "xgpio.h"
#include "xstatus.h"
#include "xuartlite.h"

int platform_init(void);
void sleep(u32 sleep_ticks);
#endif /* MAIN_H_ */
