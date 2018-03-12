IMPORT $;



SortedResults := SORT($.Persons, LastName, FirstName, RecID);


EXPORT 
	DedupPersons := DEDUP(SortedResults, LEFT.LastName = RIGHT.LastName AND LEFT.FirstName = RIGHT.FirstName)
	:PERSIST('~TEMP::DEDUPPERSONS');
	
	// COUNT(DedupPersons);
	
