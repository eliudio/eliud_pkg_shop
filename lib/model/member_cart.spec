{
  "id": "MemberCart",
  "isAppModel": false,
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
    "generateFirestoreRepository": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": false,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": false
  },
  "fields": [
    {
      "fieldName": "documentID",
      "remark": "User UUID",
      "displayName": "User UUID",
      "fieldType": "String",
      "iconName": "vpn_key"
    },
    {
      "fieldName": "items",
      "fieldType": "CartItem",
      "displayName": "Items",
      "arrayType": "Array"
    }
  ],
  "listFields": {
    "title": "documentID"
  }
}



