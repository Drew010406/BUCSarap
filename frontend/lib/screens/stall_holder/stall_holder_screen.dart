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

class StallHolderScreen extends ConsumerStatefulWidget {
  const StallHolderScreen({super.key});

  @override
  ConsumerState<StallHolderScreen> createState() => _StallHolderScreenState();
}

class _StallHolderScreenState extends ConsumerState<StallHolderScreen> {
  final TokenStorageImpl _tokenStorageImpl =
  TokenStorageImpl(const FlutterSecureStorage());


  Future<void> _connect(int stallID) async {
    EventFlux.instance.connect(
      EventFluxConnectionType.get,
      "https://sufferer-cuddly-commerce.ngrok-free.dev/queue/$stallID/stream",
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
        Future.delayed(const Duration(seconds: 5), () => _connect(stallID));
      },
    );
  }

  @override
  void dispose() {
    EventFlux.instance.disconnect();
    super.dispose();
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: kFlameDescription.copyWith(
              color: textMuted,
              fontSize: 13,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            value,
            style: kFlameDescription.copyWith(
              color: textDark,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowDivider() => Divider(
    height: 1,
    thickness: 1,
    color: divider,
    indent: 20,
    endIndent: 20,
  );

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final ownerStall = ref.watch(ownerStallProvider);

    ref.listen<AsyncValue<StallResponseModel>>(
      ownerStallProvider,
          (previous, next) {
        next.whenData((data) {
          if (data.stallID != null &&
              previous?.value?.stallID != data.stallID) {
            _connect(data.stallID!);
          }
        });
      },
    );

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: bg,
        elevation: 0,
        leadingWidth: 165,
        leading: LogoutButton(
          onTap: () async {
            await _tokenStorageImpl.delete();
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ownerStall.when(
              loading: () =>
              const Center(child: CircularProgressIndicator()),
              error: (err, stack) =>
                  Center(child: Text("Error: $err")),
              data: (data) {
                final String publicUrl = Supabase.instance.client.storage
                    .from("images")
                    .getPublicUrl("${data.photoPath}");

                return SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 112,
                        height: 112,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: accentDark.withValues(alpha: 0.25),
                            width: 2.5,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(publicUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),


                      Text(
                        '${data.stallName}',
                        style: kFlameFontTitle.copyWith(
                          fontSize: 26,
                          color: textDark,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Stall #${data.stallID}  ·  Owner #${data.ownerID}',
                        style: kFlameDescription.copyWith(
                          color: textMuted,
                          fontSize: 13,
                          decoration: TextDecoration.none,
                        ),
                      ),

                      const SizedBox(height: 28),

                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: card,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: divider, width: 1),
                        ),
                        child: Column(
                          children: [
                            _infoRow('Opening Time', '${data.openingTime}'),
                            _rowDivider(),
                            _infoRow('Closing Time', '${data.closingTime}'),
                            _rowDivider(),
                            _infoRow('Operating Days', '${data.operatingDays}'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            final stallData =
                                ref.read(ownerStallProvider).value;
                            if (stallData == null) return;
                            final updated = stallData.copyWith(
                              stallStatus: !data.stallStatus,
                            );
                            ref
                                .read(ownerStallProvider.notifier)
                                .updateStallStatus(
                              stallData.stallID!,
                              StallUpdateModel.fromJson(updated.toJson()),
                            );
                          });
                        },
                        child: Container(
                          height: 52,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: data.stallStatus
                                ? accentLight.withValues(alpha: 0.12)
                                : card,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              width: 1.5,
                              color: data.stallStatus
                                  ? accentDark
                                  : textMuted.withValues(alpha: 0.35),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: data.stallStatus
                                      ? accentDark
                                      : textMuted.withValues(alpha: 0.5),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                data.stallStatus
                                    ? 'Open for Orders'
                                    : 'Currently Closed',
                                style: kFlameFontTitle.copyWith(
                                  fontSize: 16,
                                  color: data.stallStatus
                                      ? accentDark
                                      : textMuted,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          NavigationPanel(currentRoute: currentRoute ?? ''),
        ],
      ),
    );
  }
}