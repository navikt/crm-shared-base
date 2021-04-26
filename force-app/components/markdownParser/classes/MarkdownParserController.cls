public with sharing class MarkdownParserController {
    @AuraEnabled(cacheable=true)
    public static String getData(String recordId, String objectApiName, String fieldName) {
        if (!AccessControlValidation.fieldIsAccessible(objectApiName, fieldName)) {
            return null;
        }

        String query = 'SELECT ' + fieldName + ' FROM ' + objectApiName + ' WHERE Id = : recordId LIMIT 1';
        List<SObject> results = Database.query(query);

        if (results.size() == 0) {
            return null;
        }

        return (String) results[0].get(fieldName);
    }
}
