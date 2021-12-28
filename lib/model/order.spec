{
  "id": "Order",
  "packageName": "eliud_pkg_shop",
  "isAppModel": true,
  "generate": {
    "generateComponent": true,
    "generateRepository": true,
    "generateCache": true,
    "hasPersistentRepository": true,
    "generateFirestoreRepository": true,
    "generateRepositorySingleton": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": true,
    "generateEmbeddedComponent": false,
    "documentSubCollectionOf": "app"
  },
  "memberIdentifier": "customerId",
  "fields": [
    {
      "fieldName": "documentID",
      "displayName": "Document ID",
      "fieldType": "String",
      "group": "general",
      "defaultValue": "IDENTIFIER",
      "iconName": "vpn_key"
    },
    {
      "fieldName": "appId",
      "displayName": "App ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "hidden": true,
      "group": "general"
    },
    {
      "fieldName": "customer",
      "displayName": "Member",
      "group": "customer",
      "fieldType": "Member",
      "association": true
    },
    {
      "fieldName": "name",
      "displayName": "Name",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "email",
      "displayName": "email",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "shipStreet1",
      "displayName": "Street Address",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "ship"
    },
    {
      "fieldName": "shipStreet2",
      "displayName": "Street Address Line 2",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "ship"
    },
    {
      "fieldName": "shipCity",
      "displayName": "City",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "ship"
    },
    {
      "fieldName": "shipState",
      "displayName": "State/Province",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "ship"
    },
    {
      "fieldName": "postcode",
      "displayName": "Postal / Zip Code",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "ship"
    },
    {
      "fieldName": "country",
      "displayName": "Country",
      "fieldType": "Country",
      "association": true,
      "optional": false,
      "group": "shipCountry"
    },
    {
      "fieldName": "invoiceSame",
      "displayName": "Invoice address same as shipping address",
      "fieldType": "bool",
      "defaultValue": "true",
      "group": "invoice"
    },
    {
      "fieldName": "invoiceStreet1",
      "displayName": "Street Address",
      "fieldType": "String",
      "iconName": "text_format",
      "conditional": "((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))",
      "group": "invoice"
    },
    {
      "fieldName": "invoiceStreet2",
      "displayName": "Street Address Line 2",
      "fieldType": "String",
      "iconName": "text_format",
      "conditional": "((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))",
      "group": "invoice"
    },
    {
      "fieldName": "invoiceCity",
      "displayName": "City",
      "fieldType": "String",
      "iconName": "text_format",
      "conditional": "((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))",
      "group": "invoice"
    },
    {
      "fieldName": "invoiceState",
      "displayName": "State/Province",
      "fieldType": "String",
      "iconName": "text_format",
      "conditional": "((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))",
      "group": "invoice"
    },
    {
      "fieldName": "invoicePostcode",
      "displayName": "Postal / Zip Code",
      "fieldType": "String",
      "iconName": "text_format",
      "conditional": "((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))",
      "group": "invoice"
    },
    {
      "fieldName": "invoiceCountry",
      "displayName": "Country",
      "fieldType": "Country",
      "association": true,
      "optional": false,
      "conditional": "((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))",
      "group": "invoiceCountry"
    },
    {
      "fieldName": "products",
      "fieldType": "OrderItem",
      "displayName": "Items",
      "group": "orderItems",
      "arrayType": "Array"
    },
    {
      "fieldName": "totalPrice",
      "displayName": "Price",
      "fieldType": "double",
      "group": "totalPrice"
    },
    {
      "fieldName": "currency",
      "displayName": "Currency",
      "fieldType": "String",
      "group": "totalPrice"
    },
    {
      "fieldName": "paymentReference",
      "displayName": "Payment Reference",
      "fieldType": "String",
      "group": "references"
    },
    {
      "fieldName": "shipmentReference",
      "displayName": "Shipment Reference",
      "fieldType": "String",
      "group": "references"
    },
    {
      "fieldName": "deliveryReference",
      "displayName": "Dilvery Reference",
      "fieldType": "String",
      "group": "references"
    },
    {
      "fieldName": "paymentNote",
      "displayName": "Payment Note",
      "fieldType": "String",
      "group": "notes"
    },
    {
      "fieldName": "shipmentNote",
      "displayName": "Shipment Note",
      "fieldType": "String",
      "group": "notes"
    },
    {
      "fieldName": "deliveryNote",
      "displayName": "Dilvery Note",
      "fieldType": "String",
      "group": "notes"
    },
    {
      "fieldName": "status",
      "displayName": "Status of the Order",
      "fieldType": "enum",
      "enumName": "OrderStatus",
      "enumValues" : [ "Ordered", "Paid", "PaymentFailed", "Shipped", "Delivered"],
      "group": "orderStatus"
    },
    {
      "fieldName": "timeStamp",
      "displayName": "Time-Stamp",
      "fieldType": "String",
      "hidden": true
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "customer",
        "description": "Customer"
    },
    {
        "group": "orderItems",
        "description": "Products"
    },
    {
        "group": "totalPrice",
        "description": "Total price"
    },
    {
        "group": "references",
        "description": "References"
    },
    {
        "group": "notes",
        "description": "Notes"
    },
    {
        "group": "ship",
        "description": "Shipping Address"
    },
    {
        "group": "shipCountry",
        "description": "Shipping Country"
    },
    {
        "group": "invoice",
        "description": "Invoice Address",
        "conditional": "((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))"
    },
    {
        "group": "invoiceCountry",
        "description": "Invoice Country",
        "conditional": "((state.value!.invoiceSame == null) || (!state.value!.invoiceSame!))"
    },
    {
        "group": "orderStatus",
        "description": "Order Status"
    }
  ],
  "listFields": {
    "title": "value.documentID != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID!)) : Container()",
    "subTitle": "value.paymentReference != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.paymentReference!)) : Container()"
  },
  "alternativeViews": [
    {
        "name": "Payment",
        "title": "Payment",
        "buttonLabel": "Confirm",
        "fields": [
                    "name", "shipStreet1", "shipStreet2", "shipCity", "shipState", "postcode", "country",
                    "invoiceSame", "invoiceStreet1", "invoiceStreet2", "invoiceCity", "invoiceState", "invoicePostcode", "invoiceCountry",
                    "totalPrice", "currency"
                  ],
        "groups": [ "general", "totalPrice", "ship", "shipCountry", "invoice", "invoiceCountry" ]
    },
    {
        "name": "Shipment",
        "title": "Shipment",
        "buttonLabel": "Update shipment",
        "fields": [
                    "shipmentReference", "shipmentNote"
                  ],
        "groups": [ "references", "notes" ]
    }
  ],
  "depends": ["eliud_core"]
}
