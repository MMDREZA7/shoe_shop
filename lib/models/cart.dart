import 'package:flutter/material.dart';
import 'package:shoes_shop/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sele
  List<Shoe> shoesShop = [
    Shoe(
      name: 'Air Force WB',
      price: '240',
      imagePath: 'images/air_force_WB.png',
      description: 'cool shoe with a lot of features and a lot of colors',
    ),
    Shoe(
      name: 'Air Max Plus',
      price: '110',
      imagePath: 'images/air_max_plus.png',
      description: 'air max is very cool and buatyful shoe',
    ),
    Shoe(
      name: 'Dunk Low Retro',
      price: '320',
      imagePath: 'images/dunk_low_retro.png',
      description: 'the excellents of our shoes',
    ),
    Shoe(
      name: 'Air Jordan',
      price: '260',
      imagePath: 'images/air_jordan_mid.png',
      description: 'the air jordan is very Elegant and durable',
    ),
  ];

  // list of items in user cart
  List<Shoe> userCart = [];

  // get list or shoes for sele
  List<Shoe> getShoesList() {
    return shoesShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add item to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
