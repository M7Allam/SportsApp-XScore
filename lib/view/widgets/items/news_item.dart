import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_cup_qatar_2022/data/models/appmodels/news.dart';
import 'package:world_cup_qatar_2022/logic/controllers/scraping_controller.dart';
import 'package:world_cup_qatar_2022/utils/values/colors.dart';
import 'package:world_cup_qatar_2022/utils/values/dimens.dart';
import 'package:world_cup_qatar_2022/utils/values/themes.dart';
import 'package:world_cup_qatar_2022/utils/routes/routes.dart';

class NewsItem extends StatelessWidget {

  final News item;
  final int index;


  const NewsItem({
    required this.item,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //TODO: gotoNewsDetailsPage
        Get.find<ScrapingController>().emitCurrentNewsIndex(index);
        Get.toNamed(AppRoutes.newsDetailsPage);
      },
      child: Container(
        width: AppDimens.run(220),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppDimens.run(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Image
            Expanded(
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(AppDimens.run(16)), topRight: Radius.circular(AppDimens.run(16)),),
                  child: Image.network(item.image?? '', fit: BoxFit.cover,),
                ),
              ),
            ),
            SizedBox(height: AppDimens.run(8),),

            ///Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.run(8.0)),
              child: Text(
                item.title?? '',
                style: AppTextStyles.titleNewsItem,
                maxLines: 2,
              ),
            ),
            SizedBox(height: AppDimens.run(4),),

            ///Preview
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.run(8.0)),
              child: Text(
                item.preview?? '',
                style: AppTextStyles.bodyPreviewNewsItem,
                maxLines: 3,
              ),
            ),
            SizedBox(height: AppDimens.run(8),),
          ],
        ),
      ),
    );
  }
}
