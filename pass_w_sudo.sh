#!/bin/bash

echo Please enter your password:
read -s pass

echo $pass | sudo -S apt update