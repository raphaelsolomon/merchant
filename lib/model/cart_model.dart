class CartModel {
  String? itemName;
  String? desc;
  int quantity;
  double? price;

  CartModel({this.itemName, this.desc, this.price, this.quantity = 1});

  void addQuantity() {
    this.quantity = this.quantity + 1;
  }

  void reduceQuantity() {
    if (this.quantity > 1) {
      this.quantity = this.quantity - 1;
    }
  }

  double get total => quantity * price!;
}
