#!/bin/bash

if [[ $# -eq 0 ]]; then
	echo "$0: Missing parametar
	Usage: $0 [Options] [Title of the movie/TV]
	Options: [-m more results]"
	exit 0
elif [[ $1 == "-m" ]]; then
	imdbURL="https://www.imdb.com/find?&s=tt&exact=true&ref_=fn_al_tt_ex&q="
else
	imdbURL="https://www.imdb.com/find?ref_=nv_sr_fn&s=all&q="
fi

titleURL="https://www.imdb.com/title/tt"
searchResults="/tmp/tmpSearchResults"
tmpMoviesIDs="/tmp/tmpMoviesIDs"
garbage="/dev/null"

checkConnection(){
	if ! ping -c4 www.imdb.com &>$garbage; then
		echo -e "please check your internet connection\ncan't connect to imdb.com"
	exit 0
	fi
}
getMoviesIDs(){
	# get movies with their IDs
	if [[ $1 == "-m" ]]; then
                shift
        fi
	searchName=$(echo "$@"| tr ' ' '+')
	curl -s "$imdbURL$searchName" > $searchResults
	#check if there is no results

	if grep "findNoResults" $searchResults &>$garbage ; then
		echo -e "No results found for $@"
	     	exit 0
	fi

	grep -A4 "findSection.*Titles" $searchResults | \
		sed 's/<a\ href/\n/g'| \
		grep -v "img"| \
		grep "title.*td"| \
		sed 's/<\/td.*//;s/.*\/tt/|/;s/\/.*\"\ /|/'| \
		sed -E 's/(<i>|<\/i>|<br\/>|\/small|<\/a>|<a>|>|<)//g'| \
		sort > $tmpMoviesIDs
	# print formatted list of movies	
	printf '%30s\n' | tr ' ' '-' 
	sed 's/|.*|//g' $tmpMoviesIDs | awk '{print NR") "$0}'
}
getMovieRating() {
	echo ""
	read -p "Enter Movie Number: " num
	movieID=$(cat $tmpMoviesIDs | awk -v x=$num 'NR==x'| cut -d "|" -f 2)
	curl -s "$titleURL$movieID/" >$searchResults
	# Get Movie Rating.
	# Check before if it doesn't have enought ratings
	if grep "notEnoughRatings" $searchResults &>$garbage; then
		rating="RATING: Not Enough Ratings"
	else
	rating="RATING: $(cat $searchResults | grep "title.*based on" |cut -d\" -f2| head -c3)/10"
	fi

	#Get Movie Summary
	summary=$(cat $searchResults | grep -A1 "summary_text"| tail -n1| sed "s/^[ \t]*//")
	
	printf '\n%30s\n' | tr ' ' '-' 
	echo "MOVIE ID: $movieID"
	echo $rating
	echo -e "SUMMARY:\n$summary"
}
myclean(){
	rm -f $searchResults
	rm -f $tmpMoviesIDs
}

checkConnection
getMoviesIDs $@
getMovieRating
myclean
