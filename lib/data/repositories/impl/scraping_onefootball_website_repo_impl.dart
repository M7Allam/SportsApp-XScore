import 'package:html/dom.dart' as dom;

abstract class ScrapingOneFootballWebsiteRepoImpl{

  Future<dom.Document> getHtmlPage(String url);

  List<String> getListStringOfSelector(dom.Document html, String selector);
  List<String?> getListStringOfSelectorWithAttribute(dom.Document html, String selector, String attribute);






}