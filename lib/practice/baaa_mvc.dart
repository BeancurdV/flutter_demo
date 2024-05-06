abstract class BaseView<T extends StateController> {
  T createStateController();

  BaseView() {
    T cotroller = createStateController();
    View v = cotroller.createView();
    // do something
  }
}

class View {}

abstract class StateController<T extends View> {
  T createView();
}

class LoginInputView extends BaseView<LoginInputController> {
  @override
  LoginInputController createStateController() => LoginInputController<View>();
}

class LoginInputController<T extends View> extends StateController {
  @override
  View createView() {
    return View();
  }
}
