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
//	XUartLite_Send(&uart_inst_struct, (u8 *)"i'm alive\r\n", 11);
	u8 uart_rx_buf;
	while(1){

		sleep(100);
		XUartLite_Recv(&uart_inst_struct, &uart_rx_buf, 1);

		if (uart_rx_buf == 0xAAU){
			get_response(5000, 10);
		}
		uart_rx_buf = 0x00U;



	}

	return 0;
}
