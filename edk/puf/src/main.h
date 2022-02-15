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

#define CHALLENGE_WIDTH 16
#define WORD_NUMBER (1<<CHALLENGE_WIDTH)>>3

int platform_init(void);
void get_response(u32 scan_delay, u8 challenge_width);
void sleep(u32 sleep_ticks);
#endif /* MAIN_H_ */
