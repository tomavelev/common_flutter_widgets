import 'package:common_flutter_widgets/common_flutter_widgets.dart';
import 'package:common_flutter_widgets/src/components/platform/get_platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:widget_toolkit/item_picker.dart';
import 'package:widget_toolkit/models.dart';

const double _kItemExtent = 32.0;

void cItemPicker<T extends PickerItemModel>({
  required BuildContext context,
  required List<T> items,
  T? selectedItem,
  Function(T)? callback,
}) =>
    isApple()
        ? showCupertinoModalPopup(
            context: context,
            semanticsDismissible: true,
            builder: (context) => SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: CupertinoPicker(
                      magnification: 1.22,
                      squeeze: 1.2,
                      useMagnifier: true,
                      backgroundColor: CupertinoColors.white.withOpacity(0.8),
                      itemExtent: _kItemExtent,
                      // This sets the initial item.
                      scrollController: FixedExtentScrollController(
                        initialItem: selectedItem == null
                            ? 0
                            : items.indexOf(selectedItem),
                      ),
                      // This is called when selected item is changed.
                      onSelectedItemChanged: (int selectedItem) {
                        callback?.call(items[selectedItem]);
                      },

                      children: List<Widget>.generate(items.length, (int index) {
                        return Center(child: Text(items[index].toString()));
                      }),
                    ),
                  ),
                  CInkWell(
                    child: const Icon(CupertinoIcons.check_mark),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ),
            ),
          )
        : showItemPickerBottomSheet<T>(
            context: context,
            callback: (items) {
              if (items.isNotEmpty) callback?.call(items.first);
            },
            configuration: const ItemPickerConfiguration(
              isItemSelectionRequired: false,
              isMultiSelect: false,
              isStatic: false,
            ),
            service: _ItemPickerService<T>(items));

class _ItemPickerService<T extends PickerItemModel>
    implements ItemPickerService<T> {
  final List<T> items;

  _ItemPickerService(this.items);

  @override
  Future<List<T>> getItems() => Future.value(items);
}