import 'package:world_cup_qatar_2022/data/models/apimodels/table_item.dart';

class Standing{
  final String stage;
  final String type;
  final String group;
  final List<TableItem> table;

  const Standing({
    required this.stage,
    required this.type,
    required this.group,
    required this.table,
  });

  Map<String, dynamic> toMap() {
    return {
      'stage': stage,
      'type': type,
      'group': group,
      'table': table,
    };
  }

  factory Standing.fromMap(Map<String, dynamic> map) {
    List<TableItem> tableItems = [];
    for(dynamic item in map['table'] as List<dynamic>){
      tableItems.add(TableItem.fromMap(item));
    }
    return Standing(
      stage: map['stage'] as String,
      type: map['type'] as String,
      group: map['group'] as String,
      table: tableItems,
    );
  }
}