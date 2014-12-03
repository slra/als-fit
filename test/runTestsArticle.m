% This file reruns all tests from the article

addpath ..
echo on
warning off
testGenTable
testTransRotInvar
testRotInvar

testConsistency
testConsistencySclust

warning on
echo off
