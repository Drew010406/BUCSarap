class OrderModel {
  final int? orderID;
  final int? productPileID;
  final int? stallID;
  final String? orderNumber;
  final String? orderStatus;
  final DateTime? orderTime;
  final DateTime? processingTime;
  final String? customerName;
  final int? total;

  const OrderModel({
    this.stallID,
    this.total,
    this.customerName,
    this.orderID,
    this.orderNumber,
    this.orderStatus,
    this.orderTime,
    this.processingTime,
    this.productPileID,
  });
}
