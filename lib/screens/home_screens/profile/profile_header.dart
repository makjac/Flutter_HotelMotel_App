import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/utils/scale.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

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
              height: 65,
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
              onTap: () {},
              child: ClipOval(
                child: Image.network(
                    "https://i.pinimg.com/736x/74/d7/b0/74d7b05c3476e062ca7c26452ffb22cb.jpg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
