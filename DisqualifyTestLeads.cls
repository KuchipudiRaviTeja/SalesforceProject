@isTest
public class DisqualifyTestLeads {
    @isTest
    public static void tm1(){
        List<Lead> leads = new List<Lead>();
        for(integer i=0; i<10; i++){
            Lead l = new lead();
            l.FirstName = 'Test';
            l.LastName = ' '+i;
            l.Company = 'Test Company '+i;
            leads.add(l);
        }
        Test.startTest();
        insert leads;
        Test.stopTest();
        
        System.assertEquals(10, [select count() from Lead where Status = 'Disqualified']);
    }
    
    @isTest
    public static void tm2(){
        Lead l = new lead();
        l.LastName = 'Teja';
        l.Company = 'Test Company ';
        
        Test.startTest();
        try{
            insert l;
        }catch(Exception e){
            System.debug(e.getMessage());
        }
        Test.stopTest();
    }   
}