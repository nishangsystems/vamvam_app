import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/responsiveHelper.dart';
import '../../providers/bannerProvider.dart';
import '../../utils/apiConstant.dart';
import '../../utils/imageResources.dart';

Widget get commonSliderSection => Consumer<BannerProvider>(
    builder: (context, banner, child) => banner.bannertList.isNotEmpty
        ? SizedBox(
            height: ResponsiveHelper.height(context) * 0.28,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                CarouselSlider.builder(
                    itemCount: banner.bannertList.length,
                    options: CarouselOptions(
                      onPageChanged: (index, position) =>
                          banner.setActiveIndex(index),
                      viewportFraction: 1,
                      aspectRatio: 16 / 8,
                      autoPlay: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                    ),
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return Container(
                        height: 120,
                        width: ResponsiveHelper.width(context),
                        padding: EdgeInsets.all(14),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: FancyShimmerImage(
                              imageUrl:
                                  '${ApiConstant.baseUrl}/${banner.bannertList[itemIndex].image}',
                              boxFit: BoxFit.cover,
                              errorWidget:
                                  Image.asset(ImageResources.bannerImage),
                            )),
                      );
                    }),
                Center(
                  child: CarouselIndicator(
                    count: banner.bannertList.length,
                    activeColor: Color(0xff0875C7),
                    color: Color(0xff0875C7).withOpacity(0.5),
                    width: 20,
                    height: 2,
                    index: banner.activeIndex,
                  ),
                ),
              ],
            ),
          )
        : SizedBox());
