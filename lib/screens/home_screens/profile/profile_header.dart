import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/theme_base.dart';

class ProfileHeader extends StatelessWidget {
  final String? imgUrl;
  final Function()? onTap;

  const ProfileHeader({
    Key? key,
    this.imgUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 60,
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
                      color: Color.fromARGB(57, 67, 67, 67),
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

  Widget _profileImage() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 66, 66, 66),
        radius: 60,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 53,
          child: InkWell(
            onTap: onTap,
            child: _image(),
          ),
        ),
      ),
    );
  }

  Widget _image() {
    return CircleAvatar(
      radius: 48,
      backgroundColor: Colors.brown[200],
      backgroundImage: imgUrl != null
          ? NetworkImage(
              imgUrl!,
            )
          : const NetworkImage(
              "https://firebasestorage.googleapis.com/v0/b/hotelmotel-66527.appspot.com/o/default_user.png?alt=media&token=c7fedb11-9c37-4c0a-8417-bdc769803a6b"),
    );
  }
}
