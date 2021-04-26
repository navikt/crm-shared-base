@isTest
private without sharing class MarkdownParserControllerTest {
    @isTest
    private static void testGetData() {
        Account acc = new Account(Name = 'test', Description = '### Årsak\nSlett denne\n### Yrker\nkokk\n### Annet\n');
        insert acc;

        Test.StartTest();
        String results = MarkdownParserController.getData(acc.Id, 'Account', 'Description');
        Test.StopTest();

        System.assertNotEquals(null, results, 'Results should not be null');
        System.assertEquals(
            acc.Description.replace('\n', ''),
            results.replace('\n', ''),
            'Should just be the same data'
        );
    }

    @isTest
    private static void testGetData_noFieldAccess() {
        Account acc = new Account(Name = 'test', Rating = '### Årsak\nSlett denne\n### Yrker\nkokk\n### Annet\n');
        insert acc;

        User u = Shared_TestDataFactory.createStandardUser('ARBEIDSGIVER USER');
        String results;

        Test.StartTest();
        System.runAs(u) {
            results = MarkdownParserController.getData(acc.Id, 'Account', 'Rating');
        }
        Test.StopTest();

        System.assertEquals(null, results, 'Results should be null');
    }

    @isTest
    private static void testGetData_noSharingAccess() {
        Account acc = new Account(Name = 'test', Description = '### Årsak\nSlett denne\n### Yrker\nkokk\n### Annet\n');
        insert acc;

        User u = Shared_TestDataFactory.createStandardUser('ARBEIDSGIVER USER');
        String results;

        Test.StartTest();
        System.runAs(u) {
            results = MarkdownParserController.getData(acc.Id, 'Account', 'Description');
        }
        Test.StopTest();

        System.assertEquals(null, results, 'Results should be null');
    }
}
