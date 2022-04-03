import 'package:flutter/material.dart';
import 'package:plypicker_interview/ui/constants.dart';
import 'package:provider/src/provider.dart';

import '../../models/data_model.dart';
import '../../shared_widgets/custom_app_bar.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    List<DataModel> fItems = context.watch<DataModel>().favourites;

    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: fItems.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(
                top: 6.0,
                left: 2.0,
                right: 20.0,
              ),
              child: Column(
                children: [
                  Divider(
                    thickness: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 73.0,
                            width: 60.0,
                            child: Image.network(
                              fItems[index].productImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${fItems[index].productName.toString()}',
                                style: StylingConstants.headline,
                              ),
                              Text(
                                '${fItems[index].brand.toString()}',
                                style: StylingConstants.subtitle,
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Rs. ${fItems[index].discountedPrice.toString()}',
                                style: StylingConstants.priceHeading,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.favorite_rounded,
                        color: Color(0xffFF0000),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
