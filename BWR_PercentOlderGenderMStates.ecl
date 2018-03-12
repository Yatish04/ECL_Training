// IMPORT $;

// IsMale := $.Persons.gender = 'M';
// IsBornBefore80 := $.Persons.birthdate[1..4] < '1980' AND $.Persons.birthdate != '';
// OlderMenInMStates := $.Persons(IsMale AND IsBornBefore80 AND $.Persons.state IN $.SetMStates);
// OlderMenGeneral := $.Persons(IsMale AND IsBornBefore80);
// OlderWomenInMStates := $.Persons($.Persons.gender = 'F' AND IsBornBefore80 AND $.Persons.state IN $.SetMStates);
// OlderWomenGeneral := $.Persons($.Persons.gender = 'F' AND IsBornBefore80);

// Ratio of Men born BEFORE 1980 in states beginning with M, to ALL men born before 1980


// PercOlderMaleinMStates := (DECIMAL5_2)(COUNT(OlderMenInMStates) / COUNT(OlderMenGeneral) * 100);
// PercOlderFemaleinMStates := (DECIMAL5_2)(COUNT(OlderWomenInMStates) / COUNT(OlderWomenGeneral) * 100);

// OUTPUT(PercOlderMaleinMStates, NAMED('Men_Percentage'));
// OUTPUT(PercOlderFemaleinMStates, NAMED('Women_Percentage'));


IMPORT $;
//We want a ratio of men in "M" states born before 1980
//to men in ALL states born before 1980 (express in percentage to two decimal places)
OlderPersons := $.Persons.Birthdate[1..4] < '1980';
c1 := COUNT($.MeninMStates(OlderPersons));
c2 := COUNT($.Persons(Gender = 'M',OlderPersons));
PercOlderMalesinMStates := (DECIMAL5_2)(c1/c2 * 100);
//Females:
OlderFemaleinMStates := COUNT($.Persons(State IN $.SetMStates,OlderPersons,Gender = 'F')) -
COUNT($.MeninMStates(OlderPersons));
c3 := COUNT($.Persons(Gender = 'F',OlderPersons));
PercOlderFemalesinMStates := (DECIMAL5_2)(OlderFemaleinMStates/c3 * 100);
OUTPUT(PercOlderMalesinMStates,NAMED('Men_Percentage'));
OUTPUT(PercOlderFemalesinMStates,NAMED('Female_Percentage'));