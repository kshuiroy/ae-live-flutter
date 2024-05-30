class FilterOptionsModel<T> {
  FilterOptionsModel({
    required this.title,
    required this.value,
  });

  final String title;
  final T value;

  FilterOptionsModel<T> copyWith({
    String? title,
    T? value,
  }) {
    return FilterOptionsModel<T>(
      title: title ?? this.title,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'value': value,
    };
  }

  @override
  String toString() => 'FilterOptionsModel(title: $title, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FilterOptionsModel<T> &&
        other.title == title &&
        other.value == value;
  }

  @override
  int get hashCode => title.hashCode ^ value.hashCode;
}
