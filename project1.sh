#!/bin/bash
#Written by Alexander Smith on 2/24/2020

#check if they provided a max number argument
if [ -z "$1" ]
then
	    echo "Please provide a maximum number argument"
	    echo Example: '"./project1.sh 75"'
	    exit 0
fi

quit_game=false
quit_app=false
guess=0
playagain=""
complete_games=0

file="/home/alexander/Desktop/Programming/UNIX CLASS/project1/HighLow.dat"
while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
do
        # display fields using f1, f2,..,f7
        printf 'Guesses: %s, Games Played: %s, Home Dir: %s\n' "$f1" "$f7" "$f6"
done <"$file"

while [ $quit_app = false ]
do
	rand=$((($RANDOM%$1)+1))
	amount=0
	while [ $quit_game = false ]
	do
		printf "input your guess: " 
		read -r guess
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

	complete_games=$((complete_games+1))	
	done
	printf "Would you like to play again (Y/N): "
	read -r playagain
	if [ $playagain == "Y" ] || [ $playagain == "y" ] || [ $playagain == "" ]
	then
		quit_game=false
		clear
	else
		if [ $playagain == "N" ] || [ $playagain == "n" ]
		then
			echo Thanks for Playing!
			quit_app=true
		else 
			echo Please enter Y or N.
		fi
	fi
done
echo $amount >> HighLow.dat
echo $complete_games >>HighLow.dat
exit 0