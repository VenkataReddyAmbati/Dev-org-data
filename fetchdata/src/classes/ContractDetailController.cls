public class ContractDetailController {
    Set<String> originalvalues = new Set<String>();
    Public List<string> leftselected{get;set;}
    Public List<string> rightselected{get;set;}
    Set<string> leftvalues = new Set<string>();
    Set<string> rightvalues = new Set<string>();
    Set<String> originalvaluesCity = new Set<String>();
    Public List<string> leftselectedCity{get;set;}
    Public List<string> rightselectedCity{get;set;}
    Set<string> leftvaluesCity = new Set<string>();
    Set<string> rightvaluesCity = new Set<string>();
    public string selectionmethod{set;get;}
    
        public ContractDetailController(){
        leftselected = new List<String>();
        rightselected = new List<String>();
        leftselectedCity = new List<String>();
        rightselectedCity = new List<String>();
    }
     

    String category;

    String feature;

    public String getCategory() { return this.category; }

    public void setCategory(String s) { this.category = s; }

    public String getFeature() { return this.feature; }
 
    public void setFeature(String s) { this.feature = s; }
    public List<SelectOption> getCategories() {
      List<SelectOption> optionList = new List<SelectOption>();
      optionList.add(new SelectOption('','- None -'));
      for (Sub_Region__c sr : [select name from Sub_Region__c order by Name]){
        optionList.add(new SelectOption(sr.id,sr.name));
      }
      return optionList;     
    }
    
public Pagereference emiFeatures() {
      List<SelectOption> optionList = new List<SelectOption>();
       optionList.add(new SelectOption('- None -', '- None -'));
    
			originalvalues.clear();
            leftvalues.clear();
			rightvalues.clear();
			originalvaluesCity.clear();
            leftvaluesCity.clear();
			rightvaluesCity.clear();   
      if(category != NULL) {            
        for (Country__c c : [select name from Country__c c where c.Sub_Region__c = :category]){
            
            originalvalues.add(c.name);
          leftvalues.add(c.name);
        }
          
      }
      return null;
     
    
    }
    public PageReference selectclick(){
        rightselected.clear();
        for(String s : leftselected){
            leftvalues.remove(s);
            rightvalues.add(s);
        }
        populateCityValuesForSelectedCountries();
        return null;
    }
     
    public PageReference unselectclick(){
        leftselected.clear();
        for(String s : rightselected){
            rightvalues.remove(s);
            leftvalues.add(s);
        }
        populateCityValuesForSelectedCountries();
        return null;
    }
    
        public List<SelectOption> getunSelectedValues(){
        List<SelectOption> options = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(leftvalues);
        tempList.sort();
        for(string s : tempList)
            options.add(new SelectOption(s,s));
        return options;
    }
 
    public List<SelectOption> getSelectedValues(){
        List<SelectOption> options1 = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(rightvalues);
        tempList.sort();
        for(String s : tempList)
            options1.add(new SelectOption(s,s));
        return options1;
    }
        public PageReference selectCityclick(){
        rightselectedCity.clear();
        for(String s : leftselectedCity){
            leftvaluesCity.remove(s);
            rightvaluesCity.add(s);
        }
        return null;
    }
    
        public PageReference unselectCityclick(){
        leftselectedCity.clear();
        for(String s : rightselectedCity){
            rightvaluesCity.remove(s);
            leftvaluesCity.add(s);
        }
        return null;
    }
    
    public List<SelectOption> getunSelectedCityValues(){
        List<SelectOption> options = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(leftvaluesCity);
        tempList.sort();
        for(string s : tempList)
            options.add(new SelectOption(s,s));
        return options;
    }
 
    public List<SelectOption> getSelectedCityValues(){
        List<SelectOption> options1 = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(rightvaluesCity);
        tempList.sort();
        for(String s : tempList)
            options1.add(new SelectOption(s,s));
        return options1;
    }
    
    public void populateCityValuesForSelectedCountries(){
        originalvaluesCity.clear();
        leftvaluesCity.clear();
        rightvaluesCity.clear();
        if(rightvalues!=null)
        {
            for (City__c cf : [select name from City__c c where c.Country__r.name in :rightvalues]){
            
            originalvaluesCity.add(cf.name);
          leftvaluesCity.add(cf.name);
                
        }
            
        }
    }
  
    
    
}