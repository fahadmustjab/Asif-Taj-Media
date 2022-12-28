// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tech_media/res/color.dart';
import 'package:tech_media/res/components/RoundButton.dart';
import 'package:tech_media/view/view_model/services/SessionManager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ref = FirebaseDatabase.instance.ref("User");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder(
                stream:
                    ref.child(SessionController().userId.toString()).onValue,
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.primaryColor, width: 3)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: map['Profile'].toString() == ""
                                  ? Icon(
                                      Icons.person,
                                      size: 35,
                                    )
                                  : Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(map['Profile']),
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          child: Icon(
                                            Icons.error_outline,
                                            color: AppColors.alertColor,
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ReusableRow(
                            title: 'Username',
                            value: map['UserName'],
                            iconData: Icons.person_outline),
                        ReusableRow(
                            title: 'Phone',
                            value: map['Phone'] == ""
                                ? "xxxx-xxxxxxx"
                                : map['Phone'],
                            iconData: Icons.phone_android),
                        ReusableRow(
                            title: 'Email',
                            value: map['Email'],
                            iconData: Icons.email_outlined),
                        RoundButton(title: 'Logout', onPress: () {})
                      ],
                    );
                  } else {
                    return Text('Some Error');
                  }
                },
              )
            ]),
      ),
    ));
  }
}

class ReusableRow extends StatelessWidget {
  String title;
  String value;
  IconData iconData;
  ReusableRow({
    Key? key,
    required this.title,
    required this.value,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        // border: Border.all(color: AppColors.dividedColor.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(iconData),
            title: Text(title),
            trailing: Text(value),
          ),
          Divider(
            height: 20,
            color: AppColors.dividedColor.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
