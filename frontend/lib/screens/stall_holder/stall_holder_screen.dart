import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/components/stall_holder/navigation_panel.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/models/stall_model.dart';
import 'package:frontend/providers/owner_stall_provider.dart';

import '../../components/login_screen/logout_button.dart';
import '../../services/auth/token_storage_impl.dart';
import '../../shared/back_button_container.dart';

class StallHolderScreen extends ConsumerStatefulWidget {
  const StallHolderScreen({super.key});

  @override
  ConsumerState<StallHolderScreen> createState() => _StallHolderScreenState();
}

class _StallHolderScreenState extends ConsumerState<StallHolderScreen> {
  final TokenStorageImpl _tokenStorageImpl = TokenStorageImpl(const FlutterSecureStorage());

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final ownerStall = ref.watch(ownerStallProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Color(0xFFEFE2D3),
        leadingWidth: 165,
        leading: LogoutButton(
          onTap: () async {
            await _tokenStorageImpl.delete();
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/add_product_screen');
        //     },
        //     icon: Icon(Icons.add, color: Color(0xFFDA782B)),
        //   ),
        // ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ownerStall.when(
              loading: () => const Center(child: CircularProgressIndicator(),),
              error: (err, stack) => Text("Error: $err"),
              data: (data) {
                return Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(75),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: '${data.stallName}',
                        style: kJetbrainsFontTitle.copyWith(fontSize: 24),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' # ',
                            style: TextStyle(color: Colors.black45),
                          ),
                          TextSpan(
                            text: '${data.stallID}',
                            style: TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "# ${data.ownerID}",
                      style: kJetbrainsDescription.copyWith(
                        color: Colors.black45,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Opening time: ',
                        style: kJetbrainsDescription.copyWith(
                          decoration: TextDecoration.none,
                          color: kPrimaryColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${data.openingTime}',
                            style: TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Closing time: ',
                        style: kJetbrainsDescription.copyWith(
                          decoration: TextDecoration.none,
                          color: kPrimaryColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${data.closingTime}',
                            style: TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Operating Days: ',
                        style: kJetbrainsDescription.copyWith(
                          decoration: TextDecoration.none,
                          color: kPrimaryColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${data.operatingDays}',
                            style: TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          final stallData = ref.read(ownerStallProvider).value;
                          if(stallData == null) return;
                          late StallResponseModel updated;
                          if(data.stallStatus) {
                            updated = stallData.copyWith(stallStatus: false);
                          } else {
                            updated = stallData.copyWith(stallStatus: true);
                          }
                          final json = updated.toJson();

                          ref.read(ownerStallProvider.notifier).updateStallStatus(stallData.stallID!, StallUpdateModel.fromJson(json));
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF9644).withValues(alpha: 0.50),
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            width: 2,
                            color: Color(0xFFDA782B),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            data.stallStatus ? "Active" : "Inactive",
                            style: kJetbrainsFontTitle.copyWith(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          // Home, Queue, Processed History, Analytics?
          NavigationPanel(currentRoute: currentRoute as String),
        ],
      ),
    );
  }
}
