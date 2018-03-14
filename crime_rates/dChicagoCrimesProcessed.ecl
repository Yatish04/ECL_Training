// EXPORT UID_CC := 'todo';

IMPORT $, STD;

lChicagoCrimesAfterProcessing := RECORD
    UNSIGNED row_id;
    UNSIGNED crime_id;
    STRING CaseNumber;
		UNSIGNED4 DATE_CRIME;
		UNSIGNED4 TIME_CRIME;
    STRING Date;
    UNSIGNED Address_Number;
    STRING Address_Street;
		STRING Address_City;
		STRING2 Address_State;
		STRING Address_Country;
		UNSIGNED  Zip_Code;
    STRING Block;
    UNSIGNED IUCR;	
    STRING PrimaryType;	
    STRING Description;	
    STRING LocationDescription;	
    BOOLEAN flag_Arrest;	
    STRING Arrest;	
    BOOLEAN flag_Domestic;	
    STRING Domestic;	
    STRING Beat;	
    STRING District;	
    STRING Ward;	
    STRING CommunityArea;	
    UNSIGNED FBICode;	
    STRING XCoordinate;	
    STRING YCoordinate;	
    STRING Year;	
    UNSIGNED4 date_updated;	
    UNSIGNED4 time_updated;	
		UNSIGNED4 date_processed;
    DECIMAL15_12  Latitude;
    DECIMAL15_12 Longitude;	
    STRING Location;
END;

// Function which expects a date in a format of either '1/3/2018', '1/12/2017' or '05/07/2017' and returns it in the
// yyyymmdd format
fnFormatDate(STRING S) := FUNCTION
	fnGetDay := IF(s[LENGTH(s)-4] = '/' AND s[LENGTH(s)-6] = '/', '0' + s[LENGTH(s)-5], s[LENGTH(s)-6..LENGTH(s)-5]);
	fnGetMonth := IF(s[2] = '/', '0' + s[1], s[1..2]);
	fnReorderDate(STRING S) := s[LENGTH(s)-3..] + fnGetMonth + fnGetDay;
	RETURN fnReorderDate(S);
END;

// Function which expects a time in a 'hh:mm:ss AM/PM' format and returns it in a 24-hours 'hhmmss' format
fnFormatTime(STRING S) := FUNCTION
	Hour := IF(s[LENGTH(s)-1..] = 'AM' AND s[1..2] = '12', '00', s[1..2]); // Deals with the '12 AM' special case
	fnGetHour := IF(s[LENGTH(s)-1..] = 'PM' AND NOT s[1..2] = '12', (STRING)((Integer)Hour + 12), Hour);
	fnReorderTime(STRING S) := fnGetHour + S[4..5] + S[7..8];
	RETURN (STRING) fnReorderTime(S);
END;

// Staging table with the pre-processed fields for the new subdivided tables
lChicagoCrimesAfterProcessing process_fields( $.modChicagoCrimes.lChicagoCrimes L, INTEGER row_id) := TRANSFORM
		SELF.row_id := (UNSIGNED) row_id;
	  SELF.crime_id := HASH64(L.ID);
    SELF.CaseNumber := L.CaseNumber;
		Date := IF(L.Date[9] = ' ', L.Date[1..9], L.Date[1..10]);
		SELF.date_crime := (UNSIGNED4) fnFormatDate(TRIM(Date, LEFT, RIGHT));
		SELF.TIME_CRIME := (UNSIGNED4) fnFormatTime(TRIM(L.Date[LENGTH(Date)+1..], LEFT, RIGHT));
    SELF.Date := L.Date;
		SELF.Address_Number := (UNSIGNED)L.Block[1..3];
    SELF.Address_Street := L.Block[7..];
		SELF.Address_City := 'Chicago';
		SELF.Address_State := 'IL';
		SELF.Address_Country := 'United States (US)';
		SELF.Zip_Code := 0;
    SELF.Block := L.Block;
    SELF.IUCR := (UNSIGNED) L.IUCR;	
    SELF.PrimaryType := L.PrimaryType;	
    SELF.Description := L.Description;	
    SELF.LocationDescription := L.LocationDescription;
    SELF.flag_Arrest := (BOOLEAN) IF(TRIM(L.Arrest, LEFT,RIGHT) = 'TRUE', true, false);	
    SELF.Arrest := L.Arrest;	
    SELF.flag_Domestic := (BOOLEAN) IF(TRIM(L.Domestic, LEFT,RIGHT) = 'TRUE', true, false);
    SELF.Domestic := L.Domestic;	
    SELF.Beat := L.Beat;	
    SELF.District := L.District;	
    SELF.Ward := L.Ward;	
    SELF.CommunityArea := L.CommunityArea;	
    SELF.FBICode := (UNSIGNED) L.FBICode;	
    SELF.XCoordinate := L.XCoordinate;	
    SELF.YCoordinate := L.YCoordinate;	
    SELF.Year := L.Year;	
		DateUpdated := IF(L.UpdatedOn[9] = ' ', L.UpdatedOn[1..9], L.UpdatedOn[1..10]);
    SELF.date_updated := (UNSIGNED4) fnFormatDate(TRIM(DateUpdated, LEFT, RIGHT)); ;	
		SELF.time_updated := (UNSIGNED4) fnFormatTime(TRIM(L.UpdatedOn[LENGTH(Date)+1..], LEFT, RIGHT));
		SELF.date_processed := (UNSIGNED4) STD.Date.CurrentDate();
    SELF.Latitude := (DECIMAL15_12) L.Latitude;
    SELF.Longitude := (DECIMAL15_12) L.Longitude;	
    SELF.Location := L.Location;
END;

EXPORT 
	dChicagoCrimesProcessed := PROJECT($.modChicagoCrimes.dChicagoCrimes, process_fields(LEFT,COUNTER))
  :PERSIST('~TEMP::ChicagoCrimesProcessed');

// modChicagoCrimesProcessed;