
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vamSearchBgColor,
      // extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(145),
        child: searchAppbar(textController),
      ),
      body: SearchListWidget(),
    );
  }
}
