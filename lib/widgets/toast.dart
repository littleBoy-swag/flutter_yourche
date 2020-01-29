import 'package:flutter/material.dart';

class Toast {

  static _ToastView _toastView;

  static show(BuildContext context, String message) {
    _toastView?.dismiss();
    _toastView = null;
    var overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(builder: (context) {
      return _buildToastLayout(message);
    });
    var toastView = _ToastView();
    toastView.overlayState = overlayState;
    toastView.overlayEntry = overlayEntry;
    _toastView = toastView;
    _toastView._show();
  }

  static _buildToastLayout(String message) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return IgnorePointer(
          ignoring: true,
          child: Container(
            child: Material(
              color: Colors.white.withOpacity(0),
              child: Container(
                child: Container(
                  child: Text(
                    "$message",
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      )),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                margin: EdgeInsets.only(
                  bottom: constraints.biggest.height * 0.15,
                  left: constraints.biggest.width * 0.2,
                  right: constraints.biggest.width * 0.2,
                ),
              ),
            ),
            alignment: Alignment.bottomCenter,
          ),
        );
      },
    );
  }
}

class _ToastView {
  OverlayEntry overlayEntry;
  OverlayState overlayState;
  bool dismissed = false;

  _show() async {
    overlayState.insert(overlayEntry);
    await Future.delayed(Duration(milliseconds: 1500));
    dismiss();
  }

  dismiss() {
    if (dismissed) {
      return;
    }
    dismissed = true;
    overlayEntry?.remove();
  }
}
