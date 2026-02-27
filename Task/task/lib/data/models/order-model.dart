class OrderModel {
  final String id;         // Firestore doc ID
  final String customerId;
  final String food;
  final String hotel;

  OrderModel({
    required this.id,
    required this.customerId,
    required this.food,
    required this.hotel,
  });

  Map<String, dynamic> toMap() {
    return {
      "customerId": customerId,
      "food": food,
      "hotel": hotel,
    };
  }

  factory OrderModel.fromMap(String id, Map<String, dynamic> map) {
    return OrderModel(
      id: id,
      customerId: map["customerId"],
      food: map["food"],
      hotel: map["hotel"],
    );
  }
}
