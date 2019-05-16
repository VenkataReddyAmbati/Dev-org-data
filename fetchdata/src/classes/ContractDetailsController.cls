public class ContractDetailsController {
    public Countries__c country {get; set;}
    public List<SelectOption> selectionCatagory{get; set;}
    String selectedSelectionCatagory;
    String selectedRegion;
    public String getselectedRegion() { return this.selectedRegion; }
	public void setselectedRegion(String s) { this.selectedRegion = s; }
    public String getSelectedSelectionCatagory() { return this.selectedSelectionCatagory; }
	public void setSelectedSelectionCatagory(String s) { this.selectedSelectionCatagory = s; }
    public multiselectWrapper firstMultiSelect{get; set;}
    public multiselectWrapper secondMultiSelect{get; set;}
    public multiselectWrapper thirdMultiSelect{get; set;}
    public multiselectWrapper fourthMultiSelect{get; set;}
    public multiselectWrapper regionMultiSelect{get; set;}
    public ContractDetailsController.ContractDetailsController(ApexPages.StandardController controller){
        country=new Countries__c();
        selectedSelectionCatagory='';
        selectionCatagory = new List<SelectOption>();
        selectionCatagory.add(new SelectOption('', '--None--'));
        selectionCatagory.add(new SelectOption('Search by Name', 'Search by Name'));
        selectionCatagory.add(new SelectOption('Select by management office', 'Select by management office'));
        selectionCatagory.add(new SelectOption('Select by subregion', 'Select by subregion'));
        selectionCatagory.add(new SelectOption('Select by name', 'Select by name'));
        List<OneCountry__c> allCountries=[select name from OneCountry__c];
        Set<String> allcountrynames=new set<String>();
        for(OneCountry__c country: allCountries)
        {
            allcountrynames.add(country.name);
        }
         firstMultiSelect=new multiselectWrapper(allcountrynames);
        
    }
    public Pagereference changeSelectionCatagory() {
        if(selectedSelectionCatagory=='Select by subregion' && regionMultiSelect==null)
        {
            Set<String> regionList = new Set<String>();
        	for (OneRegion__c sr : [select name from OneRegion__c order by Name]){
                regionList.add(sr.name);
        	}
            regionMultiSelect=new multiselectWrapper(regionList);
        }
        return null;
    }
    public Pagereference secondMultiselectSelect() {
        secondMultiSelect.selectclick();
        Set<String> options=new Set<String>();
        for(String s: secondMultiSelect.rightvalues)
        {
            options.add('Select all Countries from '+s);
        }
        thirdMultiSelect=new multiselectWrapper(options); 
        
        List<OneCountry__c> allCountries=[select name from OneCountry__c where Subregion__r.name in: secondMultiSelect.rightvalues];
        Set<String> allcountrynames=new set<String>();
        for(OneCountry__c country: allCountries)
        {
            allcountrynames.add(country.name);
        }
        fourthMultiSelect=new multiselectWrapper(allcountrynames);
        return null;
    }
    public Pagereference secondMultiselectUnSelect() {
        secondMultiSelect.unselectclick();
        Set<String> options=new Set<String>();
        for(String s: secondMultiSelect.rightvalues)
        {
            options.add('Select all Countries from '+s);
        }
        thirdMultiSelect=new multiselectWrapper(options); 
        return null;
    }
    public Pagereference thirdMultiselectSelect() {
        set<String> subregionnames=new set<String>();
        for(String subregion:thirdMultiSelect.leftselected)
        {
            subregionnames.add(subregion.remove('Select all Countries from '));
        }
        List<OneCountry__c> allCountries=[select name from OneCountry__c where Subregion__r.name in: subregionnames];
        set<String> names=new set<String>();
        for(OneCountry__c con:allCountries)
        {
            names.add(con.name);
        }
        fourthMultiSelect.rightvalues.addAll(names);
        fourthMultiSelect.leftvalues.removeAll(names);    
        thirdMultiSelect.selectclick();
        return null;
    }
    public Pagereference thirdMultiselectUnSelect() {
        set<String> subregionnames=new set<String>();
        for(String subregion:thirdMultiSelect.rightselected)
        {
            subregionnames.add(subregion.remove('Select all Countries from '));
        }
        List<OneCountry__c> allCountries=[select name from OneCountry__c where Subregion__r.name in: subregionnames];
        set<String> names=new set<String>();
        for(OneCountry__c con:allCountries)
        {
            names.add(con.name);
        }
        fourthMultiSelect.rightvalues.removeAll(names);
        fourthMultiSelect.leftvalues.addAll(names);    
        thirdMultiSelect.unselectclick();
        return null;
    }
   public Pagereference populateSubRegionsOnSelect() {
       
        regionMultiSelect.selectclick();
        List<OneSub_Region__c> subregions=[select id,name from OneSub_Region__c where Region__r.name in:regionMultiSelect.rightvalues];
        Set<String> allsubregions=new set<String>();
        for(OneSub_Region__c subregion: subregions)
        {
            allsubregions.add(subregion.name);
        }
       System.debug('##allsubregions'+allsubregions);
       secondMultiSelect=new multiselectWrapper(allsubregions);
       if(thirdMultiSelect!=null)
       {
           thirdMultiSelect=null;
       }
       if(fourthMultiSelect!=null)
       {
           fourthMultiSelect=null;
       }
        
       
       /*
       secondMultiSelect.originalvalues.addAll(allsubregions);
       secondMultiSelect.leftvalues.addAll(allsubregions);
       secondMultiSelect.rightvalues.clear();*/
        return null;
    }
    public Pagereference populateSubRegionsOnUnSelect() {
       
        regionMultiSelect.unselectclick();
        if(regionMultiSelect.rightvalues.size()>0){
        List<OneSub_Region__c> subregions=[select id,name from OneSub_Region__c where Region__r.name in:regionMultiSelect.rightvalues];
        Set<String> allsubregions=new set<String>();
        for(OneSub_Region__c subregion: subregions)
        {
            allsubregions.add(subregion.name);
        }
       System.debug('##allsubregions'+allsubregions);
       secondMultiSelect=new multiselectWrapper(allsubregions);
        }else{
       if(thirdMultiSelect!=null)
       {
           thirdMultiSelect=null;
       }
       if(fourthMultiSelect!=null)
       {
           fourthMultiSelect=null;
       }
        }
       
       /*
       secondMultiSelect.originalvalues.addAll(allsubregions);
       secondMultiSelect.leftvalues.addAll(allsubregions);
       secondMultiSelect.rightvalues.clear();*/
        return null;
    }
    
    public class multiselectWrapper {
    	Set<String> originalvalues = new Set<String>();
    	Public List<string> leftselected{get;set;}
    	Public List<string> rightselected{get;set;}
    	Set<string> leftvalues = new Set<string>();
    	Set<string> rightvalues = new Set<string>();
        
     Public multiselectWrapper(Set<String> values){
         originalvalues.addAll(values);
        leftselected = new List<String>();
        rightselected = new List<String>();
         leftvalues.addAll(originalvalues); 
     }
        
         public PageReference selectclick(){
        rightselected.clear();
        for(String s : leftselected){
            leftvalues.remove(s);
            rightvalues.add(s);
        }
        return null;
    }
     
    public PageReference unselectclick(){
        leftselected.clear();
        for(String s : rightselected){
            rightvalues.remove(s);
            leftvalues.add(s);
        }
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
    }
       

}