/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 order_item_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_pkg_shop/model/model_export.dart';

@immutable
abstract class OrderItemFormEvent extends Equatable {
  const OrderItemFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewOrderItemFormEvent extends OrderItemFormEvent {}

class InitialiseOrderItemFormEvent extends OrderItemFormEvent {
  final OrderItemModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseOrderItemFormEvent({this.value});
}

class InitialiseOrderItemFormNoLoadEvent extends OrderItemFormEvent {
  final OrderItemModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseOrderItemFormNoLoadEvent({this.value});
}

class ChangedOrderItemDocumentID extends OrderItemFormEvent {
  final String? value;

  ChangedOrderItemDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedOrderItemDocumentID{ value: $value }';
}

class ChangedOrderItemAmount extends OrderItemFormEvent {
  final String? value;

  ChangedOrderItemAmount({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedOrderItemAmount{ value: $value }';
}

class ChangedOrderItemAppId extends OrderItemFormEvent {
  final String? value;

  ChangedOrderItemAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedOrderItemAppId{ value: $value }';
}

class ChangedOrderItemSoldPrice extends OrderItemFormEvent {
  final String? value;

  ChangedOrderItemSoldPrice({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedOrderItemSoldPrice{ value: $value }';
}

class ChangedOrderItemProduct extends OrderItemFormEvent {
  final String? value;

  ChangedOrderItemProduct({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedOrderItemProduct{ value: $value }';
}
