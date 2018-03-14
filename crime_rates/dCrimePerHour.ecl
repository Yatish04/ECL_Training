IMPORT $, STD;


lCrimePerHour := RECORD

  UNSIGNED time_crime := STD.Date.Hour(
    $.dCrime.time_crime);
	INTEGER crime_count := COUNT(GROUP);

END;


dCrimePerHour := TABLE($.dCrime, lCrimePerHour, STD.Date.Hour($.dCrime.time_crime));
	

SORT(dCrimePerHour, -crime_count); // Check hours sorted by amount of reported crime in descending order, finding the 'hot' hours for crime
SORT(dCrimePerHour, time_crime); // A look at the Crime per Hour, sorted by hour


// IUCR = 610 means BURGLARY
dBurglariesPerHour := TABLE($.dCrime(IUCR=610), lCrimePerHour, STD.Date.Hour($.dCrime.time_crime));
SORT(dBurglariesPerHour, -crime_count); // View hours sorted by amount of reported burglaries in descending order
