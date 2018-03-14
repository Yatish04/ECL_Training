IMPORT $, STD;


SHARED lCommonCrimeTypes := RECORD

  $.dCrime.iucr;
  $.dCrime.description;
	INTEGER crime_count := COUNT(GROUP);

END;


dCommonCrimeTypes := TABLE($.dCrime, lCommonCrimeTypes, $.dCrime.iucr, $.dCrime.description);


SORT(dCommonCrimeTypes, -crime_count, iucr); // Check hours sorted by amount of reported crime in descending order, finding the 'hot' hours for crime

COUNT($.dCrime);

SUM(dCommonCrimeTypes, dCommonCrimeTypes.crime_count);

lCommonCrimeTypesWithPercentage := RECORD
  $.dCrime.iucr;
  $.dCrime.description;
	INTEGER crime_percentage := ((COUNT(GROUP)/SUM(dCommonCrimeTypes, dCommonCrimeTypes.crime_count))*100);
END;

dCommonCrimeTypesWithPercentage := TABLE($.dCrime, lCommonCrimeTypesWithPercentage, $.dCrime.iucr, $.dCrime.description);
SORT(dCommonCrimeTypesWithPercentage, -crime_percentage, iucr); // Outputs IUCR, Description and Percentage of crimes of that type, from most to least prevalent