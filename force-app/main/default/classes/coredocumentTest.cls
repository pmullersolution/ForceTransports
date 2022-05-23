public with sharing class coredocumentTest {
    @TestSetup
    static void makeData(){
        ContentVersion cv=new Contentversion();
        cv.title='ABC';
        cv.contenturl='abc';
        Blob b=Blob.valueOf('This is version data');
        cv.versiondata=Encodingutil.base64Encode(b);
        insert cv;
    }
    
    public coredocumentTest() {

    }
}
