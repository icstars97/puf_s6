/*
 * main.c
 *
 *  Created on: Jan 26, 2022
 *      Author: ise
 */
#include "main.h"

int main(void){


	platform_init();
//	XUartLite_Send(&uart_inst_struct, (u8 *)"i'm alive\r\n", 11);

	while(1){

		sleep(100);



	}

	return 0;
}
