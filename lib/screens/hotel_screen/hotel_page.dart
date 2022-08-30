import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_motel/theme/theme_base.dart';
import 'package:hotel_motel/utils/scale.dart';
import 'package:hotel_motel/widgets/containers/number_box.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({Key? key}) : super(key: key);

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  bool readMore = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("hotel"),
      //   centerTitle: true,
      //   backgroundColor: InsetsColors.abBackgroundColor,
      //   shadowColor: Colors.brown,
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.amber,
            ),
            Padding(
              padding: const EdgeInsets.all(Insets.s),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title(width),
                  divider(),
                  _summary(width),
                  const SizedBox(height: Insets.xs),
                  _price(120, 4, 2, 3, 1, width),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Divider divider() => const Divider(
        color: Color.fromARGB(34, 36, 36, 36),
        thickness: 1,
        indent: 10,
        endIndent: 10,
        height: 40,
      );

  Widget _title(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hotel zielona rózaa",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                textScaleFactor: Scale.textScale(width, 1.5),
              ),
              const SizedBox(height: Insets.xs),
              Text(
                "polska, Poznań",
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.grey),
                textScaleFactor: Scale.textScale(width, 1.5),
              ),
              const SizedBox(height: Insets.xs),
              _stars(width),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: NumberBox(number: 3.7, textPadding: 5, textScale: 1.3),
          ),
        ),
      ],
    );
  }

  Widget _stars(double width) {
    return RatingBar(
      itemCount: 5,
      initialRating: 3.5,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures: true,
      itemSize: 25 * Scale.textScale(width, 1.3),
      ratingWidget: RatingWidget(
        empty:
            Icon(Icons.star_border_rounded, color: InsetsColors.emptyStarColor),
        half: Icon(Icons.star_half_rounded, color: InsetsColors.halfStarColor),
        full: Icon(Icons.star_rounded, color: InsetsColors.fullStarColor),
      ),
      onRatingUpdate: (value) {},
    );
  }

  Widget _price(int priceUnit, int nights, int rooms, int adults, int? kids,
      double width) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              blurRadius: 10,
              spreadRadius: 2,
              color: Colors.grey,
              offset: Offset(7, 7))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(Insets.s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Price for $nights nights, $rooms rooms",
              textScaleFactor: Scale.textScale(width, 1.3),
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: Insets.xs),
            Text(
              "PLN ${priceUnit * nights}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              textScaleFactor: Scale.textScale(width, 1.5),
            ),
            const SizedBox(height: Insets.xs),
            Text(
              "Includes fees and taxes",
              textScaleFactor: Scale.textScale(width, 1.3),
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summary(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Summary",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          textScaleFactor: Scale.textScale(width, 1.5),
        ),
        const SizedBox(height: Insets.xs),
        Text(
          "Hotel Traffic Poznań Stare Miasto zlokalizowany jest w centrum Poznania. Dysponuje on pokojami z bezpłatnym WiFi oraz czynną przez całą dobę recepcją. Obiekt Hotel Altus Poznań Old Town, położony w miejscowości Poznań, oferuje usługę błyskawicznego zameldowania i wymeldowania, zakwaterowanie w pokojach dla alergików, centrum fitness, bezpłatne WiFi...",
          textAlign: TextAlign.justify,
          overflow: readMore ? TextOverflow.ellipsis : null,
          textScaleFactor: Scale.textScale(width, 1.3),
          maxLines: readMore ? 4 : null,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  readMore = !readMore;
                  setState(() {});
                },
                child: Text(readMore ? "Show more" : "Show less")),
          ],
        )
      ],
    );
  }
}
