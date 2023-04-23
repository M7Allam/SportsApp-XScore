import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_cup_qatar_2022/data/models/appmodels/news.dart';
import 'package:world_cup_qatar_2022/data/repositories/scraping_onefootball_website_repository.dart';
import 'package:world_cup_qatar_2022/data/services/scraping_onefootball_website/scraping_onefootball_website.dart';
import 'package:world_cup_qatar_2022/logic/controllers/scraping.dart';

class ScrapingController extends GetxController{

  //region:: Variables
  final _repo = ScrapingOneFootballWebsiteRepository();

  int _currentNewsIndex = -1;
  int get currentNewsIndex => _currentNewsIndex;

  List<News> _news = [];
  List<News> get news => _news;

  //endregion

  //region:: Lifecycle
  @override
  void onInit() {
    _getNews();
    //Scraping().scrapingNews();
    super.onInit();
  }
  //endregion

  //region:: States
  void emitCurrentNewsIndex(int value){
    _currentNewsIndex = value;
    _getNewsDetails(_currentNewsIndex);
    update();
  }

  void emitNews(List<News> value){
    _news = [];
    _news.addAll(value);
    update();
  }

  void emitNewsItem(News value, int index){
    _news[index] = value;
    update();
  }

//endregion

  //region:: Methods

  //region:: Scraping News
  void _getNews(){
    _repo.getHtmlPage(ScrapingOneFootballWebsite.competitionWorldCupUrl).then((html) {
      List<String> newsTitle = _filterTags(_repo.getListStringOfSelector(html, ScrapingOneFootballWebsite.selectorNewsTitle));
      List<String> newsPreviews = _filterTags(_repo.getListStringOfSelector(html, ScrapingOneFootballWebsite.selectorNewsPreview));
      List<String?> newsImages = _repo.getListStringOfSelectorWithAttribute(html, ScrapingOneFootballWebsite.selectorNewsImage, 'srcset');
      List<String?> newsLinks = _updateNewsLinks(_repo.getListStringOfSelectorWithAttribute(html, ScrapingOneFootballWebsite.selectorNewsLink, 'href'));


      List<News> news = [];
      for(int i=0; i<newsTitle.length; i++){
        News item = News(
          title: newsTitle[i],
          preview: newsPreviews[i],
          image: newsImages[i],
          link: newsLinks[i],
          articleItems: [],
        );
        news.add(item);
      }
      emitNews(news);

      //_printNewsList();


    }).catchError((error){
      debugPrint('@SCRAPING getNews ERROR: ${error.toString()}');
    });
  }

  List<String?> _updateNewsLinks(List<String?> links){
    List<String?> updateLinks = [];
    for(String? item in links){
      updateLinks.add('https://onefootball.com$item');
    }
    return updateLinks;
  }

  void _getNewsDetails(int newsIndex){
    News item = _news[newsIndex];
    _repo.getHtmlPage(item.link?? '').then((html) {
      List<String> newsDetailsParagraphs =_filterTags(_repo.getListStringOfSelector(html, ScrapingOneFootballWebsite.selectorDetailsNewsArticleParagraphs));
      List<String?> newsDetailsImages = _repo.getListStringOfSelectorWithAttribute(html, ScrapingOneFootballWebsite.selectorDetailsNewsArticleImages, 'src');
      List<String> newsOriginArticleItems = _repo.getListStringOfSelector(html, ScrapingOneFootballWebsite.selectorDetailsNewsArticleItems);
      List<String> newsDetailsArticleItems = _filterArticleItems(newsDetailsParagraphs, newsDetailsImages, newsOriginArticleItems);

      item.articleItems = [];
      item.articleItems.addAll(newsDetailsArticleItems);
      emitNewsItem(item, newsIndex);

    }).catchError((error){
      debugPrint('@SCRAPING getNewsDetails ERROR: ${error.toString()}');
    });
  }

  List<String> _filterTags(List<String> value){
    List<String> filterParagraphs = [];
    for(String paragraphItem in value){
      int addState = 0;
      String filterStr = '';
      for(String char in paragraphItem.characters){
        if(addState == 2){
          addState = 0;
        }
        if(char == '<'){
          addState = 1;
        } else if(char == '>'){
          addState = 2;
        }
        if(addState == 0){
          filterStr += char;
        }
      }
      filterParagraphs.add(filterStr);
    }
    return filterParagraphs;
  }

  List<String> _filterArticleItems(List<String> paragraphs, List<String?> images, List<String> originArticle){
    List<String> articleItems = [];
    int paragraphsCounter = 0;
    int imagesCounter = 0;
    for(int i=0; i<paragraphs.length+images.length; i++){
      if(originArticle[i] != null){
        String item = originArticle[i]!;
        if(item.startsWith('<p>')){
          articleItems.add(paragraphs[paragraphsCounter]!);
          paragraphsCounter++;
        }
        if(item.startsWith('<picture')){
          if(images[imagesCounter] != null){
            articleItems.add(images[imagesCounter]!);
          }
          imagesCounter++;
        }
      }
    }

    return articleItems;
  }

  void _printNewsList(){
    for(News item in news){
      debugPrint('@TESTSCRAP getNews title: ${item.title}');
      debugPrint('@TESTSCRAP getNews preview: ${item.preview}');
      debugPrint('@TESTSCRAP getNews image: ${item.image}');
      debugPrint('@TESTSCRAP getNews link: ${item.link}');
    }
  }
  //endregion

  //region:: Scraping Matches Live

  //endregion

  //endregion



}