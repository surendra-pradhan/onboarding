import 'package:flutter/material.dart';
import 'package:onboarding/providers/dataprovider.dart';
import 'package:provider/provider.dart';

class StoreList extends StatelessWidget {
  const StoreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            Provider.of<DataProvider>(context, listen: false).getStoreData(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const CircularProgressIndicator()
                : Consumer<DataProvider>(
                    builder: (contxt, data, _) => ListView.builder(
                        itemCount: data.storedata.length,
                        itemBuilder: (ctx, index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(data.storedata[index]['address']),
                                ),
                              ),
                            )),
                  ));
  }
}
