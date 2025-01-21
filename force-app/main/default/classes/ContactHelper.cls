public with sharing class ContactHelper {
    // When a contact is inserted
	// if DummyJSON_Id__c is null, generate a random number between 0 and 100 and set this as the contact's DummyJSON_Id__c value    
    public static void nullId (List<Contact> newContacts) {
        for (Contact con : newContacts) {
            if (con.DummyJSON_Id__c == null) {
                con.DummyJSON_Id__c = String.valueOf((Integer) (Math.random() * 100));
            }
        }
    }
    
    //When a contact is inserted
	// if DummyJSON_Id__c is less than or equal to 100, call the getDummyJSONUserFromId API
    public static void underOneHunnid (List<Contact> newContacts) {
        for (Contact con : newContacts) {
            if (Integer.valueOf(con.DummyJSON_Id__c) <= 100) {
                DummyJSONCallout.getDummyJSONUserFromId(con.DummyJSON_Id__c);
            }
        }
    }

	//When a contact is updated
	// if DummyJSON_Id__c is greater than 100, call the postCreateDummyJSONUser API
    public static void overOneHunnid (List<Contact> newContacts) {
        for (Contact con : newContacts) {
            if (Integer.valueOf(con.DummyJSON_Id__c) > 100) {
                DummyJSONCallout.postCreateDummyJSONUser(con.DummyJSON_Id__c);
            }
        }
    }
}