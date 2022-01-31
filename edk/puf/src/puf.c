/*
 * puf.c
 *
 *  Created on: Jan 26, 2022
 *      Author: ise
 */
#include "main.h"

;
XGpio io_inst_struct;


XUartLite uart_inst_struct;

XStatus platform_init(void){

	XStatus status = XST_FAILURE;
	status = XGpio_Initialize(&io_inst_struct, XPAR_GENERIC_GPIO_DEVICE_ID);
	XGpio_SetDataDirection(&io_inst_struct, 1, 0xFFFFFFFFU);
	XGpio_SetDataDirection(&io_inst_struct, 2, 0x01U);

	status = XUartLite_Initialize(&uart_inst_struct, XPAR_RS232_DEVICE_ID);


	return status;

}


void sleep(u32 sleep_ticks){
	for(u32 i=0;i<sleep_ticks;i++){
		__asm__("nop");
	}
}

