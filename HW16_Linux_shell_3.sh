#!/bin/bash

# create a test directory with some file in it
mkdir ~/HW16_test/ && cd ~/HW16_test/ && touch file{1,2,3}

# create a test directory on the remote host
ssh andriiocheretko@192.168.1.170 "mkdir /Users/andriiocheretko/Desktop/remote_test/"

# copy files to the remote host
scp file{1,2,3} andriiocheretko@192.168.1.170:/Users/andriiocheretko/Desktop/remote_test/

# create a list of copied files on the remote host
ssh andriiocheretko@192.168.1.170 "cd /Users/andriiocheretko/Desktop/remote_test/ && ls > list_of_copied_files.txt"

# delete files which were copied to the remote host
ssh andriiocheretko@192.168.1.170 "cd /Users/andriiocheretko/Desktop/remote_test/ && cat list_of_copied_files.txt | xargs rm"

# create 2 files oh the remote host
ssh andriiocheretko@192.168.1.170 "cd /Users/andriiocheretko/Desktop/remote_test/ && touch file{4,5}"

# copy files from the remote host to the local host
scp andriiocheretko@192.168.1.170:/Users/andriiocheretko/Desktop/remote_test/file{4,5}  ~/HW16_test/