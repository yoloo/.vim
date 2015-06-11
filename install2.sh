$tmp="~/tmp/";
$build="~/tmp/build/";
$ycm_build="~/tmp/ycm_build/";

if [ ! -d $tmp];
then
mkdir $tmp;
fi

if [! -d $build];
then
    mkdir $build;
fi

if [! -d $ycm_build];
then
    mkdir $ycm_build;
fi

cd $tmp;
#llvm
wget http://llvm.org/releases/3.4/llvm-3.4.src.tar.gz;
tar xzf llvm-3.4.src.tar.gz
rm llvm-3.4.src.tar.gz
mv -f llvm-3.4.src.tar.gz llvm

cd ./llvm/tools;
#clang
wget http://llvm.org/releases/3.4/clang-3.4.src.tar.gz;
tar xzf clang-3.4.src.tar.gz;
rm clang-3.4.src.tar.gz;
mv -f clang-3.4 clang

cd ../projects;
#compiler-rt
wget http://llvm.org/releases/3.4/compiler-rt-3.4.src.tar.gz;
tar xzf compiler-rt-3.4.src.tar.gz;
rm compiler-rt-3.4.src.tar.gz;
mv -f compiler-rt-3.4.src.tar.gz compiler-rt;

#test-suite
wget http://llvm.org/releases/3.4/test-suite-3.4.src.tar.gz;
tar xzf test-suite-3.4.src.tar.gz;
rm test-suite-3.4.src.tar.gz;
mv -f test-suite-3.4 test-suite;

cd $build;
../llvm/configure --enable-optimized;
make -j2;
sudo make install;

cd $ycm_build;
cmake -G "Unix Makefiles" -DEXTERNAL_LIBCLANG_PATH=~/tmp/build/Release+Asserts/lib/libclang.so . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ 
