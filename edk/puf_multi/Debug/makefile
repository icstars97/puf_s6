################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
puf_multi.elf.size \

ELFCHECK += \
puf_multi.elf.elfcheck \


# All Target
all: puf_multi.elf secondary-outputs

# Tool invocations
puf_multi.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -Wl,-T -Wl,../src/lscript.ld -L../../puf_single_bsp/microblaze_mcs_v1_4_0/lib -mlittle-endian -mcpu=v8.40.a -mxl-soft-mul -Wl,--no-relax -Wl,--gc-sections -o "puf_multi.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

puf_multi.elf.size: puf_multi.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size puf_multi.elf  |tee "puf_multi.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

puf_multi.elf.elfcheck: puf_multi.elf
	@echo 'Invoking: Xilinx ELF Check'
	elfcheck puf_multi.elf -hw ../../puf_platform/system.xml -pe microblaze_mcs_v1_4_0  |tee "puf_multi.elf.elfcheck"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES)$(ELFSIZE)$(ELFCHECK)$(S_UPPER_DEPS) puf_multi.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE) $(ELFCHECK)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
