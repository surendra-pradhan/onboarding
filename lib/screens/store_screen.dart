import 'package:flutter/material.dart';
import 'package:onboarding/providers/dataprovider.dart';
import 'package:onboarding/screens/addstore.dart';
import 'package:onboarding/screens/storelist.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatelessWidget {
  static const routerName = 'storeScreen';

  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<DataProvider>(context, listen: false).getowner('owner');
    Provider.of<DataProvider>(context, listen: false)
        .getStoreIncharge('storeincharge');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store'),
      ),
      body: const StoreList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddStore.routerName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
