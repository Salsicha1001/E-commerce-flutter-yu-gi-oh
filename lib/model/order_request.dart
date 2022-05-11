import 'package:flutter_ecommerce/model/cart_shopp.dart';

class OrderRequest {
  List<CartShopp> listOrders;
  int id_credCard;
  int id_user;

  OrderRequest({this.id_credCard,this.id_user,this.listOrders});
 
}
