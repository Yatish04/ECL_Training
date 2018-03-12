// EXPORT BWR_Persons_DependentCount_Population := 'todo';

IMPORT $;


TotalRecords := COUNT($.File_Persons.File());
NullRecords:= COUNT($.File_Persons.File(DependentCount = 0));
PopulationPercentage := (INTEGER)(((TotalRecords - NullRecords) / TotalRecords) * 100);


resulting_dataset := DATASET([
	{'Total Records', TotalRecords},
	{'Recs=0', NullRecords},
	{'Population Pct', PopulationPercentage}
],
{STRING20 valuetype, INTEGER val}
);

resulting_dataset;
