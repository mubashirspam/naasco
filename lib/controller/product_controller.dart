import 'dart:async';
import 'package:get/get.dart';
import 'package:naasco_mart/model/product.dart';
import 'package:naasco_mart/utlis/firebase.dart';

class ProducsController extends GetxController {
  static ProducsController instance = Get.find();
  RxList<ProductModel> products = RxList<ProductModel>([]);
  String collection = "products";

  @override
  onReady() {
    super.onReady();
    products.bindStream(getAllProducts());
  }

  Stream<List<ProductModel>> getAllProducts() => firebaseFirestore
      .collection(collection)
      .snapshots()
      .map((query) => query.docs
          .map(
            (item) => ProductModel.fromDocumentSnapshot(
              item
            ),
          )
          .toList());
}
