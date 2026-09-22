#!/bin/bash

echo "***********************************************"
echo "WN_BPL source v0.00 initialization script"
echo "***********************************************"

# WNDB='/Users/pjulian/Trabajo/Investigacion/WordNet/wn_prologDB'
# export WNDB
echo $WNDB

WNDEVEL=yes
export WNDEVEL
echo $WNDEVEL

export OSTYPE
echo $OSTYPE

swipl wn_connect.pl
