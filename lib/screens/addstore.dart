import 'package:flutter/material.dart';

import 'package:onboarding/widgets/ownerdropdownlist.dart';
import 'package:onboarding/widgets/storeinchargedropdown.dart';

class AddStore extends StatefulWidget {
  static const routerName = '/addStore';
  const AddStore({Key? key}) : super(key: key);

  @override
  _AddStoreState createState() => _AddStoreState();
}

class _AddStoreState extends State<AddStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Store'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Store Name'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Email'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Phone'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Regd. No.'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('GST ID'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            OwnerDropDown(
              getOwnerId: (val) => {print('......$val')},
            ),
            const SizedBox(
              height: 10,
            ),
            const StoreIncharegeDropDown()
          ],
        )),
      ),
    );
  }
}
