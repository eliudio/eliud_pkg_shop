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

import 'dart:async';
import 'package:eliud_pkg_shop/model/pay_confirmation_model.dart';

typedef PayConfirmationModelTrigger(List<PayConfirmationModel> list);

abstract class PayConfirmationRepository {
  Future<PayConfirmationModel> add(PayConfirmationModel value);
  Future<void> delete(PayConfirmationModel value);
  Future<PayConfirmationModel> get(String id);
  Future<PayConfirmationModel> update(PayConfirmationModel value);
  Stream<List<PayConfirmationModel>> values();
  Stream<List<PayConfirmationModel>> valuesWithDetails();
  StreamSubscription<List<PayConfirmationModel>> listen(PayConfirmationModelTrigger trigger);
StreamSubscription<List<PayConfirmationModel>> listenWithDetails(PayConfirmationModelTrigger trigger);
  void flush();
  Future<List<PayConfirmationModel>> valuesList();
  Future<List<PayConfirmationModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


