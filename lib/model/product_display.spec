{
  "id": "ProductDisplay",
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
      "fieldName": "itemDetailBackground",
      "displayName": "Item Detail Background",
      "fieldType": "Background",
      "optional": true,
      "group": "itemDetailBackground"
    },
    {
      "fieldName": "addToBasketText",
      "displayName": "Add to basket text",
      "group": "general",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "buyAction",
      "fieldType": "Action",
      "bespokeFormField": "ActionField(widget.app, state.value!.buyAction, _onBuyActionChanged)",
      "group": "action"
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
      "fieldName": "background",
      "displayName": "Background",
      "fieldType": "Background",
      "optional": true,
      "group": "background"
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
        "group": "conditions",
        "description": "Conditions"
    }
  ],
  "listFields": {
    "title": "value.description != null ? Center(child: text(app, context, value.description!)) : Center(child: text(app, context, value.documentID))"
  },
  "depends": ["eliud_core"]
}
