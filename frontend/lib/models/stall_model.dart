class Stall {
  final int? stallID;
  final int? ownerID;
  final DateTime? openingTime;
  final DateTime? closingTime;
  final String? operatingDays;
  final String? stallName;

  const Stall({
    this.stallID,
    this.ownerID,
    this.openingTime,
    this.operatingDays,
    this.stallName,
    this.closingTime,
  });
}
