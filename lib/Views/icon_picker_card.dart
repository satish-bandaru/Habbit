import 'package:habbit/Views/icon_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:habbit/Constants/activity_icons.dart';
import 'package:habbit/Constants/styles.dart';

class IconPickerCard extends StatelessWidget {
  IconPickerCard({
    @required this.activeColor,
    @required this.activeIcon,
    @required this.onIconChanged,
  });

  final ActivityIcon activeIcon;
  final Color activeColor;
  final Function onIconChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      child: Material(
        color: kWhiteColor,
        elevation: 6.0,
        borderRadius: BorderRadius.circular(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Icon',
                style: kPickerTitleStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return IconPicker(
                        currentIcon: activeIcon,
                        accentColor: activeColor,
                        onIconChanged: (icon) {
                          onIconChanged(icon);
                        },
                      );
                    },
                  );
                },
                child: CircleAvatar(
                  backgroundColor: activeColor,
                  child: Image(
                    image: AssetImage(
                      activeIcon.imagePath,
                    ),
                    width: 25.0,
                    height: 25.0,
                  ),
                  radius: 20.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
