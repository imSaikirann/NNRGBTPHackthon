namespace com.saikiran.eleStore;
using { cuid,managed } from '@sap/cds/common';

@assert.unique:{
   businesspartner_number  :[ businesspartner_number]
}


entity BusinessPartner : cuid,managed {
    @title : 'Business Partner Number'
    businesspartner_number : String(10);
    @title : 'Name'
    name : String(10) @mandatory;
    @title : 'Address 1'
    address1 : String(20) @mandatory;
    @title : 'Address 2'
    address2 : String(20) @mandatory;
     @title : 'City'
    city : String(20) @mandatory;
   /*   @title : 'State'
    state : String(20) @mandatory;*/
      @title : 'PIN Code'
    pincode : String(20) @mandatory;
       @title : 'GSTIN Number'
    gstin_number : String(20) @mandatory;
    
}