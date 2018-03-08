# IMDB fetcher
Command line tool to get brief details about movies from imdb.com

## HOW:

```
./imdbfetcher [Options] [Title of the movie/TV]
```

After that you will get a list of some related movies with the same name. choose the number of the movie you like.

## EXAMPLE:

```
./imdbfetcher  the guest
------------------------------
1) Athidhi (2007) aka "Guest"
2) Guest (II) (2010)

Enter Movie Number:
```
Now choose the one you would like.

```
Enter Movie Number: 2

------------------------------
MOVIE ID: 1692848
RATING: 7.0/10
SUMMARY:
Filmmaker Jose Luis Guerin documents his experience during a year of traveling as a guest of film festivals to present his previous film. What emerges is a wonderfully humane and sincere ...
```
Using option -m **(More Results)**

```
./imdbfetcher -m the guest

```

the result will look like this.

``` 
------------------------------
1) Kraft Television Theatre (1947) (TV Series)
2) The Guest (1951) (Short)
3) The Doctor (1952) (TV Series)
4) I Led 3 Lives (1953) (TV Series)
5) The Rifleman (1958) (TV Series)
6) The Patty Duke Show (1963) (TV Series)
7) The Caretaker (1963) aka "The Guest"
8) L'ospite (1971) aka "The Guest"
9) Barney Miller (1975) (TV Series)
10) Ninja Turtles: The Next Mutation (1997) (TV Series)
11) The Guest: An episode in the Life of Eugène Marais (1977)
12) Mehmaan (1972) aka "The Guest"
13) The Wubbulous World of Dr. Seuss (1996) (TV Series)
14) L'ospite (1998) aka "The Guest"
15) Gost (1987) aka "The Guest"
16) My Boss's Daughter (2003) aka "The Guest"
17) Mysafiri (1979) aka "The Guest"
18) Celeb (2002) (TV Series)
19) Magic Adventures of Mumfie (1995) (TV Series)
20) Ideal (2005) (TV Series)
21) The Guest (1924) (Short)
.
.
.
77) Following (2013) (TV Mini-Series)
78) The Guest (1974) (TV Movie)
79) The Guest (VII) (2015)

Enter Movie Number: 16

------------------------------
MOVIE ID: 0270980
RATING: 4.7/10
SUMMARY:
When a young man agrees to housesit for his boss, he thinks it'll be the perfect opportunity to get close to the woman he desperately has a crush on - his boss's daughter. But he doesn't ...
```

## TO-DO

* sort list of movies based on rating
* fast search rating only
* gt trailer URL
                                                        138,16        Bot

