import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hotel_motel/models/hotel_model.dart';
import 'package:hotel_motel/models/review_model.dart';

import '../../models/search_cryteria.dart';

class AnaliticsService {
  final FirebaseAnalytics _analytics;

  AnaliticsService({
    FirebaseAnalytics? analytics,
  }) : _analytics = analytics ?? FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future setUserId({required String userId}) async {
    await _analytics.setUserId(id: userId);
  }

  Future LoginLog() async {
    await _analytics.logLogin(loginMethod: 'emial');
  }

  Future LogSignUp() async {
    await _analytics.logSignUp(signUpMethod: 'emial');
  }

  Future LogSearch(String searchTerm, SearchCryteria searchCryteria) async {
    await _analytics.logSearch(
      searchTerm: searchTerm,
      destination: searchCryteria.location,
      numberOfNights: searchCryteria.timeRange.duration.inDays,
      startDate: searchCryteria.timeRange.start.toString(),
      endDate: searchCryteria.timeRange.end.toString(),
      numberOfRooms: searchCryteria.rooms,
      numberOfPassengers: searchCryteria.adults + searchCryteria.kids,
    );
  }

  Future LogViewHotel(Hotel hotel, double price) async {
    await _analytics.logViewItem(
      currency: 'PLN',
      value: price,
      items: [
        AnalyticsEventItem(
          itemId: hotel.hotelID,
          itemName: hotel.name,
          itemCategory: hotel.category,
          itemCategory2: hotel.city,
          price: price,
        ),
      ],
    );
  }

  Future LogBeginCheckout(Hotel hotel, double price) async {
    await _analytics.logBeginCheckout(
      currency: 'PLN',
      value: price,
      coupon: "",
      items: [
        AnalyticsEventItem(
          itemId: hotel.hotelID,
          itemName: hotel.name,
          itemCategory: hotel.category,
          itemCategory2: hotel.city,
          price: price,
        ),
      ],
    );
  }

  Future LogAddPaytmentInfo(
      Hotel hotel, double price, String paytmentMethod) async {
    await _analytics.logAddPaymentInfo(
      currency: 'PLN',
      value: price,
      paymentType: paytmentMethod,
      coupon: "",
      items: [
        AnalyticsEventItem(
          itemId: hotel.hotelID,
          itemName: hotel.name,
          itemCategory: hotel.category,
          itemCategory2: hotel.city,
          price: price,
        ),
      ],
    );
  }

  Future LogPurchase(Hotel hotel, double price) async {
    await _analytics.logPurchase(
      currency: 'pln',
      value: price,
      tax: price * 0.23,
      coupon: "",
      items: [
        AnalyticsEventItem(
          itemId: hotel.hotelID,
          itemName: hotel.name,
          itemCategory: hotel.category,
          itemCategory2: hotel.city,
          price: price,
        ),
      ],
    );
  }

  Future LogAddItemReview(ReviewModel review) async {
    await _analytics.logEvent(
      name: "add_item_review",
      parameters: {
        "hotel_id": review.hotelID,
        "purity": review.details.purity,
        "comfort": review.details.comfort,
        "location": review.details.location,
        "price": review.details.price,
        "staff": review.details.staff,
        "total": review.details.total,
      },
    );
  }

  Future LogUpdateProfileImage(String userUid) async {
    await _analytics.logEvent(
      name: "update_profile_image",
      parameters: {
        "User_uid": userUid,
      },
    );
  }

  Future logAuthError({required String authType, String? error}) async {
    var paremeters = {
      "auth_type": authType,
    };
    if (error != null) {
      paremeters.addAll({"error_value": error});
    }
    await _analytics.logEvent(
      name: "auth_error",
      parameters: paremeters,
    );
  }

  Future logHotelThumbnailView(String hotelId) async {
    await _analytics.logEvent(
      name: "hotel_thumbnail_veiw",
      parameters: {
        "hotel_id": hotelId,
      },
    );
  }
}
