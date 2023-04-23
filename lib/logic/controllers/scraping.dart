import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:world_cup_qatar_2022/data/services/scraping_onefootball_website/scraping_onefootball_website.dart';

class Scraping{

  Future scrapingMatchDetails() async{
    debugPrint('@TESTSCRAP STARTING....');
    http.get(Uri.parse('https://onefootball.com/en/match/2281899/')).then((value) {
      debugPrint('@SCRAPING THEN....');
      dom.Document html = dom.Document.html(value.body);

      ///SectionsName
      final names = html.querySelectorAll('div > div > p.title-8-medium.match-stats__stat-title')
          .map((e) => e.innerHtml.trim())
          .toList();
      debugPrint('@TESTSCRAP names size ${names.length}');
      for(String item in names){
        debugPrint('@TESTSCRAP SUCCESS names $item');

      }

      ///SectionsData
      final data = html.querySelectorAll('div > div > p.title-7-bold.match-stats__stat-value')
          .map((e) => e.innerHtml.trim())
          .toList();
      debugPrint('@TESTSCRAP data size ${data.length}');
      for(String item in data){
        debugPrint('@TESTSCRAP SUCCESS data $item');
      }


    }).catchError((error){
      debugPrint('@TESTSCRAP ERROR: ${error.toString()}');
    });


  }

  Future scrapingNews() async{
    debugPrint('@TESTSCRAP STARTING....');
    http.get(Uri.parse('https://onefootball.com/en/competition/fifa-world-cup-12')).then((value) {
      debugPrint('@SCRAPING THEN....');
      dom.Document html = dom.Document.html(value.body);


      ///News Titles
      final titles = html.querySelectorAll('div.teaser__content > h3.teaser__title')
          .map((e) => e.innerHtml.trim())
          .toList();
      debugPrint('@TESTSCRAP titles size ${titles.length}');
      for(String item in titles){
        debugPrint('@TESTSCRAP SUCCESS titles $item');

      }


      ///News previews
      final previews = html.querySelectorAll('div.teaser__content > p.teaser__preview')
          .map((e) => e.innerHtml.trim())
          .toList();
      debugPrint('@TESTSCRAP previews size ${previews.length}');
      for(String item in previews){
        debugPrint('@TESTSCRAP SUCCESS previews $item');

      }


      ///News images
      final images = html.querySelectorAll('div > picture > img.of-image__img.teaser__img')
          .map((e) => e.attributes['src'])
          .toList();
      debugPrint('@TESTSCRAP images size ${images.length}');
      for(String? item in images){
        debugPrint('@TESTSCRAP SUCCESS images $item');

      }



      ///News Link
      final links = html.querySelectorAll('div > a.teaser__link')
          .map((e) => e.attributes['href'])
          .toList();
      debugPrint('@TESTSCRAP links size ${links.length}');
      for(String? item in links){
        item = 'https://onefootball.com$item';
        debugPrint('@TESTSCRAP SUCCESS links $item');
      }


    }).catchError((error){
      debugPrint('@TESTSCRAP ERROR: ${error.toString()}');
    });


  }

  Future scrapingNewsDetails() async{
    debugPrint('@TESTSCRAP STARTING....');
    http.get(Uri.parse('https://onefootball.com/en/news/morocco-vs-belgium-why-did-yassine-bounou-pull-out-of-world-cup-clash-36310873')).then((value) {
      debugPrint('@SCRAPING THEN....');
      dom.Document html = dom.Document.html(value.body);



      ///News paragraphs
      final paragraphs = html.querySelectorAll('div.ArticleParagraph_articleParagraph__MkAim')
          .map((e) => e.innerHtml.trim())
          .toList();
      debugPrint('@TESTSCRAP paragraphs size ${paragraphs.length}');

      ///NewFilterTags
      List<String> filterParagraphs = [];
      for(String paragraphItem in paragraphs){
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

      for(int i=0; i<filterParagraphs.length; i++){
        debugPrint('@TESTSCRAP Paragraph ${paragraphs[i]}');
        debugPrint('@TESTSCRAP Filter ${filterParagraphs[i]}');
        debugPrint('@TESTSCRAP *********************');
      }




      /*
      //Filter
      int counter = 0;
      for(String item in paragraphs){
        //<p>
        item = item.substring(3, item.length-4);

        //&nbsp;
        if(item.contains('&nbsp;')){
          final split = item.split('&nbsp;');
          item = '';
          for(String s in split){
            item += s;
          }
        }



        //href
        /*
        if(item.contains('<a href')){
          final splitList = item.split('<a href');
          String splitStr = '';
          for(String s in splitList){
            splitStr += s;
          }

          /*
          bool isLoop = true;
          while(isLoop){
            if(splitStr.contains('=')){
              int start = splitStr.indexOf('=');
              int end = splitStr.indexOf('>');
              String sub1 = splitStr.substring(0, start);
              String sub2 = splitStr.substring(end+1, splitStr.length);
              splitStr = sub1 + sub2;

              final split = splitStr.split('</a>');
              splitStr = '';
              for(String s in split){
                splitStr += s;
              }
            } else {
              isLoop = false;
            }
          }
*/

          /*
          final split = splitStr.split('</a>');
          item = '';
          for(String s in split){
            item += s;
          }*/

        }*/




        debugPrint('@TESTSCRAP SUCCESS paragraphs $item');
        paragraphs[counter] = item;
        counter++;
      }
*/


      /*
      ///News Images
      final images = html.querySelectorAll('div.XpaLayout_xpaLayoutContainerGridItemComponents__RvIml > div.ImageWithSets_of-image__W9T4F > picture.ImageWithSets_of-image__picture__IHP7O > img')
          .map((e) => e.attributes['src'])
          .toList();
      debugPrint('@TESTSCRAP images size ${images.length}');
      for(String? item in images){
        debugPrint('@TESTSCRAP SUCCESS images $item');

      }
*/

      /*
      ///News Article Items
      final articles = html.querySelectorAll('div.XpaLayout_xpaLayoutContainerGridItemComponents__RvIml > div')
          .map((e) => e.innerHtml.trim())
          .toList();
      debugPrint('@TESTSCRAP articles size ${articles.length}');

      List<String> articleItems = [];
      int paragraphsCounter = 0;
      int imagesCounter = 0;
      for(int i=0; i<paragraphs.length+images.length; i++){
        if(articles[i].startsWith('<p>')){
          articleItems.add(paragraphs[paragraphsCounter]);
          paragraphsCounter++;
        }
        if(articles[i].startsWith('<picture')){
          if(images[imagesCounter] != null){
            articleItems.add(images[imagesCounter]!);
          }
          imagesCounter++;
        }
      }

      debugPrint('@TESTSCRAP SUCCESS size articleItems ${articleItems.length}');
      for(String item in articleItems){
        debugPrint('@TESTSCRAP SUCCESS articleItems $item');
      }
*/

    }).catchError((error){
      debugPrint('@TESTSCRAP ERROR: ${error.toString()}');
    });


  }

}