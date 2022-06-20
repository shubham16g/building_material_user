import 'package:building_material_user/routes/routes.dart';
import 'package:flutter/material.dart';

import 'components/m3_appbar.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: M3AppBar(title: Text("Categories"),),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(
          // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width ~/ 120,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: .8,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return CatCard(
                imageUrl: 'https://picsum.photos/300/300?random=$index',
                onPressed: () {
                  Navigator.pushNamed(context, Routes.subCategories);
                }, title: 'Civil Supplies',
              );
            }),
      ),
    );

  }
}

class CatCard extends StatelessWidget {
  final Function() onPressed;
  final String imageUrl;
  final String title;
  const CatCard({Key? key ,required this.imageUrl,required this.onPressed, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
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
              ),
              SizedBox(height: 8,),
              Text(title)
            ],
          )
      ),
    );
  }
}
