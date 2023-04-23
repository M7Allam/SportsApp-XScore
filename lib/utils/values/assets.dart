abstract class AppAssets{
  static const String appBackground = 'assets/images/app_background.png';
  static const String animLivePulse = 'assets/animations/live_pulse.json';
  static const String animLoading = 'assets/animations/loading.json';
  static const String animLoadingMinutes = 'assets/animations/loading-minutes.json';
  static const String iconFootball = 'assets/icons/football.svg';
  static const String iconTrophy = 'assets/icons/trophy.svg';
  static const String iconUpArrow = 'assets/icons/up-arrow.png';
  static const String iconUpArrow2 = 'assets/icons/up-arrow_2.png';
  static const String rawRefereeWhistle = 'assets/raw/Referee-Whistle-Sound-Effect.mp3';
  static const String rawGoalStadium = 'assets/raw/Football-Goal-Stadium-Sound-Effect.mp3';

  static String getTeamLogo(String teamName){
    return 'assets/images/teams/$teamName.svg';
  }
}