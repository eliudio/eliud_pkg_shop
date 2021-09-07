{
  "id": "OrderItem",
  "packageName": "eliud_pkg_shop",
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
	"hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
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
    "title": "value!.amount != null ? Center(child: StyleRegistry.registry().styleWithContext(context).adminListStyle().listItem(context, value!.amount.toString() + ' ' + (value!.product == null ? '' : value!.product!.title!) + ' ' + (value!.soldPrice == null ? '' : value!.soldPrice!.toString()))) : Text('0')"
  }
}
