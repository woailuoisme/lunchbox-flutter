import 'package:freezed_annotation/freezed_annotation.dart';
import '../entities/cart_item_model.dart';

part 'cart_state.freezed.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    @Default([]) List<CartItemModel> cartItems,
    @Default(false) bool isLoading,
  }) = _CartState;
  const CartState._();

  double get totalAmount =>
      cartItems.fold(0, (total, item) => total + item.totalPrice);

  int get totalQuantity =>
      cartItems.fold(0, (count, item) => count + item.quantity);

  bool get isEmpty => cartItems.isEmpty;
}
