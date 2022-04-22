

class ProductModel {
  String? id;
 String? name;
 String? nameInMalayam;
 double? price;
 String ?imgUrl;
 bool? isStock;
 bool? isRecommended;

  ProductModel({
     this.id,
     this.imgUrl,
     this.isRecommended,
     this.isStock,
     this.name,
     this.nameInMalayam,
     this.price,
  });

  ProductModel.fromDocumentSnapshot(
      Map<String, dynamic> data) {
    
    id=data["id"];
    name = data["name"];
    nameInMalayam = data["nameInMalayam"];
    price = data["price"];
    imgUrl = data['imgUrl'];
    isRecommended = data['isRecommended'];
    isStock = data['isStock'];
  }

  static fromMap(Map<String, dynamic> data) {}
}
