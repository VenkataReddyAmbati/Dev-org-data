global class Attachmentfile {
    public blob file{set;get;}
    public string resume{set;get;}
    
    public void saveattachment(){
     account acc=[select id,name from account limit 1];
 attachment att=new attachment();
   att.ParentId = acc.id; 
      att.body=file;  
        att.Name=resume;
     insert att;
 }
}