public class ApexForLoop {
    public static void paidBillings(){
        //Initialized the Billing object list to store the Billing Records created today, use SOQL.
        List<Billing__c> billings = new List<Billing__c>();
        
        //Creating billing records.
        Customer__c customer = new Customer__c ();
        customer.Name = 'Ravi';
        customer.Customer_Type__c = 'Premium';
        insert customer;
        
        for(integer i=0; i<5; i++){
            Billing__c billing = new Billing__c();
            billing.Amount_Paid__c = 10000;
            billing.Customer_Type__c = 'Premium';
            billing.Status__c = 'Paid';
            billing.Customer__c = customer.Id;
            billings.add(billing);
        }
        insert billings;
        
        //fetching the records created today using SOQL
        List<Billing__c> billingRecords = [select Id, Status__c, Name from Billing__c where CreatedDate = TODAY];
        List<String> ids = new List<String>();
        for(Billing__c billing: billingRecords){
            if(billing.Status__c == 'Paid'){
                System.debug ('Value of Current Record on which Loop is iterating ' + billing);
                ids.add(billing.Name);
            }
        }
        System.debug(ids);
    }
}