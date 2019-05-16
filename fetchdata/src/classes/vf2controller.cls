public class vf2controller {
     pageReference saveAndRedirectPage;
    public vf2controller(apexpages.StandardController con){
         saveAndRedirectPage = new pagereference('https://ap5.salesforce.com/a00/e');  
    }
    
    public PageReference campaignpage()
{
   
  
    
    return saveAndRedirectPage;
}

}