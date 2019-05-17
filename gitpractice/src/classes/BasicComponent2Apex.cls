public class BasicComponent2Apex {
    @AuraEnabled
    public static string str{set;get;}
@AuraEnabled
    public static string datarecord(){
        str=null;
        list<contact> acc=[select id,name,phone,email from contact  limit 3];
        for(contact con:acc){
             str= str+con.name;
        }
        
        return str;
    }
}