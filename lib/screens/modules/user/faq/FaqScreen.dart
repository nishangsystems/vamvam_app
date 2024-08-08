import 'package:vam_vam/providers/resultProvider.dart';
import 'package:vam_vam/screens/html/htmlScreen.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/imageResources.dart';
import '../../../../utils/paddingConstant.dart';
import '../../../../widgets/commonWidgets/commonWidgets.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  int selectedIndex = 0;
  bool showPlatformChargesScreen = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => _init());
  }

  setShowPlatformCharges(bool value) {
    showPlatformChargesScreen = value;
    setState(() {});
  }

  _init() {
    var result = Provider.of<ResultProvider>(context, listen: false);
    result.getFaqs().then((value) {
      if (value.message.contains('PLATFORM CHARGES')) {
        setShowPlatformCharges(true);
      } else if (!value.isSuccess) {
        errorToast(msg: value.message);
      } else {
        setShowPlatformCharges(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ResultProvider>(
      builder: (context, result, child) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            backgroundColor: primaryDark,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(appBarHeight),
                child: homeAppbar(
                    context: context,
                    profileImage: ImageResources.profileImage,
                    name: 'deepak',
                    location: 'H 106')),
            body: LoadingOverlay(
              isLoading: result.loader,
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      left: PaddingConstant.l,
                      right: PaddingConstant.l,
                      top: PaddingConstant.xxl),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),

                        // Add Course title
                        Row(
                          children: [
                            commonBackButton(
                                context: context,
                                title: '',
                                backBtnColor: white),
                            const SizedBox(width: 10),
                            const Text("FAQ's",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: white,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        SizedBox(height: 20),
                        if (showPlatformChargesScreen) ...[
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 50, left: 80, right: 80),
                            child: Image.asset(
                                'assets/images/platformChargeImg.png'),
                          ),
                          SizedBox(height: 20),
                          Text('Pay Platform Charges',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          SizedBox(height: 10),
                          Text(
                              'You have not paid your platform\ncharges. Pay your charges to have\naccess to your form',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          SizedBox(height: 20),
                          // commonButtonText(
                          //     width: 160,
                          //     height: 40,
                          //     text: 'Make Payment',
                          //     textColor: black,
                          //     color: Color(0xFFFF985B),
                          //     onTap: () => ())
                        ] else ...[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListView.builder(
                                  itemCount: result.faqList.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var item = result.faqList[index];
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                color: black.withOpacity(0.1))),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16.0,
                                              right: 16,
                                              top: 5,
                                              bottom: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(item.question ?? '',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex = index;
                                                      });
                                                    },
                                                    child: Icon(index !=
                                                            selectedIndex
                                                        ? Icons
                                                            .keyboard_arrow_down
                                                        : Icons
                                                            .keyboard_arrow_up),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  if (selectedIndex ==
                                                      index) ...[
                                                    Expanded(
                                                        child: HtmlScreen(
                                                            html: item.answer ??
                                                                '<p></p>')

                                                        // Text(item.answer ?? '',
                                                        //     overflow:
                                                        //         TextOverflow.ellipsis,
                                                        //     maxLines: 4,
                                                        //     style: TextStyle(
                                                        //         fontSize: 13,
                                                        //         fontWeight:
                                                        //             FontWeight.w400)),
                                                        )
                                                  ] else ...[
                                                    SizedBox(
                                                      width: 10,
                                                    )
                                                  ],
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                        SizedBox(height: 20),
                      ]),
                )),
              ),
            )),
      ),
    );
  }
}
