ifeq ($(filter VGA, $(HW_MODULES)),)

include $(VGA_DIR)/config.mk

#add itself to HW_MODULES list
HW_MODULES+=VGA


VGA_INC_DIR:=$(VGA_HW_DIR)/include
VGA_SRC_DIR:=$(VGA_HW_DIR)/src

#import module
include $(LIB_DIR)/hardware/iob_reg/hardware.mk


#include files
VHDR+=$(wildcard $(VGA_INC_DIR)/*.vh)
VHDR+=iob_vga_swreg_gen.vh iob_vga_swreg_def.vh
VHDR+=$(LIB_DIR)/hardware/include/iob_lib.vh $(LIB_DIR)/hardware/include/iob_s_if.vh $(LIB_DIR)/hardware/include/iob_gen_if.vh

#hardware include dirs
INCLUDE+=$(incdir). $(incdir)$(VGA_INC_DIR) $(incdir)$(LIB_DIR)/hardware/include

#sources
VSRC+=$(wildcard $(VGA_SRC_DIR)/*.v)

vga-hw-clean:
	@rm -f *.v *.vh

.PHONY: vga-hw-clean

endif
