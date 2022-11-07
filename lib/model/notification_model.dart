class NotificationSettingsModel {
  final String? title;
  final String? description;
  bool? isSelected;

  NotificationSettingsModel({this.title, this.description, this.isSelected});

  void selectedItem(b) {
    this.isSelected = b;
  }
}
