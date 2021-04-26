@isTest
private without sharing class FlexiPageNotificationControllerTest {
    @isTest
    private static void testGetWarning() {
        Account acc = Shared_TestDataFactory.createAccounts(1)[0];
        Task ta = new Task(WhatId = acc.Id, ActivityDate = Date.today(), Subject = 'test', Description = 'test');
        insert ta;

        Test.StartTest();
        String res = FlexiPageNotificationController.getFieldValue(ta.Id, 'Description');
        Test.StopTest();

        System.assertEquals('test', res, 'Since Description is test, the returned value should be the same');
    }

    @isTest
    private static void testGetWarning_empty() {
        Account acc = Shared_TestDataFactory.createAccounts(1)[0];
        Task ta = new Task(WhatId = acc.Id, ActivityDate = Date.today(), Subject = 'test', Description = '');
        insert ta;

        Test.StartTest();
        String res = FlexiPageNotificationController.getFieldValue(ta.Id, 'Description');
        Test.StopTest();

        System.assertEquals(null, res, 'Since Description is empty, the returned value should be empty');
    }

    @isTest
    private static void testGetWarning_noFieldExists() {
        Account acc = Shared_TestDataFactory.createAccounts(1)[0];
        Task ta = new Task(WhatId = acc.Id, ActivityDate = Date.today(), Subject = 'test', Description = '');
        insert ta;

        Test.StartTest();
        String res = FlexiPageNotificationController.getFieldValue(ta.Id, 'DOESNT_EXIST__c');
        Test.StopTest();

        System.assertEquals(null, res, 'Since DOESNT_EXIST__C doesnt exist, the returned value should be empty ');
    }
}
