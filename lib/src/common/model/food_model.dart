class FoodModel {
  String strMeal;
  String strCategory;
  String strMealThumb;
  int idMeal;

  FoodModel({
    required this.strMeal,
    required this.strMealThumb,
    required this.strCategory,
    required this.idMeal,
  });

  factory FoodModel.fromJson(Map<String, Object?> json) {
    return FoodModel(
      strMeal: json["strMeal"] as String,
      strMealThumb: json["strMealThumb"] as String,
      strCategory: json["strCategory"] as String,
      idMeal: int.parse(json["idMeal"] as String),
    );
  }

  @override
  String toString() {
    return "FoodModel(strMeal: $strMeal, strMealThumb: $strMealThumb, strCategory: $strCategory, idMeal: $idMeal)\n";
  }

  @override
  int get hashCode => Object.hash(strMeal, strMealThumb, strCategory, idMeal);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is FoodModel &&
            runtimeType == other.runtimeType &&
            strMeal == other.strMeal &&
            strCategory == other.strCategory &&
            strMealThumb == other.strMealThumb &&
            idMeal == other.idMeal;
  }
}
