import 'package:flutter/material.dart';
import 'package:hotel_motel/controller/user/user_controller.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/models/user_details.dart';
import 'package:hotel_motel/models/user_model.dart';
import 'package:hotel_motel/repository/model_repositores/user_repository/user_repository.dart';
import 'package:hotel_motel/repository/user_details_repository/user_details_repository.dart';
import 'package:hotel_motel/widgets/finalize_booking_widgets/finalize_client_details.dart';

class ProfileUserForm extends StatelessWidget {
  const ProfileUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<UserModel>(
          stream: locator
              .get<UserRepository>()
              .getUserDetails(locator.get<UserController>().currentUserUid!),
          builder: (context, snapshot) {
            return Text("data");
          },
        ),
        StreamBuilder<UserDetails>(
          stream: locator
              .get<UserDetailsRepository>()
              .getUserDetails(locator.get<UserController>().currentUserUid!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return FinalizeClientDetails(
                  userDetails: snapshot.data!, getDetails: (value) {});
            }
            return CircularProgressIndicator(color: Colors.black);
          },
        )
      ],
    );
  }
}
