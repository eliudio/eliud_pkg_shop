{
  "id": "ProductImage",
  "packageName": "eliud_pkg_shop",
  "packageFriendlyName": "shop",
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
      "required": true,
      "displayName": "Document ID",
      "fieldType": "String",
      "group": "general",
      "defaultValue": "IDENTIFIER",
      "iconName": "vpn_key",
      "hidden": true
    },
    {
      "fieldName": "image",
      "displayName": "Image",
      "fieldType": "PlatformMedium",
      "association": true,
      "optional": false,
      "group": "Image"
    }
  ],
  "listFields": {
    "title": "ImageHelper.getImageFromPlatformModel(platformMediumModel: value.image!, width: fullScreenWidth(context))",
    "subTitle": "Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID))"
  },
  "depends": ["eliud_core"]
}
