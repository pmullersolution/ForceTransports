public without sharing class coreDocuments 
{
    @AuraEnabled
    public static List<ContentDocument> getDocuments()
    {
        try {
              return [SELECT Id, ContentSize,FileExtension, ParentId, FileType,PublishStatus, Description, Title, CreatedBy.Name from ContentDocument ];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
