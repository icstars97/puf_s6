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

void get_response(u32 scan_delay, u8 challenge_width){

	u8 response_word = 0x00U;
	u32 challenge = 0x00U;
	u32 gpio_state;

	XGpio_DiscreteWrite(&io_inst_struct, 2, 0x0000000000000000U);
	XGpio_DiscreteWrite(&io_inst_struct, 1, 0x0000000000000000U);
	sleep(100);

	for (u32 word_count=0;word_count<WORD_NUMBER;word_count++){

		for (u8 i=0;i<8;i++){

			XGpio_DiscreteWrite(&io_inst_struct, 1, challenge);
			challenge++;
			XGpio_DiscreteWrite(&io_inst_struct, 2, 0x0000000000000001U);
			sleep(scan_delay);
			gpio_state = XGpio_DiscreteRead(&io_inst_struct,2);
			response_word |= (gpio_state & 2) << i;
			XGpio_DiscreteWrite(&io_inst_struct, 2, 0x0000000000000000U);

		}

		XUartLite_Send(&uart_inst_struct, &response_word, 1);
		response_word =0x00U;

	}




}

