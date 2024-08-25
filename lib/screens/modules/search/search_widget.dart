
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/data/model/response/schoolModel.dart';
import 'package:vam_vam/providers/schoolsProvider.dart';
import 'package:vam_vam/screens/modules/search/search_list_widget.dart';
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/widgets/commonWidgets/commonWidgets.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController textController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _init());
  }

  _init() {
    Provider.of<SchoolsProvider>(context, listen: false).getSchools();
  }

  List formattedSchools(schools) {
    List allSchools = [];

    for (var school in schools) {
      allSchools.add(School(
        name: school['name'],
        location: null,
        color: 'grey',
        api_root: school['api_root'],
        logo_path: school['logo_path'],
      ));
    }

    return allSchools;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vamSearchBgColor,
      extendBodyBehindAppBar: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(145),
        child: searchAppbar(textController),
      ),
      body: Consumer<SchoolsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return SearchListWidget(schools: formattedSchools(provider.schools), searching: false,);
        },
      ),
    );
  }
}
