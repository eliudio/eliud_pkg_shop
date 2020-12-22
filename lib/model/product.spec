{
  "id": "Product",
  "packageName": "eliud_pkg_shop",
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
    "isDocumentCollection": true
  },
  "fields": [
    {
      "fieldName": "documentID",
      "displayName": "Document ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
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
      "displayName": "Title",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "about",
      "displayName": "About",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "price",
      "displayName": "Price",
      "fieldType": "double",
      "group": "general"
    },
    {
      "fieldName": "weight",
      "displayName": "Weight",
      "fieldType": "double",
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
      "fieldName": "images",
      "displayName": "Images",
      "group": "images",
      "fieldType": "ProductImage",
      "arrayType": "Array"
    },
    {
      "fieldName": "posSize",
      "fieldType": "PosSize",
      "group": "posSize",
      "optional": false,
      "association": true
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
        "group": "images",
        "description": "Images"
    },
    {
        "group": "posSize",
        "description": "Position and Size of images"
    }
 ],
  "listFields": {
    "title": "documentID",
    "subTitle": "title"
  },
  "depends": ["eliud_core"]
}