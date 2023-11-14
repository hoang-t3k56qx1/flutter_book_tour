import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TextAreaBottomSheet extends StatefulWidget {
  TextAreaBottomSheet(
      {super.key,
        required this.title,
        required this.context,
        required this.onFinish,
        this.text,
        this.isNumberKeyboard,
        this.maxLength,
      });

  final String title;
  final String? text;
  final int? maxLength;
  final BuildContext context;
  bool? isNumberKeyboard;
  final void Function(String content) onFinish;

  @override
  State<TextAreaBottomSheet> createState() => _TextAreaBottomSheetState();

  static void show({
    required String title,
    String? text,
    bool isNumberKeyboard = false,
    int? maxLength,
    required BuildContext context,
    required void Function(String content) onFinish,
  }) {
    double screenHeight = MediaQuery.of(context).size.height;
    // showModalBottomSheet(
    //   isScrollControlled: true,
    //   constraints: BoxConstraints(
    //     maxHeight: screenHeight * 0.4,
    //   ),
    //   useSafeArea: true,
    //   shape: const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.vertical(
    //     top: Radius.circular(28.0),
    //   )),
    //   context: context,
    //   builder: (BuildContext context) {
    //     return TextAreaBottomSheet(
    //       title: title,
    //       text: text,
    //       isNumberKeyboard: isNumberKeyboard,
    //       context: context,
    //       onFinish: onFinish,
    //     );
    //   },
    // );
    showModalBottomSheet(
      isScrollControlled: true,
      useRootNavigator: true,
      constraints: BoxConstraints(
        maxHeight: screenHeight * 0.8,
      ),
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(28.0),
          )),
      context: context,
      builder: (BuildContext context) {
        return TextAreaBottomSheet(
          title: title,
          text: text,
          isNumberKeyboard: isNumberKeyboard,
          context: context,
          onFinish: onFinish,
          maxLength: maxLength,
        );
      },
    );
  }
}

class _TextAreaBottomSheetState extends State<TextAreaBottomSheet> {
  final controller = TextEditingController();
  @override
  void initState() {
    controller.text = widget.text ?? '';
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
      child: Padding(
        padding: EdgeInsets.only(
            top: 8.0, bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16),
              width: 45,
              height: 4,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(9, 45, 106, 1),
                  borderRadius: BorderRadius.all(Radius.circular(18))),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Hủy',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 0, 0, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        color: Color.fromRGBO(9, 45, 106, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (controller.text.isNotEmpty) {
                        widget.onFinish(controller.text);
                      }
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Xong',
                      style: TextStyle(
                        color: Color.fromRGBO(2, 107, 203, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xffC9D4E4),
              height: 1,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: TextField(
                    autofocus: true,
                    minLines: 5,
                    maxLines: null,
                    maxLength: widget.maxLength ?? 1000,
                    controller: controller,
                    keyboardType: widget.isNumberKeyboard == false
                        ? null
                        : TextInputType.number,
                    inputFormatters: widget.isNumberKeyboard == false
                        ? null
                        : [
                      // FilteringTextInputFormatter.digitsOnly,
                      SingleMinusFormatter(),
                    ],
                    decoration: InputDecoration(
                      hintText: 'Nhập ${widget.title}',
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      // border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SingleMinusFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final updatedText = _removeExtraMinusSigns(newValue.text);
    final updatedSelection = _updateSelection(newValue, updatedText);
    return TextEditingValue(
      text: updatedText,
      selection: updatedSelection,
      composing: TextRange.empty,
    );
  }

  String _removeExtraMinusSigns(String text) {
    final cleanText = text.replaceAll(
        RegExp(r'[^-0-9]'), ''); // Loại bỏ các ký tự không phải số và dấu trừ
    if (cleanText.startsWith('-')) {
      // Kiểm tra nếu dấu "-" xuất hiện ở đầu chuỗi
      final minusIndex = cleanText.indexOf('-', 1);
      if (minusIndex != -1) {
        // Nếu có nhiều hơn một dấu "-", loại bỏ chúng
        final updatedText = '-${cleanText.substring(1).replaceAll('-', '')}';
        return updatedText;
      }
    } else if (_startsWithNumber(cleanText)) {
      // Kiểm tra nếu ký tự nhập đầu tiên là số
      final updatedText =
      cleanText.replaceAll('-', ''); // Loại bỏ dấu trừ nếu có
      return updatedText;
    }
    return cleanText;
  }

  bool _startsWithNumber(String text) {
    final firstChar = text.isNotEmpty ? text[0] : null;
    return firstChar != null && RegExp(r'[0-9]').hasMatch(firstChar);
  }

  TextSelection _updateSelection(TextEditingValue value, String updatedText) {
    final int lengthDiff = value.text.length - updatedText.length;
    final int start = value.selection.start - lengthDiff;
    final int end = value.selection.end - lengthDiff;
    return TextSelection.collapsed(
        offset: start >= 0 ? start : 0, affinity: value.selection.affinity);
  }
}