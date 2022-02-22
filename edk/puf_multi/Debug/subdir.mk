################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../main.c \
../puf.c 

OBJS += \
./main.o \
./puf.o 

C_DEPS += \
./main.d \
./puf.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -std=c99 -Wall -O0 -g3 -c -fmessage-length=0 -I../../puf_single_bsp/microblaze_mcs_v1_4_0/include -mno-xl-reorder -mlittle-endian -mcpu=v8.40.a -mxl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


