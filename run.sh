pushd ~/edk2
source edksetup.sh
build
popd 

#pushd mikanos/kernel
#echo "BUILDING Kernel......."
#clang++ -O2 -Wall -g --target=x86_64-elf -ffreestanding -mno-red-zone -fno-exceptions -fno-rtti -std=c++17 -c main.cpp
#ld.lld --entry KernelMain -z norelro --image-base 0x100000 --static -o kernel.elf main.o
#popd
pushd build
/mnt/d/workspaces/os/osbook/devenv/run_qemu.sh ~/edk2/Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi
popd
# /mnt/d/workspaces/os/mikanos/kernel/kernel.elf
