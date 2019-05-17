trigger SBIArrangement on TrailAppReddy__SBI_Arrangements__c (after insert, after update, after delete, after undelete) {
    
    map<id,list<TrailAppReddy__SBI_Arrangements__c>> lis=new map<id,list<TrailAppReddy__SBI_Arrangements__c>>();
    
   if(trigger.isinsert)
   {
    for(TrailAppReddy__SBI_Arrangements__c sbis:Trigger.new)
    {
        if(lis.containskey(sbis.TrailAppReddy__Summary__c))
        {
             List<TrailAppReddy__SBI_Arrangements__c> usersId = lis.get(sbis.TrailAppReddy__Summary__c);
            usersId.add(sbis);
                  lis.put(sbis.TrailAppReddy__Summary__c,usersId);
        }else{
            lis.put(sbis.TrailAppReddy__Summary__c,new list<TrailAppReddy__SBI_Arrangements__c>{sbis});
        }
        
    }
        }
    else if(trigger.isupdate)
   {
    for(TrailAppReddy__SBI_Arrangements__c sbis:Trigger.new)
    {
       if(lis.containskey(sbis.TrailAppReddy__Summary__c))
        {
             List<TrailAppReddy__SBI_Arrangements__c> usersId = lis.get(sbis.TrailAppReddy__Summary__c);
            usersId.add(sbis);
                  lis.put(sbis.TrailAppReddy__Summary__c,usersId);
        }else{
            lis.put(sbis.TrailAppReddy__Summary__c,new list<TrailAppReddy__SBI_Arrangements__c>{sbis});
        }
    }
       for(TrailAppReddy__SBI_Arrangements__c sbis:Trigger.old)
    {
      if(lis.containskey(sbis.TrailAppReddy__Summary__c))
        {
             List<TrailAppReddy__SBI_Arrangements__c> usersId = lis.get(sbis.TrailAppReddy__Summary__c);
            usersId.add(sbis);
                  lis.put(sbis.TrailAppReddy__Summary__c,usersId);
        }else{
            lis.put(sbis.TrailAppReddy__Summary__c,new list<TrailAppReddy__SBI_Arrangements__c>{sbis});
        }
    }
       
        }else if(trigger.isdelete)
        {
           
            for(TrailAppReddy__SBI_Arrangements__c sbis:Trigger.old)
    {
       if(lis.containskey(sbis.TrailAppReddy__Summary__c))
        {
             List<TrailAppReddy__SBI_Arrangements__c> usersId = lis.get(sbis.TrailAppReddy__Summary__c);
            usersId.add(sbis);
                  lis.put(sbis.TrailAppReddy__Summary__c,usersId);
        }else{
            lis.put(sbis.TrailAppReddy__Summary__c,new list<TrailAppReddy__SBI_Arrangements__c>{sbis});
        }
    }
        }else{
            for(TrailAppReddy__SBI_Arrangements__c sbis:Trigger.new)
    {
       if(lis.containskey(sbis.TrailAppReddy__Summary__c))
        {
             List<TrailAppReddy__SBI_Arrangements__c> usersId = lis.get(sbis.TrailAppReddy__Summary__c);
            usersId.add(sbis);
                  lis.put(sbis.TrailAppReddy__Summary__c,usersId);
        }else{
            lis.put(sbis.TrailAppReddy__Summary__c,new list<TrailAppReddy__SBI_Arrangements__c>{sbis});
        }
    }
}

   list<TrailAppReddy__Summary__c> parcords=[select id,name,TrailAppReddy__Amount__c,TrailAppReddy__CHild_count__c,(select id,name,TrailAppReddy__Price__c from TrailAppReddy__SBI_Arrangements__r) from TrailAppReddy__Summary__c where ID IN:lis.keyset()]; 
    
    for(TrailAppReddy__Summary__c prec:parcords)
    {
         prec.TrailAppReddy__CHild_count__c=prec.TrailAppReddy__SBI_Arrangements__r.size();
        decimal i=0;
        for(TrailAppReddy__SBI_Arrangements__c pecc:prec.TrailAppReddy__SBI_Arrangements__r)
        {
            //i=i+pecc.TrailAppReddy__Price__c;
           // prec.TrailAppReddy__Amount__c= prec.TrailAppReddy__Amount__c+pecc.TrailAppReddy__Price__c;
        }
     prec.TrailAppReddy__Amount__c=1000;   
    
    }
    update parcords;
    
    
    
}