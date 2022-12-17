import '../../../models/review_model.dart';

abstract class BaseReviewRepository {
  Future<void> AddhotelReview(ReviewModel review);

  Stream<List<ReviewModel>> GetHotelReviews(String hotelID);
}
