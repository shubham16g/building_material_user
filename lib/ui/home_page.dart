import 'package:building_material_user/ui/compontents/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive.isMobile(context)
          ? const _MainArea()
          : Row(
              children: const [
                _SideMenu(),
                Expanded(child: _MainArea()),
              ],
            ),
    );
  }
}

class _SideMenu extends StatelessWidget {
  const _SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.isTablet(context) ? 60 : 250,
      color: Colors.greenAccent,
    );
  }
}

class _MainArea extends StatelessWidget {
  const _MainArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Home Page'),
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
