namespace com.satinfotech.stock;

entity BusinessPartner 
{
    @tittle: 'Business Partner Number'
    bus_part_no: String(10);
    @title: 'Name'
    name: String(10);
    @title: 'Address 1'
    address_1: String(20);
    @tittle: 'Address 2'
    address_2: String(10);
    @title: 'City'
    city: String(10);
    @title: 'State'
    state: Association to States;
    @title: 'PINCode'
    pin_no:String(15);
    @title: 'GSTN Register'
    Is_gstn_registered: String(20);
    @title: 'GSTIN Number'
    gstin_no: String(90);
    @title: 'Is Vendor'
    Is_vendor: String(80);
    @title: 'Is Customer'
    Is_customer: String(90);

}

@cds.persistance.skip
entity States
{
    @title: 'code'
    key code : String(20);
    @title: 'Description'
    description : String(80);
}

entity Store
{
    @tittle: 'Store ID'
    store_id: String(10);
    @title: 'Name'
    name: String(10);
    @title: 'Address 1'
    address_1: String(20);
    @tittle: 'Address 2'
    address_2: String(10);
    @title: 'City'
    city: String(10);
    @title: 'State'
    state: Association to States;
    @title: 'PINCode'
    pin_no:String(15);
}

entity Product 
{
    @tittle: 'Product ID'
    prod_id: String(10);
    @title: 'Product Name'
    prod_name: String(10);
    @title: 'Product Image URL'
    prod_imgurl: String(20);
    @tittle: 'Product Cost Price'
    prod_costpr: String(10);
    @title: 'product Sell price'
    prod_sellpr: String(10);
}

entity StockData
{
    @tittle: 'Store ID'
    store_id: String(10);
    @tittle: 'Product ID'
    prod_id: String(10);
    @title: 'Stock Quan'
    stock_qt: String(10);
}

entity purchaseapp
{
    @tittle: 'PurchaseOrderNumber'
    pur_ord_no: String(10);
    @tittle: 'Bussines Partner'
    buss_partner: String(10);
    @title: 'Stock Quan'
    stock_qt: String(10);
}