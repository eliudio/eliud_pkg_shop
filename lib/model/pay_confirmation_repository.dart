/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_confirmation_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_shop/model/pay_confirmation_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_shop/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_shop/model/entity_export.dart';


import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef PayConfirmationModelTrigger(List<PayConfirmationModel> list);
typedef PayConfirmationChanged(PayConfirmationModel value);

abstract class PayConfirmationRepository {
  Future<PayConfirmationModel> add(PayConfirmationModel value);
  Future<void> delete(PayConfirmationModel value);
  Future<PayConfirmationModel> get(String id);
  Future<PayConfirmationModel> update(PayConfirmationModel value);

  Stream<List<PayConfirmationModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery });
  Stream<List<PayConfirmationModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery });
  Future<List<PayConfirmationModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery });
  Future<List<PayConfirmationModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery });

  StreamSubscription<List<PayConfirmationModel>> listen(PayConfirmationModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel, EliudQuery eliudQuery });
  StreamSubscription<List<PayConfirmationModel>> listenWithDetails(PayConfirmationModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel, EliudQuery eliudQuery });
  StreamSubscription<PayConfirmationModel> listenTo(String documentId, PayConfirmationChanged changed);
  void flush();
  
  String timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);

  Future<void> deleteAll();
}


