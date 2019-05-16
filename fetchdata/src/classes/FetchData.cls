Public class FetchData {
    @AuraEnabled
    Public static List<Account> Accdata(){
        List<Account> alist=[Select Name,Billingcity,Type,BillingState from Account order by createddate];
        //upsert SaveAcc;
         return alist;
      
    }
    @AuraEnabled 
    Public static void SaveAccount(Account SaveAcc){
        update SaveAcc;       
    }   
     @AuraEnabled 
    Public static void DelAccount(Account Accdel,List<Account> MassDelete){
        system.debug(MassDelete);
        system.debug(Accdel);
        if(Accdel!=null){
        delete Accdel;
        }
        if(MassDelete!=null)
        delete MassDelete;
          
    }


}