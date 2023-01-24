import 'package:flutter/material.dart';
import 'package:hotel_motel/controller/user/user_controller.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/models/user_details.dart';
import 'package:hotel_motel/models/user_model.dart';
import 'package:hotel_motel/repository/user_repository/user_repository.dart';
import 'package:hotel_motel/repository/user_details_repository/user_details_repository.dart';

import '../../../widgets/TextFormFields/input_field.dart';

class ProfileUserForm extends StatelessWidget {
  const ProfileUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          StreamBuilder<UserModel>(
            stream: locator
                .get<UserRepository>()
                .getUserDetails(locator.get<UserController>().currentUserUid!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    InputField(
                      label: "Username",
                      prefixIcon: Icon(Icons.person),
                      initValue: snapshot.data!.displayName ?? "",
                      onSaved: (newUsername) {},
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
          StreamBuilder<UserDetails>(
            stream: locator
                .get<UserDetailsRepository>()
                .getUserDetails(locator.get<UserController>().currentUserUid!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    InputField(
                      label: "Name",
                      prefixIcon: Icon(Icons.person),
                      initValue: snapshot.data?.name,
                      onSaved: (newName) {},
                    ),
                    InputField(
                      label: "Surname",
                      prefixIcon: Icon(Icons.person),
                      initValue: snapshot.data?.surname,
                      onSaved: (newSurname) {},
                    ),
                    InputField(
                      label: "Street",
                      prefixIcon: Icon(Icons.location_city),
                      initValue: snapshot.data?.street,
                      onSaved: (newStreet) {},
                    ),
                    InputField(
                      label: "Building Number",
                      prefixIcon: Icon(Icons.location_city),
                      initValue: snapshot.data?.buildingNumber,
                      onSaved: (newBN) {},
                    ),
                    InputField(
                      label: "Local Number",
                      prefixIcon: Icon(Icons.location_city),
                      initValue: snapshot.data?.localNumber,
                      onSaved: (newLN) {},
                    ),
                    InputField(
                      label: "City",
                      prefixIcon: Icon(Icons.location_city),
                      initValue: snapshot.data?.city,
                      onSaved: (newCity) {},
                    ),
                    InputField(
                      label: "ZipCode",
                      prefixIcon: Icon(Icons.location_city),
                      initValue: snapshot.data?.zipcode,
                      onSaved: (newZipcode) {},
                    ),
                    InputField(
                      label: "Phone number",
                      prefixIcon: Icon(Icons.phone),
                      initValue: snapshot.data?.phoneNumber,
                      onSaved: (newPN) {},
                    ),
                    InputField(
                      label: "email",
                      prefixIcon: Icon(Icons.email),
                      initValue: snapshot.data?.email,
                      onSaved: (newEmail) {},
                    ),
                  ],
                );
              }
              return CircularProgressIndicator(color: Colors.black);
            },
          )
        ],
      ),
    );
  }
}
