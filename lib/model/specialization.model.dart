class SpecializationModel {
  final String title;
  bool isSelected = false;

  SpecializationModel({required this.title, required this.isSelected});

  setIsSelected(bool b) {
    this.isSelected = b;
  }
}
