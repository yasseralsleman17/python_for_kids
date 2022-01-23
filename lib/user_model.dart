class UserModel {
  int id;
  String name;
  String password;
  String phone;
  String email;
  int level;
  int points;
  int characterid;

  UserModel(
      {this.id,
      this.name,
      this.password,
      this.phone,
      this.email,
      this.level,
      this.points,
      this.characterid});

  static const ID = "id";
  static const NAME = "name";
  static const PASSWORD = "password";
  static const PHONE = "phone";
  static const EMAIL = "email";
  static const LEVEL = "level";
  static const POINTS = "points";
  static const CHARACTERID = "characterid";

  static final List<String> values = [
    /// Add all fields
    ID, NAME, PASSWORD, PHONE, EMAIL, LEVEL, POINTS,CHARACTERID,
  ];

  static UserModel fromJson(Map<String, Object> json) => UserModel(
        id: json[ID] as int,
        password:    json[PASSWORD]    as String,
        name:        json[NAME]        as String,
        phone:       json[PHONE]       as String,
        email:       json[EMAIL]       as String,
        level:       json[LEVEL]       as int,
        points:      json[POINTS]      as int,
        characterid: json[CHARACTERID] as int,

      );

  Map<String, dynamic> toJson() => {
        ID: id,
        NAME: name,
        PASSWORD: password,
        PHONE: phone,
        EMAIL: email,
        LEVEL: level,
        POINTS: points,
        CHARACTERID:characterid
  };
}
