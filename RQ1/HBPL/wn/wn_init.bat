
echo "***********************************************"
echo "WN_BPL source v0.00 initialization script"
echo "***********************************************"

SET WNDB=C:/fernan/research/BDDEDUC/DES/DESDevel/Fuzzy/WordNet/WordNet3.0
echo %WNDB%

SET WNDEVEL=yes
echo %WNDEVEL%

SET OSTYPE=windows
echo %OSTYPE%

swipl -g "[wn_connect]"
