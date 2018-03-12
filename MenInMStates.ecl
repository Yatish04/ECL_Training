// EXPORT MenInMStates := 'todo';


IMPORT $;

EXPORT MenInMStates := $.Persons($.Persons.state IN $.SetMStates, $.Persons.gender = 'M');