/*
 * main.c
 *
 *  Created on: Jan 26, 2022
 *      Author: ise
 */
#include "main.h"
extern XUartLite uart_inst_struct;
int main(void){


	platform_init();

	while(1){
		sleep(1000000);
		XUartLite_Send(&uart_inst_struct, (u8 *)"i'm alive\r\n", 11);
	}

	return 0;
}
