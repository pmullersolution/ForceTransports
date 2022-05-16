public without sharing class coreDocuments 
{
    @AuraEnabled(Cacheable=true)
    public static List<documents> getDocuments(string idObject)
    {
        try {
            list<documents> listDocuments = new List<Documents>();
            for(ContentDocumentLink cdl : [SELECT Id, ContentDocument.ContentSize, ContentDocument.FileExtension, ContentDocument.Title, ContentDocument.CreatedBy.name From ContentDocumentLink Where LinkedEntityId = :idObject])
            {
                listDocuments.add(new documents(cdl));
            }
              return listDocuments;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public class documents
    {
        @AuraEnabled
        public string name{get;set;}
        @AuraEnabled
        public string type{get;set;}
        @AuraEnabled
        public integer sizeDoc{get;set;}
        @AuraEnabled
        public string createdBy{get;set;}

        public documents(ContentDocumentLink CDL)
        {
            this.name = CDL.ContentDocument.Title;
            this.type = CDL.ContentDocument.FileExtension;
            this.sizeDoc = CDL.ContentDocument.ContentSize;
            this.createdBy = CDL.ContentDocument.CreatedBy.name;
        }
    }
}
