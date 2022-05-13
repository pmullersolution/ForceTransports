trigger sumasingl on suma__c (before insert, before update) {
        //sum1 = new sumasingl();
        //sum1.getSuma(trigger.new);

    classumasingl su = classumasingl.getInstance(trigger.new);
    su.getSuma();

}