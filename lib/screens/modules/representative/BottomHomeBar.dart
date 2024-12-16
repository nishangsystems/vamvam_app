// ignore_for_file: unused_field

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/profileprovider.dart';
import 'package:vam_vam/providers/registerProvider.dart';
import 'package:vam_vam/providers/roleProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/utils/schoolPreference.dart';
import '../../../providers/HomeProvider.dart';
import '../../../providers/bannerProvider.dart';
import '../../../utils/colors.dart';
import '../../../utils/imageResources.dart';
import '../../../widgets/commonWidgets/commonWidgets.dart';
import 'HomeScreen.dart';

class RepresantativeBottomHomeBar extends StatefulWidget {
  const RepresantativeBottomHomeBar({Key? key}) : super(key: key);

  @override
  State<RepresantativeBottomHomeBar> createState() =>
      _RepresantativeBottomHomeBarState();
}

class _RepresantativeBottomHomeBarState
    extends State<RepresantativeBottomHomeBar> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _init();

    SchoolPreference.getSchoolID().then((school_id){
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      messaging.subscribeToTopic('school_${school_id}_teachers');
      messaging.subscribeToTopic('school_${school_id}_general');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, data, child) => LoadingOverlay(
        isLoading: data.isLoading,
        child: Scaffold(
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
          // floatingActionButton: Image.asset(
          //   "assets/icons/homeCall.png",
          //   width: 43,
          //   height: 43,
          // ),

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
          // bottomNavigationBar: BottomNavigationBar(
          //     backgroundColor: Colors.blue[800],
          //     items: const <BottomNavigationBarItem>[
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.home),
          //         label: 'Home',
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.search),
          //         label: 'Search',
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.person),
          //         label: 'Menu',
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.timelapse_outlined),
          //         label: 'History',
          //       ),
          //     ],
          //     type: BottomNavigationBarType.fixed,
          //     currentIndex: 0,
          //     selectedItemColor: Colors.white,
          //     unselectedItemColor: Colors.white,
          //     iconSize: 20,
          //     onTap: _onItemTapped,
          //     elevation: 0),
        ),
      ),
    );
  }

  _init() {
    var banner = Provider.of<BannerProvider>(context, listen: false);
    var home = Provider.of<HomeProvider>(context, listen: false);
    var profile = Provider.of<ProfileProvider>(context, listen: false);
    var register = Provider.of<RegisterProvider>(context, listen: false);
    var role = Provider.of<RoleProvider>(context, listen: false);
    var auth = Provider.of<AuthProvider>(context, listen: false);
    home.startLoader(true);
    banner.getBanner(role.roleType, context).then((value){});

    profile
        .getProfile(auth.getUserId(), register, role.roleType, context)
        .then((value) => home.startLoader(false));
  }

  _onReresh() async {
    await Future.delayed(Duration(milliseconds: 1500));
    _init();
  }
}
