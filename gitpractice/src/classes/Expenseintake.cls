public class Expenseintake {
    
    public account acc{set;get;}
     public contact con{set;get;}
    public list<contact> conlist{set;get;}
    public list<contact> cons{set;get;}
    public Expense__c exp{set;get;}
    public string tabopt{set;get;}
   public Expenseintake()
   {
     
        acc=new account();
        con=new contact();
       conlist=new list<contact>();
       cons=new list<contact>();
       cons.add(con);
        exp=new Expense__c();
   }
    public void addrow(){
       contact aons= new contact();
       cons.add(aons);
    }
    public void accredirec(){
        tabopt='account';
    }
    public void conredirec(){
        tabopt='Contact';
    }
    public void expredirec(){
        tabopt='Expense';
    }
    public void sumredirec(){
        tabopt='Summary';
    }
    
    public void savedetails()
    {
    account accdet=new account();
       accdet.name=acc.name;
       accdet.phone=acc.phone;
        accdet.Industry=acc.Industry;
          accdet.rating=acc.rating ; 
           accdet.type=acc.type;  
            insert accdet;
        for(contact con1:cons){
        contact condet=new contact();
        condet.lastname=con1.lastname;
        condet.FirstName=con.Firstname;
        condet.Phone=con1.Phone;
        condet.Email=con1.Email;
        condet.AccountId=con1.accountId;
            conlist.add(condet);
        
            }
        insert conlist;
       Expense__c expdet=new Expense__c();
        expdet.name=exp.Name;
            expdet.Amount__c=exp.Amount__c;
            expdet.Client__c=exp.Client__c;
            expdet.Date__c=exp.Date__c;
            expdet.Reimbursed__c=exp.Reimbursed__c;
        insert expdet;
       
        tabopt='Account';
         conlist.clear();
        
       // pagereference pr=new pagereference('/apex/expenseintake');
        //return pr;
        
    }
}