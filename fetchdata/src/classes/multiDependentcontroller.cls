public class multiDependentcontroller {
    Set<String> originalvaluesregion = new Set<String>();
    public list<string> leftselectedregion{set;get;}
    public list<string> rightselectedregion{set;get;}
    Set<String> leftvaluesregion = new Set<String>();
    Set<String> rightvaluesregion = new Set<String>();
   Set<String> originalvaluessubregion = new Set<String>();
    public list<string> leftselectedsubregion{set;get;}
    public list<string> rightselectedsubregion{set;get;}
    Set<String> leftvaluessubregion = new Set<String>();
    Set<String> rightvaluessubregion = new Set<String>();
    Set<String> originalvaluescountry = new Set<String>();
    public list<string> leftselectedcountry{set;get;}
    public list<string> rightselectedcountry{set;get;}
    Set<String> leftvaluescountry = new Set<String>();
    Set<String> rightvaluescountry = new Set<String>();
    public string selectionmethod{set;get;}
    
    public multiDependentcontroller(){
        leftselectedregion= new List<String>();
        rightselectedregion= new List<String>();
        leftselectedsubregion = new List<String>();
        rightselectedsubregion = new List<String>();
         leftselectedcountry = new List<String>();
        rightselectedcountry = new List<String>();
    } 
     public List<SelectOption> getselectionmethods() {
      List<SelectOption> optionList = new List<SelectOption>();
      optionList.add(new SelectOption('','- None -'));
      for (Sub_Region__c sr : [select name from Sub_Region__c order by Name]){
        optionList.add(new SelectOption(sr.id,sr.name));
      }
      return optionList;     
    }
    public Pagereference multipick() {
      List<SelectOption> optionList = new List<SelectOption>();
       optionList.add(new SelectOption('- None -', '- None -'));
    
			originalvaluesregion.clear();
            leftvaluesregion.clear();
			rightvaluesregion.clear();
			originalvaluessubregion.clear();
            leftvaluessubregion.clear();
			rightvaluessubregion.clear();   
      if(selectionmethod != NULL) {            
        for (Country__c c : [select name from Country__c c where c.Sub_Region__c = :selectionmethod])
        {
            
            originalvaluesregion.add(c.name);
          leftvaluesregion.add(c.name);
        }
      }
      return null;
     
    }  
     public List<SelectOption> getunSelectedValuesregion(){
        List<SelectOption> options = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(leftvaluesregion);
        tempList.sort();
        for(string s : tempList)
            options.add(new SelectOption(s,s));
        return options;
    }
 public PageReference selectclickregion(){
       
        for(String s : leftselectedregion){
            leftvaluesregion.remove(s);
            rightvaluesregion.add(s);
        }
     populatesubregionValuesForSelectedregions();
        return null;
    }
     
    public List<SelectOption> getSelectedValuesregion(){
        List<SelectOption> options1 = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(rightvaluesregion);
        tempList.sort();
        for(String s : tempList)
            options1.add(new SelectOption(s,s));
        return options1;
    }
public PageReference unselectclickregion(){
       
        for(String s : rightselectedregion){
            rightvaluesregion.remove(s);
            leftvaluesregion.add(s);
        }
    populatesubregionValuesForSelectedregions();
        return null;
    }
    public List<SelectOption> getunSelectedValuessubregion(){
       List<SelectOption> options1 = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(leftvaluessubregion);
        tempList.sort();
        for(string s:tempList){
            options1.add(new selectoption(s,s));
        }
        return options1;
    }
    public pagereference selectclicksubregion(){
        
        for(string s:leftselectedsubregion){
            leftvaluessubregion.remove(s);
            rightvaluessubregion.add(s);
        }
        return null;
    }  
    public List<SelectOption> getSelectedValuessubregion(){
       List<SelectOption> options1 = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(rightvaluessubregion);
        tempList.sort();
        for(string s:tempList){
            options1.add(new selectoption(s,s));
        }
        return options1;
    }
    public PageReference unselectclicksubregion(){
        
        for(String s : rightselectedsubregion){
            rightvaluessubregion.remove(s);
            leftvaluessubregion.add(s);
        }
   
        return null;
    }
    
    
     public void populatesubregionValuesForSelectedregions(){
        originalvaluessubregion.clear();
        leftvaluessubregion.clear();
        rightvaluessubregion.clear();
        if(rightvaluesregion!=null)
        {
            for (City__c cf : [select name from City__c c where c.Country__r.name in :rightvaluesregion]){
            
            originalvaluessubregion.add(cf.name);
          leftvaluessubregion.add(cf.name);
                
        }
            
        }
    }
  
    
}