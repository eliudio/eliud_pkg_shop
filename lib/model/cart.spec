{
  "id": "Cart",
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
      "fieldName": "title",
      "displayName": "title",
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
      "fieldName": "checkoutAction",
      "fieldType": "Action",
      "bespokeFormField": "ActionField(widget.app, state.value!.checkoutAction, _onCheckoutActionChanged)",
      "group": "checkoutAction"
    },
    {
      "fieldName": "backToShopAction",
      "fieldType": "Action",
      "bespokeFormField": "ActionField(widget.app, state.value!.backToShopAction, _onBackToShopActionChanged)",
      "group": "backToShopAction"
    },
    {
      "fieldName": "openProductAction",
      "fieldType": "Action",
      "bespokeFormField": "ActionField(widget.app, state.value!.openProductAction, _onOpenProductActionChanged)",
      "group": "openProductAction"
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
