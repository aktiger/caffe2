# This makefile does nothing but delegating the actual building to cmake.

all:
	@mkdir -p build && cd build && cmake .. $(shell python ./scripts/get_python_cmake_flags.py) -DCUDA_USE_STATIC_CUDA_RUNTIME=OFF -DCMAKE_VERBOSE_MAKEFILE=ON && $(MAKE)

local:
	@./scripts/build_local.sh

android:
	@./scripts/build_android.sh

ios:
	@./scripts/build_ios.sh

clean: # This will remove ALL build folders.
	@rm -fr build*/

linecount:
	@cloc --read-lang-def=caffe.cloc caffe2 || \
		echo "Cloc is not available on the machine. You can install cloc with " && \
		echo "    sudo apt-get install cloc"
