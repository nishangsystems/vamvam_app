
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/data/model/response/schoolModel.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/providers/schoolsProvider.dart';
import 'package:vam_vam/screens/modules/search/search_list_widget.dart';
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/utils/imageResources.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController textController = TextEditingController();
  List<School> allSchools = [];
  List<School> filteredSchools = [];
  bool searching = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => _init());
  }

  _init() async {
    var provider = Provider.of<SchoolsProvider>(context, listen: false);
    await provider.getSchools();
    setState(() {
      allSchools = formattedSchools(provider.schools);
      filteredSchools = allSchools; // Initially, display all schools
    });
  }

  List<School> formattedSchools(List schools) {
    return schools.map((school) => School(
      id: school['id'],
      name: school['name'],
      location: null,
      color: 'grey',
      api_root: school['api_root'],
      logo_path: school['logo_path'],
    )).toList();
  }

  void _filterSchools(String query) {
    setState(() {
      searching = query.isNotEmpty;
      filteredSchools = allSchools.where((school) {
        return school.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
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
      body: Consumer3<SchoolsProvider, AuthProvider, RoleProvider>(
        builder: (context, provider, auth, role, child) {
          if (provider.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return SearchListWidget(
            schools: filteredSchools,
            searching: searching,
            searchTerm: textController.text,
            auth: auth,
            role: role
          );
        },
      ),
    );
  }

  Widget searchAppbar(textController) => AppBar(
    backgroundColor: primaryDark,
    excludeHeaderSemantics: true,
    clipBehavior: Clip.antiAlias,
    foregroundColor: white,
    centerTitle: true,
    flexibleSpace: Container(
      height: 240,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 30, bottom: 0, left: 16, right: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(40)
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child:Image.asset(
              ImageResources.logo,
              width: 50,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 25),
          TextField(
            controller: textController,
            onChanged: (value) {
              _filterSchools(value);
              print("searched input");
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: textColor2,
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: "Search a school",
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
            ),
          ),
        ],
      ),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40)
      ),
    ),
  );

}
