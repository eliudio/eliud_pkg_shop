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
  Stream<List<PayConfirmationModel>> values({String orderBy, bool descending });
  Stream<List<PayConfirmationModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<PayConfirmationModel>> valuesList({String orderBy, bool descending });
  Future<List<PayConfirmationModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<PayConfirmationModel>> listen(PayConfirmationModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<PayConfirmationModel>> listenWithDetails(PayConfirmationModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


