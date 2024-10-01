import '../helper/api.dart';
import '../models/product_model.dart';

class UpdateProductServices{
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String desc,
    required String image ,
    required String category,
    required dynamic id ,
  })async{
    print('id = $id');
    Map<String,dynamic> data = await Api().put(url:"https://fakestoreapi.com/products/$id", body:{
      "title": title,
      "price": price,
      "description": desc,
      "image": image,
      "category": category,
    });
    return ProductModel.fromJson(data);
  }
}