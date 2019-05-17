public class getcontact {
  @AuraEnabled
    public static account detailsget(string recid){
        account con=[select id,name from account where id=:recid ];
        return con;
        
        
        
    }
}