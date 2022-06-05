
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
      appBar: AppBar(
        title: const Text('Product Page'),
      ),
      body: Center(
        child: TextButton(child: Text('${vm.count}'), onPressed: (){
          vm.increment();
        },),
      ),
    );
  }
}