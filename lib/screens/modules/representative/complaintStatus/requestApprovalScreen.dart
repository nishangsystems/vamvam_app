import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vam_vam/providers/AuthProvider.dart';
import 'package:vam_vam/providers/approvalProvider.dart';
import 'package:vam_vam/screens/loader/loaderOverlay.dart';
import 'package:vam_vam/utils/colors.dart';
import 'package:vam_vam/utils/imageResources.dart';
import 'package:vam_vam/utils/paddingConstant.dart';
import 'package:vam_vam/widgets/commonWidgets/commonWidgets.dart';

class RepRequestApprovalScreen extends StatefulWidget {
  final String complaintId;
  const RepRequestApprovalScreen({super.key, required this.complaintId});

  @override
  State<RepRequestApprovalScreen> createState() =>
      _RepRequestApprovalScreenState();
}

class _RepRequestApprovalScreenState extends State<RepRequestApprovalScreen> {
  final TextEditingController descriptionController = TextEditingController();
  String? descriptionError;

  setDescriptionError(String? value) {
    setState(() {
      descriptionError = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDark,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(appBarHeight),
          child: homeAppbar(
              context: context,
              profileImage: ImageResources.profileImage,
              name: 'deepak',
              location: 'H 106')),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Consumer2<ApprovalProvider, AuthProvider>(
            builder: (context, approval, auth, child) => LoadingOverlay(
              isLoading: false,
              child: Column(
                children: [
                  Row(
                    children: [
                      commonBackButton(
                          context: context, title: '', backBtnColor: white),
                      const SizedBox(width: 10),
                      const Text("Request Approval",
                          style: TextStyle(
                            fontSize: 17,
                            color: white,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(PaddingConstant.xs),
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        boxShadow: const [
                          BoxShadow(blurRadius: 2.0, color: white),
                        ],
                        border: Border.all(color: white.withOpacity(0.1)),
                        color: white),
                    child: TextFormField(
                      controller: descriptionController,
                      maxLines: null,
                      expands: true,
                      style: TextStyle(fontSize: 12),
                      keyboardType: TextInputType.multiline,
                      validator: (value) {
                        if (value!.isEmpty) {
                          setDescriptionError("Message can't be empty");
                        } else {
                          setDescriptionError(null);
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: 'Write Your Message',
                        errorStyle: TextStyle(color: errorColor),
                        hintStyle: TextStyle(
                            color: black.withOpacity(0.4), fontSize: 12),
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  commonButtonWhite(
                      width: double.infinity,
                      bgColors: [Colors.red, Colors.red],
                      title: 'Request',
                      txtColor: white,
                      fontSize: 12,
                      onTap: () {
                        if (descriptionError == null) {
                          approval
                              .repRequestApproval(
                                  executiveId: auth.getUserId(),
                                  compalintId: widget.complaintId,
                                  message: descriptionController.text
                                      .toString()
                                      .trim())
                              .then((value) {
                            if (value.isSuccess) {
                              successToast(msg: value.message);
                              Navigator.of(context).pop();
                            } else {
                              errorToast(msg: value.message);
                            }
                          });
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
