import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_motel/screens/home_screens/bookings/bloc/bookings_bloc.dart';
import 'package:hotel_motel/screens/home_screens/bookings/cancelled/cancelled_bookings.dart';
import 'package:hotel_motel/screens/home_screens/bookings/incoming/incoming_bookins.dart';
import 'package:hotel_motel/screens/home_screens/bookings/realized/realized_bookings.dart';
import 'package:hotel_motel/screens/home_screens/bookings/widgets/bookings_tab_bar.dart';
import 'package:hotel_motel/theme/theme_base.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bookings"),
          backgroundColor: InsetsColors.abBackgroundColor,
          centerTitle: true,
          bottom: PreferredSize(
            child: BookingTabBar(),
            preferredSize: Size(double.infinity, 35),
          ),
        ),
        body: BlocBuilder<BookingsBloc, BookingsState>(
          builder: ((context, state) {
            if (state is LoadingBooking) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is BookingsLoaded) {
              return TabBarView(
                children: <Widget>[
                  IncomingBooking(thumbnails: state.thumbnails),
                  RealizedBooking(thumbnails: state.thumbnails),
                  CancelledBookings(thumbnails: state.thumbnails),
                ],
              );
            }
            if (state is EmptyBookings) {
              return Center(
                child: const Text("You haven't have any bookings yet!"),
              );
            }
            if (state is BookingError) {
              return Center(
                child: Text(state.error),
              );
            }
            return Center(
              child: const Text("Opps... Something went wrong :("),
            );
          }),
        ),
      ),
    );
  }
}
