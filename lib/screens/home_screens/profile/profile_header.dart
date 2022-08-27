// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hotel_motel/data/controller/user_controller.dart';
import 'package:hotel_motel/data/repository/fb_storage_repository.dart';
import 'package:hotel_motel/locator.dart';

import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/utils/scale.dart';
import 'package:image_picker/image_picker.dart';

class ProfileHeader extends StatelessWidget {
  final String? imgUrl;
  final ImagePicker _picker = ImagePicker();

  ProfileHeader({
    Key? key,
    this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: _statChip("Trips:", "3", width),
                ),
                _spacer(),
                Expanded(
                  flex: 1,
                  child: _statChip("something:", "8", width),
                ),
                _spacer(),
                Expanded(
                  flex: 1,
                  child: _statChip("hahahahahahahahahahah:", "190", width),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 70,
              decoration: const BoxDecoration(
                color: InsetsColors.abBackgroundColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.brown,
                      offset: Offset(0, -3),
                      //color: Colors.brown,
                      blurRadius: 2,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 0),
                  BoxShadow(
                      color: Color.fromARGB(58, 83, 55, 2),
                      offset: Offset(0, 5),
                      //color: Colors.brown,
                      blurRadius: 5,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 5),
                ],
              ),
            ),
            Container(height: 60),
          ],
        ),
        _profileImage(),
      ],
    );
  }

  Widget _spacer() {
    return Container(
      width: 2,
      height: 70,
      color: Colors.brown[300],
    );
  }

  Widget _statChip(String title, String score, double width) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.brown[400],
      ),
      child: Padding(
        padding: const EdgeInsets.all(Insets.xs),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: Scale.textScale(width, 1.3),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              score,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _profileImage() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: CircleAvatar(
        backgroundColor: Colors.brown,
        radius: 60,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 53,
          child: CircleAvatar(
            radius: 48,
            backgroundColor: Colors.brown[200],
            child: InkWell(
              onTap: () async {
                final pickedImage =
                    await _picker.pickImage(source: ImageSource.gallery);
                if (pickedImage != null) {
                  File image = File(pickedImage.path);
                  UserController uc = locator.get<UserController>();
                  uc.uploadUserProfileImage(image);
                }
              },
              child: ClipOval(
                child: imgUrl != null
                    ? Image.network(
                        imgUrl!,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/hotelmotel-66527.appspot.com/o/default-avatar-profile-vector-user-profile-default-avatar-profile-vector-user-profile-profile-179376714.jpeg?alt=media&token=af8c479a-585d-44da-a9b6-f43035f6ef09"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
