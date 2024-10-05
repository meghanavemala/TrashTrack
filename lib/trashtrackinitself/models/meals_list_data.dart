import '/bluetooth_connect/bl.dart'; // Import the BluetoothService

int raatre = 0; // Global variable for raatre, initialized to 0

class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    required this.kacl,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  int kacl;

  static int calculateKacl(int raatre) {
    return raatre;
  }

  static List<MealsListData> get tabIconsList {
    return [
      MealsListData(
        imagePath: 'assets/fitness_app/drywaste.png',
        titleTxt: 'Dry Waste',
        meals: <String>['Percentage of', 'dry waste'],
        startColor: '#2d3580',
        endColor: '#89adf5',
        kacl: calculateKacl(raatre),
      ),
      MealsListData(
        imagePath: 'assets/fitness_app/wetwaste.png',
        titleTxt: 'Wet Waste',
        meals: <String>['Percentage of', 'wet waste'],
        startColor: '#2d8044',
        endColor: '#95ff95',
        kacl: calculateKacl(raatre),
      ),
      MealsListData(
        imagePath: 'assets/fitness_app/totalwaste.png',
        titleTxt: 'Net Waste',
        meals: <String>['Percentage of', 'net waste'],
        startColor: '#FE95B6',
        endColor: '#FF5287',
        kacl: calculateKacl(raatre),
      ),
      MealsListData(
        imagePath: 'assets/fitness_app/dinner.png',
        titleTxt: 'Dinner',
        meals: <String>['Recommend:', '703 kcal'],
        startColor: '#6F72CA',
        endColor: '#1E1466',
        kacl: calculateKacl(raatre),
      ),
    ];
  }

  static void startListening() {
    bluetoothService.integerStream.listen((newRaatre) {
      raatre = newRaatre;
      // Update any UI or perform actions as needed
    });
  }
}
