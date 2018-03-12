// EXPORT XTAB_Persons_Gender := 'todo';

IMPORT $;


Layout_Gender := RECORD

	$.File_Persons.File.Gender;
	INTEGER GenderCount := COUNT(GROUP);

END;

// EXPORT 
	XTAB_Persons_Gender := TABLE($.File_Persons.FILE, Layout_Gender, Gender);
	
XTAB_Persons_Gender;