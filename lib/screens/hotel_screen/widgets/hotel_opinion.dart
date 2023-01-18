import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_motel/locator.dart';
import 'package:hotel_motel/models/user_model.dart';
import 'package:hotel_motel/repository/model_repositores/user_repository/user_repository.dart';
import 'package:hotel_motel/screens/hotel_screen/widgets/summary/score_label.dart';
import 'package:hotel_motel/theme/theme_base.dart';

import '../../../models/review_model.dart';
import '../../../service/storage/storage_service.dart';

class HotelOpinion extends StatefulWidget {
  final ReviewModel opinion;

  const HotelOpinion({
    Key? key,
    required this.opinion,
  }) : super(key: key);

  @override
  State<HotelOpinion> createState() => _HotelOpinionState();
}

class _HotelOpinionState extends State<HotelOpinion>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutSine,
  );

  bool isDetailsVisible = false;

  _toggleContainer() {
    print(_animation.status);
    if (_animation.status != AnimationStatus.completed) {
      _controller.forward();
    } else {
      _controller.animateBack(0, duration: Duration(milliseconds: 500));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Insets.xs),
      child: StreamBuilder<UserModel>(
        stream: locator
            .get<UserRepository>()
            .getUserDetails(widget.opinion.userUid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              padding: EdgeInsets.all(Insets.xs),
              color: isDetailsVisible ? Colors.black12 : Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      snapshot.data!.anonim == false
                          ? _profileAvatar()
                          : _anonimAvatar(),
                      SizedBox(width: Insets.xs),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          snapshot.data!.anonim == false
                              ? Text(
                                  snapshot.data!.displayName ?? "Anonim",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  "Anonim",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                          RatingBar(
                            itemCount: 5,
                            initialRating:
                                (widget.opinion.details.total / 20).toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            itemSize: 23,
                            ratingWidget: RatingWidget(
                              empty: Icon(Icons.star_border_rounded,
                                  color: InsetsColors.emptyStarColor),
                              half: Icon(Icons.star_half_rounded,
                                  color: InsetsColors.halfStarColor),
                              full: Icon(Icons.star_rounded,
                                  color: InsetsColors.fullStarColor),
                            ),
                            onRatingUpdate: (value) {},
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () => setState(() {
                                isDetailsVisible = !isDetailsVisible;
                                _toggleContainer();
                              }),
                          icon: isDetailsVisible
                              ? Icon(Icons.keyboard_arrow_up_rounded)
                              : Icon(Icons.keyboard_arrow_down_rounded)),
                    ],
                  ),
                  SizedBox(height: Insets.xs),
                  _moreDetails(),
                  SizedBox(height: Insets.xs),
                  Text(
                    widget.opinion.comment,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _profileAvatar() => FutureBuilder<String>(
        future: locator
            .get<StorageService>()
            .getProfulrImgUrl(widget.opinion.userUid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CircleAvatar(
              radius: 27,
              backgroundImage: NetworkImage(
                snapshot.data!,
              ),
            );
          }
          if (snapshot.hasError) {
            return CircleAvatar(
              radius: 27,
              backgroundImage: NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/hotelmotel-66527.appspot.com/o/default_user.png?alt=media&token=c7fedb11-9c37-4c0a-8417-bdc769803a6b",
              ),
            );
          }
          return CircleAvatar(
            radius: 27,
            backgroundColor: Colors.black,
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        },
      );

  Widget _anonimAvatar() => CircleAvatar(
        radius: 27,
        backgroundImage: NetworkImage(
          "https://firebasestorage.googleapis.com/v0/b/hotelmotel-66527.appspot.com/o/default_user.png?alt=media&token=c7fedb11-9c37-4c0a-8417-bdc769803a6b",
        ),
      );

  Widget _moreDetails() => SizeTransition(
        sizeFactor: _animation,
        axis: Axis.vertical,
        child: Column(
          children: [
            ScoreLabel(label: "Czystość", score: widget.opinion.details.purity),
            ScoreLabel(label: "Komfort", score: widget.opinion.details.comfort),
            ScoreLabel(
                label: "Udogodnienia", score: widget.opinion.details.amenities),
            ScoreLabel(label: "Personel", score: widget.opinion.details.staff),
            ScoreLabel(
                label: "Lokalizacja", score: widget.opinion.details.location),
            ScoreLabel(label: "Cena", score: widget.opinion.details.price),
            SizedBox(height: Insets.xs),
          ],
        ),
      );
}
