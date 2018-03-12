// EXPORT BWR_BasicPersonsFilters := 'todo';

IMPORT $;

PersonInFlorida := $.Persons.State = 'FL';
PersonInMiami := $.Persons.City = 'MIAMI';

// All who live in florida
COUNT($.Persons(PersonInFlorida));

// All Who live in zip Miami/FL
COUNT($.Persons(PersonInFlorida AND PersonInMiami));

// Live in zip code 33102
COUNT($.Persons($.Persons.zipcode = '33102'));


// First name begins with B
COUNT($.Persons($.Persons.FirstName[1] = 'B'));


// File date year after 2000
COUNT($.Persons($.Persons.FileDate[1..4] > '2000'));

