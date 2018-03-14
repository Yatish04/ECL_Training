IMPORT $, STD;


lCrimeOverTheYears := RECORD

  UNSIGNED date_crime := STD.Date.Year($.dCrime.date_crime);
	INTEGER CrimeCount := COUNT(GROUP);

END;


// export 
  dCrimeOverTheYears := TABLE($.dCrime, lCrimeOverTheYears, STD.Date.Year(date_crime));

dCrimeOverTheYears;