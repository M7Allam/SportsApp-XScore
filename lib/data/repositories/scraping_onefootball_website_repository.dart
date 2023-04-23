import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:world_cup_qatar_2022/data/repositories/impl/scraping_onefootball_website_repo_impl.dart';

class ScrapingOneFootballWebsiteRepository with ScrapingOneFootballWebsiteRepoImpl {

  @override
  Future<dom.Document> getHtmlPage(String url) async{
    http.Response response = await http.get(Uri.parse(url));
    return dom.Document.html(response.body);
  }

  @override
  List<String> getListStringOfSelector(dom.Document html, String selector) {
    return html.querySelectorAll(selector).map((e) => e.innerHtml.trim()).toList();
  }

  @override
  List<String?> getListStringOfSelectorWithAttribute(dom.Document html, String selector, String attribute) {
    return html.querySelectorAll(selector).map((e) => e.attributes[attribute]?.trim()).toList();
  }









  


}