public class EdwordsSearchcontroller
{
    public EdwordsReq__c ed{set;get;}
    public string keyword{set;get;}
    public list<account> acc{set;get;}
    public list<contact> con{set;get;}
    public list<arrangements__c> arr{set;get;}
    
    public EdwordsSearchcontroller(apexpages.StandardController cont)
    {
         ed=(EdwordsReq__c)cont.getRecord();
        
    }
    public void search()
    {
 if(ed.account__c==true && ed.contact__c==true && ed.Arrangement__c==true)
{
acc=acc=[select id,name from account where name=:keyword or id=:keyword];
con=[select id,name from contact where name=:keyword or id=:keyword];
arr=[select id,name from arrangements__c where name=:keyword or id=:keyword];
}
if(ed.account__c==true && ed.contact__c==true)
{
acc=acc=[select id,name from account where name=:keyword or id=:keyword];
con=[select id,name from contact where name=:keyword or id=:keyword];
}
if( ed.contact__c=true && ed.Arrangement__c==true)
{
con=[select id,name from contact where name=:keyword or id=:keyword];
arr=[select id,name from arrangements__c where name=:keyword or id=:keyword];
}
if( ed.account__c=true && ed.Arrangement__c==true)
{
arr=[select id,name from arrangements__c where name=:keyword or id=:keyword];
acc=acc=[select id,name from account where name=:keyword or id=:keyword];
}
if(ed.account__c=true )
{
acc=acc=[select id,name from account where name=:keyword or id=:keyword];
}
if(ed.contact__c==true)
{
con=[select id,name from contact where name=:keyword or id=:keyword];
}
if(ed.Arrangement__c==true)
{
arr=[select id,name from arrangements__c where name=:keyword or id=:keyword];
}
 
   }
}