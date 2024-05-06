/**
 * 声明一个带作用域的 Mixin
 * 1. 抽取公共逻辑，并且不增加 集成体系的复杂性
 * 2. 可以存在作用域
 */
mixin TradePwdController on AndroidComposeUI {
  setPwd(String pwd) {
    print('try to set the pwd');
  }

  verifyPwd(String pwd) {
    print('try to verify the pwd');
  }
}

class AndroidXmlUI {}

class AndroidComposeUI {}
/*
// 'TradePwdController' can't be mixed onto 'AndroidXmlUI' because 'AndroidXmlUI' doesn't implement 'AndroidComposeUI'
class LoanPage extends AndroidXmlUI with TradePwdController {
  onSetPwdClicked() {
    setPwd("123");
  }

  onVerifyPwdClicked() {
    verifyPwd("123");
  }
}
 */

class RepayPage extends AndroidComposeUI with TradePwdController {
  onSetPwdClicked() {
    setPwd("123");
  }

  onVerifyPwdClicked() {
    verifyPwd("123");
  }
}
