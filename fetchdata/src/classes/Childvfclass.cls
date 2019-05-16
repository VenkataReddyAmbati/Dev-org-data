public class Childvfclass {
    public id sumatiid{set;get;}
     public id childid{set;get;}
    public childobject__c childrecord{set;get;}
    public sumati__c parentrecord{set;get;}
    Id recordTypeId = [Select Id,Name from RecordType where Name='Childsumati' and SOBjectType='childobject__c'].id;
    Id recordTypeId2 = [Select Id,Name from RecordType where Name='ChildEmployee' and SOBjectType='childobject__c'].id;
    Id recordTypeId1 = [Select Id,Name from RecordType where Name='Sumati' and SOBjectType='sumati__c'].Id;
    
    public Childvfclass(apexpages.StandardController std)
    {
        childrecord=(childobject__c)std.getRecord();
        //childid=apexpages.currentPage().getparameters().get('id');
        sumatiid=apexpages.currentPage().getparameters().get('sid');
        if(childrecord!=NULL && childrecord.id!=NULL)
        {
        childrecord=[select id,name,RecordTypeId,sumati__c,Childlocation__c,Childsumati__c from childobject__c where id=:childrecord.id];
       sumatiid=childrecord.sumati__c;
        }
        parentrecord=[select id from sumati__c where id=:sumatiid];
       // system.debug(childrecord.RecordTypeId);
        Childrecord.sumati__c=parentrecord.id;
       
    }
    /*public pagereference saverecord()
    {
        childrecord.sumati__c=parentrecord.id;
         
        if(childrecord.Id!=NULL)
        {
            
           update childrecord;  
        }else
        {
        insert childrecord;
        }
        PageReference pr =new PageReference('/'+parentrecord.id);
        return pr;
        
        
    }*/
    public pagereference submit12()
    {
        childobject__c cld=new childobject__c();
        cld.sumati__c=childrecord.sumati__c;
        cld.Name=childrecord.Name;
        cld.RecordTypeId=recordTypeId;
        cld.Childlocation__c=childrecord.Childlocation__c;
        cld.Childsumati__c=childrecord.Childsumati__c;
        insert cld;
         PageReference pr =new PageReference('/'+parentrecord.id);
        return pr;
    }
    
       public PageReference cancelpage()
    {
        PageReference pr =new PageReference('/'+parentrecord.id);
        return pr; 
    }
    

}