import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:universe/app/router.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/features/scan/logic/scan_cubit.dart';
import 'package:universe/features/scan/logic/scan_state.dart';

class ScanScreenBody extends StatefulWidget {
  const ScanScreenBody({super.key});

  @override
  State<ScanScreenBody> createState() => _ScanScreenBodyState();
}

class _ScanScreenBodyState extends State<ScanScreenBody>
    with SingleTickerProviderStateMixin {
  final MobileScannerController cameraController = MobileScannerController();

  bool _isScanning = false;
  bool _dialogShowing = false;
  String? _lastScanned;

  late AnimationController _lineController;
  late Animation<double> _lineAnimation;

  @override
  void initState() {
    super.initState();
    _lineController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _lineAnimation = Tween<double>(begin: 0, end: 240).animate(
      CurvedAnimation(parent: _lineController, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ScanCubit, ScanState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (_) {
              if (!mounted) return;
              cameraController.stop();
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!mounted) return;
                context.go(AppRouter.kScanSuccessScreen);
              });
            },
            error: (error) {
              if (!mounted || _dialogShowing) return;
              _dialogShowing = true;
              AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.bottomSlide,
                title: 'Scan Failed',
                desc: 'Invalid QR code',
                dismissOnTouchOutside: false,
                btnOkText: 'OK',
                btnOkOnPress: () {
                  _dialogShowing = false;
                  if (!mounted) return;
                  setState(() {
                    _isScanning = false;
                    _lastScanned = null;
                  });
                  cameraController.start();
                },
              ).show();
            },
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            MobileScanner(
              controller: cameraController,
              onDetect: (capture) async {
                if (_isScanning) return;

                final barcodes = capture.barcodes;
                if (barcodes.isEmpty) return;

                String? value;
                for (final b in barcodes) {
                  if (b.rawValue != null && b.rawValue!.isNotEmpty) {
                    value = b.rawValue!;
                    break;
                  }
                }
                if (value == null) return;
                if (_lastScanned == value) return;

                final scanCubit = context.read<ScanCubit>();

                setState(() {
                  _isScanning = true;
                  _lastScanned = value;
                });

                await cameraController.stop();
                await Future.delayed(const Duration(milliseconds: 150));

                scanCubit.scan(value);
              },
            ),

            SizedBox(
              width: 260,
              height: 260,
              child: Stack(
                children: [
                  Positioned(top: 0, left: 0, child: _corner(true, true)),
                  Positioned(top: 0, right: 0, child: _corner(false, true)),
                  Positioned(bottom: 0, left: 0, child: _corner(true, false)),
                  Positioned(bottom: 0, right: 0, child: _corner(false, false)),
                  AnimatedBuilder(
                    animation: _lineAnimation,
                    builder: (_, _) {
                      return Positioned(
                        top: _lineAnimation.value,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 2,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                ColorsManager.primary,
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _corner(bool left, bool top) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        border: Border(
          left: left
              ? BorderSide(color: ColorsManager.primary, width: 4)
              : BorderSide.none,
          right: !left
              ? BorderSide(color: ColorsManager.primary, width: 4)
              : BorderSide.none,
          top: top
              ? BorderSide(color: ColorsManager.primary, width: 4)
              : BorderSide.none,
          bottom: !top
              ? BorderSide(color: ColorsManager.primary, width: 4)
              : BorderSide.none,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _lineController.dispose();
    cameraController.dispose();
    super.dispose();
  }
}
