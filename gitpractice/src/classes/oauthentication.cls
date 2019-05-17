public class oauthentication {
    public string redirecturl{set;get;}
    public string clientid{set;get;}
    public string endpoint{set;get;}
    public string code{set;get;}
    public string accesstoken{set;get;}
    public string result1{set;get;}
    public pagereference code(){
        redirecturl='https://c.ap5.visual.force.com/apex/oauth1';
       //clientid="3MVG9ZL0ppGP5UrCpX.e6KnOMQPjYrxpl1Y9kYBegJcOqKh_2FPRfSXJ.CkSXTVqo2sCCU50druQmbHCo_7NH";
        Endpoint='https://login.salesforce.com/services/oauth1/authorize?response_type=code&client_id=3MVG9ZL0ppGP5UrCpX.e6KnOMQPjYrxpl1Y9kYBegJcOqKh_2FPRfSXJ.CkSXTVqo2sCCU50druQmbHCo_7NH&redirect_uri=https://c.ap5.visual.force.com/apex/oauth1';
        pagereference pg=new pagereference(endpoint);
        return pg;
        
    }
    public void getcode(){
       code=apexpages.currentPage().getparameters().get('code');
       
                         }
    public void getaccess(){
        string aces='https://login.salesforce.com/services/oauth2/token';
        HttpRequest req=new HttpRequest();
        string body='grant_type=authorization_code&client_secret=3798424434702076760&client_id=3MVG9ZL0ppGP5UrCpX.e6KnOMQPjYrxpl1Y9kYBegJcOqKh_2FPRfSXJ.CkSXTVqo2sCCU50druQmbHCo_7NH&redirect_uri=https://c.ap2.visual.force.com/apex/datalistex&code='+code;
        req.setMethod('POST');
        req.setBody(body);
        req.setEndpoint(aces);
        Http p=new Http();
        HttpResponse res=p.send(req);
        string result=res.getBody();
        system.JSONParser jsp=json.createParser(result);
        while(jsp.nextToken()!=NULL){
            if(jsp.getText()=='access_Token'){
                jsp.nextToken();
                accesstoken=jsp.getText();
                
            }
        }
    }
    public void operation(){
       string url= 'https://ap2.salesforce.com/services/data/v40.0/sobjects/Account/0012800001O63GG?fields=AccountNumber,BillingPostalCode';
        HttpRequest req1=new HttpRequest();
        req1.setEndpoint(url);
        //req1.setHeader('Authorization:', 'Bearer'+accesstoken);
        req1.setMethod('GET');
         Http p1=new Http();
        HttpResponse res1=p1.send(req1);
    result1=res1.getBody();
        
        
    }
}