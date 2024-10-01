import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/weidget/custom)button.dart';
import 'package:store_app/weidget/custom_textfeild.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = "update product";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? title, desc, image;

  String? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel Productt =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Update Product",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextfield(
                    onchange: (data) {
                      title = data;
                    },
                    text: 'Product Name'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                    onchange: (data) {
                      desc = data;
                    },
                    text: 'descrabtion'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                    onchange: (data) {
                      price = data;
                    },
                    inputType: TextInputType.number,
                    text: 'price'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                    onchange: (data) {
                      image = data;
                    },
                    text: 'image'),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: "Update",
                  ontap: ()async {
                    isLoading = true;
                    setState(() {});
                    try {
                    await  updateProductMethod(Productt);
                      print("success");
                    }catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

Future<void> updateProductMethod(ProductModel Productt)async {
   await UpdateProductServices().updateProduct(
     id: Productt.id,
        title: title == null ? Productt.title: title! ,
        price: price == null ? Productt.price : price!,
        desc: desc == null ? Productt.description: desc!,
        image: image == null ? Productt.image : image!,
        category: Productt.category);
  }
}
