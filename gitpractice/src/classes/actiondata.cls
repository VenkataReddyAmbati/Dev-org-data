public class actiondata {
    
@AuraEnabled
    public static list<account> getAccounts(){
       list<account> acc=[select id,Name,Phone,Rating from account];
          return acc;
         
    }

    @AuraEnabled
    public static boolean updateAccounts(List<Account> editedAccountList){
        try{
            update editedAccountList;
            return true;
        } catch(Exception e){
            return false;
        }
    }
}