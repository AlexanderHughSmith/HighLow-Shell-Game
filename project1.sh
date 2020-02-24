#!/bin/bash
#Written by Alexander Smith on 2/24/2020
quit_game=false
quit_app=false
guess=0
playagain=""
if [ -z "$1" ]
then
	    echo "Please provide a maximum number argument"
	    echo Example: '"./project1.sh 75"'
	    exit 0
fi

while [ $quit_app = false ]
do
	rand=$((($RANDOM%$1)+1))
	amount=0
	while [ $quit_game = false ]
	do
		echo input your guess: 
		read guess
		if [ $guess -gt $1 ]
		then
			echo please input a value between 1 and $1
		else
			if [ $guess -gt $rand ]
			then
				echo The number you are looking for is less than $guess
				amount=$((amount+1))
			fi

			if [ $guess -lt $rand ]
			then
				echo The number you are looking for is greater than $guess
				amount=$((amount+1))
			fi

			if [ $guess == $rand ]
			then
				amount=$((amount+1))
				echo You got the number correct in $amount attempts!
				quit_game=true
			fi
		fi

		
	done
	echo "Would you like to play again (Y/N): "
	read -r playagain
	if [ $playagain == "Y" ] || [ $playagain == "y" ]
		then
			quit_game=false
		else
			echo Thanks for Playing!
			quit_app = true
	fi
	clear
done