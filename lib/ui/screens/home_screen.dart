import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:plypicker_interview/models/data_model.dart';
import 'package:provider/src/provider.dart';

import '../../data.dart';
import '../../shared_widgets/custom_app_bar.dart';
import '../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<DataModel>().initialData();

    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      appBar: const CustomAppBar(),
      body: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
          ),
          itemCount: localData.length,
          itemBuilder: (context, index) {
            final selectedItem =
                context.watch<DataModel>().initialData()[index];
            return SizedBox(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(selectedItem.productImage.toString()),
                      fit: BoxFit.fill,
                    )),
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedItem.productName.toString(),
                              style: StylingConstants.headline,
                            ),
                            StatefulBuilder(builder: (context, setState) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedItem.isFavourite =
                                        !selectedItem.isFavourite;
                                  });
                                  print('${selectedItem.isFavourite} $index');

                                  if (selectedItem.isFavourite == true) {
                                    context
                                        .read<DataModel>()
                                        .favourites
                                        .add(selectedItem);
                                  } else {
                                    context
                                        .read<DataModel>()
                                        .favourites
                                        .remove(selectedItem);
                                  }
                                },
                                child: selectedItem.isFavourite == true
                                    ? const Icon(
                                        Icons.favorite_rounded,
                                        color: Color(0xffFF0000),
                                        size: 20,
                                      )
                                    : const Icon(
                                        Icons.favorite_outline_rounded,
                                        size: 20,
                                      ),
                              );
                            }),
                          ],
                        ),
                        Text(
                          selectedItem.brand.toString(),
                          style: StylingConstants.subtitle,
                        ),
                        Row(
                          children: [
                            Text(
                              'Rs. ${selectedItem.discountedPrice.toString()}  ',
                              style: StylingConstants.priceHeading,
                            ),
                            Text(
                              'Rs. ${selectedItem.originalPrice.toString()}  ',
                              style: StylingConstants.discountedPriceHeading,
                            ),
                            Text(
                              '-${selectedItem.discountPercentage.toString()}%',
                              style: StylingConstants.discountHeading,
                            ),
                          ],
                        ),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 12.0,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 0.1),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Color(0xffFF7253),
                          ),
                          onRatingUpdate: (rating) {
                            print('$rating $index');
                          },
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            );
          }),
    );
  }
}
