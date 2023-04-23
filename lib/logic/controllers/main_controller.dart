import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_cup_qatar_2022/data/models/apimodels/time.dart';
import 'package:world_cup_qatar_2022/data/models/appmodels/table_team.dart';
import 'package:world_cup_qatar_2022/data/repositories/world_cup_api_repository.dart';
import 'package:world_cup_qatar_2022/data/models/appmodels/match.dart';
import 'package:world_cup_qatar_2022/data/models/apimodels/match.dart' as apiMatch;
import 'package:world_cup_qatar_2022/data/models/appmodels/group_standing.dart';
import 'package:world_cup_qatar_2022/data/models/apimodels/standing.dart' as apiStanding;
import 'package:world_cup_qatar_2022/data/models/appmodels/competition.dart';
import 'package:world_cup_qatar_2022/data/models/apimodels/competition.dart' as apiCompetition;
import 'package:world_cup_qatar_2022/data/models/appmodels/scorer.dart';
import 'package:world_cup_qatar_2022/data/models/apimodels/scorer.dart' as apiScorer;
import 'package:world_cup_qatar_2022/data/repositories/world_time_api_repository.dart';
import 'package:world_cup_qatar_2022/data/repositories/scraping_onefootball_website_repository.dart';
import 'package:world_cup_qatar_2022/data/services/notifications/local_notification_service.dart';
import 'package:world_cup_qatar_2022/data/services/scraping_onefootball_website/scraping_onefootball_website.dart';
import 'package:world_cup_qatar_2022/data/services/world_cup_api/constants.dart';
import 'package:world_cup_qatar_2022/logic/controllers/scraping.dart';
import 'package:world_cup_qatar_2022/utils/constants.dart';
import 'package:world_cup_qatar_2022/utils/enums/match.dart';
import 'package:world_cup_qatar_2022/utils/enums/stages.dart';
import 'package:world_cup_qatar_2022/utils/values/strings.dart';
import 'package:world_cup_qatar_2022/utils/values/assets.dart';
import 'package:vibration/vibration.dart';
import 'package:just_audio/just_audio.dart';


class MainController extends GetxController{

  final _repo = WorldCupApiRepository();
  final _timeRepo = WorldTimeApiRepository();
  final _scrapingRepo = ScrapingOneFootballWebsiteRepository();
  late final LocalNotificationService _localNotificationsService;


  //region:: Variables
  bool _isLoadingMatchdateMatches = false;
  DateTime _dateTime = DateTime.now();
  List<Match> _matches = [];
  final RxList<Match> _matchesToday = RxList<Match>();
  List<Match> _matchesByMatchdate = [];
  List<GroupStanding> _groupsStanding = [];
  List<GroupStanding> _groupsStandingToday = [];
  List<Scorer> _scorers = [];
  final List<String> _dropdownStages = ['Groups Stage', 'Round of 16', 'Quarter-Finals', 'Semi-Finals', 'Third place', 'Final'];
  Competition? _competition;
  int _currentMatchdateIndex = 0;
  int _currentStageIndex = 0;
  List<String> _dropdownMatchdateItems = [];
  List<Match> _matchesByStage = [];
  final AudioPlayer audioPlayerRefereeWhistle = AudioPlayer();
  final AudioPlayer audioPlayerGoalStadium = AudioPlayer();
  int _apiKeysCounter = 0;
  int counterScore = 0;
  int minutesTest = 46;


  //endregion

  //region:: Getter
  bool get isLoadingMatchdateMatches => _isLoadingMatchdateMatches;
  DateTime get currentDateTime => _dateTime;
  List<Match> get allMatches => _matches;
  RxList<Match> get matchesToday => _matchesToday;
  List<Match> get currentMatchdateMatches => _matchesByMatchdate;
  List<GroupStanding> get allGroupsStanding => _groupsStanding;
  List<GroupStanding> get groupsStandingOfTodayMatches => _groupsStandingToday;
  List<Scorer> get topScorers => _scorers;
  List<String> get dropdownStagesItems => _dropdownStages;
  Competition? get competition => _competition;
  int get currentMatchdateIndex => _currentMatchdateIndex;
  int get currentDropdownStageIndex => _currentStageIndex;
  List<String> get dropdownMatchdateItems => _dropdownMatchdateItems;
  List<Match> get filterMatchesByStage => _matchesByStage;
  //endregion

  //region:: emitStates
  void emitLoadingMatchdateMatches(){
    _isLoadingMatchdateMatches = !_isLoadingMatchdateMatches;
    update();
  }

  void emitMatchesList(List<Match> newMatches){
    _matches = [];
    _matches.addAll(newMatches);
    update();
  }

  void emitMatchesTodayList(List<Match> newMatches){
    _matchesToday.clear();
    _matchesToday.addAll(newMatches);
    //update();
  }

  void emitCurrentDateTime(DateTime newDateTime){
    _dateTime = newDateTime;
    update();
  }

  void emitCompetition(Competition competition){
    _competition = competition;
    update();
  }

  void emitAllGroupsStanding(List<GroupStanding> newGroupsStanding){
    _groupsStanding = newGroupsStanding;
    update();
  }

  void emitGroupsStandingOfTodayMatches(List<GroupStanding> newGroupsStanding){
    _groupsStandingToday = newGroupsStanding;
    update();
  }

  void emitTopScorers(List<Scorer> newScorers){
    _scorers = newScorers;
    update();
  }

  void emitCurrentMatchdateMatches(List<Match> newMatches){
    _matchesByMatchdate = [];
    _matchesByMatchdate.addAll(newMatches);
    update();
  }

  void emitCurrentMatchdateIndex(int value){
    _currentMatchdateIndex = value;
    update();
    List<Match> currentMatchdayMatches = _filterMatchesByMatchdate(_currentMatchdateIndex, _matches);
    emitCurrentMatchdateMatches(currentMatchdayMatches);
  }

  void emitCurrentStageDropdownIndex(int value){
    _currentStageIndex = value;
    update();
    List<Match> currentMatchesByStage = _filterMatchesByStage(_getCurrentStageFromDropdownItem(_dropdownStages[_currentStageIndex]));
    emitFilterMatchesByStage(currentMatchesByStage);
  }

  void emitDropdownMatchdateItems(List<String> newList){
    _dropdownMatchdateItems = [];
    _dropdownMatchdateItems.addAll(newList);
    update();
  }

  void emitFilterMatchesByStage(List<Match> newList){
    _matchesByStage = [];
    _matchesByStage.addAll(newList);
    update();
  }



  //endregion

  //region:: Lifecycle
  @override
  void onInit() {
    _localNotificationsService = LocalNotificationService();
    _localNotificationsService.initialize();
    _initAudioPlayers();
    getTime(); //cycle: getTime, getCompetition, getAllGroupsStanding, getMatchesToday, getGroupsStandingMatchesToday
    //getAllMatches();
    //getTopScorers, when click on TopScorers screen

    Timer.periodic(const Duration(seconds: 10), (timer) {
      //if(DateTime.now().minute == minutesTest+2) counterScore++;
      _checkIsLiveMatchesForScraping();
    });
    Timer.periodic(const Duration(minutes: 2), (timer) {
      _checkMatchesIsStarted();
    });


    super.onInit();
  }
  //endregion

  //region:: Methods
  void getCompetition(){
    debugPrint('@GET getCompetition STARTING....');
    _repo.getCompetition(WorldCupApiConstants.apiKeys[_apiKeysCounter]).then((value){
      final apiCompetition.Competition apiCompetitionModel = apiCompetition.Competition.fromMap(value);
      final Competition competition = Competition.fromApi(apiCompetitionModel);
      emitCompetition(competition);
      debugPrint('@GET getCompetition SUCCESS....');
      if(competition.currentMatchday < 4){
        //getAllMatches();
        getAllGroupsStanding();
      }
    }).catchError((error){
      debugPrint('@GET getCompetition ERROR: ${error.toString()}');
      //Recursion
      _changeApiKeysCounter();
      getCompetition();
    });
  }

  void getAllMatches() {
    debugPrint('@GET getAllMatches STARTING....');
    emitLoadingMatchdateMatches();
    _repo.getAllMatches(WorldCupApiConstants.apiKeys[_apiKeysCounter]).then((value){
      List<apiMatch.Match> apiMatches = [];
      for(dynamic item in value){
        apiMatches.add(apiMatch.Match.fromMap(item));
      }

      List<Match> matches = [];
      for(apiMatch.Match item in apiMatches){
        matches.add(Match.fromApi(item));
      }
      emitMatchesList(matches);
      debugPrint('@GET getAllMatches SUCCESS....');
      List<Match> currentMatchdateMatches = _filterMatchesByMatchdate(_currentMatchdateIndex, matches);
      emitLoadingMatchdateMatches();
      emitCurrentMatchdateMatches(currentMatchdateMatches);
    }).catchError((error){
      debugPrint('@GET getAllMatches ERROR: ${error.toString()}');
      //Recursion
      _changeApiKeysCounter();
      getAllMatches();

    });
  }

  void getMatchesToday(String today) {
    debugPrint('@GET getMatchesToday STARTING....');
    _repo.getMatchesByDate(WorldCupApiConstants.apiKeys[_apiKeysCounter], today).then((value){
      List<apiMatch.Match> apiMatches = [];

      for(dynamic item in value){
        apiMatches.add(apiMatch.Match.fromMap(item));
      }

      List<Match> matches = [];
      for(apiMatch.Match item in apiMatches){
        matches.add(Match.fromApi(item));
      }

      /*
      matches[2].status = MatchStatus.IN_PLAY;
      matches[2].score.homeScore = 0;
      matches[2].score.awayScore = 0;
      */

      emitMatchesTodayList(matches);

      debugPrint('@GET getMatchesToday SUCCESS....');
      if(_competition!.currentMatchday < 4) getGroupsStandingByMatches(matches, _groupsStanding);


    }).catchError((error){
      debugPrint('@GET getMatchesToday ERROR: ${error.toString()}');
      //Recursion
      _changeApiKeysCounter();
      getMatchesToday(today);
    });
  }

  void getGroupsStandingByMatches(List<Match> todayMatches, List<GroupStanding> allGroupsStanding) {
    debugPrint('@GET getGroupsStandingByMatches STARTING....');
    Map<String, GroupStanding> groupsStandingMap = {};
    for(Match match in todayMatches){
      for(GroupStanding groupItem in allGroupsStanding){
        if(match.group!.name == groupItem.group.name){
          groupsStandingMap.putIfAbsent(groupItem.group.name, ()=> groupItem);
          break;
        }
      }
    }

    List<GroupStanding> todayGroupsStanding = [];
    groupsStandingMap.forEach((key, value) {
      todayGroupsStanding.add(value);
    });

    for(GroupStanding standing in todayGroupsStanding){
      standing.table = _setTeamsIsInLiveMatch(todayMatches, standing.table);
    }

    emitGroupsStandingOfTodayMatches(todayGroupsStanding);
    debugPrint('@GET getGroupsStandingByMatches SUCCESS....');

  }

  void getAllGroupsStanding() {
    debugPrint('@GET getAllGroupsStanding STARTING....');
    _repo.getAllStandings(WorldCupApiConstants.apiKeys[_apiKeysCounter]).then((value){
      List<apiStanding.Standing> apiStandings = [];
      for(dynamic item in value){
        apiStandings.add(apiStanding.Standing.fromMap(item));
      }

      List<GroupStanding> groupsStandings = [];
      for(apiStanding.Standing item in apiStandings){
        groupsStandings.add(GroupStanding.fromApi(item));
      }

      debugPrint('@GET getAllGroupsStanding SUCCESS....');
      emitAllGroupsStanding(groupsStandings);
      getMatchesToday('${currentDateTime.year}-${currentDateTime.month}-${currentDateTime.day}');

    }).catchError((error){
      debugPrint('@GET getAllGroupsStanding ERROR: ${error.toString()}');
      //Recursion
      _changeApiKeysCounter();
      getAllGroupsStanding();

    });
  }

  void getTopScorers() {
    debugPrint('@GET getTopScorers STARTING....');
    _repo.getTopScorers(WorldCupApiConstants.apiKeys[_apiKeysCounter]).then((value){
      List<apiScorer.Scorer> apiScorers = [];
      for(dynamic item in value){
        apiScorers.add(apiScorer.Scorer.fromMap(item));
      }

      List<Scorer> scorers = [];
      for(apiScorer.Scorer item in apiScorers){
        scorers.add(Scorer.fromApi(item));
      }
      emitTopScorers(scorers);
      debugPrint('@GET getTopScorers SUCCESS....');

    }).catchError((error){
      debugPrint('@GET getTopScorers ERROR: ${error.toString()}');
      //Recursion
      _changeApiKeysCounter();
      getTopScorers();

    });
  }

  List<Match> _filterMatchesByStage(Stages stage){
    List<Match> filterMatchesByStage = [];
    int limit = -1;
    switch(stage){
      case Stages.LAST_16:
        limit = 8;
        break;
      case Stages.QUARTER_FINALS:
        limit = 4;
        break;
      case Stages.SEMI_FINALS:
        limit = 2;
        break;
      case Stages.THIRD_PLACE:
      case Stages.FINAL:
      limit = 1;
      break;
    }

    for(Match match in allMatches){
      if(match.stage == stage){
        filterMatchesByStage.add(match);
      }
      if(filterMatchesByStage.length == limit){
        break;
      }
    }

    return filterMatchesByStage;
  }

  Stages _getCurrentStageFromDropdownItem(String dropdownItem){
    switch(dropdownItem){
      case 'Round of 16':
        return Stages.LAST_16;
      case 'Quarter-Finals':
        return Stages.QUARTER_FINALS;
      case 'Semi-Finals':
        return Stages.SEMI_FINALS;
      case 'Third place':
        return Stages.THIRD_PLACE;
      case 'Final':
        return Stages.FINAL;
      case 'Groups Stage':
      default:
        return Stages.GROUP_STAGE;

    }
  }

  List<TableTeam> _setTeamsIsInLiveMatch(List<Match> todayMatches, List<TableTeam> tableTeamsGroupStandingToday){
    int counterIsLive = 0;
    for(Match todayMatch in todayMatches){
      counterIsLive = 0;
      if(todayMatch.status == MatchStatus.IN_PLAY || todayMatch.status == MatchStatus.PAUSED){
        if(counterIsLive == 2) continue;
        for(TableTeam tableTeam in tableTeamsGroupStandingToday){
          if(todayMatch.homeTeam.id == tableTeam.team.id || todayMatch.awayTeam.id == tableTeam.team.id){
            tableTeam.isInLiveMatch = true;
            counterIsLive++;
          }
        }
      }
    }
    return tableTeamsGroupStandingToday;
  }

  void getTime(){
    debugPrint('@GET getTime STARTING....');
    _timeRepo.getTime().then((value) {
      Time time = Time.fromMap(value);
      DateTime dateTime = DateTime.parse(time.datetime).toLocal();
      emitCurrentDateTime(dateTime);
      debugPrint('@GET getTime SUCCESS....');
      getCompetition();
      _setFirstValueOfCurrentMatchdate(dateTime);
    }).catchError((error) {
      debugPrint('@GET getTime ERROR: ${error.toString()}');
      getCompetition();
    });
  }

  void _setFirstValueOfCurrentMatchdate(DateTime dateTime){
    _fillDropdownMatchDateItems();
    String monthStr = monthsShortNames[dateTime.month]?? '';
    String value = '${AppStrings.matchday} - ${dateTime.day} $monthStr';
    int index = _dropdownMatchdateItems.indexOf(value);
    if(index != -1) emitCurrentMatchdateIndex(index);
  }

  List<Match> _filterMatchesByMatchdate(int matchdateIndex, List<Match> allMatches){
    List<Match> matchesFilter = [];
    String dropdownDateItem = _dropdownMatchdateItems[matchdateIndex];
    String dropdownItemSplit = dropdownDateItem.split('-')[1].trim();
    List<String> dropdownValueSplit = dropdownItemSplit.split(' ');
    int dropdownDay = int.parse(dropdownValueSplit[0]);
    String dropdownMonthStr = dropdownValueSplit[1];
    int dropdownMonth = 11;
    if(dropdownMonthStr == 'Dec') dropdownMonth = 12;

    if(DateTime.now().month == dropdownMonth && DateTime.now().day == dropdownDay){
      matchesFilter.addAll(_matchesToday);
    }else {
      for(Match match in allMatches){
        if(match.dateTime!.day == dropdownDay && match.dateTime!.month == dropdownMonth){
          matchesFilter.add(match);
        }
      }
    }


    return matchesFilter;

  }

  void _fillDropdownMatchDateItems(){
    List<String> items = [];
    int day = 20;
    String month = 'Nov';
    for(int i = 0; i<29; i++){
      if(day == 31){
        day = 1;
        month = 'Dec';
      }
      items.add('${AppStrings.matchday} - $day $month');
      day++;
    }
    emitDropdownMatchdateItems(items);

  }

  void _checkIsLiveMatchesForScraping(){
    int index = 0;
    for(Match match in _matchesToday){
      if(match.status == MatchStatus.IN_PLAY || match.status == MatchStatus.PAUSED){
        _getOneFootballWebsiteHtmlPage(match, index);
      }
      index++;
    }
  }

  void _getOneFootballWebsiteHtmlPage(Match match, int index){
    debugPrint('@SCRAPING onefootball.com STARTING....');
    _scrapingRepo.getHtmlPage(ScrapingOneFootballWebsite.todayMatchesUrl).then((html) {
      List<String?> teams = _scrapingRepo.getListStringOfSelector(html, ScrapingOneFootballWebsite.selectorTeamsName);
      for(String? item in teams){
        debugPrint('@SCRAPING SUCCESS names $item');
      }

      List<String?> scores = _scrapingRepo.getListStringOfSelector(html, ScrapingOneFootballWebsite.selectorScores);
      for(String? item in scores){
        debugPrint('@SCRAPING SUCCESS scores $item');
      }

      List<String?> minutes = _scrapingRepo.getListStringOfSelector(html, ScrapingOneFootballWebsite.selectorMinutes);
      for(String? item in minutes){
        debugPrint('@SCRAPING SUCCESS minutes $item');
      }


      _getMatchesLiveScoreAndMinutes(match, index, teams, scores, minutes);


    }).catchError((error){
      debugPrint('@SCRAPING ERROR: ${error.toString()}');
    });
  }

  void _getMatchesLiveScoreAndMinutes(Match match, int index, List<String?> teams, List<String?> scores, List<String?> minutes){
    if(match.status == MatchStatus.IN_PLAY || match.status == MatchStatus.PAUSED){
      String homeScoreStr = scores[index*2]!;
      String awayScoreStr = scores[index*2+1]!;
      String liveMinutesStr = minutes[index]!;
      int stop = 0;
      int counter = 0;

      for(String? team in teams){
        if(team == match.homeTeam.fullName){
          homeScoreStr = scores[counter]!;
          stop++;
        }
        if(team == match.awayTeam.fullName){
          awayScoreStr = scores[counter]!;
          stop++;
        }
        if(stop == 2){
          break;
        }
        counter++;
      }

      /*
      homeScoreStr = scores[index*2]!;
      awayScoreStr = scores[index*2+1]!;
      liveMinutesStr = minutes[index]!;
      */
      debugPrint('@SCRAPING _getMatchesLiveScoreAndMinutes homeScore ${match.homeTeam.fullName} $homeScoreStr');
      debugPrint('@SCRAPING _getMatchesLiveScoreAndMinutes awayScore ${match.awayTeam.fullName} $awayScoreStr');
      debugPrint('@SCRAPING _getMatchesLiveScoreAndMinutes liveMinutes $liveMinutesStr');


      int homeScoreInt = match.score.homeScore?? 0;
      int awayScoreInt = match.score.awayScore?? 0;
      try{
        homeScoreInt = int.parse(homeScoreStr);
        awayScoreInt = int.parse(awayScoreStr);
      }catch(exception){
        debugPrint('@SCRAPING _getMatchesLiveScoreAndMinutes ERROR EXCEPTION int.parse:  ${exception.toString()}');
      }



      /*
      if(DateTime.now().minute < minutesTest) liveMinutesStr = '45\'';
      if(DateTime.now().minute == minutesTest) liveMinutesStr = 'Half time';
      if(DateTime.now().minute > minutesTest) liveMinutesStr = '60\'';
      if(DateTime.now().minute == minutesTest+2) awayScoreInt = counterScore;
      if(DateTime.now().minute == minutesTest+3) liveMinutesStr = 'Full time';
      */

      if(match.score.homeScore != homeScoreInt || match.score.awayScore != awayScoreInt || match.score.liveMinutes != liveMinutesStr){
        MatchStatus oldMatchStatus = match.status;
        if(liveMinutesStr.length < 15) {
          match.score.liveMinutes = liveMinutesStr;
          match.status = MatchStatus.IN_PLAY;
        }
        if(liveMinutesStr == 'Full time') match.status = MatchStatus.FINISHED;
        if(liveMinutesStr == 'Half time') match.status = MatchStatus.PAUSED;
        debugPrint('@SCRAPING _getMatchesLiveScoreAndMinutes MatchStatus ${match.status}');

        if(match.score.homeScore != homeScoreInt || match.score.awayScore != awayScoreInt || oldMatchStatus != match.status){
          Vibration.vibrate();
        }
        if(oldMatchStatus != match.status){
          audioPlayerRefereeWhistle.load();
          audioPlayerRefereeWhistle.play();
          String notificationBody = '';
          if(oldMatchStatus == MatchStatus.TIMED && match.status == MatchStatus.IN_PLAY) notificationBody = 'Kick-off the match';
          if(oldMatchStatus == MatchStatus.IN_PLAY && match.status == MatchStatus.PAUSED) notificationBody = 'End of the half time';
          if(oldMatchStatus == MatchStatus.PAUSED && match.status == MatchStatus.IN_PLAY) notificationBody = 'Start the second time';
          if(oldMatchStatus == MatchStatus.IN_PLAY && match.status == MatchStatus.FINISHED) notificationBody = 'Match ended with Score ${match.score.homeScore}-${match.score.awayScore}';
          _localNotificationsService.showNotification(
            id: 1,
            title: '${match.homeTeam.fullName} VS ${match.awayTeam.fullName}',
            body: notificationBody,
            icon: '@drawable/ic_stat_whitsle',
          );
        }
        if(match.score.homeScore != homeScoreInt || match.score.awayScore != awayScoreInt){
          audioPlayerGoalStadium.load();
          audioPlayerGoalStadium.play();
          String notificationBody = '';
          if(match.score.homeScore != homeScoreInt) notificationBody = '${match.homeTeam.fullName} scores a goooal!!! $homeScoreInt-$awayScoreInt at ${match.score.liveMinutes}';
          if(match.score.awayScore != awayScoreInt) notificationBody = '${match.awayTeam.fullName} scores a goooal!!! $homeScoreInt-$awayScoreInt at ${match.score.liveMinutes}';
          _localNotificationsService.showNotification(
            id: 2,
            title: '${match.homeTeam.fullName} VS ${match.awayTeam.fullName}',
            body: notificationBody,
            icon: '@drawable/ic_stat_goal',
          );
        }

        match.score.homeScore = homeScoreInt;
        match.score.awayScore = awayScoreInt;

        _matchesToday.refresh();


      }


    }
  }

  void _checkMatchesIsStarted(){
    debugPrint('@SCRAPING _checkMatchesIsStarted STARTING......');
    for(Match match in _matchesToday){
      if(match.dateTime == null) continue;
      if(match.dateTime!.isBefore(DateTime.now()) && match.status == MatchStatus.TIMED){
        match.status = MatchStatus.IN_PLAY;
      }
    }
    _matchesToday.refresh();
  }

  void _initAudioPlayers(){
    audioPlayerRefereeWhistle.setAsset(AppAssets.rawRefereeWhistle);
    audioPlayerGoalStadium.setAsset(AppAssets.rawGoalStadium);
  }

  void _changeApiKeysCounter(){
    if(_apiKeysCounter < WorldCupApiConstants.apiKeys.length){
      _apiKeysCounter++;

    }
    if(_apiKeysCounter >= WorldCupApiConstants.apiKeys.length){
      _apiKeysCounter = 0;
    }
  }

  //endregion



}