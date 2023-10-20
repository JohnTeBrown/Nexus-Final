#!/bin/bash

########################
#(C) Rainsoftware 2023##
########################

# declaring variables
correct="/php-app-server/"
where=$(pwd)
repair=$(cd ..) 
max_retries=34
retries=0
namehash=$((RANDOM % 10000))
log="log/operation_log${namehash}.log"
plugins="disabled"

# BEGINNING plugins list
plugins=(
	"/path/to/example.pl arg1 arg2"
	"/path/to/example2.pl arg3 arg4"
)
# ENDING plugins list

while [ "$retries" -lt "$max_retries" ]; do
	# Increment the retries counter
	((retries++))
	
		# check location & attempt to start the server
			if [ "$where" == "$correct" ]; then
				echo "running server-startup test." >> "$log"
				php server.php -7
				break
			else
				# try to attempt fix operation
				eval $repair until [ "$where" == "$correct" ];
					php server.php -7
				fi
		done
		if [ "$plugins" == "enabled" ]; then
			echo "Plugins are enabled, executing plugins list now" >> "$log"
			echo "Plugins are enabled, executing plugins list now"
			sleep()
			for script_with_args in "${plugins[@]}"; do
				script_path=${script_with_args%% *}
				script_args=${script_with_args#* }
				
				echo "strapping plugins: $script_path with arguments: $script_args" >> "$log"
				echo "strapping plugins: $script_path with arguments: $script_args"
				perl "$script_path" $script_args
			done
		else
			echo "Error: plugins are disabled aborting bootstrapper process." >> "$log"
			echo "Error: plugins are disabled aborting bootstrapper process."
		fi
		
	# Check if the operation broke due to reaching the retries limit
	if [ "$retries" -ge "$max_retries" ]; then
		echo "Error: Exceeded maximum number of retries. the operation could not be repaired and encountered a fatal error :(" >> "$log"
		echo "Error: Exceeded maximum number of retries. the operation could not be repaired and encountered a fatal error :("
		echo "================================================Information====================================================" >> "$log"
		echo "Error: Test Failed." >> "$log"
		echo "Error: Test Failed."
		echo "* this test does not dictate application functionality and only predicts reliability/stability *." >> "$log"
		echo "* this file is property of Rainsoftware, Rainsoftware's BreakinRain Security, Rainsoftwares Solem Locke *" >> "$log" 
	fi