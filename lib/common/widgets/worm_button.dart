import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:viveo_task/common/themes/colors.dart';
import 'package:viveo_task/common/themes/dimens.dart';
import 'package:viveo_task/common/themes/text_styles.dart';

class WormButton extends StatefulWidget {
  final List<WormItem> items;
  final Function(int)? onIndexChanged;

  WormButton({required this.items, this.onIndexChanged});

  @override
  _WormButtonState createState() => _WormButtonState();
}

class _WormButtonState extends State<WormButton> {
  WormItem? selectedItem;

  @override
  void initState() {
    super.initState();
    if (widget.items.isNotEmpty) {
      setState(() {
        selectedItem = widget.items[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorDarkBlue,
        borderRadius: Dimens.borderRadius,
      ),
      child: Row(
        children: widget.items.map(_renderItem).toList(),
      ),
    );
  }

  Widget _renderItem(WormItem item) {
    return Flexible(
      child: Container(
        height: Dimens.buttonHeight,
        decoration: BoxDecoration(
          color: _getColor(item),
          borderRadius: Dimens.borderRadius,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: Dimens.borderRadius,
            splashColor: _getSplashColor(item),
            focusColor: _getSplashColor(item),
            highlightColor: _getSplashColor(item),
            onTap: () {
              if (item == selectedItem && item.enabled) {
                item.onTap();
              } else {
                widget.onIndexChanged?.call(widget.items.indexOf(item));
                setState(() {
                  selectedItem = item;
                });
              }
            },
            child: Center(
              child: Text(
                item.title,
                style: item == selectedItem
                    ? TextStyles.action
                    : TextStyles.disabledAction,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color? _getColor(WormItem item) {
    if (item == selectedItem) {
      if (item.enabled) {
        return colorPink;
      } else {
        return colorDisabled;
      }
    } else {
      return null;
    }
  }

  Color? _getSplashColor(WormItem item) {
    if (item == selectedItem) {
      if (item.enabled) {
        return colorDarkPink;
      } else {
        return colorDisabled;
      }
    } else {
      return colorDarkPink;
    }
  }
}

class WormItem {
  final String title;
  final VoidCallback onTap;
  final bool enabled;

  WormItem({required this.title, required this.onTap, this.enabled = true});
}
