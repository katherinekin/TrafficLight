if [ -f test/main ]; then
    rm test/main
fi
g++ -std=c++11 src/*.cpp -o test/main

if [ ! -f test/main ]; then
    echo -e "\033[1;91mCompile FAILED.\033[0m"
    exit
fi
if [ -f test/inputFile ]; then
echo -e "\033[1;91mNo InputFile.\033[0m"
    exit
fi

if [ -f test/ansFile ]; then
echo -e "\033[1;91mNo ansFile.\033[0m"
    exit
fi

# clean
rm -rf test/outputFile
mkdir test/outputFile

if [ -f */*.out ]; then
    rm */*.out
fi
if [ -f */*.stderr ]; then
    rm */*.stderr
fi
if [ -f */*.stdcout ]; then
    rm */*.stdcout
fi

echo -e "\033[1;94mRunning Test 1.\033[0m"
#Test 1
./test/main < test/inputFile/input1.txt  1 | tee test/outputFile/output1.txt
diff -iEBwu test/ansFile/ans1.txt test/outputFile/output1.txt > test/diff1.txt

if [ $? -ne 0 ]; then
    echo -e "Test case 1    \033[1;91mFAILED.\033[0m"
else
    echo -e "Test case 1    \033[1;92mPASSED.\033[0m"
    rm -f test/diff1.txt
fi
echo

echo -e "\033[1;94mRunning Test 2.\033[0m"
#Test 2
./test/main < test/inputFile/input2.txt  1 | tee test/outputFile/output2.txt
diff -iEBwu test/ansFile/ans2.txt test/outputFile/output2.txt > test/diff2.txt

if [ $? -ne 0 ]; then
    echo -e "Test case 2    \033[1;91mFAILED.\033[0m"
else
    echo -e "Test case 2    \033[1;92mPASSED.\033[0m"
    rm -f test/diff2.txt
fi
echo

echo -e "\033[1;94mRunning Test 3.\033[0m"
#Test 3
./test/main < test/inputFile/input3.txt  1 | tee test/outputFile/output3.txt
diff -iEBwu test/ansFile/ans3.txt test/outputFile/output3.txt > test/diff3.txt

if [ $? -ne 0 ]; then
    echo -e "Test case 3    \033[1;91mFAILED.\033[0m"
else
    echo -e "Test case 3    \033[1;92mPASSED.\033[0m"
    rm -f test/diff3.txt
fi
echo

echo -e "\033[1;94mRunning Test 4.\033[0m"
#Test 4
./test/main < test/inputFile/input4.txt  1 | tee test/outputFile/output4.txt
diff -iEBwu test/ansFile/ans4.txt test/outputFile/output4.txt > test/diff4.txt

if [ $? -ne 0 ]; then
    echo -e "Test case 4    \033[1;91mFAILED.\033[0m"
else
    echo -e "Test case 4    \033[1;92mPASSED.\033[0m"
    rm -f test/diff4.txt
fi
echo

echo -e "\033[1;94mRunning Test 5.\033[0m"
#Test 5
./test/main < test/inputFile/input5.txt  1 | tee test/outputFile/output5.txt
diff -iEBwu test/ansFile/ans5.txt test/outputFile/output5.txt > test/diff5.txt

if [ $? -ne 0 ]; then
    echo -e "Test case 5    \033[1;91mFAILED.\033[0m"
else
    echo -e "Test case 5    \033[1;92mPASSED.\033[0m"
    rm -f test/diff5.txt
fi
echo