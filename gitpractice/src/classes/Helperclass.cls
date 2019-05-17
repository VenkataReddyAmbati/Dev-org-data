public class Helperclass {
    
    public static list<Account> accs{get;set;}
    
    public static list<Account> accrecs{get;set;}
    
   public  Helperclass() {
       accs=new list<Account>();
       accrecs=new list<Account>();
   }
    
    @auraenabled
    public Static void details()
    {
        accs=[select id,name,phone from account];
    }
    
     @auraenabled
    public Static void records()
    {
        accrecs=[select id,name from Account where name like 'venkat%'];
        
    }

}