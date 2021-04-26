@isTest
private without sharing class Shared_TestDataFactoryTest {
    @isTest
    private static void testcreateStandardUser() {
        Integer beforeUser = [SELECT Id FROM User].size();

        Test.StartTest();
        Shared_TestDataFactory.createStandardUser('Last UNIQUE NAME');
        Test.StopTest();

        Integer afterUser = [SELECT Id FROM User].size();

        System.assertEquals(1, afterUser - beforeUser, 'New user should have been created');
    }

    @isTest
    private static void testCreateAccounts() {
        Integer beforeAccount = [SELECT Id FROM Account].size();
        Integer amount = 4;
        Test.StartTest();
        Shared_TestDataFactory.createAccounts(amount);
        Test.StopTest();

        Integer afterAccount = [SELECT Id FROM Account].size();

        System.assertEquals(amount, afterAccount - beforeAccount, 'New user should have been created');
    }

    @IsTest
    private static void testCreateContacts() {
        List<Account> accounts = Shared_TestDataFactory.createAccounts(2);
        Test.startTest();
        List<Contact> contacts = Shared_TestDataFactory.createContacts(accounts, 3);
        Test.stopTest();
        System.assertEquals(6, contacts.size(), 'three contacts per account added');
    }
}
