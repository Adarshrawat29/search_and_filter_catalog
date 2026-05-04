class ItemLocalDataSource {
  Future<List<Map<String, dynamic>>> getItems() async {
    await Future.delayed(const Duration(seconds: 1)); 

    return [
      {
        "id": 1,
        "title": "Flutter Basics",
        "description": "Learn Flutter step by step",
        "category": "Education"
      },
      {
        "id": 2,
        "title": "Food Delivery",
        "description": "Order food online",
        "category": "Service"
      },
      {
        "id": 3,
        "title": "Workout Plan",
        "description": "Stay fit and healthy",
        "category": "Health"
      },
    ];
  }
}