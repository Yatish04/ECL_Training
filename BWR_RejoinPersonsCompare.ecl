IMPORT $;

//DATASETS of renormedtables created in Part Two
RJPersons:= DATASET('~ONLINE::FGB::OUT::Persons_Rejoined', $.File_Persons.Layout_Persons,THOR);

//SORT the APPENDedrecords, and then DEDUP.
AppendRecs:= $.File_Persons.File+ RJPersons;
SortRecs:= SORT(AppendRecs,RECORD);
DedupPersons:= DEDUP(SortRecs,RECORD);

//Count of rejoined records created in Exercise 7B
OUTPUT(COUNT(RJPersons),NAMED('Input_Recs_Persons'));

//This result should be zero
OUTPUT(COUNT(DedupPersons)-COUNT(RJPersons),NAMED('Dup_Persons'));