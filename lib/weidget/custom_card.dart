

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_page.dart';

class CustomCard extends StatelessWidget {
   CustomCard({super.key , required this.product});
  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
       Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Stack(
          clipBehavior: Clip.none,
          children: [Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 40,
                    spreadRadius: 0,
                    offset: Offset(10, 10))
              ],
            ),
            child:  Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     product.title.substring(0,6),
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$' '${product.price.toString()}' , style: const TextStyle(color: Colors.black),),
                        const Icon(Icons.favorite , color: Colors.red,)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
            Positioned(
              right: 32,
              top: -40,
              child: Image.network(
                product.image
                ,width: 100
                , height: 75,),),
          ]
      ),
    );
  }
}
