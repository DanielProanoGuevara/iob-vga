include $(VGA_DIR)/hardware/hardware.mk

DEFINE+=$(defmacro)VCD

VSRC+=$(wildcard $(VGA_HW_DIR)/testbench/*.v)
