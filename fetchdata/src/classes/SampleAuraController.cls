public class SampleAuraController {
   //Get Contact List
    @AuraEnabled
    public static List<Contact> getContactList(Integer limits, Integer offsets){
        Integer intLimit = Integer.valueof(limits);
        Integer intOffset = Integer.valueof(offsets);
        List<Contact> conList = new List<Contact>();
        conList = [SELECT Id, Name, Email, Phone FROM Contact LIMIT :intLimit Offset :intOffset];
        return conList;
    }
     
    //Get Total Number of Contacts
    @AuraEnabled
    public static Integer getTotalContacts(){
        AggregateResult results = [SELECT Count(Id) TotalContacts  From Contact];
        Integer totalContacts = (Integer)results.get('TotalContacts') ; 
        return totalContacts;
    } 
     
    //Delete Contact
    @AuraEnabled
    public static void deleteContact(Contact con){
        Delete con;
    } 
    //Delete selected Contacts
    @AuraEnabled
    public static void deleteselectedContacts(List<Contact> consdelete){
        Delete consdelete;
    }
    
     @AuraEnabled
    public static boolean updatecontacts(List<Contact> editedcontactList ){
      
        update editedcontactList;
        return true;
    }


}