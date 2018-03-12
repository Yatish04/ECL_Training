IMPORT $;

IsFloridian := $.Persons.State = 'FL';
IsMale := $.Persons.gender = 'M';
IsBorn80 := $.Persons.birthdate[1..4] >= '1980' AND $.Persons.birthdate != '';

EXPORT IsYoungFloridaMale := IsFloridian AND IsMale AND IsBorn80;