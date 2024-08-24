import 'package:noize_app/common/styles/colors.dart';
import 'package:noize_app/utils/device_utils.dart';
import 'package:flutter/material.dart';

class CustomTextfield1 extends StatefulWidget {
  final String? hint;
  final String? label;
  final double pixelHeight;
  final double pixelWidth;
  final double? height;
  final double? width;
  final bool? alwaysShowSuffixIcon;
  final String? defaultText;
  final void Function()? ontap;
  final Function(String text)? onchanged;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Icon? prefixIcon;
  final bool obscureText;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;

  const CustomTextfield1({
    super.key,
    this.hint,
    this.label,
    this.height,
    this.width,
    this.alwaysShowSuffixIcon = false,
    this.defaultText = "",
    this.ontap,
    this.onchanged,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.pixelHeight = 48,
    this.pixelWidth = 200,
    this.obscureText= false,
    this.hintStyle,
    this.labelStyle,

  });

  @override
  State<CustomTextfield1> createState() => _TextField1State();
}

class _TextField1State extends State<CustomTextfield1> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  String? text;
  bool checkForSuffixIcon = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(refreshSuffixIconState);
     if(widget.alwaysShowSuffixIcon == true){
      
     }else{
      controller.addListener(refreshSuffixIconState);
     }
    controller.text = widget.defaultText ?? "";
    refreshSuffixIconState();
  }

  @override
  void dispose() {
    focusNode.removeListener(refreshSuffixIconState);
    controller.removeListener(refreshSuffixIconState);
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }
  

  void refreshSuffixIconState() {
    if(widget.alwaysShowSuffixIcon == true){
      checkForSuffixIcon = true;
    }else{
      widget.suffixIcon != null && focusNode.hasFocus && controller.text.isNotEmpty 
       ? checkForSuffixIcon = true : checkForSuffixIcon = false;
    }
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: widget.width != null ? DeviceUtils.getScreenWidth(context) * (widget.width! / 100) : widget.pixelWidth,
      height: widget.height != null ? DeviceUtils.getScreenHeight(context) * (widget.height! / 100) : widget.pixelHeight,
      child: TextField(
        obscureText: (widget.obscureText == false) ? false : true,
        keyboardType: widget.keyboardType,
        controller: controller,
        focusNode: focusNode,
        onChanged: (text) {
          setState(() {
            text = controller.text;
            refreshSuffixIconState();
          });
         if(widget.onchanged != null){
          widget.onchanged;
         }
        },
        onTap: widget.ontap,
        onTapOutside: (e){focusNode.unfocus(); debugPrint("Tapped outside");},
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: checkForSuffixIcon == true ? widget.suffixIcon : SizedBox(),
          hintText: widget.hint,
          labelText: widget.label,
          labelStyle: widget.labelStyle ?? TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          hintStyle: widget.hintStyle ?? TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          filled: true,
          fillColor: Theme.of(context).colorScheme.secondary,
          contentPadding: const EdgeInsets.all(16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: NoizeColors.lavender,
              width: 1.5,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1.5,
            ),
            
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: NoizeColors.ultraMarine,
              width: 1.5,
            ),
          )
        ),
      ),
    );
  }
}
