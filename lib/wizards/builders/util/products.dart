import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_pkg_shop_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop_model/model/model_export.dart';

import 'product.dart';

class Products {
  final String uniqueId;
  final ShopModel shop;
  final AppModel app;
  final String memberId;

  Products(
      {required this.uniqueId,
      required this.shop,
      required this.app,
      required this.memberId});

  static String productId1 = 'gouldian_finch';
  static String productId2 = 'red_breasted_blackbird';
  static String productId3 = 'queen_of_the_night';
  static String productId4 = 'golden_oriole';
  static String productId5 = 'turquoise_kakariki';
  static String productId6 = 'amaryllis';
  static String productId7 = 'daisy';
  static String productId8 = 'anemone';
  static String productId9 = 'lily_of_the_nile';
  static String productId10 = 'blue_backed_manakin';
  static String productId11 = 'northern_cardinal';
  static String productId12 = 'eurasian_magpie';
  static String productId13 = 'myna';
  static String productId14 = 'parakeet';
  static String productId15 = 'kingbird';
  static String productId16 = 'grosbeak';

  Future<void> run() async {
    var theProducts = <Product>[
      // 1
      Product(
        id: productId1,
        title: 'Gouldian Finch',
        about:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.',
        assetLocation1:
            'packages/eliud_pkg_shop/assets/shop/products/gouldianfinch1.png',
        assetLocation2:
            'packages/eliud_pkg_shop/assets/shop/products/gouldianfinch2.png',
        price: 11,
      ),
/*
      // 2
      Product(
        id: productId2,
        title: 'Red Breasted Blackbird',
        about:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.',
        assetLocation1:
            'packages/eliud_pkg_shop/assets/shop/products/redbreastedblackbird1.png',
        assetLocation2:
            'packages/eliud_pkg_shop/assets/shop/products/redbreastedblackbird2.png',
        price: 11,
      ),
      // 3
      Product(
        id: productId3,
        title: 'Queen of the Night',
        about:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.',
        assetLocation1:
            'packages/eliud_pkg_shop/assets/shop/products/queenofthenight1.png',
        assetLocation2:
            'packages/eliud_pkg_shop/assets/shop/products/queenofthenight2.png',
        price: 11,
      ),
      // 4
      Product(
        id: productId4,
        title: 'Golden Oriole',
        about:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.',
        assetLocation1:
            'packages/eliud_pkg_shop/assets/shop/products/goldenoriole1.png',
        assetLocation2:
            'packages/eliud_pkg_shop/assets/shop/products/goldenoriole2.png',
        price: 11,
      ),
      // 5
      Product(
        id: productId5,
        title: 'Turquoise Kakariki',
        about:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.',
        assetLocation1:
            'packages/eliud_pkg_shop/assets/shop/products/turquoisekakariki1.png',
        assetLocation2:
            'packages/eliud_pkg_shop/assets/shop/products/turquoisekakariki2.png',
        price: 11,
      ),
      // 6
      Product(
        id: productId6,
        title: 'Amaryllis',
        about:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.',
        assetLocation1:
            'packages/eliud_pkg_shop/assets/shop/products/amaryllis1.png',
        assetLocation2:
            'packages/eliud_pkg_shop/assets/shop/products/amaryllis2.png',
        price: 11,
      ),
      // 7
      Product(
        id: productId7,
        title: 'Daisy',
        about:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.',
        assetLocation1:
            'packages/eliud_pkg_shop/assets/shop/products/daisy1.png',
        assetLocation2:
            'packages/eliud_pkg_shop/assets/shop/products/daisy2.png',
        price: 11,
      ),
      // 8
      Product(
        id: productId8,
        title: 'Anemone',
        about:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.',
        assetLocation1:
            'packages/eliud_pkg_shop/assets/shop/products/anemone1.png',
        assetLocation2:
            'packages/eliud_pkg_shop/assets/shop/products/anemone2.png',
        price: 11,
      ),
      // 9
      Product(
        id: productId9,
        title: 'Lily Of The Nile',
        about:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.',
        assetLocation1:
            'packages/eliud_pkg_shop/assets/shop/products/lilyofthenile1.png',
        assetLocation2:
            'packages/eliud_pkg_shop/assets/shop/products/lilyofthenile2.png',
        price: 11,
      ),
      // 10
      Product(
        id: productId10,
        title: 'Blue Backed Manakin',
        about:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.',
        assetLocation1:
            'packages/eliud_pkg_shop/assets/shop/products/bluebackedmanakin1.png',
        assetLocation2:
            'packages/eliud_pkg_shop/assets/shop/products/bluebackedmanakin2.png',
        price: 11,
      ),
      // 11
      Product(
        id: productId11,
        title: 'Northern Cardinal',
        about:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.',
        assetLocation1:
            'packages/eliud_pkg_shop/assets/shop/products/northerncardinal1.png',
        assetLocation2:
            'packages/eliud_pkg_shop/assets/shop/products/northerncardinal2.png',
        price: 11,
      ),
      // 12
      Product(
        id: productId12,
        title: 'Eurasian Magpie',
        about:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.',
        assetLocation1:
            'packages/eliud_pkg_shop/assets/shop/products/eurasianmagpie1.png',
        assetLocation2:
            'packages/eliud_pkg_shop/assets/shop/products/eurasianmagpie2.png',
        price: 11,
      ),
      // 13
      Product(
        id: productId13,
        title: 'Myna',
        about:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.',
        assetLocation1:
            'packages/eliud_pkg_shop/assets/shop/products/myna1.png',
        assetLocation2:
            'packages/eliud_pkg_shop/assets/shop/products/myna2.png',
        price: 11,
      ),
      // 14
      Product(
        id: productId14,
        title: 'Parakeet',
        about:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.',
        assetLocation1:
            'packages/eliud_pkg_shop/assets/shop/products/parakeet1.png',
        assetLocation2:
            'packages/eliud_pkg_shop/assets/shop/products/parakeet2.png',
        price: 11,
      ),
      // 15
      Product(
        id: productId15,
        title: 'Kingbird',
        about:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.',
        assetLocation1:
            'packages/eliud_pkg_shop/assets/shop/products/kingbird1.png',
        assetLocation2:
            'packages/eliud_pkg_shop/assets/shop/products/kingbird2.png',
        price: 11,
      ),
      // 16
      Product(
        id: productId16,
        title: 'Grosbeak',
        about:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.',
        assetLocation1:
            'packages/eliud_pkg_shop/assets/shop/products/grosbeak1.png',
        assetLocation2:
            'packages/eliud_pkg_shop/assets/shop/products/grosbeak2.png',
        price: 11,
      )
*/
    ];

    // for now, during tests, only support 2 products
    for (var i = 0; i < theProducts.length; i++) {
      var p = theProducts[i];
      await AbstractRepositorySingleton.singleton
          .productRepository(app.documentID)!
          .add(await productToProductModel(uniqueId, shop, app, memberId, p));
    }
  }
}
