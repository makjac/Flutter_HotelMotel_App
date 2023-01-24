// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotel_motel/screens/finalize_booking_screen/widgets/finalize_header.dart';
import 'package:hotel_motel/theme/design_system.dart';
import 'package:hotel_motel/widgets/TextFormFields/input_field.dart';

import '../../../models/user_details.dart';
import '../../../../locator.dart';
import '../../../bloc/finalize_booking/finalize_booking_bloc.dart';
import '../../../controller/user/user_controller.dart';

// ignore: must_be_immutable
class FinalizeClientDetails extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  UserDetails userDetails;
  final ValueChanged<UserDetails> getDetails;

  FinalizeClientDetails({
    Key? key,
    required this.userDetails,
    required this.getDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FinalizeHeader(label: "Client details"),
          const SizedBox(height: Insets.s),
          _userForm(),
          BlocBuilder<FinalizeBookingBloc, FinalizeBookingState>(
            builder: (context, state) {
              if (state is UpdatingUserDetails) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<FinalizeBookingBloc>(context).add(
                              UpdateUserDetails(
                                  userUid: locator
                                      .get<UserController>()
                                      .currentUserUid!,
                                  userDetails: userDetails));
                        }
                      },
                      child: const Text("Save user details")),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _userForm() => Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InputField(
              label: "Name",
              prefixIcon: Icon(Icons.person),
              initValue: userDetails.name,
              onChanged: (newName) {
                userDetails.name = newName!;
                getDetails(userDetails);
              },
            ),
            InputField(
              label: "Surname",
              prefixIcon: Icon(Icons.person),
              initValue: userDetails.surname,
              onChanged: (newSurname) {
                userDetails.surname = newSurname!;
                getDetails(userDetails);
              },
            ),
            InputField(
              label: "Street",
              prefixIcon: Icon(Icons.location_city),
              initValue: userDetails.street,
              onChanged: (newStreet) {
                userDetails.street = newStreet!;
                getDetails(userDetails);
              },
            ),
            InputField(
              label: "Building Number",
              prefixIcon: Icon(Icons.location_city),
              initValue: userDetails.buildingNumber,
              onChanged: (newBN) {
                userDetails.buildingNumber = newBN ?? "";
                getDetails(userDetails);
              },
            ),
            InputField(
              label: "Local Number",
              prefixIcon: Icon(Icons.location_city),
              initValue: userDetails.localNumber,
              onChanged: (newLN) {
                userDetails.localNumber = newLN ?? "";
                getDetails(userDetails);
              },
            ),
            InputField(
              label: "City",
              prefixIcon: Icon(Icons.location_city),
              initValue: userDetails.city,
              onChanged: (newCity) {
                userDetails.city = newCity!;
                getDetails(userDetails);
              },
            ),
            InputField(
              label: "ZipCode",
              prefixIcon: Icon(Icons.location_city),
              initValue: userDetails.zipcode,
              onChanged: (newZipcode) {
                userDetails.zipcode = newZipcode!;
                getDetails(userDetails);
              },
            ),
            InputField(
              label: "Phone number",
              prefixIcon: Icon(Icons.phone),
              initValue: userDetails.phoneNumber,
              onChanged: (newPN) {
                userDetails.phoneNumber = newPN!;
                getDetails(userDetails);
              },
            ),
            InputField(
              label: "email",
              prefixIcon: Icon(Icons.email),
              initValue: userDetails.email,
              onChanged: (newEmail) {
                userDetails.email = newEmail!;
                getDetails(userDetails);
              },
            ),
            const SizedBox(height: Insets.s),
          ],
        ),
      );
}
