import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/app_exception.dart';
import 'package:instagram_challenge_manager/common/common.dart';
import 'package:instagram_challenge_manager/instagram/domain/instagram_info.dart';
import 'package:instagram_challenge_manager/instagram/presentation/controllers/instagram_login_controller.dart';
import 'package:toastification/toastification.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class InstagramLoginWidget extends ConsumerStatefulWidget {
  const InstagramLoginWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InstagramLoginWidgetState();
}

class _InstagramLoginWidgetState extends ConsumerState<InstagramLoginWidget> {
  late final WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..clearCache()
      ..clearLocalStorage()
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(InstagramInfo.redirectUri.toString())) {
              ref
                  .read(instagramLoginControllerProvider.notifier)
                  .validateCodeAndLogin(request.url);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(InstagramInfo.initialUrl);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      instagramLoginControllerProvider,
      (prev, state) {
        if (prev != null && prev is AsyncLoading && state is AsyncData) {
          // Pop the wolt modal.
          Navigator.of(context).pop();
        }
        if (state is AsyncError) {
          Navigator.of(context).pop();
          toastification.showError(
            context: context,
            message: state.error.errorMessage(context),
          );
        }
      },
    );
    return ElevatedButton(
      onPressed: () async {
        await WoltModalSheet.show<void>(
          context: context,
          pageListBuilder: (bottomSheetContext) {
            return [
              //? Track the fact the modal is open?
              // Login page
              NonScrollingWoltModalSheetPage(
                child: Consumer(
                  builder: (context, ref, _) {
                    ref.listen(
                      instagramLoginControllerProvider,
                      (prev, state) {
                        if (state is AsyncLoading) {
                          WoltModalSheet.of(bottomSheetContext).showNext();
                        }
                      },
                    );
                    return WebViewWidget(controller: webViewController);
                  },
                ),
              ),
              // Loading page
              NonScrollingWoltModalSheetPage(
                child: const Center(child: CircularProgressIndicator()),
              ),
            ];
          },
        );
      },
      child: const Text('Login with Instagram'),
    );
  }
}
