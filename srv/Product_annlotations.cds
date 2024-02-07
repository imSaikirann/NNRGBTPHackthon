using { com.saikiran.eleStore as db } from '../db/schema';

//services and projections
service ProductService {

    entity Product as projection on db.Product;

}
//create button
annotate ProductService.Product with @odata.draft.enabled ;
 
//validations

annotate ProductService.Product with {
   //product_image   @assert.format: 'https?://[^\s/$.?#].[^\s]*\.(png|jpg|jpeg|gif|bmp|svg)';
}



//annotations for Business partner
annotate ProductService.Product with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value: product_id
        },
         {
            $Type : 'UI.DataField',
            Value: product_name
        },
         {
            $Type : 'UI.DataField',
            Value: product_image
        },
         {
            $Type : 'UI.DataField',
            Value: product_cost_price
        },
         {
            $Type : 'UI.DataField',
            Value: product_sell_price
        },
        
        
    ],
    UI.FieldGroup #ProductInformation : {
        Data:[
       {
            $Type : 'UI.DataField',
            Value: product_id,
        },
         {
            $Type : 'UI.DataField',
            Value: product_name,
        },
         {
            $Type : 'UI.DataField',
            Value: product_image,
        },
         {
            $Type : 'UI.DataField',
            Value: product_cost_price,
        },
         {
            $Type : 'UI.DataField',
            Value: product_sell_price,
        },
        
         
         
        ]
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BusinessP',
            Label: 'Product Information',
            Target: '@UI.FieldGroup#ProductInformation',
        }
    ],
      
);



