import 'package:to_do_list/export.dart';

class ToastWidget extends StatelessWidget {
  const ToastWidget(
      {super.key,
      required this.message,
      required this.toastType,
      required this.onDissmiss});
  final String message;
  final ToastType toastType;
  final VoidCallback onDissmiss;
  @override
  Widget build(BuildContext context) {
    if (toastType == ToastType.success) return _toastSuccess();
    return _toastError();
  }

  Widget _toastSuccess() => Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          color: Color(0xFF2f3640),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        constraints: const BoxConstraints(
          minHeight: 45.0,
          maxHeight: 70.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: TextApp(
                message,
                fontSize: 14.0,
                textColor: whiteColor,
                maxLines: 2,
              ),
            ),
            const SizedBox(width: 8.0),
            InkWell(
              onTap: onDissmiss,
              child: SvgPicture.asset(
                AssetSvg.circleClearSvg,
                fit: BoxFit.scaleDown,
                colorFilter:
                    const ColorFilter.mode(whiteColor, BlendMode.srcIn),
              ),
            )
          ],
        ),
      );

  Widget _toastError() => Column();
}
