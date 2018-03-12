IMPORT $;


EXPORT 
fn_Aggregates(DATASET(RECORDOF($.Persons)) DS, INTEGER FieldName) := FUNCTION
	
	PeopleWithoutDependents := COUNT(DS(FieldName=0));
	TotalNumberOfDependents := SUM(DS,FieldName);
	AverageDependents := AVE(DS,FieldName);
	MaxDependents := MAX(DS,FieldName);
	MinDependents := MIN(DS,FieldName);

	resulting_dataset := DATASET([
		{'No Dependents', PeopleWithoutDependents},
		{'Total Dependents', TotalNumberOfDependents},
		{'Average Dependents', AverageDependents},
		{'Max Dependents', MaxDependents},
		{'Min Dependents', MinDependents}
	],
	{STRING20 Title, INTEGER Value}
	);
	
	RETURN(resulting_dataset);
END;
// fn_Aggregates($.Persons, $.Persons.DependentCount)