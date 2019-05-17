public class accdetailexte {
    public id venkatid{set;get;}
    public Venkat__c venid{set;get;}
    public boolean egg{set;get;}
    public account acc{set;get;}
    public accdetailexte(apexpages.StandardController std){
        
        venkatid=ApexPages.currentPage().getParameters().get('vid');

        if(venkatid !=NULL)
        {
          venid=[select id,Account__c,acc_rating__c from Venkat__c where id=:venkatid];
             acc =[select id,name,rating from account where id=:venid.Account__c];
            system.debug(venid.acc_rating__c);
            system.debug(acc.Rating);
        }
       egg=false; 
    }
    public pagereference testdetails(){
        egg=true;
        
        venid.acc_rating__c=acc.rating;
        update venid;
        pagereference pr=new pagereference('/'+venid.id);
        return pr;
        
    }
}