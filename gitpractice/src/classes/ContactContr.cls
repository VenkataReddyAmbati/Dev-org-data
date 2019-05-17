public with sharing class ContactContr {
    @AuraEnabled
    public static List<Contact> getContacts() {
        List<Contact> contacts =
                [SELECT Id, Name, Phone, Email FROM Contact];
        //Add isAccessible() check
        return contacts;
    }
}