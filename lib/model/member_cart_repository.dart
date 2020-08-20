/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_cart_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'member_cart_model.dart';

typedef MemberCartModelTrigger(List<MemberCartModel> list);

abstract class MemberCartRepository {
  Future<MemberCartModel> add(MemberCartModel value);
  Future<void> delete(MemberCartModel value);
  Future<MemberCartModel> get(String id);
  Future<MemberCartModel> update(MemberCartModel value);
  Stream<List<MemberCartModel>> values();
  Stream<List<MemberCartModel>> valuesWithDetails();
  StreamSubscription<List<MemberCartModel>> listen(MemberCartModelTrigger trigger);
StreamSubscription<List<MemberCartModel>> listenWithDetails(MemberCartModelTrigger trigger);
  void flush();
  Future<List<MemberCartModel>> valuesList();
  Future<List<MemberCartModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


