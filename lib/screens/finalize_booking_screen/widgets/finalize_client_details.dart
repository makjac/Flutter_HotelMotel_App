// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotel_motel/screens/finalize_booking_screen/widgets/finalize_header.dart';
import 'package:hotel_motel/theme/design_system.dart';

import '../../../../data/models/user_details.dart';
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
                child: ElevatedButton(
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
            _inputField(
              "Name",
              Icon(Icons.person),
              userDetails.name,
              (newName) {
                userDetails.name = newName!;
                getDetails(userDetails);
              },
            ),
            _inputField(
              "Surname",
              Icon(Icons.person),
              userDetails.surname,
              (newSurname) {
                userDetails.surname = newSurname!;
                getDetails(userDetails);
              },
            ),
            _inputField(
              "Street",
              Icon(Icons.location_city),
              userDetails.street,
              (newStreet) {
                userDetails.street = newStreet!;
                getDetails(userDetails);
              },
            ),
            _inputField(
              "Building Number",
              Icon(Icons.location_city),
              userDetails.buildingNumber,
              (newBN) {
                userDetails.buildingNumber = newBN ?? "";
                getDetails(userDetails);
              },
            ),
            _inputField(
              "Local Number",
              Icon(Icons.location_city),
              userDetails.localNumber,
              (newLN) {
                userDetails.localNumber = newLN ?? "";
                getDetails(userDetails);
              },
            ),
            _inputField(
              "City",
              Icon(Icons.location_city),
              userDetails.city,
              (newCity) {
                userDetails.city = newCity!;
                getDetails(userDetails);
              },
            ),
            _inputField(
              "ZipCode",
              Icon(Icons.location_city),
              userDetails.zipcode,
              (newZipcode) {
                userDetails.zipcode = newZipcode!;
                getDetails(userDetails);
              },
            ),
            _inputField(
              "Phone number",
              Icon(Icons.phone),
              userDetails.phoneNumber,
              (newPN) {
                userDetails.phoneNumber = newPN!;
                getDetails(userDetails);
              },
            ),
            _inputField(
              "email",
              Icon(Icons.email),
              userDetails.email,
              (newEmail) {
                userDetails.email = newEmail!;
                getDetails(userDetails);
              },
            ),
            const SizedBox(height: Insets.s),
          ],
        ),
      );

  Widget _inputField(String label, Icon prefixIcon, String initValue,
      void Function(String?)? onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Insets.xs),
      child: TextFormField(
        decoration: _textFireldDecoration(label, prefixIcon),
        minLines: 1,
        initialValue: initValue,
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "value can't be null";
          }
          return null;
        },
      ),
    );
  }

  InputDecoration _textFireldDecoration(String label, Icon prefixIcon) {
    return InputDecoration(
      hintText: label,
      label: Text(label),
      focusColor: Colors.black,
      hoverColor: Colors.black,
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: Colors.black,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: Colors.black87,
        ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), topRight: Radius.circular(10)),
      ),
    );
  }
}
