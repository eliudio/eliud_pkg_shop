/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pay_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_shop/model/pay_model.dart';

import 'dart:async';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef PayModelTrigger(List<PayModel> list);

abstract class PayRepository {
  Future<PayModel> add(PayModel value);
  Future<void> delete(PayModel value);
  Future<PayModel> get(String id);
  Future<PayModel> update(PayModel value);

  Stream<List<PayModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});
  Stream<List<PayModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});
  Future<List<PayModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});
  Future<List<PayModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel});

  StreamSubscription<List<PayModel>> listen(PayModelTrigger trigger, {String currentMember, String orderBy, bool descending, ReadCondition readCondition, int privilegeLevel});
  StreamSubscription<List<PayModel>> listenWithDetails(PayModelTrigger trigger, {String currentMember, String orderBy, bool descending, ReadCondition readCondition, int privilegeLevel});
  void flush();

  Future<void> deleteAll();
}


