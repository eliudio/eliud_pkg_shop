{
  "id": "OrderReferences",
  "packageName": "eliud_pkg_shop",
  "isAppModel": true,
  "generate": {
    "generateComponent": false,
    "generateRepository": false,
    "generateCache": false,
	"hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": false,
    "generateList": false,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": false,
    "documentSubCollectionOf": "app"
  },
  "fields": [
    {
      "fieldName": "paymentReference",
      "displayName": "Payment Reference",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "shipmentReference",
      "displayName": "Shipment Reference",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "deliveryReference",
      "displayName": "Dilvery Reference",
      "fieldType": "String",
      "group": "general"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    }
  ]
}
