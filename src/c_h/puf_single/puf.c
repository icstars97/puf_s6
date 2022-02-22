/*
 * puf.c
 *
 *  Created on: Jan 26, 2022
 *      Author: ise
 */
#include "main.h"


XIOModule iomodule_inst_struct;

void platform_init(void){

	XIOModule_Initialize(&iomodule_inst_struct,XPAR_IOMODULE_0_DEVICE_ID);
	XIOModule_Start(&iomodule_inst_struct);

}



void sleep(u32 sleep_ticks){
	for(u32 i=0;i<sleep_ticks;i++){
		__asm__("nop");
	}
}


void get_response(u32 scan_delay){

	XIOModule_DiscreteWrite(&iomodule_inst_struct,1,0);
	XIOModule_DiscreteWrite(&iomodule_inst_struct,2,0);


	u8 response_word = 0x00U;
	u32 challenge = 0x0000U;

	for (u32 i=0;i<WORD_COUNT;i++){
		for (u8 j=0;j<8;j++){
			XIOModule_DiscreteWrite(&iomodule_inst_struct,1,challenge);
			sleep(100);
			XIOModule_DiscreteWrite(&iomodule_inst_struct,2,1);
			sleep(scan_delay>>1);
			response_word |= (XIOModule_DiscreteRead(&iomodule_inst_struct,1) & 1) << j;
			XIOModule_DiscreteWrite(&iomodule_inst_struct,2,0);
			//challenge += 1;
		}

		XIOModule_Send(&iomodule_inst_struct, &response_word, 1);
		sleep(scan_delay>>1);
		response_word = 0x00U;
	}




}
