import 'package:flutter/material.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/utils/scale.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: InsetsColors.backgroundColor,
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: InsetsColors.abBackgroundColor,
        shadowColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(width, height),
          const SizedBox(height: Insets.xs),
          Padding(
            padding: const EdgeInsets.all(Insets.s),
            child: Column(
              children: [
                _button(
                  const Icon(Icons.add_business),
                  "Register own hotel",
                  () {},
                ),
                const SizedBox(height: Insets.xs),
                _button(
                  const Icon(Icons.logout),
                  "Log out",
                  () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(double width, double height) {
    return Stack(
      children: [
        Container(
          height: height * 0.17 + 60,
        ),
        Container(
          width: double.infinity,
          height: height * 0.17,
          decoration: const BoxDecoration(
            color: InsetsColors.abBackgroundColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(58, 83, 55, 2),
                  blurRadius: 5,
                  blurStyle: BlurStyle.normal,
                  spreadRadius: 5),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: _statChip("Trips:", "3", width),
              ),
              _spacer(),
              Expanded(
                flex: 1,
                child: _statChip("revies:", "3", width),
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

  Widget _button(Icon icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          icon,
          const SizedBox(width: Insets.s),
          Text(label),
        ],
      ),
    );
  }
}
