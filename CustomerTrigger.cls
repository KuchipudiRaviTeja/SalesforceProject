@isTest
public class CustomerTrigger {
    @isTest
    public static void tm1(){
        List<Customer__c> customers = new List<Customer__c>();
        //Creating Customer Records
        for(integer i=0; i<10; i++){
            Customer__c c = new Customer__c ();
            c.Name = 'Customer '+i;
            c.Active__c = false;
            c.Customer_Type__c = 'Premium';
            customers.add(c);
        }
        insert customers;
        //Getting Each customer and updating its active value       
        List<Customer__c> getCustomers = [select id, Active__c from Customer__c];
        for(Customer__c c: getCustomers){
            c.Active__c = true;
        }
        
        Test.startTest();
        update getCustomers;
        Test.stopTest();        
        //10 customer records are updated so we must see 10 billing reports
        System.assertEquals(10, [select count() from Billing__c ]);
    }
}