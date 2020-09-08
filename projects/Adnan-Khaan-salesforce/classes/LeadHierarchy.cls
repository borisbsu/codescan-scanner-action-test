global class LeadHierarchy {

	global string top= NULL;
	

	global Database.QueryLocator start(Database.BatchableContext bc)
	{
		
		return Database.getQueryLocator('SELECT id,LastName,company FROM lead WHERE company =\'acme\'');
		
	}

	global void execute(Database.BatchableContext bc, list<lead> led)
	{
		list <lead> temp= new list<lead>();
		system.debug(top);
		for(lead l: led)
		{
			if(top==Null)
			{
				top=l.id;
				system.debug(top);
            }
			else
            {
            l.firstname='Adnan';
			temp.add(l);		
            }
          }
            
		
		update temp;
		
	}
	
	
	global void finish(Database.batchableContext bc)
	{
		AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
		        	    TotalJobItems, CreatedBy.Email
				          FROM AsyncApexJob
				          WHERE Id = :bc.getJobId()];	
        system.debug(top);
	}


}