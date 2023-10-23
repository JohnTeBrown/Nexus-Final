#!/bin/bash

###########################
## (C) Rainsoftware 2023 ##
##    "We  Make  Things" ##
###########################

# declaring variables
correct="/php-app-server/" # correct location
where=$(pwd) 
repair=$(cd ..) # repair arguments | can be changed based on needs.
max_retries=34
retries=0
namehash=$((RANDOM % 10000)) 
log="log/operation_log${namehash}.log"
plugins="disabled" # switch to enabled to allow perl plugins

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
				if [ "$plugins" == "enabled" ]; then
					echo "Plugins are enabled, executing plugins list now" >> "$log"
					echo "Plugins are enabled, executing plugins list now"
					sleep 6
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
				
				# try to attempt fix operation
				eval $repair until [ "$where" == "$correct" ];
					echo "================================================Information=====================================================" >> "$log"
					echo "the operation encountered a error :: incorrect directory 'server.php' not found. . ." >> "$log"
					echo "the operation encountered a error :: incorrect directory 'server.php' not found. . ."
					
					sleep 6
					
					echo "Attempting operation repair, please stand by. . ." >> "$log"
					echo "Attempting operation repair, please stand by. . ."
					
					sleep 10
					
					echo "attempting to run startup operation, please stand by. . ." >> "$log"
					echo "attempting to run startup operation, please stand by. . ."
					sleep 6
					
					echo "running server-startup test." >> "$log"
					echo "running server-startup test."
					echo "* this test does not dictate application functionality and only predicts reliability/stability *." >> "$log"
					echo "* this file is property of Rainsoftware, Rainsoftware's BreakinRain Security, Rainsoftwares Solem Locke *" >> "$log" 
					echo "================================================================================================================" >> "$log"
					
					sleep 7
					
					php ../../server.php -7/
				fi
		done
		
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
