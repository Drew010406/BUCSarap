import 'package:flutter_riverpod/flutter_riverpod.dart';

class OwnerProvider extends Notifier<int?> {
  @override
  int? build() {
    return null;
  }

  void addOwner(int ownerID) {
    state = ownerID;
  }
}

final ownerNotifierProvider = NotifierProvider<OwnerProvider, int?>(
  () => OwnerProvider(),
);
