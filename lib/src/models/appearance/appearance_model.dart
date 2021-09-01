enum Gender { male, female, undefined }

extension GenderExtension on Gender {
  String get name {
    switch (this) {
      case Gender.male:
        return "male";
      case Gender.female:
        return "female";
      case Gender.undefined:
        return "undefined";
    }
  }
}

Gender genderFrom(String value) {
  switch (value) {
    case "male":
      return Gender.male;
    case "female":
      return Gender.female;
    case "undefined":
      return Gender.undefined;
    default:
      return Gender.undefined;
  }
}

class AppearanceModel {
  final Gender gender;

  AppearanceModel(this.gender);

  AppearanceModel.fromMap(Map<String, dynamic> map) : gender = genderFrom(map['gender'].toString().toLowerCase());
}
