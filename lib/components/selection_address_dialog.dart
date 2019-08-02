import 'package:flutter/material.dart';
import 'package:wealthpal/components/circular_image.dart';
import 'package:wealthpal/views/theme.dart';

/// selection dialog used for selection of the country code
class SelectionAddressDialog extends StatefulWidget {
  /// elements passed as favorite
  final List<String> elements;

  SelectionAddressDialog(
    this.elements, {
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectionAddressDialogState();
}

class _SelectionAddressDialogState extends State<SelectionAddressDialog> {
  /// this is useful for filtering purpose

  @override
  Widget build(BuildContext context) => SimpleDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/images/close.png", width: 24, height: 24),
            ),
            Expanded(
              child: Text(
                "Select address",
                textAlign: TextAlign.center,
                style: AppStyles.dialogTitleStyle,
              ),
            ),
          ],
        ),
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(width: 1, color: AppColors.cE0E0E0))),
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: AppColors.cE0E0E0),
                      ),
                    ),
                    child: SimpleDialogOption(
                      child: Text("Enter address manually →", style: TextStyle(color: AppColors.c2F80ED),),
                      onPressed: () {
                        _selectItem("Manual Address Input");
                      },
                    )
                  ),
                  widget.elements.isEmpty
                      ? const DecoratedBox(decoration: BoxDecoration())
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[]
                            ..addAll(widget.elements
                                .map(
                                  (f) => SimpleDialogOption(
                                    child: _buildOption(f),
                                    onPressed: () {
                                      _selectItem(f);
                                    },
                                  ),
                                )
                                .toList())
                            ..add(const Divider()),
                  ),
                ],
              ),
          ),
        ],
      );

  Widget _buildOption(String e) {
    return Container(
      width: 400,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Text(
              e,
              overflow: TextOverflow.fade,
              style: AppStyles.inputTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  void _selectItem(String e) {
    Navigator.pop(context, e);
  }
}
