import 'package:eventflux/client.dart';
import 'package:eventflux/enum.dart';
import 'package:eventflux/models/exception.dart';
import 'package:eventflux/models/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/components/stall_holder/navigation_panel.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/models/stall_model.dart';
import 'package:frontend/providers/owner_stall_provider.dart';
import 'package:frontend/providers/queue_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  Future<void> _connect(int stallID) async {
    // https://pub.dev/packages/flutter_client_sse
    // https://www.reddit.com/r/FlutterDev/comments/194emt9/new_way_to_handle_server_sent_events_in_flutter/
    // https://pub.dev/packages/eventflux
    EventFlux.instance.connect(
      EventFluxConnectionType.get,
      "https://sufferer-cuddly-commerce.ngrok-free.dev/orders/queue/$stallID/stream",
      header: {
        "Accept": "text/event-stream",
        "Cache-Control": "no-cache",
        "ngrok-skip-browser-warning": "true",
      },
      onSuccessCallback: (EventFluxResponse? response) async {
        response?.stream?.listen((data) {
          ref.invalidate(pendingQueueProviderProvider);
          print("SSE DATA: ${data.data}");
        });
      },
      onError: (EventFluxException error) {
        Future.delayed(const Duration(seconds: 5), () {
          _connect(stallID);
        });
      },
    );
  }
  @override
  void dispose() {
    EventFlux.instance.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final ownerStall = ref.watch(ownerStallProvider);

    // Safely listen for stall data and connect once it's available
    ref.listen<AsyncValue<StallResponseModel>>(
      ownerStallProvider,
      (previous, next) {
        next.whenData((data) {
          if (data.stallID != null && previous?.value?.stallID != data.stallID) {
            _connect(data.stallID!);
          }
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: const Color(0xFFEFE2D3),
        leadingWidth: 165,
        leading: LogoutButton(
          onTap: () async {
            await _tokenStorageImpl.delete();
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ownerStall.when(
              loading: () => const Center(child: CircularProgressIndicator(),),
              error: (err, stack) => Center(child: Text("Error: $err")),
              data: (data) {
                final String publicUrl = Supabase.instance.client.storage
                    .from("images")
                    .getPublicUrl(
                  "${data.photoPath}",
                );
                return Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(publicUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: '${data.stallName}',
                        style: kFlameFontTitle.copyWith(fontSize: 24),
                        children: <TextSpan>[
                          const TextSpan(
                            text: ' # ',
                            style: TextStyle(color: Colors.black45),
                          ),
                          TextSpan(
                            text: '${data.stallID}',
                            style: const TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "# ${data.ownerID}",
                      style: kFlameDescription.copyWith(
                        color: Colors.black45,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Opening time: ',
                        style: kFlameDescription.copyWith(
                          decoration: TextDecoration.none,
                          color: kPrimaryColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${data.openingTime}',
                            style: const TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Closing time: ',
                        style: kFlameDescription.copyWith(
                          decoration: TextDecoration.none,
                          color: kPrimaryColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${data.closingTime}',
                            style: const TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Operating Days: ',
                        style: kFlameDescription.copyWith(
                          decoration: TextDecoration.none,
                          color: kPrimaryColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${data.operatingDays}',
                            style: const TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
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
                          color: const Color(0xFFFF9644).withValues(alpha: 0.50),
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            width: 2,
                            color: const Color(0xFFDA782B),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            data.stallStatus ? "Active" : "Inactive",
                            style: kFlameFontTitle.copyWith(fontSize: 18),
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
          NavigationPanel(currentRoute: currentRoute ?? ''),
        ],
      ),
    );
  }
}
