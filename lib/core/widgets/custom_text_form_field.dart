import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universe/core/theme/colors_manager.dart';
import 'package:universe/core/theme/text_styles.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.width,
    this.validator,
    this.controller,
    this.hasError = false,
    this.maxLength,
    this.maxLines,
    this.keyboardType,
    this.textAlign,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.enabled,
  });

  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final double? width;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool hasError;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool? enabled;
  final int? maxLines;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  FocusNode? _internalFocusNode;
  bool _isUsingInternalFocus = false;

  FocusNode get _focusNode {
    if (_internalFocusNode == null) {
      if (widget.focusNode != null) {
        _internalFocusNode = widget.focusNode;
        _isUsingInternalFocus = false;
      } else {
        _internalFocusNode = FocusNode();
        _isUsingInternalFocus = true;
      }
    }
    return _internalFocusNode!;
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    widget.controller?.addListener(_onTextChange);
  }

  void _onFocusChange() {
    if (mounted) {
      setState(() {});
    }
  }

  void _onTextChange() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onTextChange);
    if (_internalFocusNode != null) {
      _internalFocusNode!.removeListener(_onFocusChange);
      if (_isUsingInternalFocus) {
        _internalFocusNode!.dispose();
      }
    }
    super.dispose();
  }

  bool _hasText() {
    return widget.controller?.text.isNotEmpty ?? false;
  }

  Color _getBorderColor() {
    if (widget.hasError) {
      return ColorsManager.error;
    }
    if (_focusNode.hasFocus || _hasText()) {
      return ColorsManager.primary;
    }
    return ColorsManager.grey;
  }

  double _getBorderWidth() {
    if (widget.hasError || _focusNode.hasFocus || _hasText()) {
      return 2.w;
    }
    return 1.w;
  }

  Color _getIconColor() {
    if (widget.enabled == false) {
      return ColorsManager.grey;
    }
    if (widget.hasError) {
      return ColorsManager.error;
    }
    if (_focusNode.hasFocus || _hasText()) {
      return ColorsManager.primary;
    }
    return ColorsManager.grey;
  }

  Widget? _buildSuffixIcon() {
    if (widget.suffixIcon == null) return null;

    final iconColor = _getIconColor();

    if (widget.suffixIcon is Icon) {
      final icon = widget.suffixIcon as Icon;
      return Icon(icon.icon, color: iconColor, size: icon.size);
    }

    if (widget.suffixIcon is GestureDetector) {
      final gesture = widget.suffixIcon as GestureDetector;
      if (gesture.child is Icon) {
        final icon = gesture.child as Icon;
        return GestureDetector(
          onTap: gesture.onTap,
          child: Icon(icon.icon, color: iconColor, size: icon.size ?? 24),
        );
      }
    }

    return ColorFiltered(
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      child: widget.suffixIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      child: TextFormField(
        maxLines: widget.maxLines ?? 1,

        enabled: widget.enabled,
        controller: widget.controller,
        focusNode: _focusNode,
        style: widget.inputTextStyle ?? TextStyle(color: ColorsManager.primary),
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              widget.contentPadding ??
              EdgeInsets.symmetric(vertical: 12.0.w, horizontal: 16.0.w),
          constraints: BoxConstraints(minHeight: 48.h),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              color: widget.hasError ? ColorsManager.error : ColorsManager.grey,
              width: 1.w,
            ),
          ),
          focusedBorder:
              widget.focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(
                  color: widget.hasError
                      ? ColorsManager.error
                      : ColorsManager.primary,
                  width: 2.w,
                ),
              ),
          enabledBorder:
              widget.enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(
                  color: _getBorderColor(),
                  width: _getBorderWidth(),
                ),
              ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: ColorsManager.error, width: 2.w),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: ColorsManager.error, width: 2.w),
          ),
          hintText: widget.hintText,
          hintStyle:
              widget.hintStyle ??
              TextStyles.font14BlackRegular.copyWith(color: ColorsManager.grey),
          suffixIcon: _buildSuffixIcon(),
          prefixIcon: widget.prefixIcon,
          filled: true,
          fillColor: Colors.transparent,
          errorMaxLines: 2,
          counterText: '',
        ),
        obscureText: widget.obscureText ?? false,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        readOnly: widget.readOnly,
      ),
    );
  }
}
