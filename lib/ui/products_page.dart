import 'package:building_material_user/ui/components/m3_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/routes.dart';

class CounterViewModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CounterViewModel>();
    return Scaffold(
      appBar: M3AppBar(
        title: const Text('Demo Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width ~/ 180,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              childAspectRatio: 0.6,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return ProductCard(
                imageUrl: 'https://picsum.photos/300/300?random=$index',
                onPressed: () {
                  Navigator.pushNamed(context, Routes.singleProductPage);
                },
              );
            }),
      ),
      bottomNavigationBar: Container(
        color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  filterList(context);
                },
                child: Row(
                  children: const [
                    Icon(Icons.sort),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Sorted By")
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: const [
                    Icon(Icons.account_tree_rounded),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Sorted By"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Function() onPressed;
  final String imageUrl;

  const ProductCard({Key? key, required this.onPressed, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Column(
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 200,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Brand Name",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 3),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Product Name",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        "\u{20B9} 500 ",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text("\u{20B9}600",
                          style: TextStyle(color: Colors.grey, fontSize: 13)),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: InkWell(
                      splashColor: Colors.red,
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.black,
                        size: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 3),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "GST T&C APPLY",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

filterList(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
           shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Newest")));
              },
              child: const Text('Newest'),
            ),
            SimpleDialogOption(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("A - Z")));
              },
              child: const Text('A - Z'),
            ),
            SimpleDialogOption(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Z - A")));
              },
              child: const Text('Z - A'),
            ),
            SimpleDialogOption(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Price : Low to High")));
              },
              child: const Text('Price : High to Low'),
            ),SimpleDialogOption(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Price : High to Low")));
              },
              child: const Text('Price : Low to High'),
            ),
          ],
        );
      });
}
