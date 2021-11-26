import 'package:flutter/material.dart';
import 'package:onboarding/screens/addstoreicharge.dart';
import 'package:onboarding/screens/storeinchargeList.dart';

class StoreInchargeScren extends StatelessWidget {
  static const routername = '/storeIncharge';

  const StoreInchargeScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Incharge Screen'),
      ),
      body: const StoreInchargeList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddStoreIncharge.routerName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
