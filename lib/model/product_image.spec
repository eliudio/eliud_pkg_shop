{
  "id": "ProductImage",
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
    "subTitle": "value.documentID != null ? Center(child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().textStyle().text(context, value.documentID!)) : Container()"
  },
  "depends": ["eliud_core"]
}
