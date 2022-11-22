class Chart {
  int id;
  String created_at;
  String updated_at;
  int user_profile_id;
  int reason_type_id;
  int manager_id;
  String description;
  int emoji_point;

  Chart(
      {required this.id,
      required this.created_at,
      required this.updated_at,
      required this.user_profile_id,
      required this.reason_type_id,
      required this.manager_id,
      required this.description,
      required this.emoji_point});

  factory Chart.empty() => Chart(
        id: 0,
        created_at: '',
        updated_at: '',
        user_profile_id: 0,
        reason_type_id: 0,
        manager_id: 0,
        description: '',
        emoji_point: 0,
      );

  Chart.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        created_at = json['created_at'],
        updated_at = json['updated_at'],
        user_profile_id = json['user_profile_id'],
        reason_type_id = json['reason_type_id'] ?? 0,
        manager_id = json['manager_id'],
        description = json['description'],
        emoji_point = json['emoji_point'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': created_at,
        'updated_at': updated_at,
        'user_profile_id': user_profile_id,
        'reason_type_id': reason_type_id,
        'manager_id': manager_id,
        'description': description,
        'emoji_point': emoji_point,
      };

  @override
  String toString() {
    return "Chart{id:$id, description:$description, created_at:$created_at}";
  }
}
