{
  "id": "Pay",
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
      "fieldName": "description",
      "displayName": "Description",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "succeeded",
      "fieldType": "Action",
      "bespokeFormField": "ActionField(widget.app, state.value!.succeeded, _onSucceededChanged)",
      "group": "succeeded"
    },
    {
      "fieldName": "payAction",
      "fieldType": "Action",
      "bespokeFormField": "ActionField(widget.app, state.value!.payAction, _onPayActionChanged)",
      "group": "payAction",
      "remark": "requires a new implementation of a BespokeFormField WorkflowActionField",
      "hidden": true
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
        "group": "succeeded",
        "description": "Succeeded Action"
    },
    {
        "group": "payAction",
        "description": "Pay Action"
    },
    {
        "group": "shop",
        "description": "Shop"
    },
    {
        "group": "conditions",
        "description": "Conditions"
    }
  ],
  "listFields": {
    "title": "value.description != null ? Center(child: text(app, context, value.description!)) : value.documentID != null ? Center(child: text(app, context, value.documentID!)) : Container()"
  },
  "depends": ["eliud_core"]
}
