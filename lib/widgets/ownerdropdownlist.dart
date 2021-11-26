import 'package:flutter/material.dart';
import 'package:onboarding/providers/dataprovider.dart';
import 'package:onboarding/themes/light_color.dart';
import 'package:provider/provider.dart';

class OwnerDropDown extends StatefulWidget {
  Function getOwnerId;
  OwnerDropDown({Key? key, required this.getOwnerId}) : super(key: key);

  @override
  _OwnerDropDownState createState() => _OwnerDropDownState();
}

class _OwnerDropDownState extends State<OwnerDropDown> {
  String dropdownValue = 'null';
  List DropDownList = [];
  bool isInit = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      List storeowner = Provider.of<DataProvider>(context).storeOwner;
      print('...........$storeowner');
      DropDownList = [...storeowner];
    }
    setState(() {
      isInit = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: LightColor.grey.withOpacity(.3))),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down_outlined),
        iconSize: 24,
        underline: const SizedBox(),
        style: const TextStyle(color: Colors.deepPurple),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
            widget.getOwnerId(dropdownValue);
          });
        },
        items: <Map>[
          {'username': 'Select Owner', 'userID': 'null'},
          ...DropDownList
        ].map<DropdownMenuItem<String>>((Map value) {
          return DropdownMenuItem<String>(
            value: value['userID'].toString(),
            child: Text(value['username']),
          );
        }).toList(),
      ),
    );
  }
}
