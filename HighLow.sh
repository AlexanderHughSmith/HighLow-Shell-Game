#!/bin/bash
#Written by Alexander Smith on 2/24/2020

#check if they provided a max number argument
if [ -z "$1" ]
then
	    echo "Please provide a maximum number argument"
	    echo Example: '"./project1.sh 75"'
	    exit 0
fi


#initialize variables
loaded_guess=0
loaded_complete_games=0
quit_game=false
quit_app=false
guess=0
playagain=""

#path to HighLow.dat
file="/home/alexander/Desktop/Programming/UNIX CLASS/project1/HighLow.dat"

#load data
var=0
while read -r line; do
    test="$line"
    if [ $var == 0 ]
    then
    	loaded_guess=$test
	else
		loaded_complete_games=$test
	fi
    var=$((var+1))
done < "$file"

echo Total Guesses: $loaded_guess
echo Total Complete Games: $loaded_complete_games
echo Hisory loaded succesfully






#while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
#do
		#print "Guesses: "$f1
		#print "games: "$f2
        # display fields using f1, f2,..,f7
        #printf 'Guesses: %s, Games Played: %s, Home Dir: %s\n' "$f1" "$f7" "$f6"
#done <"$file"

while [ $quit_app = false ]
do
	rand=$((($RANDOM%$1)+1))
	amount=0
	while [ $quit_game = false ]
	do
		#printf instead of echo to keep input on same line
		printf "Input your guess: " 
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
	done
	echo $amount


	loaded_guess=$((loaded_guess+amount))
	loaded_complete_games=$((loaded_complete_games+1))

	printf "Would you like to play again (Y/N): "
	read -r playagain
	if [ -z $playagain ] || [ $playagain == "Y" ] || [ $playagain == "y" ]
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
> HighLow.dat

echo $loaded_guess >> HighLow.dat
echo $loaded_complete_games >>HighLow.dat
exit 0