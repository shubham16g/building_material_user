import 'package:flutter/material.dart';

import 'components/image_carousel.dart';

class SingleProductPage extends StatelessWidget {
  const SingleProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Name", textAlign: TextAlign.center),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // productImages(context)
                ImageCarousel(),
                /*Image.network(
                  'https://source.unsplash.com/random/300x200',
                  fit: BoxFit.cover,
                  height: 400,
                )*/
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            "50% Off",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            "In Stock",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Brand Name",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Product Name",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "\u{20B9} 500",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("\u{20B9} 600",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "GST T&C APPLY",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.grey,
                  height: 1,
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Features & Details",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: ['Dummy Text 1Dummy Text 1Dummy Text 1Dummy Text 1Dummy Text 1Dummy Text 1Dummy Text 1Dummy Text 1', 'Dummy Text 2', 'Dummy Text 3 ']
                        .map((e) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("\u2022"),
                                  const SizedBox(width: 10),
                                  Expanded(child: Text(e)),
                                  const SizedBox(height: 5),
                                ],
                              ),
                        ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Details",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                // ...[{"Brand": "AGL"}, {"Brand": "AGL"}],
                ...{"Brand": "AGL", "Some": "Value"}.entries.map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: Expanded(child: Text(e.key)),
                      ),
                      Expanded(child: Text(e.value)),
                    ],
                  ),
                )).toList(),
                /*Row(
                  children: const [
                    SizedBox(
                      width: 120,
                      child: Flexible(child: Text("Brand")),
                    ),
                    Flexible(child: Text("AGL")),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    SizedBox(
                      width: 120,
                      child: Flexible(child: Text("Tile Type")),
                    ),
                    Flexible(child: Text("Wall")),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    SizedBox(
                      width: 120,
                      child: Flexible(child: Text("Product Model")),
                    ),
                    Flexible(child: Text("SUPERBO ART NERO")),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    SizedBox(
                      width: 120,
                      child: Flexible(child: Text("Appearance")),
                    ),
                    Flexible(child: Text("Rich and Seamless Look")),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    SizedBox(
                      width: 120,
                      child: Flexible(child: Text("Resistant")),
                    ),
                    Flexible(child: Text("Scratch, Stain")),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    SizedBox(
                      width: 120,
                      child: Flexible(child: Text("Size")),
                    ),
                    Flexible(child: Text("600 * 300 mm")),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    SizedBox(
                      width: 120,
                      child: Flexible(child: Text("Weight")),
                    ),
                    Flexible(child: Text("16.5 Kgs")),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    SizedBox(
                      width: 120,
                      child: Flexible(child: Text("Thickness")),
                    ),
                    Flexible(child: Text("09 mm")),
                  ],
                )*/
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              surfaceTintColor: Colors.blueAccent,
              primary: Colors.greenAccent,
              onPrimary: Colors.greenAccent,
            ),
            // color: Colors.greenAccent,
            onPressed: () {},
            child: const Text(
              "ADD TO CART",
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
        ));
  }
}


void test(){
  final list1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final list2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  final list = [...list1, ...list2];
//  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
}