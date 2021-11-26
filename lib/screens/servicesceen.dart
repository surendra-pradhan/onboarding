import 'package:flutter/material.dart';
import 'package:onboarding/providers/authprovider.dart';
import 'package:onboarding/screens/ownscreen.dart';
import 'package:onboarding/screens/store_screen.dart';
import 'package:onboarding/screens/storeinchargescreen.dart';
import 'package:onboarding/widgets/servicecard.dart';
import 'package:provider/provider.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          ServiceCard(
            title: 'Owners',
            count: '15',
            icons: 'assets/images/owner.svg',
            routename: OwnerScreen.routerName,
          ),
          ServiceCard(
            title: 'Store Incharge',
            count: '15',
            icons: 'assets/images/store.svg',
            routename: StoreInchargeScren.routername,
          ),
          ServiceCard(
            title: 'Store',
            count: '15',
            icons: 'assets/images/owner.svg',
            routename: StoreScreen.routerName,
          ),
        ],
      ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Authprovider>(context, listen: false).logout();
        },
      ),
    );
  }
}
