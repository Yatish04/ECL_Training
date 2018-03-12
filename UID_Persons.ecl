// EXPORT UID_Persons := 'todo';

IMPORT $;

Persons_With_UID := RECORD
	UNSIGNED4 UID;
	$.File_Persons.Layout_Persons
END;

Persons_With_UID AddUID( $.File_Persons.Layout_Persons Layout, INTEGER UID) := TRANSFORM
	SELF.UID := UID;
	SELF := Layout;
END;

EXPORT UID_Persons := PROJECT($.File_Persons.File, AddUID(LEFT,COUNTER))
	:PERSIST('~CLASS::FGB::PERSIST::UID_PEOPLE');