import 'package:flutter/material.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';

import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:onboarding/providers/dataprovider.dart';
import 'package:provider/provider.dart';

class StoreIncharegeDropDown extends StatefulWidget {
  const StoreIncharegeDropDown({Key? key}) : super(key: key);

  @override
  _StoreIncharegeDropDownState createState() => _StoreIncharegeDropDownState();
}

class _StoreIncharegeDropDownState extends State<StoreIncharegeDropDown> {
  List _incharge = [];

  var _items;
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final storeInchare = Provider.of<DataProvider>(context).storeIncharge;
      _incharge = [...storeInchare];
      print('$storeInchare');
      _items = _incharge
          .map((inc) => MultiSelectItem(inc, inc['username']))
          .toList();
    }
    setState(() {
      _isInit = false;
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  List _selectedAnimals2 = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(.1),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(.3),
          width: 2,
        ),
      ),
      child: Column(
        children: <Widget>[
          MultiSelectBottomSheetField(
            initialChildSize: 0.4,
            listType: MultiSelectListType.CHIP,
            searchable: true,
            buttonText: Text("Store Incharge"),
            title: Text("Store Incharge"),
            items: _items,
            onConfirm: (values) {
              _selectedAnimals2 = values;

              print(values[0]);
            },
            chipDisplay: MultiSelectChipDisplay(
              onTap: (value) {
                setState(() {
                  _selectedAnimals2.remove(value);
                });
              },
            ),
          ),
          _selectedAnimals2 == null || _selectedAnimals2.isEmpty
              ? Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "None selected",
                    style: TextStyle(color: Colors.black54),
                  ))
              : Container(),
        ],
      ),
    );
  }
}
