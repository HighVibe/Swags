#!/bin/bash

clear
echo
echo
echo compiled smart contracts
echo

{
rm -R bin

solc --optimize --abi -o bin --overwrite contracts/HighVibeSwag.sol 
solc --optimize --bin -o bin --overwrite contracts/HighVibeSwag.sol

} &> /dev/null

ls -l bin/HighVibe*

echo
