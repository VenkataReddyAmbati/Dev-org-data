trigger Accountduplicatetrigger on Account (before insert,before update) {
    
    if(Trigger.isinsert || Trigger.isbefore)
    {
        
    Set<String> setName = new Set<String>();
	For(Account acc : trigger.new)
	{
		setName.add(acc.name);
	}
        if(!setName.isEmpty())
        {
            List<Account> lstAccount = [select name ,id from account where name in :setName ];
		
		Map<String ,Account> mapNameWiseAccount = new Map<String,Account>();
		For(Account acc: lstAccount)
		{
			mapNameWiseAccount.put(acc.name ,acc);
		}
		
		For(Account acc : trigger.new)
		{
			if(mapNameWiseAccount.containsKey(acc.name))
			{
				//acc.Name.addError('Name already Exist ');
			}
		}
            
        }
        
        
        
    }

}