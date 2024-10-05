class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  final int indsex = 5;
  List<String>? meals;
  int kacl;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath: 'assets/fitness_app/drywaste.png',
      titleTxt: 'Dry Waste',
      kacl: 52,
      meals: <String>['Percentage of', 'dry waste'],
      startColor: '#a8e1f7',
      endColor: '#bc95ff',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/wetwaste.png',
      titleTxt: 'Wet Waste',
      kacl: 62,
      meals: <String>['Percentage of', 'wet waste'],
      startColor: '#2d8044',
      endColor: '#95ff95',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/totalwaste.png',
      titleTxt: 'Net Waste',
      kacl: 75,
      meals: <String>['Percentage of', 'net waste'],
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/dinner.png',
      titleTxt: 'Dinner',
      kacl: 0,
      meals: <String>['Recommend:', '703 kcal'],
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
  ];
}
