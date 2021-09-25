import 'package:filter_objects/some_obj_filtered_list/some_obj_filtered_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class Filter extends StatelessWidget {
  const Filter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 30,
            child: TextFormField(
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: 'enter enum',
              ),
              onChanged: (value) {
                context.read<SomeObjFilteredListProvider>().someEnum = value;
                context.read<SomeObjFilteredListProvider>().filterList();
              },
            ),
          ),
          Container(
            height: 30,
            child: TextFormField(
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: 'enter string',
              ),
              onChanged: (value) {
                context.read<SomeObjFilteredListProvider>().someString = value;
                context.read<SomeObjFilteredListProvider>().filterList();
              },
            ),
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                  height: 30,
                  child: TextFormField(
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'date from',
                    ),
                    inputFormatters: [
                      MaskTextInputFormatter(mask: "##/##/####")
                    ],
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.length == 10) {
                        int year = int.parse(value.substring(6));
                        int month = int.parse(value.substring(3, 5));
                        int day = int.parse(value.substring(0, 2));
                        context.read<SomeObjFilteredListProvider>().dateFrom =
                            DateTime(year, month, day);
                      } else {
                        context.read<SomeObjFilteredListProvider>().dateFrom =
                            null;
                      }
                      context.read<SomeObjFilteredListProvider>().filterList();
                    },
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  height: 30,
                  child: TextFormField(
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'date to',
                    ),
                    inputFormatters: [
                      MaskTextInputFormatter(mask: "##/##/####")
                    ],
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.length == 10) {
                        int year = int.parse(value.substring(6));
                        int month = int.parse(value.substring(3, 5));
                        int day = int.parse(value.substring(0, 2));
                        context.read<SomeObjFilteredListProvider>().dateTo =
                            DateTime(year, month, day);
                      } else {
                        context.read<SomeObjFilteredListProvider>().dateTo =
                            null;
                      }
                      context.read<SomeObjFilteredListProvider>().filterList();
                    },
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                  height: 30,
                  child: TextFormField(
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'int from',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      context.read<SomeObjFilteredListProvider>().intFrom =
                          int.tryParse(value);
                      context.read<SomeObjFilteredListProvider>().filterList();
                    },
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  height: 30,
                  child: TextFormField(
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'int to',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      context.read<SomeObjFilteredListProvider>().intTo =
                          int.tryParse(value);
                      context.read<SomeObjFilteredListProvider>().filterList();
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
