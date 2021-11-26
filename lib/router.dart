import 'package:flutter/material.dart';
import 'package:onboarding/screens/addownerscreen.dart';
import 'package:onboarding/screens/addstore.dart';
import 'package:onboarding/screens/addstoreicharge.dart';
import 'package:onboarding/screens/ownscreen.dart';
import 'package:onboarding/screens/store_screen.dart';
import 'package:onboarding/screens/storeinchargescreen.dart';

final Map<String, WidgetBuilder> routes = {
  StoreScreen.routerName: (ctx) => const StoreScreen(),
  OwnerScreen.routerName: (ctx) => const OwnerScreen(),
  AddOwnerScreen.routerName: (ctx) => const AddOwnerScreen(),
  StoreInchargeScren.routername: (ctx) => const StoreInchargeScren(),
  AddStoreIncharge.routerName: (ctx) => const AddStoreIncharge(),
  AddStore.routerName: (ctx) => const AddStore()
};
