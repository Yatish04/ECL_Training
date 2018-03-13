IMPORT $;


lCrime := RECORD
  UNSIGNED crime_id;
  STRING case_number;
  UNSIGNED row_id;
  UNSIGNED4 date_crime;
  UNSIGNED4 time_crime;
  STRING description;
  BOOLEAN bool_arrested;
  STRING victim_name;
  STRING victim_gender;
  UNSIGNED IUCR;
  UNSIGNED FBI_code;
  UNSIGNED4 date_updated;
  UNSIGNED4 date_processed; 
END;

lCrime process_fields( $.modChicagoCrimesProcessed L, INTEGER row_id) := TRANSFORM
	  SELF.row_id := row_id;
	  SELF.crime_id := HASH64(L.crime_id);
    SELF.case_number := L.casenumber;
    SELF.date_crime := L.date_crime;
    SELF.time_crime := L.time_crime;
    SELF.description := L.description;
    SELF.bool_arrested := L.flag_arrest;
    SELF.victim_name := '';
    SELF.victim_gender := '';
    SELF.IUCR := L.iucr;
    SELF.FBI_code := L.fbicode;
    SELF.date_updated := L.date_updated;
    SELF.date_processed := L.date_processed; 
END;


// EXPORT 
	dCrime := PROJECT($.modChicagoCrimesProcessed.dChicagoCrimesProcessed, process_fields(LEFT,COUNTER));

dCrime;
// // EXPORT 
// 	XTAB_Crime := TABLE($.modChicagoCrimesProcessed, lCrime, Crime);
	
// XTAB_Crime;
// // $.modChicagoCrimesProcessed;