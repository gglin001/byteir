pushd external/llvm-project && git fetch && git checkout $(cat ../../build_tools/llvm_version.txt) && popd

bash build_tools/build_mlir.sh ${PWD}/external/llvm-project/ ${PWD}/llvm-build

ln -s $(pwd)/llvm-build $(pwd)/compiler/llvm-build
ln -s $(pwd)/llvm-build $(pwd)/runtime/llvm-build
