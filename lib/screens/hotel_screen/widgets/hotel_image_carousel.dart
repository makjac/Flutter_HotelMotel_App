// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HotelImageCarousel extends StatefulWidget {
  final double height;

  const HotelImageCarousel({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  State<HotelImageCarousel> createState() => _HotelImageCarouselState();
}

class _HotelImageCarouselState extends State<HotelImageCarousel> {
  final _carouselControler = CarouselController();
  int _activeIndex = 0;
  bool _isAautoPlay = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselControler,
          itemCount: 3,
          itemBuilder: ((context, index, realIndex) {
            return _buildImage(
                "https://flutterappdev.com/wp-content/uploads/2019/03/Screen-Shot-2019-03-06-at-9.28.42-AM.png",
                index);
          }),
          options: CarouselOptions(
            viewportFraction: 1,
            initialPage: _activeIndex,
            autoPlay: _isAautoPlay,
            height: widget.height,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, reason) {
              setState(() {
                _activeIndex = index;
              });
            },
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 34,
              color: Colors.black26,
            ),
          ),
        ),
        Positioned.fill(
          left: 10,
          child: Align(
            alignment: Alignment.centerLeft,
            child: _previousImgBut(),
          ),
        ),
        Positioned.fill(
          right: 10,
          child: Align(
            alignment: Alignment.centerRight,
            child: _nextImgBut(),
          ),
        ),
        Positioned.fill(
          bottom: 6,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: _buildIndicator(),
          ),
        ),
        Positioned(
            bottom: -7,
            right: 6,
            child: IconButton(
              tooltip: "Auto Paly",
              icon: Icon(Icons.play_arrow),
              color: _isAautoPlay ? Colors.white : Colors.grey,
              onPressed: () => setState(() {
                _isAautoPlay = !_isAautoPlay;
              }),
            ))
      ],
    );
  }

  Widget _buildImage(String urlImage, int index) => Container(
        child: Image.network(
          hotelsUrl[index],
          fit: BoxFit.cover,
        ),
      );

  Widget _buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: _activeIndex,
        count: hotelsUrl.length,
        effect: const JumpingDotEffect(
          activeDotColor: Colors.white,
          dotColor: Colors.grey,
        ),
        onDotClicked: (index) {
          setState(() {
            _activeIndex = index;
            _carouselControler.animateToPage(_activeIndex);
          });
        },
      );

  Widget _nextImgBut() {
    return CircleAvatar(
      backgroundColor: Colors.black26,
      child: IconButton(
        tooltip: "Next Image",
        icon: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
        ),
        onPressed: () {
          _carouselControler.nextPage(duration: Duration(microseconds: 500));
        },
      ),
    );
  }

  Widget _previousImgBut() {
    return CircleAvatar(
      backgroundColor: Colors.black26,
      child: IconButton(
        tooltip: "Previous Image",
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.white,
        ),
        onPressed: (() {
          _carouselControler.previousPage(
              duration: Duration(microseconds: 500));
        }),
      ),
    );
  }
}

List<String> hotelsUrl = [
  "https://www.hotel-cyprus.pl/thumb?file=hotel-cyprus%2Fuser%2Fhotel%2Fnowe.jpg&w=1920",
  "https://www.kayak.pl/rimg/himg/47/ec/7e/ice-115522-63352612_3XL-307131.jpg?width=1366&height=768&crop=true",
  "http://u.profitroom.pl/2017.hotelpoznanski.pl/thumb/1200x630/uploads/bg_home.jpg",
];
