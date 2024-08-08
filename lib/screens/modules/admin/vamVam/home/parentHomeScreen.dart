import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/helpers/responsiveHelper.dart';
import 'package:vam_vam/providers/parentProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/screens/modules/admin/vamVam/student/parentStudentProfileScreen.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/imageResources.dart';
import '../../../../../utils/paddingConstant.dart';
import '../../../../../widgets/commonWidgets/commonWidgets.dart';

class ParentHomeScreen extends StatefulWidget {
  const ParentHomeScreen({super.key});

  @override
  State<ParentHomeScreen> createState() => _ParentHomeScreenState();
}

class _ParentHomeScreenState extends State<ParentHomeScreen> {
  @override
  void initState() {
    Future.microtask(() => _init());
    super.initState();
  }

  _init() {
    Provider.of<ParentProvider>(context, listen: false).getParentStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ParentProvider>(
      builder: (context, parent, child) => Scaffold(
          backgroundColor: primaryDark,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(appBarHeight),
              child: homeAppbar(
                  context: context,
                  profileImage: ImageResources.profileImage,
                  name: 'deepak',
                  location: 'H 106')),
          body: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: PaddingConstant.xs,
                  right: PaddingConstant.xs,
                  top: PaddingConstant.m),
              child: LoadingOverlay(
                isLoading: parent.isLoading,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),

                      // Add Course title
                      Row(
                        children: [
                          commonBackButton(
                              context: context, title: '', backBtnColor: white),
                          const SizedBox(width: 10),
                          const Text("My Children",
                              style: TextStyle(
                                fontSize: 17,
                                color: white,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      parent.studentList.isEmpty && !parent.isLoading
                          ? Padding(
                              padding: EdgeInsets.only(
                                  top: ResponsiveHelper.height(context) * 0.35),
                              child: notDataFound(null),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: parent.studentList.length,
                              itemBuilder: (context, index) {
                                var item = parent.studentList[index];
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 25),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: white,
                                      border: Border.all(
                                          width: 1, color: vamBorderColor)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.matric ?? '',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: vamPrimaryColor),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        item.name ?? '',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: vamPrimaryColor),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      commonButtonWhite(
                                          width:
                                              ResponsiveHelper.width(context),
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ParentStudentProfileScreen(
                                                            subTitle:
                                                                item.name ?? '',
                                                            title: item
                                                                    .matric ??
                                                                '',
                                                            studentId:
                                                                '${item.id}')));
                                          },
                                          title: 'View Details',
                                          txtColor: white,
                                          bgColors: [
                                            primaryLight,
                                            primaryLight
                                          ])
                                    ],
                                  ),
                                );
                              })
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
