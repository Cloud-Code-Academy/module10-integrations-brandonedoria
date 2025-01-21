public with sharing class ContactTriggerHandler extends TriggerHandler {
    private List<Contact> newContacts;
    private Map<Id, Contact> newConMap;
    private List<Contact> oldContacts;
    private Map<Id, Contact> oldConMap;

    public ContactTriggerHandler() {
        this.newContacts = (List<Contact>) Trigger.new;
        this.newConMap = (Map<Id, Contact>) Trigger.newMap;
        this.oldContacts = (List<Contact>) Trigger.old;
        this.oldConMap = (Map<Id, Contact>) Trigger.oldMap;
    }

    // When a contact is inserted
	// if DummyJSON_Id__c is null, generate a random number between 0 and 100 and set this as the contact's DummyJSON_Id__c value
    public override void beforeInsert() {
        ContactHelper.nullId(this.newContacts);
    }

    //When a contact is inserted
	// if DummyJSON_Id__c is less than or equal to 100, call the getDummyJSONUserFromId API
    public override void afterInsert() {
        ContactHelper.underOneHunnid(this.newContacts);
    }

	//When a contact is updated
	// if DummyJSON_Id__c is greater than 100, call the postCreateDummyJSONUser API
    public override void afterUpdate() {
        ContactHelper.overOneHunnid(this.newContacts);
    }

}