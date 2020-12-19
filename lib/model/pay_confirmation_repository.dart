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

import 'package:eliud_pkg_shop/model/pay_confirmation_model.dart';

import 'dart:async';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef PayConfirmationModelTrigger(List<PayConfirmationModel> list);

abstract class PayConfirmationRepository {
  Future<PayConfirmationModel> add(PayConfirmationModel value);
  Future<void> delete(PayConfirmationModel value);
  Future<PayConfirmationModel> get(String id);
  Future<PayConfirmationModel> update(PayConfirmationModel value);

  Stream<List<PayConfirmationModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});
  Stream<List<PayConfirmationModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});
  Future<List<PayConfirmationModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});
  Future<List<PayConfirmationModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});

  StreamSubscription<List<PayConfirmationModel>> listen(PayConfirmationModelTrigger trigger, {String currentMember, String orderBy, bool descending, ReadCondition readCondition, int privilegeLevel});
  StreamSubscription<List<PayConfirmationModel>> listenWithDetails(PayConfirmationModelTrigger trigger, {String currentMember, String orderBy, bool descending, ReadCondition readCondition, int privilegeLevel});
  void flush();

  Future<void> deleteAll();
}


