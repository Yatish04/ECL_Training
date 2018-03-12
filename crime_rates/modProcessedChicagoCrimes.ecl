IMPORT $;

EXPORT modProcessedChicagoCrimes := MODULE
  EXPORT lProcessedChicagoCrimes := RECORD
    // RECORDOF($.modChicagoCrimes.dChicagoCrimes) AND NOT [City, State, ZipCode];
    // RECORDOF($.modChicagoCrimes.dChicagoCrimes);
    STRING ID;
    STRING CaseNumber;
    STRING Date	:= (STRING4)$.modChicagoCrimes.dChicagoCrimes.Date;
    // UNSIGNED8 Date	:= (UNSIGNED8)$.modChicagoCrimes.dChicagoCrimes.Date;
    STRING Block;
    STRING IUCR;	
    STRING PrimaryType;	
    STRING Description;	
    STRING LocationDescription;	
    STRING Arrest;	
    STRING Domestic;	
    STRING Beat;	
    STRING District;	
    STRING Ward;	
    STRING CommunityArea;	
    STRING FBICode;	
    STRING XCoordinate;	
    STRING YCoordinate;	
    STRING Year;	
    STRING UpdatedOn;	
    STRING Latitude;
    STRING Longitude;	
    STRING Location;
  END;

  EXPORT dProcessedChicagoCrimes := DATASET('~online::dsr::crimes_2001_201803', lProcessedChicagoCrimes, CSV(HEADING(1)));

END;

