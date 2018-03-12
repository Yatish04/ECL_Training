IMPORT $;

lProcessedChicagoCrimes := RECORD
	STRING Date :=	(STRING)$.modChicagoCrimes.dChicagoCrimes.Date[1..8];
END;

lProcessedChicagoCrimes AddUID( $.modChicagoCrimes.lChicagoCrimes Layout) := TRANSFORM
	SELF := Layout;
END;

EXPORT UID_Persons := PROJECT($.modChicagoCrimes.dChicagoCrimes, AddUID(LEFT,COUNTER))
	:PERSIST('~CLASS::FGB::PERSIST::UID_PEOPLE');
