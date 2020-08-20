{
  "id": "OrderItem",
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
    "generateFirestoreRepository": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": true
  },
  "fields": [
    {
      "fieldName": "documentID",
      "displayName": "Document ID",
      "fieldType": "String",
      "group": "general",
      "defaultValue": "IDENTIFIER",
      "iconName": "vpn_key",
      "hidden": true
    },
    {
      "fieldName": "amount",
      "displayName": "Amount",
      "group": "general",
      "fieldType": "int"
    },
    {
      "fieldName": "appId",
      "displayName": "App ID",
      "fieldType": "String",
      "group": "app"
    },
    {
      "fieldName": "soldPrice",
      "displayName": "Price",
      "fieldType": "double",
      "group": "general"
    },
    {
      "fieldName": "product",
      "displayName": "Product",
      "group": "product",
      "fieldType": "Product",
      "association": true
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "app",
        "description": "App"
    },
    {
        "group": "product",
        "description": "Product"
    }
  ],
  "listFields": {
    "title": "amount != null ? value.amount.toString() + ' ' + (value.product == null ? '' : value.product.title) + ' ' + (value.soldPrice == null ? '' : value.soldPrice.toString()) : '0'"
  }
}
