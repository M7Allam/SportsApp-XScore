class GoalLive{
  final String id;
  final String title;
  final String thumbnail;
  final String video;
  final bool isVisible;

  const GoalLive({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.video,
    required this.isVisible,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
      'video': video,
      'isVisible': isVisible,
    };
  }

  factory GoalLive.fromMap(Map<String, dynamic> map) {
    return GoalLive(
      id: map['id'] as String,
      title: map['title'] as String,
      thumbnail: map['thumbnail'] as String,
      video: map['video'] as String,
      isVisible: map['isVisible'] as bool,
    );
  }

}