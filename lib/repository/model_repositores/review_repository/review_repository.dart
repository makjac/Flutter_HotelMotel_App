import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_motel/data/models/review_model.dart';
import 'package:hotel_motel/repository/model_repositores/review_repository/base_review_repository.dart';

class ReviewRepository extends BaseReviewRepository {
  final FirebaseFirestore _firestore;

  ReviewRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> AddhotelReview(ReviewModel review) async {
    CollectionReference reviewRef = _firestore.collection('opinion');
    await reviewRef.add(review.toMap()).then((value) => null);
  }

  @override
  Stream<List<ReviewModel>> GetHotelReviews(String hotelID) {
    // TODO: implement GetHotelReviews
    throw UnimplementedError();
  }
}
