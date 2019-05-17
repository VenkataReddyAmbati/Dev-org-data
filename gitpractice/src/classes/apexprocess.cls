public class apexprocess 
{
 
  /*public static account acc{set;get;}
    
    public apexprocess(apexpages.StandardController acc1)
    {
       acc=(account)acc1.getrecord() ;
       
    }*/
    @InvocableMethod
    public static void createcontact(List<Id> accountIds)
    {
        
        list<account> acc=[select id,name from account where id in:accountIds];
        for(account ac:acc)
        {
            contact con=new contact();
          con.AccountId=ac.id;
          con.LastName=ac.name;
           insert con;
        }
       
    }

}