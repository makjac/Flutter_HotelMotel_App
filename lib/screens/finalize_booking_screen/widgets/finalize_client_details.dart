// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotel_motel/screens/finalize_booking_screen/bloc/finalize_booking_bloc.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/widgets/finalize_header.dart';
import 'package:hotel_motel/theme/design_system.dart';

import '../../../../data/controller/user/user_controller.dart';
import '../../../../data/models/user_details.dart';
import '../../../../locator.dart';

// ignore: must_be_immutable
class FinalizeClientDetails extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  FinalizeClientDetails({
    Key? key,
  }) : super(key: key);

  UserDetails? userDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FinalizeHeader(label: "Client details"),
          const SizedBox(height: Insets.s),
          BlocConsumer<FinalizeBookingBloc, FinalizeBookingState>(
            listener: (context, state) {
              if (state is UserDetailsLoaded) {
                userDetails = state.userDetails;
              }
            },
            builder: (context, state) {
              if (state is UserDetailsLoaded) {
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _inputField(
                        "Name",
                        Icon(Icons.person),
                        state.userDetails.name,
                        (newName) => userDetails?.name = newName!,
                      ),
                      _inputField(
                        "Surname",
                        Icon(Icons.person),
                        state.userDetails.surname,
                        (newSurname) => userDetails?.surname = newSurname!,
                      ),
                      _inputField(
                        "Street",
                        Icon(Icons.location_city),
                        state.userDetails.street,
                        (newStreet) => userDetails?.street = newStreet!,
                      ),
                      _inputField(
                        "Building Number",
                        Icon(Icons.location_city),
                        state.userDetails.buildingNumber,
                        (newBN) => userDetails?.buildingNumber = newBN ?? "",
                      ),
                      _inputField(
                        "Local Number",
                        Icon(Icons.location_city),
                        state.userDetails.localNumber,
                        (newLN) => userDetails?.localNumber = newLN ?? "",
                      ),
                      _inputField(
                        "City",
                        Icon(Icons.location_city),
                        state.userDetails.city,
                        (newCity) => userDetails?.city = newCity!,
                      ),
                      _inputField(
                        "ZipCode",
                        Icon(Icons.location_city),
                        state.userDetails.zipcode,
                        (newZipcode) => userDetails?.zipcode = newZipcode!,
                      ),
                      _inputField(
                        "Phone number",
                        Icon(Icons.phone),
                        state.userDetails.phoneNumber,
                        (newPN) => userDetails?.phoneNumber = newPN!,
                      ),
                      _inputField(
                        "email",
                        Icon(Icons.email),
                        state.userDetails.email,
                        (newEmail) => userDetails?.email = newEmail!,
                      ),
                      const SizedBox(height: Insets.s),
                    ],
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
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
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<FinalizeBookingBloc>(context).add(
                            UpdateUserDetails(
                                userUid: locator
                                    .get<UserController>()
                                    .currentUserUid!,
                                userDetails: userDetails!));
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
