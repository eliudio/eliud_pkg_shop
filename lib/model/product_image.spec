{
  "id": "ProductImage",
  "packageName": "eliud_pkg_shop",
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
      "fieldName": "image",
      "displayName": "Image",
      "fieldType": "Image",
      "association": true,
      "optional": false,
      "group": "Image"
    }
  ],
  "listFields": {
    "title": "image",
    "imageTitle": true,
    "subTitle": "documentID"
  },
  "depends": ["eliud_core"]
}
