namespace com.satinfotech.stock;
using {managed, cuid} from '@sap/cds/common';
@assert.unique:{
    bus_part_no:[bus_part_no]
}


entity BusinessPartner 
{
    key ID: UUID;
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
    Is_gstn_registered: Boolean default false;
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
    key ID:UUID;
    @tittle: 'Store ID'
    store_id: String(10);
    name: Association to BusinessPartner;
    address_1: Association to BusinessPartner;
    city: Association to BusinessPartner;
    state: Association to States;
    pin_no: Association to BusinessPartner;
}

entity Product 
{
    key ID:UUID;
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

entity StockData {
    key ID       : UUID;
    store_id     : Association to Store;
    prod_id      : Association to Product;
    stock_qty    : Integer;
}