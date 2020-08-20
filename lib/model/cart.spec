{
  "id": "Cart",
  "isAppModel": true,
  "generate": {
    "generateComponent": true,
    "generateRepository": true,
    "generateCache": true,
    "generateFirestoreRepository": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": true,
    "generateEmbeddedComponent": false,
    "isExtension": true
  },
  "fields": [
    {
      "fieldName": "documentID",
      "displayName": "Document ID",
      "group": "general",
      "fieldType": "String",
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
      "fieldName": "title",
      "displayName": "description",
      "group": "general",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "description",
      "displayName": "description",
      "group": "general",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "checkoutText",
      "displayName": "Checkout text",
      "group": "general",
      "fieldType": "String",
      "iconName": "text_format",
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
      "association": true,
      "optional": true,
      "group": "itemImageBackground"
    },
    {
      "fieldName": "itemDetailBackground",
      "displayName": "Item Detail Background",
      "fieldType": "Background",
      "association": true,
      "optional": true,
      "group": "itemDetailBackground"
    },
    {
      "fieldName": "checkoutAction",
      "fieldType": "Action",
      "bespokeFormField": "ActionField",
      "group": "checkoutAction"
    },
    {
      "fieldName": "backToShopAction",
      "fieldType": "Action",
      "bespokeFormField": "ActionField",
      "group": "backToShopAction"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "checkoutAction",
        "description": "Checkout Action"
    },
    {
        "group": "backToShopAction",
        "description": "Continue Shopping Action"
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
        "group": "checkoutAction",
        "description": "Checkout Action"
    }
  ],
  "listFields": {
    "title": "documentID",
    "subTitle": "description"
  }
}
