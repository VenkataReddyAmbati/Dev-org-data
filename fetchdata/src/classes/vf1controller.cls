public class vf1controller {
    
    public Emplyee_Form__c emp{get;set;}
    Public String EmpEditMode{get;set;}
    public string Eid;
    
    public vf1controller()
    {
        
        EmpEditMode='Save';
        emp=new Emplyee_Form__c();
    }
    public pagereference saveEmployeeFOrm()
    {
        PageReference acctPage = new ApexPages.StandardController(emp).view();
        acctPage.setRedirect(true);
return acctpage;
        EmpEditMode='Edit';
        insert emp;
        return null;
    }
    public pagereference getEdit()
    {
        EmpEditMode='savechanges';
        return null;
    }
    public pagereference EditEmployeeFOrm()
    {
        EmpEditMode='Edit';
        update emp;
        return null;
    }
    public pagereference navigation(){
        pagereference p=new pagereference('https://c.ap5.visual.force.com/apex/EmpNew');
            return p;
    }

}