/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_overview_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
// import the main classes
import 'package:eliud_model/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_model/model/abstract_repository_singleton.dart';
import 'package:eliud_model/model/repository_export.dart';
import 'package:eliud_model/model/model_export.dart';
import 'package:eliud_model/shared/action_model.dart';
import 'package:eliud_model/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import '../model/model_export.dart';
import '../model/entity_export.dart';


@immutable
abstract class OrderOverviewFormEvent extends Equatable {
  const OrderOverviewFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewOrderOverviewFormEvent extends OrderOverviewFormEvent {
}


class InitialiseOrderOverviewFormEvent extends OrderOverviewFormEvent {
  final OrderOverviewModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseOrderOverviewFormEvent({this.value});
}

class InitialiseOrderOverviewFormNoLoadEvent extends OrderOverviewFormEvent {
  final OrderOverviewModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseOrderOverviewFormNoLoadEvent({this.value});
}

class ChangedOrderOverviewDocumentID extends OrderOverviewFormEvent {
  final String value;

  ChangedOrderOverviewDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderOverviewDocumentID{ value: $value }';
}

class ChangedOrderOverviewAppId extends OrderOverviewFormEvent {
  final String value;

  ChangedOrderOverviewAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderOverviewAppId{ value: $value }';
}

class ChangedOrderOverviewTitle extends OrderOverviewFormEvent {
  final String value;

  ChangedOrderOverviewTitle({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderOverviewTitle{ value: $value }';
}

class ChangedOrderOverviewShop extends OrderOverviewFormEvent {
  final String value;

  ChangedOrderOverviewShop({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderOverviewShop{ value: $value }';
}

class ChangedOrderOverviewItemImageBackground extends OrderOverviewFormEvent {
  final String value;

  ChangedOrderOverviewItemImageBackground({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderOverviewItemImageBackground{ value: $value }';
}

class ChangedOrderOverviewItemDetailBackground extends OrderOverviewFormEvent {
  final String value;

  ChangedOrderOverviewItemDetailBackground({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedOrderOverviewItemDetailBackground{ value: $value }';
}

