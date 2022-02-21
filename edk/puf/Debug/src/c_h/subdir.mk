################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
I:/FPGA_projects/xise_projects/puf/src/c_h/main.c \
I:/FPGA_projects/xise_projects/puf/src/c_h/puf.c 

OBJS += \
./src/c_h/main.o \
./src/c_h/puf.o 

C_DEPS += \
./src/c_h/main.d \
./src/c_h/puf.d 


# Each subdirectory must supply rules for building sources it contributes
src/c_h/main.o: I:/FPGA_projects/xise_projects/puf/src/c_h/main.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -std=c99 -Wall -O0 -g3 -c -fmessage-length=0 -I../../puf_bsp/microblaze_mcs_v1_4_0/include -mno-xl-reorder -mlittle-endian -mcpu=v8.40.a -mxl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/c_h/puf.o: I:/FPGA_projects/xise_projects/puf/src/c_h/puf.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -std=c99 -Wall -O0 -g3 -c -fmessage-length=0 -I../../puf_bsp/microblaze_mcs_v1_4_0/include -mno-xl-reorder -mlittle-endian -mcpu=v8.40.a -mxl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


