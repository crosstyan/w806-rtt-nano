##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## BuildSet
ProjectName            :=W806_SDK
ConfigurationName      :=BuildSet
WorkspacePath          :=./
ProjectPath            :=./
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=Awesome
Date                   :=11/12/2021
CDKPath                :=D:/C-Sky/CDK
LinkerName             :=csky-elfabiv2-gcc
LinkerNameoption       :=
SIZE                   :=csky-elfabiv2-size
READELF                :=csky-elfabiv2-readelf
CHECKSUM               :=crc32
SharedObjectLinkerName :=
ObjectSuffix           :=.o
DependSuffix           :=.d
PreprocessSuffix       :=.i
DisassemSuffix         :=.asm
IHexSuffix             :=.ihex
BinSuffix              :=.bin
ExeSuffix              :=.elf
LibSuffix              :=.a
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
ElfInfoSwitch          :=-hlS
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
UnPreprocessorSwitch   :=-U
SourceSwitch           :=-c 
ObjdumpSwitch          :=-S
ObjcopySwitch          :=-O ihex
ObjcopyBinSwitch       :=-O binary
OutputFile             :=W806
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :=W806_SDK.txt
MakeDirCommand         :=mkdir
LinkOptions            := -mcpu=ck804ef  -mhard-float  -nostartfiles -Wl,--gc-sections -T"$(ProjectPath)../../../../../../../ld/W806/gcc_csky.ld"
LinkOtherFlagsOption   :=-Wl,-zmax-page-size=1024 -mhard-float
IncludePackagePath     :=
IncludeCPath           := $(IncludeSwitch)D:/C-Sky/CDK/CSKY/MinGW/csky-abiv2-elf-toolchain/csky-elfabiv2/include $(IncludeSwitch). $(IncludeSwitch)../../../../../../../app/inc $(IncludeSwitch)../../../../../../../include $(IncludeSwitch)../../../../../../../include/arch/xt804 $(IncludeSwitch)../../../../../../../include/arch/xt804/csi_core $(IncludeSwitch)../../../../../../../include/arch/xt804/csi_dsp $(IncludeSwitch)../../../../../../../include/driver $(IncludeSwitch)../../../../../../../rt-thread/components/finsh $(IncludeSwitch)../../../../../../../rt-thread/include $(IncludeSwitch)../../../../../../../rt-thread/bsp $(IncludeSwitch)../../../../../../../rt-thread/include/libc  
IncludeAPath           := $(IncludeSwitch)D:/C-Sky/CDK/CSKY/csi/csi_core/csi_cdk/ $(IncludeSwitch)D:/C-Sky/CDK/CSKY/csi/csi_core/include/ $(IncludeSwitch)D:/C-Sky/CDK/CSKY/csi/csi_driver/include/ $(IncludeSwitch). $(IncludeSwitch)../../../../../../../include $(IncludeSwitch)../../../../../../../include/arch/xt804 $(IncludeSwitch)../../../../../../../include/arch/xt804/csi_core $(IncludeSwitch)../../../../../../../include/arch/xt804/csi_dsp $(IncludeSwitch)../../../../../../../include/os $(IncludeSwitch)../../../../../../../include/platform $(IncludeSwitch)../../../../../../../rt-thread/components/finsh $(IncludeSwitch)../../../../../../../rt-thread/include $(IncludeSwitch)../../../../../../../rt-thread/bsp $(IncludeSwitch)../../../../../../../rt-thread/include/libc  
Libs                   := -Wl,--start-group  -Wl,--end-group $(LibrarySwitch)dsp  
ArLibs                 := "dsp" 
PackagesLibPath        :=
LibPath                :=$(LibraryPathSwitch)../../../../../../../lib/W806  $(PackagesLibPath) 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       :=csky-elfabiv2-ar rcu
CXX      :=csky-elfabiv2-g++
CC       :=csky-elfabiv2-gcc
AS       :=csky-elfabiv2-gcc
OBJDUMP  :=csky-elfabiv2-objdump
OBJCOPY  :=csky-elfabiv2-objcopy
CXXFLAGS := -mcpu=ck804ef  -mhard-float   $(PreprocessorSwitch)GCC_COMPILE=1  $(PreprocessorSwitch)TLS_CONFIG_CPU_XT804=1   -O2  -g3  -Wall  -ffunction-sections -fdata-sections -c 
CFLAGS   := -mcpu=ck804ef  -mhard-float   $(PreprocessorSwitch)GCC_COMPILE=1  $(PreprocessorSwitch)TLS_CONFIG_CPU_XT804=1   -O2  -g3  -Wall  -ffunction-sections -fdata-sections -c 
ASFLAGS  := -mcpu=ck804ef  -mhard-float    -Wa,--gdwarf2    


Objects0=$(IntermediateDirectory)/drivers_wm_gpio$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_uart$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_cpu$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_hal$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_spi$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_wdg$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_tim$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_internal_flash$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_adc$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_pwm$(ObjectSuffix) \
	$(IntermediateDirectory)/drivers_wm_pmu$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_spi_flash$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_i2c$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_touch$(ObjectSuffix) $(IntermediateDirectory)/src_main$(ObjectSuffix) $(IntermediateDirectory)/src_wm_it$(ObjectSuffix) $(IntermediateDirectory)/src_led$(ObjectSuffix) $(IntermediateDirectory)/src_user$(ObjectSuffix) $(IntermediateDirectory)/src_serial$(ObjectSuffix) $(IntermediateDirectory)/src_StaticQueue$(ObjectSuffix) \
	$(IntermediateDirectory)/src_SerialProcess$(ObjectSuffix) $(IntermediateDirectory)/src_contex_test$(ObjectSuffix) $(IntermediateDirectory)/bsp_board$(ObjectSuffix) $(IntermediateDirectory)/src_clock$(ObjectSuffix) $(IntermediateDirectory)/src_components$(ObjectSuffix) $(IntermediateDirectory)/src_cpu$(ObjectSuffix) $(IntermediateDirectory)/src_idle$(ObjectSuffix) $(IntermediateDirectory)/src_ipc$(ObjectSuffix) $(IntermediateDirectory)/src_irq$(ObjectSuffix) $(IntermediateDirectory)/src_kservice$(ObjectSuffix) \
	$(IntermediateDirectory)/src_mem$(ObjectSuffix) $(IntermediateDirectory)/src_memheap$(ObjectSuffix) $(IntermediateDirectory)/src_mempool$(ObjectSuffix) $(IntermediateDirectory)/src_object$(ObjectSuffix) $(IntermediateDirectory)/src_scheduler$(ObjectSuffix) $(IntermediateDirectory)/src_slab$(ObjectSuffix) $(IntermediateDirectory)/src_thread$(ObjectSuffix) $(IntermediateDirectory)/src_timer$(ObjectSuffix) $(IntermediateDirectory)/bsp_startup$(ObjectSuffix) $(IntermediateDirectory)/bsp_system$(ObjectSuffix) \
	$(IntermediateDirectory)/bsp_trap_c$(ObjectSuffix) $(IntermediateDirectory)/bsp_vectors$(ObjectSuffix) $(IntermediateDirectory)/bsp_board_init$(ObjectSuffix) $(IntermediateDirectory)/libc_libc_port$(ObjectSuffix) $(IntermediateDirectory)/device_device$(ObjectSuffix) $(IntermediateDirectory)/finsh_cmd$(ObjectSuffix) $(IntermediateDirectory)/finsh_finsh_port$(ObjectSuffix) $(IntermediateDirectory)/finsh_msh$(ObjectSuffix) $(IntermediateDirectory)/finsh_shell$(ObjectSuffix) 

Objects1=$(IntermediateDirectory)/x804_context_x804$(ObjectSuffix) \
	$(IntermediateDirectory)/x804_cpu$(ObjectSuffix) $(IntermediateDirectory)/__rt_entry$(ObjectSuffix) 



Objects=$(Objects0) $(Objects1) 

##
## Main Build Targets 
##
.PHONY: all
all: $(IntermediateDirectory)/$(OutputFile)

$(IntermediateDirectory)/$(OutputFile):  $(Objects) Always_Link 
	$(LinkerName) $(OutputSwitch) $(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) $(LinkerNameoption) $(LinkOtherFlagsOption)  -Wl,--ckmap=$(ProjectPath)/Lst/$(OutputFile).map  @$(ObjectsFileList)  $(LinkOptions) $(LibPath) $(Libs)
	@mv $(ProjectPath)/Lst/$(OutputFile).map $(ProjectPath)/Lst/$(OutputFile).temp && $(READELF) $(ElfInfoSwitch) $(ProjectPath)/Obj/$(OutputFile)$(ExeSuffix) > $(ProjectPath)/Lst/$(OutputFile).map && echo ====================================================================== >> $(ProjectPath)/Lst/$(OutputFile).map && cat $(ProjectPath)/Lst/$(OutputFile).temp >> $(ProjectPath)/Lst/$(OutputFile).map && rm -rf $(ProjectPath)/Lst/$(OutputFile).temp
	$(OBJDUMP) $(ObjdumpSwitch) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)  > $(ProjectPath)/Lst/$(OutputFile)$(DisassemSuffix) 
	@echo size of target:
	@$(SIZE) $(ProjectPath)$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@echo -n checksum value of target:  
	@$(CHECKSUM) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@$(ProjectName).modify.bat $(IntermediateDirectory) $(OutputFile)$(ExeSuffix) 

Always_Link:


##
## Objects
##
$(IntermediateDirectory)/drivers_wm_gpio$(ObjectSuffix): ../../../../../../../platform/drivers/wm_gpio.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_gpio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_gpio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_gpio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_gpio$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_gpio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_gpio$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_gpio.c

$(IntermediateDirectory)/drivers_wm_uart$(ObjectSuffix): ../../../../../../../platform/drivers/wm_uart.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_uart.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_uart$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_uart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_uart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_uart$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_uart.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_uart$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_uart.c

$(IntermediateDirectory)/drivers_wm_cpu$(ObjectSuffix): ../../../../../../../platform/drivers/wm_cpu.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_cpu.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_cpu$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_cpu$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_cpu$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_cpu$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_cpu.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_cpu$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_cpu.c

$(IntermediateDirectory)/drivers_wm_hal$(ObjectSuffix): ../../../../../../../platform/drivers/wm_hal.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_hal.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_hal$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_hal$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_hal$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_hal$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_hal.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_hal$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_hal.c

$(IntermediateDirectory)/drivers_wm_spi$(ObjectSuffix): ../../../../../../../platform/drivers/wm_spi.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_spi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_spi$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_spi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_spi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_spi$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_spi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_spi$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_spi.c

$(IntermediateDirectory)/drivers_wm_wdg$(ObjectSuffix): ../../../../../../../platform/drivers/wm_wdg.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_wdg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_wdg$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_wdg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_wdg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_wdg$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_wdg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_wdg$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_wdg.c

$(IntermediateDirectory)/drivers_wm_tim$(ObjectSuffix): ../../../../../../../platform/drivers/wm_tim.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_tim.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_tim$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_tim$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_tim$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_tim$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_tim.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_tim$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_tim.c

$(IntermediateDirectory)/drivers_wm_internal_flash$(ObjectSuffix): ../../../../../../../platform/drivers/wm_internal_flash.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_internal_flash.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_internal_flash$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_internal_flash$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_internal_flash$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_internal_flash$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_internal_flash.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_internal_flash$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_internal_flash.c

$(IntermediateDirectory)/drivers_wm_adc$(ObjectSuffix): ../../../../../../../platform/drivers/wm_adc.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_adc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_adc$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_adc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_adc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_adc$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_adc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_adc$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_adc.c

$(IntermediateDirectory)/drivers_wm_pwm$(ObjectSuffix): ../../../../../../../platform/drivers/wm_pwm.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_pwm.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_pwm$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_pwm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_pwm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_pwm$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_pwm.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_pwm$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_pwm.c

$(IntermediateDirectory)/drivers_wm_pmu$(ObjectSuffix): ../../../../../../../platform/drivers/wm_pmu.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_pmu.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_pmu$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_pmu$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_pmu$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_pmu$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_pmu.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_pmu$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_pmu.c

$(IntermediateDirectory)/drivers_wm_spi_flash$(ObjectSuffix): ../../../../../../../platform/drivers/wm_spi_flash.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_spi_flash.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_spi_flash$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_spi_flash$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_spi_flash$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_spi_flash$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_spi_flash.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_spi_flash$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_spi_flash.c

$(IntermediateDirectory)/drivers_wm_i2c$(ObjectSuffix): ../../../../../../../platform/drivers/wm_i2c.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_i2c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_i2c$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_i2c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_i2c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_i2c$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_i2c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_i2c$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_i2c.c

$(IntermediateDirectory)/drivers_wm_touch$(ObjectSuffix): ../../../../../../../platform/drivers/wm_touch.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_touch.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_touch$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_touch$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_touch$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_touch$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_touch.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_touch$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_touch.c

$(IntermediateDirectory)/src_main$(ObjectSuffix): ../../../../../../../app/src/main.c  
	$(CC) $(SourceSwitch) ../../../../../../../app/src/main.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_main$(ObjectSuffix) -MF$(IntermediateDirectory)/src_main$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_main$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_main$(PreprocessSuffix): ../../../../../../../app/src/main.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_main$(PreprocessSuffix) ../../../../../../../app/src/main.c

$(IntermediateDirectory)/src_wm_it$(ObjectSuffix): ../../../../../../../app/src/wm_it.c  
	$(CC) $(SourceSwitch) ../../../../../../../app/src/wm_it.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_wm_it$(ObjectSuffix) -MF$(IntermediateDirectory)/src_wm_it$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_wm_it$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_wm_it$(PreprocessSuffix): ../../../../../../../app/src/wm_it.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_wm_it$(PreprocessSuffix) ../../../../../../../app/src/wm_it.c

$(IntermediateDirectory)/src_led$(ObjectSuffix): ../../../../../../../app/src/led.c  
	$(CC) $(SourceSwitch) ../../../../../../../app/src/led.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_led$(ObjectSuffix) -MF$(IntermediateDirectory)/src_led$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_led$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_led$(PreprocessSuffix): ../../../../../../../app/src/led.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_led$(PreprocessSuffix) ../../../../../../../app/src/led.c

$(IntermediateDirectory)/src_user$(ObjectSuffix): ../../../../../../../app/src/user.c  
	$(CC) $(SourceSwitch) ../../../../../../../app/src/user.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_user$(ObjectSuffix) -MF$(IntermediateDirectory)/src_user$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_user$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_user$(PreprocessSuffix): ../../../../../../../app/src/user.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_user$(PreprocessSuffix) ../../../../../../../app/src/user.c

$(IntermediateDirectory)/src_serial$(ObjectSuffix): ../../../../../../../app/src/serial.c  
	$(CC) $(SourceSwitch) ../../../../../../../app/src/serial.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_serial$(ObjectSuffix) -MF$(IntermediateDirectory)/src_serial$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_serial$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_serial$(PreprocessSuffix): ../../../../../../../app/src/serial.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_serial$(PreprocessSuffix) ../../../../../../../app/src/serial.c

$(IntermediateDirectory)/src_StaticQueue$(ObjectSuffix): ../../../../../../../app/src/StaticQueue.c  
	$(CC) $(SourceSwitch) ../../../../../../../app/src/StaticQueue.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_StaticQueue$(ObjectSuffix) -MF$(IntermediateDirectory)/src_StaticQueue$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_StaticQueue$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_StaticQueue$(PreprocessSuffix): ../../../../../../../app/src/StaticQueue.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_StaticQueue$(PreprocessSuffix) ../../../../../../../app/src/StaticQueue.c

$(IntermediateDirectory)/src_SerialProcess$(ObjectSuffix): ../../../../../../../app/src/SerialProcess.c  
	$(CC) $(SourceSwitch) ../../../../../../../app/src/SerialProcess.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_SerialProcess$(ObjectSuffix) -MF$(IntermediateDirectory)/src_SerialProcess$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_SerialProcess$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_SerialProcess$(PreprocessSuffix): ../../../../../../../app/src/SerialProcess.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_SerialProcess$(PreprocessSuffix) ../../../../../../../app/src/SerialProcess.c

$(IntermediateDirectory)/src_contex_test$(ObjectSuffix): ../../../../../../../app/src/contex_test.c  
	$(CC) $(SourceSwitch) ../../../../../../../app/src/contex_test.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_contex_test$(ObjectSuffix) -MF$(IntermediateDirectory)/src_contex_test$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_contex_test$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_contex_test$(PreprocessSuffix): ../../../../../../../app/src/contex_test.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_contex_test$(PreprocessSuffix) ../../../../../../../app/src/contex_test.c

$(IntermediateDirectory)/bsp_board$(ObjectSuffix): ../../../../../../../rt-thread/bsp/board.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/bsp/board.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_board$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_board$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_board$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/bsp_board$(PreprocessSuffix): ../../../../../../../rt-thread/bsp/board.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_board$(PreprocessSuffix) ../../../../../../../rt-thread/bsp/board.c

$(IntermediateDirectory)/src_clock$(ObjectSuffix): ../../../../../../../rt-thread/src/clock.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/src/clock.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_clock$(ObjectSuffix) -MF$(IntermediateDirectory)/src_clock$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_clock$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_clock$(PreprocessSuffix): ../../../../../../../rt-thread/src/clock.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_clock$(PreprocessSuffix) ../../../../../../../rt-thread/src/clock.c

$(IntermediateDirectory)/src_components$(ObjectSuffix): ../../../../../../../rt-thread/src/components.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/src/components.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_components$(ObjectSuffix) -MF$(IntermediateDirectory)/src_components$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_components$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_components$(PreprocessSuffix): ../../../../../../../rt-thread/src/components.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_components$(PreprocessSuffix) ../../../../../../../rt-thread/src/components.c

$(IntermediateDirectory)/src_cpu$(ObjectSuffix): ../../../../../../../rt-thread/src/cpu.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/src/cpu.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_cpu$(ObjectSuffix) -MF$(IntermediateDirectory)/src_cpu$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_cpu$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_cpu$(PreprocessSuffix): ../../../../../../../rt-thread/src/cpu.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_cpu$(PreprocessSuffix) ../../../../../../../rt-thread/src/cpu.c

$(IntermediateDirectory)/src_idle$(ObjectSuffix): ../../../../../../../rt-thread/src/idle.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/src/idle.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_idle$(ObjectSuffix) -MF$(IntermediateDirectory)/src_idle$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_idle$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_idle$(PreprocessSuffix): ../../../../../../../rt-thread/src/idle.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_idle$(PreprocessSuffix) ../../../../../../../rt-thread/src/idle.c

$(IntermediateDirectory)/src_ipc$(ObjectSuffix): ../../../../../../../rt-thread/src/ipc.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/src/ipc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_ipc$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ipc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_ipc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_ipc$(PreprocessSuffix): ../../../../../../../rt-thread/src/ipc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_ipc$(PreprocessSuffix) ../../../../../../../rt-thread/src/ipc.c

$(IntermediateDirectory)/src_irq$(ObjectSuffix): ../../../../../../../rt-thread/src/irq.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/src/irq.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_irq$(ObjectSuffix) -MF$(IntermediateDirectory)/src_irq$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_irq$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_irq$(PreprocessSuffix): ../../../../../../../rt-thread/src/irq.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_irq$(PreprocessSuffix) ../../../../../../../rt-thread/src/irq.c

$(IntermediateDirectory)/src_kservice$(ObjectSuffix): ../../../../../../../rt-thread/src/kservice.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/src/kservice.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_kservice$(ObjectSuffix) -MF$(IntermediateDirectory)/src_kservice$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_kservice$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_kservice$(PreprocessSuffix): ../../../../../../../rt-thread/src/kservice.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_kservice$(PreprocessSuffix) ../../../../../../../rt-thread/src/kservice.c

$(IntermediateDirectory)/src_mem$(ObjectSuffix): ../../../../../../../rt-thread/src/mem.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/src/mem.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_mem$(ObjectSuffix) -MF$(IntermediateDirectory)/src_mem$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_mem$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_mem$(PreprocessSuffix): ../../../../../../../rt-thread/src/mem.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_mem$(PreprocessSuffix) ../../../../../../../rt-thread/src/mem.c

$(IntermediateDirectory)/src_memheap$(ObjectSuffix): ../../../../../../../rt-thread/src/memheap.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/src/memheap.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_memheap$(ObjectSuffix) -MF$(IntermediateDirectory)/src_memheap$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_memheap$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_memheap$(PreprocessSuffix): ../../../../../../../rt-thread/src/memheap.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_memheap$(PreprocessSuffix) ../../../../../../../rt-thread/src/memheap.c

$(IntermediateDirectory)/src_mempool$(ObjectSuffix): ../../../../../../../rt-thread/src/mempool.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/src/mempool.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_mempool$(ObjectSuffix) -MF$(IntermediateDirectory)/src_mempool$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_mempool$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_mempool$(PreprocessSuffix): ../../../../../../../rt-thread/src/mempool.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_mempool$(PreprocessSuffix) ../../../../../../../rt-thread/src/mempool.c

$(IntermediateDirectory)/src_object$(ObjectSuffix): ../../../../../../../rt-thread/src/object.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/src/object.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_object$(ObjectSuffix) -MF$(IntermediateDirectory)/src_object$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_object$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_object$(PreprocessSuffix): ../../../../../../../rt-thread/src/object.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_object$(PreprocessSuffix) ../../../../../../../rt-thread/src/object.c

$(IntermediateDirectory)/src_scheduler$(ObjectSuffix): ../../../../../../../rt-thread/src/scheduler.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/src/scheduler.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_scheduler$(ObjectSuffix) -MF$(IntermediateDirectory)/src_scheduler$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_scheduler$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_scheduler$(PreprocessSuffix): ../../../../../../../rt-thread/src/scheduler.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_scheduler$(PreprocessSuffix) ../../../../../../../rt-thread/src/scheduler.c

$(IntermediateDirectory)/src_slab$(ObjectSuffix): ../../../../../../../rt-thread/src/slab.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/src/slab.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_slab$(ObjectSuffix) -MF$(IntermediateDirectory)/src_slab$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_slab$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_slab$(PreprocessSuffix): ../../../../../../../rt-thread/src/slab.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_slab$(PreprocessSuffix) ../../../../../../../rt-thread/src/slab.c

$(IntermediateDirectory)/src_thread$(ObjectSuffix): ../../../../../../../rt-thread/src/thread.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/src/thread.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_thread$(ObjectSuffix) -MF$(IntermediateDirectory)/src_thread$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_thread$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_thread$(PreprocessSuffix): ../../../../../../../rt-thread/src/thread.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_thread$(PreprocessSuffix) ../../../../../../../rt-thread/src/thread.c

$(IntermediateDirectory)/src_timer$(ObjectSuffix): ../../../../../../../rt-thread/src/timer.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/src/timer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_timer$(ObjectSuffix) -MF$(IntermediateDirectory)/src_timer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_timer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_timer$(PreprocessSuffix): ../../../../../../../rt-thread/src/timer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_timer$(PreprocessSuffix) ../../../../../../../rt-thread/src/timer.c

$(IntermediateDirectory)/bsp_startup$(ObjectSuffix): ../../../../../../../platform/arch/xt804/bsp/startup.S  
	$(AS) $(SourceSwitch) ../../../../../../../platform/arch/xt804/bsp/startup.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_startup$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_startup$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_startup$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/bsp_startup$(PreprocessSuffix): ../../../../../../../platform/arch/xt804/bsp/startup.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_startup$(PreprocessSuffix) ../../../../../../../platform/arch/xt804/bsp/startup.S

$(IntermediateDirectory)/bsp_system$(ObjectSuffix): ../../../../../../../platform/arch/xt804/bsp/system.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/arch/xt804/bsp/system.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_system$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_system$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_system$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/bsp_system$(PreprocessSuffix): ../../../../../../../platform/arch/xt804/bsp/system.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_system$(PreprocessSuffix) ../../../../../../../platform/arch/xt804/bsp/system.c

$(IntermediateDirectory)/bsp_trap_c$(ObjectSuffix): ../../../../../../../platform/arch/xt804/bsp/trap_c.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/arch/xt804/bsp/trap_c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_trap_c$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_trap_c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_trap_c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/bsp_trap_c$(PreprocessSuffix): ../../../../../../../platform/arch/xt804/bsp/trap_c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_trap_c$(PreprocessSuffix) ../../../../../../../platform/arch/xt804/bsp/trap_c.c

$(IntermediateDirectory)/bsp_vectors$(ObjectSuffix): ../../../../../../../platform/arch/xt804/bsp/vectors.S  
	$(AS) $(SourceSwitch) ../../../../../../../platform/arch/xt804/bsp/vectors.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_vectors$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_vectors$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_vectors$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/bsp_vectors$(PreprocessSuffix): ../../../../../../../platform/arch/xt804/bsp/vectors.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_vectors$(PreprocessSuffix) ../../../../../../../platform/arch/xt804/bsp/vectors.S

$(IntermediateDirectory)/bsp_board_init$(ObjectSuffix): ../../../../../../../platform/arch/xt804/bsp/board_init.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/arch/xt804/bsp/board_init.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_board_init$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_board_init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_board_init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/bsp_board_init$(PreprocessSuffix): ../../../../../../../platform/arch/xt804/bsp/board_init.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_board_init$(PreprocessSuffix) ../../../../../../../platform/arch/xt804/bsp/board_init.c

$(IntermediateDirectory)/libc_libc_port$(ObjectSuffix): ../../../../../../../platform/arch/xt804/libc/libc_port.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/arch/xt804/libc/libc_port.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_libc_port$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_libc_port$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_libc_port$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_libc_port$(PreprocessSuffix): ../../../../../../../platform/arch/xt804/libc/libc_port.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_libc_port$(PreprocessSuffix) ../../../../../../../platform/arch/xt804/libc/libc_port.c

$(IntermediateDirectory)/device_device$(ObjectSuffix): ../../../../../../../rt-thread/components/device/device.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/components/device/device.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/device_device$(ObjectSuffix) -MF$(IntermediateDirectory)/device_device$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/device_device$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/device_device$(PreprocessSuffix): ../../../../../../../rt-thread/components/device/device.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/device_device$(PreprocessSuffix) ../../../../../../../rt-thread/components/device/device.c

$(IntermediateDirectory)/finsh_cmd$(ObjectSuffix): ../../../../../../../rt-thread/components/finsh/cmd.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/components/finsh/cmd.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/finsh_cmd$(ObjectSuffix) -MF$(IntermediateDirectory)/finsh_cmd$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/finsh_cmd$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/finsh_cmd$(PreprocessSuffix): ../../../../../../../rt-thread/components/finsh/cmd.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/finsh_cmd$(PreprocessSuffix) ../../../../../../../rt-thread/components/finsh/cmd.c

$(IntermediateDirectory)/finsh_finsh_port$(ObjectSuffix): ../../../../../../../rt-thread/components/finsh/finsh_port.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/components/finsh/finsh_port.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/finsh_finsh_port$(ObjectSuffix) -MF$(IntermediateDirectory)/finsh_finsh_port$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/finsh_finsh_port$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/finsh_finsh_port$(PreprocessSuffix): ../../../../../../../rt-thread/components/finsh/finsh_port.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/finsh_finsh_port$(PreprocessSuffix) ../../../../../../../rt-thread/components/finsh/finsh_port.c

$(IntermediateDirectory)/finsh_msh$(ObjectSuffix): ../../../../../../../rt-thread/components/finsh/msh.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/components/finsh/msh.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/finsh_msh$(ObjectSuffix) -MF$(IntermediateDirectory)/finsh_msh$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/finsh_msh$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/finsh_msh$(PreprocessSuffix): ../../../../../../../rt-thread/components/finsh/msh.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/finsh_msh$(PreprocessSuffix) ../../../../../../../rt-thread/components/finsh/msh.c

$(IntermediateDirectory)/finsh_shell$(ObjectSuffix): ../../../../../../../rt-thread/components/finsh/shell.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/components/finsh/shell.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/finsh_shell$(ObjectSuffix) -MF$(IntermediateDirectory)/finsh_shell$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/finsh_shell$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/finsh_shell$(PreprocessSuffix): ../../../../../../../rt-thread/components/finsh/shell.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/finsh_shell$(PreprocessSuffix) ../../../../../../../rt-thread/components/finsh/shell.c

$(IntermediateDirectory)/x804_context_x804$(ObjectSuffix): ../../../../../../../rt-thread/libcpu/cky/x804/context_x804.s  
	$(AS) $(SourceSwitch) ../../../../../../../rt-thread/libcpu/cky/x804/context_x804.s $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/x804_context_x804$(ObjectSuffix) -MF$(IntermediateDirectory)/x804_context_x804$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/x804_context_x804$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/x804_context_x804$(PreprocessSuffix): ../../../../../../../rt-thread/libcpu/cky/x804/context_x804.s
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/x804_context_x804$(PreprocessSuffix) ../../../../../../../rt-thread/libcpu/cky/x804/context_x804.s

$(IntermediateDirectory)/x804_cpu$(ObjectSuffix): ../../../../../../../rt-thread/libcpu/cky/x804/cpu.c  
	$(CC) $(SourceSwitch) ../../../../../../../rt-thread/libcpu/cky/x804/cpu.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/x804_cpu$(ObjectSuffix) -MF$(IntermediateDirectory)/x804_cpu$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/x804_cpu$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/x804_cpu$(PreprocessSuffix): ../../../../../../../rt-thread/libcpu/cky/x804/cpu.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/x804_cpu$(PreprocessSuffix) ../../../../../../../rt-thread/libcpu/cky/x804/cpu.c


$(IntermediateDirectory)/__rt_entry$(ObjectSuffix): $(IntermediateDirectory)/__rt_entry$(DependSuffix)
	@$(AS) $(SourceSwitch) $(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) $(IncludeAPath)
$(IntermediateDirectory)/__rt_entry$(DependSuffix):
	@$(CC) $(CFLAGS) $(IncludeAPath) -MG -MP -MT$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) -MF$(IntermediateDirectory)/__rt_entry$(DependSuffix) -MM $(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S

-include $(IntermediateDirectory)/*$(DependSuffix)
