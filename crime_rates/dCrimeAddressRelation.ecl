IMPORT $;

lCrimeAddressRelation := RECORD
  UNSIGNED crime_id;
  UNSIGNED address_id;
  UNSIGNED4 date_processed;
END;

lCrimeAddressRelation RelateTables(lCrimeAddressRelation L, lCrimeAddressRelation R) := TRANSFORM
  SELF.crime_id:= L.crime_id;
  SELF.address_id:= R.address_id;
  SELF.date_processed := L.date_processed;
END;

JoinedCrimeTables := JOIN($.dCrime, $.dAddress, LEFT.row_id=RIGHT.row_id);


lCrimeAddressRelation process_fields(JoinedCrimeTables L, INTEGER processed_fields_counter) := TRANSFORM
	  SELF.crime_id := L.crime_id;
	  SELF.address_id := l.address_id;
	  SELF.date_processed := L.date_processed;
END;

EXPORT
	dCrimeAddressRelation := PROJECT(JoinedCrimeTables, process_fields(LEFT,COUNTER))
    :PERSIST('~TEMP::dCrimeAddressRelation');

	// dCrimeAddressRelation := TRANSFORM(JoinedCrimeTables, RelateTables, crime_id);
	
// dCrimeAddressRelation;