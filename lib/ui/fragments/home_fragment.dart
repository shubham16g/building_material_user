

import 'package:building_material_user/ui/components/slide_show.dart';
import 'package:building_material_user/ui/components/utils.dart';
import 'package:flutter/material.dart';

import '../../routes/routes.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 20),
        SlideShow(aspectRatio: Responsive.isDesktop(context) ? 4 : 3,
            items: ['Slide 1', 'Slide 2', 'Slide 3'].map((e) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
              child: Center(
                child: Text(e, style: TextStyle(fontSize: 30),),
              ),
            )).toList()),
        SizedBox(height: 20),

        Center(
          child: TextButton(onPressed: (){
            Navigator.pushNamed(context, Routes.productsPage);
          }, child: Text('Products'),),
        ),
      ],
    );
  }
}
