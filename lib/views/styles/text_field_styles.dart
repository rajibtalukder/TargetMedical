import 'package:target_medical/target_medical.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:target_medical/views/widgets/expand_widget.dart';

class AppTextFieldStyles {
  AppTextFieldStyles._();

  static Widget _baseTextFormFieldWidget({
    required String hint,
    String? errorMassage,
    TextInputType? keyboardType,
    TextEditingController? controller,
    bool enable = true,
    TextAlign? textAlign,
    List<TextInputFormatter>? inputFormatters,
    FormFieldValidator? validator,
    GestureTapCallback? onTap,
    bool obscureText = false,
    ValueChanged<String>? onChanged,
    BoxConstraints? suffixWidgetConstraints,
    Widget? suffixWidget,
  }) {
    return TextFormField(
      readOnly: !enable,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: AppColors.black,
      style: AppTextStyles.regular14,
      textAlign: textAlign ?? TextAlign.start,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(
          12.w,
          16.h,
          suffixWidget != null ? 0 : 12.w,
          16.h,
        ),
        suffixIcon: suffixWidget,
        suffixIconConstraints:
            suffixWidgetConstraints ?? BoxConstraints.loose(Size(24.h, 24.h)),
        isDense: true,
        hintText: hint,
        hintStyle:
              AppTextStyles.regular13.copyWith(color: AppColors.black.withOpacity(0.6)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGray),
        ),
      ),
      inputFormatters: inputFormatters,
      onTap: onTap,
      onChanged: onChanged,
      validator: validator ??
          (value) {
            String massage = 'Please enter $hint';
            if (errorMassage != null) {
              massage = errorMassage;
            }

            if (value != null) {
              if (value.isEmpty) {
                return massage;
              }
            }
            return null;
          },
    );
  }

  static Widget _baseTextFormFieldWidgetOutline({
    required String hint,
    String? errorMassage,
    TextInputType? keyboardType,
    TextEditingController? controller,
    bool enable = true,
    TextAlign? textAlign,
    List<TextInputFormatter>? inputFormatters,
    FormFieldValidator? validator,
    GestureTapCallback? onTap,
    Widget? suffixIcon,
    bool obscureText = false,
  }) {
    return TextFormField(
      readOnly: !enable,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: AppColors.black,
      style: AppTextStyles.regular14,
      textAlign: textAlign ?? TextAlign.start,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints.loose(Size(24.h, 24.h)),
        isDense: true,
        hintText: hint,
        hintStyle: AppTextStyles.regular13,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(color: AppColors.lightGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(color: AppColors.gray),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(color: AppColors.lightGray),
        ),
      ),
      inputFormatters: inputFormatters,
      onTap: onTap,
      validator: validator ??
          (value) {
            String massage = 'Please enter $hint';
            if (errorMassage != null) {
              massage = errorMassage;
            }

            if (value != null) {
              if (value.isEmpty) {
                return massage;
              }
            }
            return null;
          },
    );
  }

  static Widget text(
      {required String hint,
      TextEditingController? controller,
      bool enable = true,
      bool outline = false,
      TextAlign? textAlign,
      FormFieldValidator? validator}) {
    if (outline) {
      return _baseTextFormFieldWidgetOutline(
        hint: hint,
        validator: validator,
        textAlign: textAlign,
        keyboardType: TextInputType.text,
        enable: enable,
        controller: controller,
      );
    }
    return _baseTextFormFieldWidget(
      hint: hint,
      validator: validator,
      textAlign: textAlign,
      keyboardType: TextInputType.text,
      enable: enable,
      controller: controller,
    );
  }

  static Widget number(
      {required String hint,
      TextEditingController? controller,
      bool enable = true,
      TextAlign? textAlign,
      FormFieldValidator? validator}) {
    return _baseTextFormFieldWidget(
      hint: hint,
      validator: validator,
      textAlign: textAlign,
      keyboardType: TextInputType.number,
      enable: enable,
      controller: controller,
    );
  }

  static Widget email({
    required String hint,
    TextEditingController? controller,
    bool enable = true,
    TextAlign? textAlign,
    bool outline = false,
  }) {
    if (outline) {
      return _baseTextFormFieldWidgetOutline(
        hint: hint,
        controller: controller,
        enable: enable,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value != null) {
            if (value.isEmpty) {
              return 'Please enter your email';
            } else {
              final RegExp emailRegex = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
              if (!emailRegex.hasMatch(value)) {
                return 'Please enter a valid email';
              }
            }
          }

          return null;
        },
      );
    }
    return _baseTextFormFieldWidget(
      hint: hint,
      controller: controller,
      enable: enable,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value != null) {
          if (value.isEmpty) {
            return 'Please enter your email';
          } else {
            final RegExp emailRegex = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
            if (!emailRegex.hasMatch(value)) {
              return 'Please enter a valid email';
            }
          }
        }

        return null;
      },
    );
  }

  static Widget password({
    required String hint,
    String? errorMassage,
    TextEditingController? controller,
    bool enable = true,
    TextAlign? textAlign,
    FormFieldValidator? validator,
    bool showPassword = false,
  }) {
    ValueNotifier<bool> passwordStatus = ValueNotifier(showPassword);

    return ValueListenableBuilder(
      valueListenable: passwordStatus,
      builder: (context, value, child) {
        return _baseTextFormFieldWidget(
          obscureText: !value,
          controller: controller,
          errorMassage: errorMassage,
          textAlign: textAlign,
          hint: hint,
          enable: enable,
          suffixWidget: InkWell(
            onTap: () {
              passwordStatus.value = !value;
            },
            child: Icon(
              value == false
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
              color: AppColors.lightGray,
            ),
          ),
          validator: validator ??
              (value) {
                String massage = 'Please enter $hint';
                if (errorMassage != null) {
                  massage = errorMassage;
                }

                if (value != null) {
                  if (value.isEmpty) {
                    return massage;
                  }
                }
                return null;
              },
        );
      },
    );
  }

  static Widget mobileNumber({
    required String hint,
    TextEditingController? controller,
    bool enable = true,
  }) {
    return _baseTextFormFieldWidget(
      hint: hint,
      controller: controller,
      enable: enable,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'\d')),
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(11),
      ],
      validator: (value) {
        if (value != null) {
          if (value.isEmpty) {
            return 'Please enter mobile number';
          } else {
            final numberWithOutCountryCode = value.replaceAll('+88', '');
            final numberOperatorCode = numberWithOutCountryCode.substring(0, 3);
            final pattern = RegExp(r'^(011|013|014|015|016|017|018|019)');
            if (pattern.hasMatch(numberOperatorCode) == false) {
              return 'Please enter a valid number';
            }
            if (numberWithOutCountryCode.length != 11) {
              return 'Please enter a valid number';
            }
          }
        }

        return null;
      },
    );
  }

  static Widget selectable({
    required String hint,
    required List<String> option,
    TextEditingController? controller,
    bool enable = true,
    TextAlign? textAlign,
    FormFieldValidator? validator,
    ValueChanged<String>? onChanged,
    ValueChanged<int>? onTap,
  }) {
    final thisController = controller ?? TextEditingController();

    final ValueNotifier<bool> expand = ValueNotifier(false);

    return ValueListenableBuilder(
      valueListenable: expand,
      builder: (context, value, child) {
        return Column(
          children: [
            _baseTextFormFieldWidget(
              hint: hint,
              validator: validator,
              textAlign: textAlign,
              keyboardType: TextInputType.text,
              enable: enable,
              onTap: (){
                expand.value = !expand.value;
                FocusScope.of(context).unfocus();
              },
              controller: thisController,
              onChanged: onChanged,
              suffixWidgetConstraints:
                  BoxConstraints.tightFor(width: 34.w, height: 18.h),
              suffixWidget: InkWell(
                onTap: () {
                  expand.value = !expand.value;
                  FocusScope.of(context).unfocus();
                },
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.fastOutSlowIn,
                  turns: value ? -0.75 : -0.25,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.gray.withOpacity(0.6),
                    size: 18.h,
                  ),
                ),
              ),
            ),
            ExpandWidget(
              expand: value,
              child: Column(
                children: [
                  SizedBox(height: 6.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.lightBlueAccent,
                    ),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: option.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                thisController.text = option[index];
                                expand.value = false;

                                if (onChanged != null) {
                                  onChanged(option[index]);
                                }
                                if (onTap != null) {
                                  onTap(index);
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                alignment: Alignment.center,
                                child: Text(
                                  option[index],
                                  // style: AppTextStyles.headline3
                                  //     .copyWith(color: AppColors.black80),
                                ),
                              ),
                            ),
                            Visibility(
                              visible:
                                  (index + 1) == option.length ? false : true,
                              child: Container(
                                height: 1.2.h,
                                width: AppSize.width,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  color: AppColors.black.withOpacity(0.04),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 16.w),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  static Widget dob({
    required String hint,
    required TextEditingController controller,
    bool outline = false,
  }) {
    if (outline) {
      return _baseTextFormFieldWidgetOutline(
        hint: hint,
        controller: controller,
        enable: false,
        keyboardType: TextInputType.number,
        onTap: () async {
          _pickDate(
            onSelect: (dateTime) {
              controller.text = DateFormat('dd/MM/yyyy').format(dateTime);
            },
          );
        },
      );
    }

    return _baseTextFormFieldWidget(
      hint: hint,
      controller: controller,
      enable: false,
      keyboardType: TextInputType.number,
      onTap: () async {
        _pickDate(
          onSelect: (dateTime) {
            controller.text = DateFormat('dd/MM/yyyy').format(dateTime);
          },
        );
      },
    );
  }

  static void _pickDate({required Function(DateTime dateTime) onSelect}) async {
    await showCupertinoModalPopup(
        context: Get.context!,
        builder: (_) => Container(
              height: 300,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 15.0.h, right: 15.0.w),
                      child: Icon(
                        Icons.done,
                        size: 30.h,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 254.h,
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (date) {
                          onSelect(date);
                        }),
                  ),
                ],
              ),
            ));
  }
}
