// ignore_for_file: unused_field

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/HomeProvider.dart';
import 'package:vam_vam/providers/bannerProvider.dart';
import 'package:vam_vam/providers/locationMapProvider.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/utils/imageResources.dart';
import '../../../utils/schoolPreference.dart';
import '../../../widgets/commonWidgets/commonWidgets.dart';
import 'HomeScreen.dart';

class UserBottomHomeBar extends StatefulWidget {
  const UserBottomHomeBar({Key? key}) : super(key: key);

  @override
  State<UserBottomHomeBar> createState() => _UserBottomHomeBarState();
}

class _UserBottomHomeBarState extends State<UserBottomHomeBar> {
  final int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() => _init());


    SchoolPreference.getSchoolID().then((school_id){
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      messaging.subscribeToTopic('school_${school_id}_students');
      messaging.subscribeToTopic('school_${school_id}_general');
    });


  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeProvider, ProfileProvider>(
      builder: (context, data, profile, child) => LoadingOverlay(
        isLoading: data.isLoading || profile.isLoading,
        child: Scaffold(
          backgroundColor:  Colors.white,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(appBarHeight),
              child: homeAppbar(
                  context: context,
                  profileImage: ImageResources.profileImage,
                  name: 'deepak',
                  location: 'H 106')),
          body: RefreshIndicator(
            onRefresh: () => _onReresh(),
            child: Center(
              child: _widgetOptions.elementAt(0),
            ),
          ),
          // floatingActionButton: FloatingActionButton.small(
          //   backgroundColor: Colors.transparent,
          //   onPressed: () {
          //     launch("tel://9876543210");
          //   },
          //   child: Image.asset(
          //     "assets/icons/homeCall.png",
          //     height: 65,
          //   ),
          // ),
        ),
      ),
    );
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
    Provider.of<LocationMapProvider>(context, listen: false)
        .determinePositionNew();
    home.startLoader(true);
    banner
        .getBanner(role.roleType, context)
        .then((value) => home.startLoader(false));
  }

  _onReresh() async {
    await Future.delayed(Duration(milliseconds: 1500));
    _init();
  }
}
