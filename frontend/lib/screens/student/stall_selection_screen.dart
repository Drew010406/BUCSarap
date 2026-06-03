import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/providers/cart_provider.dart';
import 'package:frontend/shared/back_button_container.dart';
import 'package:frontend/shared/cart_button.dart';
import 'package:frontend/shared/cart_container.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../constants.dart';
import '../../firebase_options.dart';
import '../../providers/fcm_token_provider.dart';
import '../../providers/stall_provider.dart';
import '../../services/firebase/firebase_api.dart';
import '../../services/firebase/firebase_service.dart';

class StallSelectionScreen extends ConsumerStatefulWidget {
  const StallSelectionScreen({super.key});

  @override
  ConsumerState<StallSelectionScreen> createState() =>
      _StallSelectionScreenState();
}

class _StallSelectionScreenState extends ConsumerState<StallSelectionScreen> {
  @override
  void initState() {
    super.initState();
    _initFCM();
  }

  Future<void> _initFCM() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    final token = await FirebaseApi().initNotifications();
    if (mounted) {
      ref.read(fcmTokenNotifierProvider.notifier).addToken(token);
    }
  }
  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final stallsAsyncProvider = ref.watch(stallsProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Color(0xFFEFE2D3),
        leadingWidth: 140,
        leading: BackButtonContainer(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          CartButton(productQuantity: cartProducts.length),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/receipt_screen');
            },
            icon: Icon(Icons.receipt),
            color: Color(0xFFDA782B),
            padding: EdgeInsets.only(right: 20),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Center(
                child: Text(
                  "Select Food Stall",
                  style: TextStyle(fontSize: 30, fontFamily: "flame"),
                ),
              ),
              //   TODO: Implement SingleChildScroll
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                    bottom: 100,
                  ),
                  child: stallsAsyncProvider.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (err, stack) => Text('Error: $err'),
                    data: (stalls) => GridView.builder(
                      itemCount: stalls.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final String publicUrl = Supabase.instance.client.storage
                            .from("images")
                            .getPublicUrl(
                          "${stalls[index].photoPath}",
                        );
                        return GestureDetector(
                          onTap: () {
                            final stall = stalls[index];
                            if (stall.stallStatus) {
                              debugPrint('Selected stallID: ${stall.stallID}');
                              ref
                                  .read(selectedStallProvider.notifier)
                                  .selectStall(stall);
                              Navigator.pushNamed(context, '/category_screen');
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFE591),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xFFFF9644,
                                      ).withValues(alpha: 0.50),
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    width: double.infinity,
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Image.network(
                                        publicUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  stalls[index].stallName!,
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: "flame",
                                    fontSize: 18,
                                  ),
                                ),
                                if (!stalls[index].stallStatus)
                                  Text(
                                    "Unavailable",
                                    style: kFlameFontTitle.copyWith(
                                      fontSize: 24,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(bottom: 0, child: CartContainer()),
        ],
      ),
    );
  }
}
