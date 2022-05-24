{
  "id": "OrderOverview",
  "packageName": "eliud_pkg_shop",
  "packageFriendlyName": "shop",
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
    "isExtension": true,
    "documentSubCollectionOf": "app"
  },
  "fields": [
    {
      "fieldName": "documentID",
      "required": true,
      "displayName": "Document ID",
      "group": "general",
      "fieldType": "String",
      "iconName": "vpn_key"
    },
    {
      "fieldName": "appId",
      "required": true,
      "displayName": "App ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "hidden": true,
      "group": "general"
    },
    {
      "fieldName": "description",
      "displayName": "Description",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "shop",
      "displayName": "Shop",
      "fieldType": "Shop",
      "association": true,
      "optional": false,
      "group": "shop"
    },
    {
      "fieldName": "itemImageBackground",
      "displayName": "Item Image Background",
      "fieldType": "Background",
      "optional": true,
      "group": "itemImageBackground"
    },
    {
      "fieldName": "itemDetailBackground",
      "displayName": "Item Detail Background",
      "fieldType": "Background",
      "optional": true,
      "group": "itemDetailBackground"
    },
    {
      "fieldName": "conditions",
      "displayName": "Conditions",
      "fieldType": "StorageConditions",
      "group": "conditions"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "shop",
        "description": "Shop"
    },
    {
        "group": "itemImageBackground",
        "description": "Item Image Background"
    },
    {
        "group": "itemDetailBackground",
        "description": "Item Detail Background"
    },
    {
        "group": "conditions",
        "description": "Conditions"
    }
  ],
  "listFields": {
    "title": "value.description != null ? Center(child: text(app, context, value.description!)) : value.documentID != null ? Center(child: text(app, context, value.documentID)) : Container()"
  },
  "depends": ["eliud_core"]
}
