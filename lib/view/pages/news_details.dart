import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_cup_qatar_2022/data/models/appmodels/news.dart';
import 'package:world_cup_qatar_2022/logic/controllers/scraping_controller.dart';
import 'package:world_cup_qatar_2022/utils/values/colors.dart';
import 'package:world_cup_qatar_2022/utils/values/dimens.dart';
import 'package:world_cup_qatar_2022/utils/values/themes.dart';
import 'package:world_cup_qatar_2022/view/widgets/animations/fade_in_widget.dart';
import 'package:world_cup_qatar_2022/view/widgets/app_background.dart';
import 'package:world_cup_qatar_2022/view/widgets/loading_builder.dart';

class NewsDetailsPage extends StatelessWidget {

  const NewsDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppDimens.run(16)),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: GetBuilder<ScrapingController>(
                  builder: (controller){
                    News newsItem = controller.news[controller.currentNewsIndex];
                    return Column(
                      children: [
                        ///Image and ArrowBack
                        FadeInWidget(
                          child: Stack(
                            children: [
                              ///Image
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(AppDimens.run(16))),
                                child: Image.network(newsItem.image?? '', fit: BoxFit.cover,),
                              ),
                              ///Back Icon
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(AppDimens.run(16)), bottomRight: Radius.circular(AppDimens.run(16))),
                                ),
                                child: IconButton(
                                  onPressed: (){
                                    Get.back();
                                  },
                                  icon: const Icon(Icons.arrow_back_rounded, color: AppColors.white,),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppDimens.run(8),),

                        ///Title
                        FadeInWidget(
                          child: Text(
                            newsItem.title?? '',
                            style: AppTextStyles.titleDetailsNewsItem,
                            maxLines: 100,
                          ),
                        ),
                        SizedBox(height: AppDimens.run(32),),


                        Builder(
                          builder: (context) {
                            if(newsItem.articleItems.isNotEmpty){
                              return ListView.builder(
                                itemBuilder: (context, index) => Container(
                                  margin: EdgeInsets.only(bottom: AppDimens.run(16.0)),
                                  child: FadeInWidget(
                                    child: Builder(
                                      builder: (context) {
                                        if(newsItem.articleItems[index] != null){
                                          String articleItem = newsItem.articleItems[index]!;
                                          if(articleItem.startsWith('http')){
                                            return ClipRRect(
                                              borderRadius: BorderRadius.all(Radius.circular(AppDimens.run(16))),
                                              child: Image.network(articleItem?? '', fit: BoxFit.cover,),
                                            );
                                          }
                                          return Text(
                                            articleItem?? '',
                                            style: AppTextStyles.bodyDetailsNewsItem,
                                            maxLines: 100,
                                          );
                                        }
                                        return const SizedBox();

                                      },
                                    ),
                                  ),
                                ),
                                primary: false,
                                shrinkWrap: true,
                                itemCount: newsItem.articleItems.length,
                              );
                            }
                            return const FadeInWidget(duration: Duration(milliseconds: 500,), child: Center(child: LoadingBuilder(),),);
                          },
                        ),
                        SizedBox(height: AppDimens.run(16.0),),


                      ],
                    );

                  }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
