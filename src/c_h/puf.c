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
	XIOModule_DiscreteWrite(&iomodule_inst_struct,2,1);

	u8 response[2];


	for (u32 i=0;i<CHALLENGE_COUNT;i++){

		XIOModule_DiscreteWrite(&iomodule_inst_struct,1,i);
		XIOModule_DiscreteWrite(&iomodule_inst_struct,2,1);
		sleep(1000);
		response[0] = (u8) XIOModule_DiscreteRead(&iomodule_inst_struct,2);
		response[1] = (u8) (XIOModule_DiscreteRead(&iomodule_inst_struct,2) >> 8);
		XIOModule_DiscreteWrite(&iomodule_inst_struct,2,0);

	}




}

