import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartUninitialised extends CartState {
}

class CartInitialised extends CartState {
  final int timestamp;

  CartInitialised() : timestamp = new DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => [ timestamp ];
}

