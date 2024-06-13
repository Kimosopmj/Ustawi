
import 'package:flutter/material.dart';

class MoodJournalBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          
    // Code for Product Detail screen body
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Image.asset('path_to_product_image'),
        SizedBox(height: 20),
        Text('Product Name'),
        SizedBox(height: 10),
        Text('Product Description'),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Handle add to cart button press
          },
          child: Text('Add to Cart'),
        ),
      ],
    )
  
        ],
      ),
    );
  }
}
    