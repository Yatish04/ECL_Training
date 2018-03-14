IMPORT $;


lCrime := RECORD
  UNSIGNED row_id;
  UNSIGNED address_id;
  UNSIGNED address_number;
  STRING address_street;
  STRING address_city;
  STRING2 address_state;
  STRING address_country;
  UNSIGNED zip_code;
  STRING local_description;
  DECIMAL15_12 latitude;
  DECIMAL15_12 longitude;
  UNSIGNED4 date_updated;
  UNSIGNED4 date_processed;
END;

lCrime process_fields( $.dChicagoCrimesProcessed L, INTEGER processed_fields_counter) := TRANSFORM
    SELF.row_id := L.row_id;
    SELF.address_id := processed_fields_counter;
    SELF.address_number := L.address_number;
    SELF.address_street := L.address_street;
    SELF.address_city := L.address_city;
    SELF.address_state := L.address_state;
    SELF.address_country := L.address_country;
    SELF.zip_code := L.zip_code;
    SELF.local_description := L.LocationDescription;
    SELF.latitude := L.latitude;
    SELF.longitude := L.longitude;
    SELF.date_updated := L.date_updated;
    SELF.date_processed := L.date_processed; 
END;


EXPORT 
	dAddress := PROJECT($.dChicagoCrimesProcessed, process_fields(LEFT,COUNTER))
    :PERSIST('~TEMP::dAddress');

// dAddress;