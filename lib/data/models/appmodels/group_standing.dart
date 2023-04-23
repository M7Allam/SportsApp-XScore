import 'package:world_cup_qatar_2022/data/models/apimodels/standing.dart';
import 'package:world_cup_qatar_2022/data/models/apimodels/table_item.dart';
import 'package:world_cup_qatar_2022/data/models/appmodels/table_team.dart';
import 'package:world_cup_qatar_2022/utils/enums/stages.dart';
import 'package:world_cup_qatar_2022/utils/general_methods.dart';

class GroupStanding{
  final String title;
  final Groups group;
  final Stages stage;
  late List<TableTeam> table;

  GroupStanding({
    required this.title,
    required this.group,
    required this.stage,
    required this.table,
  });


  factory GroupStanding.fromApi(Standing standing) {
    List<TableTeam> tableTeams = [];
    for(TableItem item in standing.table){
      tableTeams.add(TableTeam.fromApi(item));
    }
    String titleStr = standing.group.replaceRange(standing.group.length-2, standing.group.length-1, ' ');
    return GroupStanding(
      title: titleStr,
      group: getGroup(standing.group),
      stage: getStage(standing.stage),
      table: tableTeams,
    );
  }

}