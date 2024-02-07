using { com.satinfotech.stock as stk } from '../db/schema';

service StockDb {
    entity BusinessPartner as projection on stk.BusinessPartner;
    entity States as projection on stk.States;
    entity Store as projection on stk.Store;
    entity Product as projection on stk.Product;
    entity StockData as projection on stk.StockData

}

annotate StockDb.BusinessPartner with @odata.draft.enabled;
annotate StockDb.States with @odata.draft.enabled;
annotate StockDb.Store with @odata.draft.enabled;
annotate StockDb.Product with @odata.draft.enabled;
annotate StockDb.StockData with @odata.draft.enabled;


annotate StockDb.BusinessPartner with {
    name @assert.format: '^[a-zA-Z]{2,}$';
    Is_gstn_registered @assert.format: '$REGEX(<expression>,<compare_string>=$ORIGINAL);'; 
}



annotate StockDb.BusinessPartner with @(
    UI.LineItem: [
        {
            Value: bus_part_no
        },
    ]
);

annotate StockDb.States with @(
    UI.LineItem: [
        {
            Value: code,
        },
        {
            Value: description,
        }
    ]
    
);

annotate StockDb.Store with @(
    UI.LineItem: [
        {
            Value: store_id
        },
    ]
    
);

annotate StockDb.Product with @(
    UI.LineItem: [
        {
            Value: prod_id
        },
    ]
);

