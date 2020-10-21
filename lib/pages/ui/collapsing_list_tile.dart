import 'package:flutter/material.dart';
import 'package:zomato_test/common/size_config.dart';
import 'package:zomato_test/util/utils.dart';
import '../ui/theme.dart';

class CollapsingListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;
  final bool isSelected;
  final Function onTab;

  CollapsingListTile(
      {@required this.title,
      @required this.icon,
      @required this.animationController,
      this.isSelected = false,
      this.onTab});

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  Animation<double> widthAnimation, sizedBoxAnimation;

  @override
  void initState() {
    super.initState();

    widthAnimation =
        Tween<double>(begin: Util.px_250 * SizeConfig.heightMultiplier, end: Util.px_45 * SizeConfig.heightMultiplier).animate(widget.animationController);

    sizedBoxAnimation =
        Tween<double>(begin: Util.px_10 * SizeConfig.heightMultiplier, end: 0).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTab,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(Util.px_15 * SizeConfig.heightMultiplier),
          ),
          color: widget.isSelected
              ? Colors.transparent.withOpacity(0.3)
              : Colors.transparent,
        ),
        width: widthAnimation.value,
        margin: EdgeInsets.symmetric(horizontal: Util.px_5 * SizeConfig.heightMultiplier),
        padding: EdgeInsets.symmetric(horizontal: Util.px_4 * SizeConfig.heightMultiplier, vertical: Util.px_4 * SizeConfig.heightMultiplier),
        child: Row(

          children: <Widget>[
            Icon(
              widget.icon,
              color: widget.isSelected ? selectedColor : Colors.black,
              size: Util.px_24 * SizeConfig.heightMultiplier,
            ),
            SizedBox(
              width: sizedBoxAnimation.value,
            ),
            (widthAnimation.value >= Util.px_250 * SizeConfig.heightMultiplier)
                ? Text(
                    widget.title,
                    style: listTitleDefaultTextStyle,
                  )
                : Text("")
          ],
        ),
      ),
    );
  }
}
