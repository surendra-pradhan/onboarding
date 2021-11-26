import 'package:flutter/material.dart';
import 'package:onboarding/screens/addownerscreen.dart';
import 'package:onboarding/screens/ownlist.dart';

class OwnerScreen extends StatelessWidget {
  static const routerName = '/ownerscreen';
  const OwnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Owner'),
      ),
      body: OwnerList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddOwnerScreen.routerName);
        },
      ),
    );
  }
}
