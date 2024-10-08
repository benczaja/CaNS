#
# external libraries compilation
#
ifeq ($(strip $(GPU)),1)
libs: $(wildcard $(LIBS_DIR)/2decomp-fft/src/*.f90)
	cd $(LIBS_DIR)/2decomp-fft && make
	cp $(LIBS_DIR)/cuDecomp_Makefile $(LIBS_DIR)/cuDecomp/Makefile
	cp $(LIBS_DIR)/nvhpcsdk.conf $(LIBS_DIR)/cuDecomp/configs/
	cd $(LIBS_DIR)/cuDecomp && make lib -j
libsclean: $(wildcard $(LIBS_DIR)/2decomp-fft/src/*.f90)
	cd $(LIBS_DIR)/2decomp-fft && make clean
	cd $(LIBS_DIR)/cuDecomp && make clean
else
libs: $(wildcard $(LIBS_DIR)/2decomp-fft/src/*.f90)
	cd $(LIBS_DIR)/2decomp-fft && make
libsclean: $(wildcard $(LIBS_DIR)/2decomp-fft/src/*.f90)
	cd $(LIBS_DIR)/2decomp-fft && make clean
endif
