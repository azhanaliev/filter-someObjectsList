import 'package:filter_objects/some_obj_filtered_list/some_obj_filtered_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SomeObjList extends StatelessWidget {
  const SomeObjList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _someObject =
        context.watch<SomeObjFilteredListProvider>().filteredObjects;
    return Selector<SomeObjFilteredListProvider, int?>(
      selector: (_, provider) => provider.filteredObjects.length,
      builder: (_, length, __) {
        return Expanded(
          child: ListView.builder(
            itemCount: length,
            itemBuilder: (_, index) {
              return ListTile(
                leading: Text(
                  _someObject[index].someEnum.toString(),
                ),
                title: Text(
                  _someObject[index].someString,
                ),
                subtitle: Text(
                  _someObject[index].someInt.toString(),
                ),
                trailing: Text(
                  _someObject[index].someDate.toString(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
