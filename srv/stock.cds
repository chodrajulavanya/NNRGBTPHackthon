using { com.satinfotech.stock as stk } from '../db/schema';

service StockDb {
    entity BusinessPartner as projection on stk.BusinessPartner;
    entity States as projection on stk.States;
    entity Store as projection on stk.Store;
    {
         @UI.Hidden : true
        ID,
        * 
    };
    entity Product as projection on stk.Product;
    {
         @UI.Hidden : true
        ID,
        * 
    };
    entity StockData as projection on stk.StockData;
    

}

annotate StockDb.BusinessPartner with @odata.draft.enabled;
annotate StockDb.States with @odata.draft.enabled;
annotate StockDb.Store with @odata.draft.enabled;
annotate StockDb.Product with @odata.draft.enabled;
annotate StockDb.StockData with @odata.draft.enabled;


annotate StockDb.BusinessPartner with {
    name @assert.format: '^[a-zA-Z]{2,}$';
    pin_no @assert.format: '^[1-9]{1}[0-9]{2}\\s{0, 1}[0-9]{3}$'; 
}



annotate StockDb.BusinessPartner with @(
    UI.LineItem: [
        {
            Label: 'Bussiness Partner Number',
            Value: bus_part_no
        },
        {
            Label: 'Name',
            Value: name
        },
        {
            Label: 'Address 1',
            Value: address_1
        },
        {
            Label: 'Address 2',
            Value: address_2
        },
        {
            Label: 'City',
            Value: city
        },
        {
            Label: 'State',
            Value: state
        },
        {
            Label: 'GSTN Register',
            Value: Is_gstn_registered
        },
        {
            Label: 'GSTIN Number',
            Value: gstin_no
        },

    ],
    UI.FieldGroup #BusinessProduct: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Bussiness Partner Number',
                Value: bus_part_no
            },
            {
                $Type: 'UI.DataField',
                Value: name
            },
            {
                $Type: 'UI.DataField',
                Value: address_1
            },
            {
                $Type: 'UI.DataField',
                Value: address_2
            },
            {
                $Type: 'UI.DataField',
                Value: city
            },
             {
                $Type: 'UI.DataField',
                Value: pin_no
            },
            {
                $Type: 'UI.DataField',
                Value: state
            },
            {
                $Type: 'UI.DataField',
                Value: Is_gstn_registered
            },
            {
                $Type: 'UI.DataField',
                Value: gstin_no
            },
        ],
    },
    UI.Facets               : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'BusinessProductFacet',
        Label : 'BusinessProduct',
        Target: '@UI.FieldGroup#BusinessProduct',
    }, ],

);

annotate StockDb.States with @(
    UI.LineItem: [
        {
            $Type:'UI.DataField',
            Value: code
        },
        {
            $Type:'UI.DataField',
            Value: description
        },
    ]
    
);

annotate StockDb.Store with @(
    UI.LineItem: [
        {
            Label: 'Store Id',
            Value: store_id
        },
        {
            Label: 'Name',
            Value: name
        },
        {
            Label: 'Address 1',
            Value: address_1
        },
        {
            Label: 'Address 2',
            Value: address_2
        },
        {
            Label: 'City',
            Value: city
        },
        {
            Label: 'State',
            Value: state
        },
        {
            Label: 'Pin code',
            Value: pin_no
        },
    ],
    UI.FieldGroup #Store: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                Label: 'Store Id',
                Value: store_id
            },
            {
                Label: 'Name',
                Value: name
            },
            {
                Label: 'Address 1',
                Value: address_1
            },
            {
                Label: 'Address 2',
                Value: address_2
            },
            {
                Label: 'City',
                Value: city
            },
            {
                Label: 'State',
                Value: state
            },
            {
                Label: 'Pin code',
                Value: pin_no
            },
        ],
    },
    UI.Facets : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'StoreFacet',
        Label : 'Store facets',
        Target: '@UI.FieldGroup#store'
    }, 
    ],
    
    
);

annotate StockDb.Product with @(
    UI.LineItem           : [
        {
            Label: 'Product Id',
            Value: prod_id
        },
        {
            Label: 'Product Name',
            Value: prod_name
        },
        {
            Label: 'Product Image URL',
            Value: prod_imgURL
        },
        {
            Label: 'Product Cost Price',
            Value: prod_costpr
        },
        {
            Label: 'Product Sell Price',
            Value: prod_sellpr
        },
    ],
    UI.FieldGroup #Product: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
            Label: 'Product Id',
            Value: prod_id
        },
        {
            Label: 'Product Name',
            Value: prod_name
        },
        {
            Label: 'Product Image URL',
            Value: prod_imgURL
        },
        {
            Label: 'Product Cost Price',
            Value: prod_costpr
        },
        {
            Label: 'Product Sell Price',
            Value: prod_sellpr
        },
        ],
    },
    UI.Facets : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'ProductFacet',
        Label : 'Product facets',
        Target: '@UI.FieldGroup#product'
    }, ],

);


annotate StockDb.StockData with @(
    UI.LineItem:[
        {
            Label:'Store Id',
            Value:store_id
        },
         {
            Label:'Product Id',
            Value:prod_id
        },
        {
            Label:'Stock Quantity',
            Value:stock_qty
        }
    ],
    UI.FieldGroup #stock :{
        $Type:'UI.FieldGroupType',
        Data:[
             {
            Label:'Store Id',
            Value:store_id
        },
         {
            Label:'Product Id',
            Value:prod_id
        },
        {
            Label:'Stock Quantity',
            Value:stock_qty
        }
        ],
    },
      UI.Facets:[
        {
            $Type:'UI.ReferenceFacet',
            ID:'stockFacet',
            Label:'stock facets',
            Target:'@UI.FieldGroup#stock'
        },
    ]
);

annotate StockDb.BusinessPartner with {
    state @(
        common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'state',
            CollectionPath: 'States',
            Parameters : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : state,
                    ValueListProperty : 'code'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                }
            ]
        }
    );
}

annotate StockDb.Store with {
    state @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            Label: 'State',
            CollectionPath: 'States',
            Parameters : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : state,
                    ValueListProperty : 'code'
                },
               
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                }
            ]
        }
    );
};

annotate StockDb.StockData with {
    store_id @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Store ID',
            CollectionPath : 'StoreData',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : store_iD,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                },
             
            ]
        }
    );
    prod_id @(
            Common.ValueListWithFixedValues: true,
            Common.ValueList : {
            Label: 'Product ID',
            CollectionPath : 'Product',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : prod_id,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                },
             
            ]
        }
    );
}