public class AccountController {
    @AuraEnabled
    public static list<Account> findall(){
        return [select id,name from account limit 50];
    }
 @AuraEnabled
    public static List<Account> findByName(String searchKey) {
        String name = '%' + searchKey + '%';
        System.debug(name);
        return [SELECT id, name FROM Account WHERE name LIKE :name LIMIT 50];
    }
    @AuraEnabled
    public static Account findById(String AccountId) {
        return [SELECT id, name FROM Account WHERE Id = :AccountId];
    }
}