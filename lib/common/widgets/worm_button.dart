import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:viveo_task/common/themes/colors.dart';
import 'package:viveo_task/common/themes/dimens.dart';
import 'package:viveo_task/common/themes/text_styles.dart';

class WormButton extends StatefulWidget {
  final List<WormItem> items;
  final Function(int)? onIndexChanged;
  final int selectedTab;
  final inProgress;

  WormButton({
    required this.items,
    this.onIndexChanged,
    this.selectedTab = 0,
    this.inProgress = false,
  });

  @override
  _WormButtonState createState() => _WormButtonState();
}

class _WormButtonState extends State<WormButton> {

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
            onTap: widget.inProgress
                ? null
                : () {
                    if (_isSelected(item) && item.enabled) {
                      item.onTap();
                    } else {
                      widget.onIndexChanged?.call(widget.items.indexOf(item));
                    }
                  },
            child: _isSelected(item)
                ? _selectedContent(item)
                : _unselectedContent(item),
          ),
        ),
      ),
    );
  }

  Widget _selectedContent(WormItem item) {
    if (widget.inProgress) {
      return Center(
        child: Container(
          height: Dimens.iconSize,
          width: Dimens.iconSize,
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Center(
        child: Text(
          item.title,
          style: TextStyles.action,
        ),
      );
    }
  }

  Widget _unselectedContent(WormItem item) {
    return Center(
      child: Text(
        item.title,
        style: TextStyles.action,
      ),
    );
  }

  Color? _getColor(WormItem item) {
    if (_isSelected(item)) {
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
    if (_isSelected(item)) {
      if (item.enabled) {
        return colorDarkPink;
      } else {
        return colorDisabled;
      }
    } else {
      return colorDarkPink;
    }
  }

  bool _isSelected(WormItem item) => widget.items[widget.selectedTab] == item;

}

class WormItem {
  final String title;
  final VoidCallback onTap;
  final bool enabled;

  WormItem({required this.title, required this.onTap, this.enabled = true});
}
