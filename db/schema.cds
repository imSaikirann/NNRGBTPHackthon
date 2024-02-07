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
      @title:'State'
    state:Association to States;
    @title : 'PIN Code'
    pincode : String(20) @mandatory;
    @title : 'Do you Registerd for GSTN '
    is_gstn_reg : Boolean default false;
    @title : 'GSTIN Number'
    gstin_number : String(20);
     @title : ' Are you a vendor'
    Is_vendor: Boolean default false;
     @title : 'Are you a customer'
    Is_customer: Boolean default false;
    
}


@cds.persistence.skip
entity States {
    @title:'code'
    key code: String(3);
    @title:'description'
    description:String(10);
    
}

//store
entity Store : cuid,managed {
   @title : 'Store ID'
    store_id : String(10);
    @title : 'Name'
    name : String(10) @mandatory;
    @title : 'Address 1'
    address1 : String(20) @mandatory;
    @title : 'Address 2'
    address2 : String(20) @mandatory;
    @title : 'PIN Code'
    pincode : String(20) @mandatory;
    Product : Composition of many {
        pro : Association to Product
    }
  
}

//product schema
entity Product : cuid ,managed{
    @title : 'Product ID'
    product_id : String(10);
    @title : ' Product Name'
    product_name : String(10) @mandatory;
    @title : 'Product Image URL'
    product_image : String(50) @mandatory;
    @title : 'Product Cost Price'
    product_cost_price: String(20) @mandatory;
    @title : 'Product Sell Price'
    product_sell_price: String(20) @mandatory;
  
}


entity Stock {
    key ID            : UUID;
    storeId         : Association to Store;
    productId       : Association to Product;
    stock_qty        : Integer;
}