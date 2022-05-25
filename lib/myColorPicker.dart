// my_color_picker.dart
import 'package:flutter/material.dart';

class MyColorPicker extends StatefulWidget {
  // This function sends the selected color to outside
  final Function onSelectColor;

  // List of pickable colors
  final List<Color> availableColors;

  // The default picked color
  final Color initialColor;

  // Determnie shapes of color cells
  final bool circleItem;

  const MyColorPicker(
      {Key? key,
        required this.onSelectColor,
        required this.availableColors,
        required this.initialColor,
        this.circleItem = true})
      : super(key: key);

  @override
  _MyColorPickerState createState() => _MyColorPickerState();
}

class _MyColorPickerState extends State<MyColorPicker> {
  // This variable used to determine where the checkmark will be
  late Color _pickedColor;

  @override
  void initState() {
    _pickedColor = widget.initialColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
         height: 300,
        child: ListView.builder(
            scrollDirection : Axis.horizontal,
            shrinkWrap: true,
            itemCount: widget.availableColors.length,
            itemBuilder: (context, index) {
              final itemColor = widget.availableColors[index];
              return  InkWell(
                  onTap: () {
                    widget.onSelectColor(itemColor);
                    setState(() {
                      _pickedColor = itemColor;
                    });
                    setState(() {

                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 10,top: 10),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: itemColor,
                          shape: widget.circleItem == true
                              ? BoxShape.circle
                              : BoxShape.rectangle,
                          border: Border.all(width: 1, color: Colors.grey.shade300)),
                      child: itemColor == _pickedColor
                      ? const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      )
                          : Container(),
                    ),
                  ),
                );
            },
          ),
      ),
    );
  }

}