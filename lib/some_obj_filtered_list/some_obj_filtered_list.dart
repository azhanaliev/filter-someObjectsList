import 'package:filter_objects/some_obj_filtered_list/some_obj_filtered_list_provider.dart';
import 'package:filter_objects/some_obj_filtered_list/widgets/filter.dart';
import 'package:filter_objects/some_obj_filtered_list/widgets/some_obj_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SomeObjFilteredList extends StatelessWidget {
  final String title;

  SomeObjFilteredList({
    required this.title,
    Key? key,
  }) : super(key: key);

  final List<SomeObject> someList = [
    SomeObject(Weeks.FRI, 'unlikely', 1, DateTime(2001, 1, 1)),
    SomeObject(Weeks.FRI, 'supply', 2, DateTime(2002, 1, 1)),
    SomeObject(Weeks.FRI, 'only', 3, DateTime(2003, 1, 1)),
    SomeObject(Weeks.FRI, 'lovely', 4, DateTime(2004, 1, 1)),
    SomeObject(Weeks.FRI, 'likely', 5, DateTime(2005, 1, 1)),
    SomeObject(Weeks.FRI, 'family', 6, DateTime(2006, 1, 1)),
    SomeObject(Weeks.FRI, 'early', 7, DateTime(2007, 1, 1)),
    SomeObject(Weeks.FRI, 'daily', 8, DateTime(2008, 1, 1)),
    SomeObject(Weeks.FRI, 'apply', 9, DateTime(2009, 1, 1)),
    SomeObject(Weeks.FRI, 'apple', 10, DateTime(2010, 1, 1)),
    SomeObject(Weeks.FRI, 'cucumber', 11, DateTime(2011, 1, 1)),
    SomeObject(Weeks.FRI, 'carrot', 12, DateTime(2012, 1, 1)),
    SomeObject(Weeks.MON, 'carsdfgrot', 13, DateTime(2012, 1, 1)),
    SomeObject(Weeks.MON, 'csdfgsdfarrot', 14, DateTime(2012, 1, 1)),
    SomeObject(Weeks.MON, 'cxvbarrot', 15, DateTime(2012, 1, 1)),
    SomeObject(Weeks.MON, 'c;a;arrot', 17, DateTime(2012, 1, 1)),
    SomeObject(Weeks.MON, 'c[eebarrot', 28, DateTime(2012, 1, 1)),
    SomeObject(Weeks.MON, 'csdfb;earrot', 14, DateTime(2012, 1, 1)),
    SomeObject(Weeks.MON, 'carsdlkbrtrot', 346, DateTime(2012, 1, 1)),
    SomeObject(Weeks.MON, 'casdf,./g,rrot', 455, DateTime(2012, 1, 1)),
    SomeObject(Weeks.MON, 'carafwefasfrot', 1222, DateTime(2012, 1, 1)),
    SomeObject(Weeks.MON, 'a;lmg;kher', 222, DateTime(2012, 1, 1)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => SomeObjFilteredListProvider(
              someList: someList,
            ),
          ),
        ],
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Filter(),
                SomeObjList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
