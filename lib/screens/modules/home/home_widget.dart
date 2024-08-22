
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/HomeProvider.dart';
import 'package:vam_vam/providers/bannerProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
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

class _IndexState extends State<Index> {
  double carouselIndex = 0.0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => _init());
  }

  _init() {
    var banner = Provider.of<BannerProvider>(context, listen: false);
    var home = Provider.of<HomeProvider>(context, listen: false);
    var role = Provider.of<RoleProvider>(context, listen: false);
    // var profile = Provider.of<ProfileProvider>(context, listen: false);
    // var register = Provider.of<RegisterProvider>(context, listen: false);
    // var auth = Provider.of<AuthProvider>(context, listen: false);
    // profile
    //     .getProfile(auth.getUserId(), register, role.roleType, context,
    //         isFirst: 'first_time')
    //     .then((value) {
    //   Future.delayed(Duration(seconds: 2)).then((value) {
    //     showProfileSnackbar(
    //         context: context,
    //         bottomMargin: ResponsiveHelper.height(context) * 0.85);
    //   });
    // });
    home.startLoader(true);
    banner
        .getBanner(role.roleType, context)
        .then((value) => home.startLoader(false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(appBarHeight),
            child: indexAppbar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              indexSliderSection,
              PreviousSchoolsWidget(),
            ],
          ),
        )
    );
  }
}