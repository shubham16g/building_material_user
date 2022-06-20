import 'package:building_material_user/change_notifiers/bottom_nav_change_notifier.dart';
import 'package:building_material_user/models/demo_entity.dart';
import 'package:building_material_user/network/api_response.dart';
import 'package:building_material_user/network/service/api_service.dart';
import 'package:building_material_user/ui/components/bottom_nav.dart';
import 'package:building_material_user/ui/components/m3_appbar.dart';
import 'package:building_material_user/ui/components/utils.dart';
import 'package:building_material_user/ui/fragments/home_fragment.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: M3AppBar(
        title: Text(
          'MartX',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          if (!Responsive.isMobile(context))
            Container(
              width: 280,
              height: 42,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          if (!Responsive.isMobile(context))
            SizedBox(width: 7,),
          if (Responsive.isMobile(context))
            IconButton(
              splashRadius: 20,
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {},
            ),
          IconButton(
            splashRadius: 20,
            icon: const Icon(
              Icons.favorite,
            ),
            onPressed: () {},
          ),
          IconButton(
            splashRadius: 20,
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          ),
          if (!Responsive.isMobile(context))
            TextButton(onPressed: () {}, child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('Login'),
            ), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondaryContainer)),),
        ],
      ),
      body: Consumer<BottomNavViewModel>(
        builder: (context, model, child) {
          switch (model.currentIndex) {
            case 0:
              return HomeFragment();
            case 1:
              return _MainArea();
            default:
              return Center(
                child: Text('Not Found ${model.currentIndex}'),
              );
          }
        },
      ),
      bottomNavigationBar: Responsive.isMobile(context) ? BottomNav(onChange: (int index) {
        context.read<BottomNavViewModel>().currentIndex = index;
      }) : null,
    );
  }
}

class _MainArea extends StatelessWidget {
  const _MainArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final apiService = context.read<ApiService>();
    return Scaffold(
      body: FutureBuilder<ApiResponse<DemoEntity>>(
        future: apiService.getDemoList(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null && snapshot.data!.isSuccessful) {
            final demoEntity = snapshot.data!.data!;
            final data = demoEntity.data;

            final controller = ScrollController();
            return ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                }
              ),
              child: ListView.builder(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return ListTile(
                    title: Text(item.name ?? "NO NAME"),
                    subtitle: Text(item.pantoneValue),
                    onTap: () {

                    },
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData){
            final apiResponse = snapshot.data;
            return Center(child: Text(apiResponse?.errorMessage ?? "Null Api Response"),);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),

      bottomNavigationBar: Responsive.isMobile(context)
          ? Container(
              color: Colors.greenAccent,
              height: 60,
            )
          : null,
    );
  }
}
