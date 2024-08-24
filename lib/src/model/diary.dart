class Diary {
  String description;
  String date;
  Diary({
    required this.description,
    required this.date,
  });

  Diary copyWith({
    String? description,
    String? date,
  }) {
    return Diary(
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'date': date,
    };
  }

  factory Diary.fromMap(Map<String, dynamic> map) {
    return Diary(
      description: map['description'] as String,
      date: map['date'] as String,
    );
  }

  @override
  String toString() => 'Diary(description: $description, date: $date)';

  @override
  bool operator ==(covariant Diary other) {
    if (identical(this, other)) return true;

    return other.description == description && other.date == date;
  }

  @override
  int get hashCode => description.hashCode ^ date.hashCode;
}
