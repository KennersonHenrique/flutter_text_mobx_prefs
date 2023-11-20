import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Include generated file
part 'infoPageStateManagement.g.dart';

class TextManagement = _TextManagement with _$TextManagement;

abstract class _TextManagement with Store {
  @observable
  String value = '';

  @action
  set(val) {
    value = val;
    setText(val);
  }

  @action
  remove() {
    value = '';
  }

  Future setText(val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('TEXT', val);
  }

  Future removeText() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('TEXT');
  }

  Future<String?> getText() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? TEXT = prefs.getString('TEXT');
    return TEXT;
  }
}

class EditText = _EditText with _$EditText;

abstract class _EditText with Store {
  @observable
  bool isEditable = false;

  @action
  set(bol) {
    isEditable = bol;
  }
}
