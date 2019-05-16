public class multiselectcontroller {
 	Public string selectedname{get;set;}
     list<String> originalvalues = new list<String>{'asia pacific','emerging markets world wide','Europe G5','Europe,Middle East&Africa','Greater china','latin america','north america','japan'};
    Public List<string> leftselected{get;set;}
    Public List<string> rightselected{get;set;}
    Public Boolean testRend{get;set;}
    Set<string> leftvalues = new Set<string>();
    Set<string> rightvalues = new Set<string>();
    public multiselectcontroller(){
        testRend = false;
        leftselected = new List<String>();
        rightselected = new List<String>();
        leftvalues.addAll(originalValues);
    }

public List<SelectOption> getCountriesOptions() {
        List<SelectOption> countryOptions = new List<SelectOption>();
        countryOptions.add(new SelectOption('','-None-'));
        countryOptions.add(new SelectOption('select by subregion','select by subregion'));
        countryOptions.add(new SelectOption('select by management office','select by management office'));
        countryOptions.add(new SelectOption('select by name','select by name'));
        countryOptions.add(new SelectOption('search by name','search by name'));
return countryOptions;
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
    public List<SelectOption> getSelectedValues(){
        List<SelectOption> options1 = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(rightvalues);
        tempList.sort();
        for(String s : tempList)
            options1.add(new SelectOption(s,s));
        return options1;
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
    
    public void checkSelectedList(){
        if(selectedname == 'select by subregion'){
			testRend = true;            
        }
    }
    

}