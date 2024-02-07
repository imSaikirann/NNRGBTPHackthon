using { com.saikiran.eleStore as db } from '../db/schema';

//services and projections
service Electronics {

    entity BusinessPartner as projection on db.BusinessPartner;

}
//create button
annotate Electronics.BusinessPartner with @odata.draft.enabled ;

//validations

annotate Electronics.BusinessPartner with {
   pincode     @assert.format: '^[1-9]\d{2}( ?\d{3})?$';
   gstin_number @assert.format:'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9A-Z]{1}[0-9A-Z]{1}$'
}


//annotations for Business partner
annotate Electronics.BusinessPartner with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value: businesspartner_number
        },
         {
            $Type : 'UI.DataField',
            Value: name
        },
         {
            $Type : 'UI.DataField',
            Value: address1
        },
         {
            $Type : 'UI.DataField',
            Value: address2
        },
         {
            $Type : 'UI.DataField',
            Value: city
        },
         {
            $Type : 'UI.DataField',
            Value: pincode
        },
         {
            $Type : 'UI.DataField',
            Value: gstin_number
        },
    ],
    UI.FieldGroup #BusinessPartnerInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Value: businesspartner_number,
        },
         {
            $Type : 'UI.DataField',
            Value: name,
        },
         {
            $Type : 'UI.DataField',
            Value: address1,
        },
         {
            $Type : 'UI.DataField',
            Value: address2,
        },
         {
            $Type : 'UI.DataField',
            Value: city,
        },
         {
            $Type : 'UI.DataField',
            Value: pincode,
        },
         {
            $Type : 'UI.DataField',
            Value: gstin_number,
        },
            
        ]
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BusinessP',
            Label: 'Business Partner Information',
            Target: '@UI.FieldGroup#BusinessPartnerInformation',
        }
    ]
      
) ;