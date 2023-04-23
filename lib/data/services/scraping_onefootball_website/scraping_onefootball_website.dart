class ScrapingOneFootballWebsite{
  static const String todayMatchesUrl = 'https://onefootball.com/en/matches/';
  static const String competitionWorldCupUrl = 'https://onefootball.com/en/competition/fifa-world-cup-12/';


  static const String selectorTeamsName = 'div > span.title-8-medium.simple-match-card-team__name';
  static const String selectorScores = 'div > span.title-7-bold.simple-match-card-team__score';
  static const String selectorMinutes = 'div.simple-match-card__match-content > span';

  static const String selectorNewsTitle = 'div.teaser__content > h3.teaser__title';
  static const String selectorNewsPreview = 'div.teaser__content > p.teaser__preview';
  //static const String selectorNewsImage = 'div > picture > img.of-image__img.teaser__img';
  static const String selectorNewsImage = 'div.teaser__img-wrapper > of-image > div.of-image > picture.of-image__picture > source:nth-child(1)';
  static const String selectorNewsLink = 'div > a.teaser__link';

  static const String selectorDetailsNewsArticleItems = 'div.XpaLayout_xpaLayoutContainerGridItemComponents__RvIml > div';
  static const String selectorDetailsNewsArticleParagraphs = 'div.ArticleParagraph_articleParagraph__MkAim < p';
  static const String selectorDetailsNewsArticleImages = 'div.XpaLayout_xpaLayoutContainerGridItemComponents__RvIml > div.ImageWithSets_of-image__W9T4F > picture.ImageWithSets_of-image__picture__IHP7O > img';





}