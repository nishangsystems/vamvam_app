
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/data/model/response/schoolModel.dart';
import 'package:vam_vam/providers/HomeProvider.dart';
import 'package:vam_vam/providers/bannerProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/providers/schoolsProvider.dart';
import 'package:vam_vam/screens/modules/home/featured_schools_widget.dart';
import 'package:vam_vam/screens/modules/home/previous_schools_widget.dart';
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/utils/imageResources.dart';
import 'package:vam_vam/widgets/commonWidgets/commonWidgets.dart';
import 'package:vam_vam/widgets/commonWidgets/sliderWidget.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> with WidgetsBindingObserver {
  double carouselIndex = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Future.microtask(() => _init());
  }

  _init() {
    var banner = Provider.of<BannerProvider>(context, listen: false);
    var home = Provider.of<HomeProvider>(context, listen: false);
    var role = Provider.of<RoleProvider>(context, listen: false);
    var school = Provider.of<SchoolsProvider>(context, listen: false);
    // var profile = Provider.of<ProfileProvider>(context, listen: false);

    home.startLoader(true);
    school.getSchools();
    banner
        .getBanner(role.roleType, context)
        .then((value) => home.startLoader(false));

    // setState(() {});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Future.microtask(() => _init());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(appBarHeight),
            child: indexAppbar(context),
        ),
        body: Consumer3<SchoolsProvider, AuthProvider, RoleProvider> (
          builder: (context, data, auth, role, child) {
            if (data.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            print("auth data: $auth");

            print("auth login status: ${
              auth.isLoggedIn()
            }");

            print("schools data: ${data.schools}");

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 145,
                  ),
                  indexSliderSection,
                  PreviousSchoolsWidget(),
                  FeaturedSchoolsWidget(schools: data.schools, auth: auth, role: role)
                ],
              ),
            );
          }
        )
    );
  }
}