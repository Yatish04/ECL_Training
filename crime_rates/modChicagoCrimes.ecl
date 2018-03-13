EXPORT modChicagoCrimes := MODULE
  EXPORT lChicagoCrimes := RECORD
    STRING ID;
    STRING CaseNumber;
    STRING Date;
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

  // // BIG DATA SET
  // EXPORT dChicagoCrimes := DATASET('~online::dsr::crimes_2001_201803', lChicagoCrimes, CSV(HEADING(1)));

  // SMALLER DATA SET, for TESTS
  EXPORT dChicagoCrimes := DATASET('~reduced::test::crimes', lChicagoCrimes, CSV(HEADING(1)));

END;

