{
  "id": "Shop",
  "packageName": "eliud_pkg_shop",
  "packageFriendlyName": "shop",
  "isAppModel": true,
  "generate": {
    "generateComponent": false,
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
    "isExtension": false,
    "documentSubCollectionOf": "app"
  },
  "codeToCollectReferences": "    var products = await productRepository(appId: appId)!.valuesListWithDetails(eliudQuery: EliudQuery(theConditions: [\n      EliudQueryCondition('shopId', isEqualTo: documentID),\n    ]));\n    referencesCollector.addAll(products.map((product) => ModelReference(ProductModel.packageName, ProductModel.id, product!)));",
  "extraImports": {
    "model": "import 'package:eliud_core/tools/query/query_tools.dart';"
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
      "displayName": "description",
      "group": "general",
      "fieldType": "String",
      "iconName": "text_format"
    },
    {
      "fieldName": "shortDescription",
      "displayName": "Short Description",
      "group": "general",
      "fieldType": "String",
      "iconName": "text_format"
    },
    {
      "fieldName": "currency",
      "displayName": "Currency",
      "fieldType": "String",
      "group": "general"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    }
  ],
  "listFields": {
    "title": "value.documentID != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID)) : Container()",
    "subTitle": "value.description != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.description!)) : Container()"
  }
}