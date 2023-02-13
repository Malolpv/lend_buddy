abstract class BaseModel {
  int id = 0;

  BaseModel(Map<String, dynamic> map) {
    fromMap(map);
  }

  Map<String, Object> toMap();

  BaseModel fromMap(Map<String, dynamic> map);
}
