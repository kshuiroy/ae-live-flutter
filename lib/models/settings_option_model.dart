class SettingsOptionModel<T> {
  SettingsOptionModel({
    required this.title,
    required this.value,
  });

  final String title;
  final T value;

  SettingsOptionModel<T> copyWith({
    final String? title,
    final T? value,
  }) {
    return SettingsOptionModel<T>(
      title: title ?? this.title,
      value: value ?? this.value,
    );
  }

  @override
  String toString() => 'SettingsOptionModel(title: $title, value: $value)';

  @override
  bool operator ==(final Object other) {
    if (identical(this, other)) return true;

    return other is SettingsOptionModel<T> &&
        other.title == title &&
        other.value == value;
  }

  @override
  int get hashCode => title.hashCode ^ value.hashCode;
}
