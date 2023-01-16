import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/constans/route_name_constans.dart';
import 'package:hotel_motel/controller/user/user_controller.dart';
import 'package:hotel_motel/models/booking_model.dart';
import 'package:hotel_motel/models/search_cryteria.dart';
import 'package:hotel_motel/models/user_details.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/utils/finalize_booking_arguments.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/widgets/booking_details/finalize_booking_details.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/widgets/finalize_client_details.dart';
import 'package:hotel_motel/screens/finalize_booking_screen/widgets/peytment/finalize_paytment_method.dart';
import 'package:hotel_motel/service/analitics_service/analitics_service.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/widgets/decorations/app_divider.dart';

import '../../bloc/finalize_booking/finalize_booking_bloc.dart';

// ignore: must_be_immutable
class FinalizeBookingPage extends StatefulWidget {
  FinalizeBookingArguments _arguments;

  FinalizeBookingPage({required FinalizeBookingArguments arguments, super.key})
      : _arguments = arguments {
    if (arguments.cryteria == null) {
      _arguments.cryteria = SearchCryteria(
          location: arguments.hotel.city,
          timeRange: DateTimeRange(
              start: DateTime.now().add(Duration(days: 1)),
              end: DateTime.now().add(Duration(days: 2))),
          rooms: 1,
          adults: 1,
          kids: 0);
    }
  }

  @override
  State<FinalizeBookingPage> createState() => _FinalizeBookingPageState();
}

class _FinalizeBookingPageState extends State<FinalizeBookingPage> {
  @override
  void initState() {
    locator<AnaliticsService>().LogBeginCheckout(
        widget._arguments.hotel,
        (widget._arguments.room.price *
                widget._arguments.cryteria!.rooms *
                widget._arguments.cryteria!.timeRange.duration.inDays)
            .toDouble());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserDetails _user;
    String _paytmentMethod = "inCash";
    return BlocProvider<FinalizeBookingBloc>(
      create: (context) => FinalizeBookingBloc()
        ..add(LoadDetails(
            userUid: locator.get<UserController>().currentUserUid!)),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Finalize booking"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: Insets.s),
                FinalizeBookingDetails(
                  hotel: widget._arguments.hotel,
                  room: widget._arguments.room,
                  cryteria: widget._arguments.cryteria,
                  updateTimeRange: _updateTimeRange,
                ),
                AppDivider(),
                BlocConsumer<FinalizeBookingBloc, FinalizeBookingState>(
                  listener: (context, state) {
                    if (state is UserDetailsLoaded) {
                      _user = state.userDetails;
                    }
                    if (state is BookingCreated) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoute.HOME_ROUTE, (route) => false);
                    }
                  },
                  builder: (context, state) {
                    if (state is UserDetailsLoaded) {
                      return FinalizeClientDetails(
                        userDetails: state.userDetails,
                        getDetails: (newUser) {
                          _user = newUser;
                        },
                      );
                    }

                    return CircularProgressIndicator();
                  },
                ),
                AppDivider(),
                FinalizePaytmentMethods(
                  onChanged: (newPayMet) {
                    _paytmentMethod = newPayMet.name;
                  },
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(Insets.s),
                    child: SizedBox(
                      width: double.infinity,
                      child: BlocBuilder<FinalizeBookingBloc,
                          FinalizeBookingState>(
                        builder: (context, state) {
                          if (state is CreateBooking) {
                            return _loadingButton();
                          }
                          return _activeButton(_paytmentMethod, context);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _activeButton(String paytmentMethod, BuildContext context) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        onPressed: () {
          final Booking booking = Booking(
              bookingID: "",
              hotelID: widget._arguments.hotel.hotelID,
              roomID: widget._arguments.room.roomID,
              userUid: locator.get<UserController>().currentUser!.uid!,
              created: DateTime.now(),
              startTime: widget._arguments.cryteria!.timeRange.start,
              endTime: widget._arguments.cryteria!.timeRange.end,
              status: "active",
              payment: paytmentMethod,
              opinion: "none");
          locator<AnaliticsService>().LogAddPaytmentInfo(
              widget._arguments.hotel,
              (widget._arguments.room.price *
                      widget._arguments.cryteria!.rooms *
                      widget._arguments.cryteria!.timeRange.duration.inDays)
                  .toDouble(),
              paytmentMethod);
          locator<AnaliticsService>().LogPurchase(
              widget._arguments.hotel,
              (widget._arguments.room.price *
                      widget._arguments.cryteria!.rooms *
                      widget._arguments.cryteria!.timeRange.duration.inDays)
                  .toDouble());
          BlocProvider.of<FinalizeBookingBloc>(context)
              .add(CreateBooking(booking: booking));
        },
        child: const Text("Book a trip!"),
      );

  Widget _loadingButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        onPressed: () {},
        child: const CircularProgressIndicator(),
      );

  void _updateTimeRange() {
    showDateRangePicker(
            context: context,
            initialDateRange: widget._arguments.cryteria!.timeRange,
            firstDate: DateTime.now(),
            lastDate: DateTime(2220))
        .then((dateRange) {
      if (dateRange != null) {
        setState(() {
          widget._arguments.cryteria!.timeRange = dateRange;
        });
      }
    });
  }
}
