public class Fieldsetsclass 

{
    public List<Account> lstAccount{get;set;}
    
    public Fieldsetsclass()
    {
        lstAccount=new List<Account>();

                String query = 'SELECT ';
                for(Schema.FieldSetMember f : this.getFields()) 
                {
                    query += f.getFieldPath() + ', ';
                }
                query += '  Id FROM Account limit 1 ';
                System.debug('query ------>'+query );
                lstAccount = Database.query(query);        
    }

    public List<Schema.FieldSetMember> getFields() 
    {
        return SObjectType.Account.FieldSets.Account_FieldSet.getFields();
    }
}