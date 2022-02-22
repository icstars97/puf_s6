/*
 * main.c
 *
 *  Created on: Jan 26, 2022
 *      Author: ise
 */
#include "main.h"

extern XIOModule iomodule_inst_struct;
int main(void){


	platform_init();

	u8 cmd_buf[3] = {0x00U, 0x00U, 0x00U};
	while(1){

		XIOModule_Recv(&iomodule_inst_struct, cmd_buf, 3);

		switch (cmd_buf[0]){
			case 0xAAU:
				get_response(50000, 1000);
				break;

			case 0xBBU:

				break;
			default:

			break;
		}

		cmd_buf[0] = 0x00U;




	}

	return 0;
}
