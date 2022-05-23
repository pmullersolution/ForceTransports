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

    @AuraEnabled
    public static String uploadFile(String base64, String filename, String recordId) {
            ContentVersion cv = createContentVersion(base64, filename);
            ContentDocumentLink cdl = createContentLink(cv.Id, recordId);
            if (cv == null || cdl == null) { return null; }
            return cdl.Id;
    }
    

    private static ContentVersion createContentVersion(String base64, String filename) {
        ContentVersion cv = new ContentVersion();
        cv.VersionData = EncodingUtil.base64Decode(base64);
        cv.Title = filename;
        cv.PathOnClient = filename;
        try {
          insert cv;
          return cv;
        } catch(DMLException e) {
          System.debug(e);
          return null;
        }
      }

    private static ContentDocumentLink createContentLink(String contentVersionId, String recordId){
            if (contentVersionId == null || recordId == null) { return null; }
                ContentDocumentLink cdl = new ContentDocumentLink();
                cdl.ContentDocumentId = [
                SELECT ContentDocumentId 
                FROM ContentVersion 
                WHERE Id =: contentVersionId
                ].ContentDocumentId;
                cdl.LinkedEntityId = recordId;
                // ShareType is either 'V', 'C', or 'I'
                // V = Viewer, C = Collaborator, I = Inferred
                cdl.ShareType = 'V';
                try {
                insert cdl;
                return cdl;
                } catch(DMLException e) {
                System.debug(e);
                return null;
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
