pushd ../kernel
clang++ -O2 -Wall -g --target=x86_64-elf -ffreestanding -mno-red-zone -fno-exceptions -fno-rtti -std=c++17 -c main.cpp || {
 echo "Failed in compile kernel"
 exit 1
}

ld.lld --entry KernelMain -z norelro --image-base 0x100000 --static -o kernel.elf main.o || {
 echo "Failed in link kernel"
 exit 1
}
popd

pushd ~/edk2
source edksetup.sh || {
   echo "Failed in edksetup.sh"
   exit 1
}
build || {
 echo "Failed in build"
 exit 1
}
popd


pushd build
/mnt/d/workspaces/os/osbook/devenv/run_qemu.sh ~/edk2/Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi /mnt/d/workspaces/os/mikanos/kernel/kernel.elf || {
 echo "Failed in run_qemu.sh"
 exit 1
}

popd
#
