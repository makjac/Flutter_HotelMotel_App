import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/data/controller/user/user_controller.dart';
import 'package:hotel_motel/data/models/user_details.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/bloc/finalize_booking_bloc.dart';
import 'package:hotel_motel/theme/design_system.dart';

class UserDetailsForm extends StatefulWidget {
  const UserDetailsForm({super.key});

  @override
  State<UserDetailsForm> createState() => _UserDetailsFormState();
}

class _UserDetailsFormState extends State<UserDetailsForm> {
  UserDetails? userDetails;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FinalizeBookingBloc, FinalizeBookingState>(
      listener: (context, state) {
        if (state is UserDetailsLoaded) {
          userDetails = state.userDetails;
        }
      },
      builder: (context, state) {
        if (state is UserDetailsLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _label("Name:"),
              TextFormField(
                minLines: 1,
                initialValue: state.userDetails.name,
                onChanged: (name) => userDetails?.name = name,
              ),
              const SizedBox(height: Insets.xs),
              _label("Surname:"),
              TextFormField(
                minLines: 1,
                initialValue: state.userDetails.surname,
                onChanged: (surname) => userDetails?.surname = surname,
              ),
              const SizedBox(height: Insets.xs),
              _label("Street:"),
              TextFormField(
                minLines: 1,
                initialValue: state.userDetails.street,
                onChanged: (street) => userDetails?.street = street,
              ),
              const SizedBox(height: Insets.xs),
              _label("Building number:"),
              TextFormField(
                minLines: 1,
                initialValue: state.userDetails.buildingNumber,
                onChanged: (bNum) => userDetails?.buildingNumber = bNum,
              ),
              const SizedBox(height: Insets.xs),
              _label("Local number:"),
              TextFormField(
                minLines: 1,
                initialValue: state.userDetails.localNumber,
                onChanged: (lNum) => userDetails?.localNumber = lNum,
              ),
              const SizedBox(height: Insets.xs),
              _label("City:"),
              TextFormField(
                minLines: 1,
                initialValue: state.userDetails.city,
                onChanged: (city) => userDetails?.city = city,
              ),
              const SizedBox(height: Insets.xs),
              _label("Zipcode:"),
              TextFormField(
                minLines: 1,
                initialValue: state.userDetails.zipcode,
                onChanged: (zipcode) => userDetails?.zipcode = zipcode,
              ),
              const SizedBox(height: Insets.xs),
              _label("Phone number:"),
              TextFormField(
                minLines: 1,
                initialValue: state.userDetails.phoneNumber,
                onChanged: (pNum) => userDetails?.phoneNumber = pNum,
              ),
              const SizedBox(height: Insets.xs),
              _label("Email:"),
              TextFormField(
                minLines: 1,
                initialValue: state.userDetails.email,
                onChanged: (email) => userDetails?.email = email,
              ),
              const SizedBox(height: Insets.s),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<FinalizeBookingBloc>(context).add(
                          UpdateUserDetails(
                              userUid:
                                  locator.get<UserController>().currentUserUid!,
                              userDetails: userDetails!));
                    },
                    child: const Text("Save user details")),
              ),
            ],
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

  Text _label(String label) => Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 17,
        ),
      );
}
