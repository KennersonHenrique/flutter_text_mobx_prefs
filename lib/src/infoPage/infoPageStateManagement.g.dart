// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infoPageStateManagement.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TextManagement on _TextManagement, Store {
  late final _$valueAtom =
      Atom(name: '_TextManagement.value', context: context);

  @override
  String get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$_TextManagementActionController =
      ActionController(name: '_TextManagement', context: context);

  @override
  dynamic set(dynamic val) {
    final _$actionInfo = _$_TextManagementActionController.startAction(
        name: '_TextManagement.set');
    try {
      return super.set(val);
    } finally {
      _$_TextManagementActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic remove() {
    final _$actionInfo = _$_TextManagementActionController.startAction(
        name: '_TextManagement.remove');
    try {
      return super.remove();
    } finally {
      _$_TextManagementActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}

mixin _$EditText on _EditText, Store {
  late final _$isEditableAtom =
      Atom(name: '_EditText.isEditable', context: context);

  @override
  bool get isEditable {
    _$isEditableAtom.reportRead();
    return super.isEditable;
  }

  @override
  set isEditable(bool value) {
    _$isEditableAtom.reportWrite(value, super.isEditable, () {
      super.isEditable = value;
    });
  }

  late final _$_EditTextActionController =
      ActionController(name: '_EditText', context: context);

  @override
  dynamic set(dynamic bol) {
    final _$actionInfo =
        _$_EditTextActionController.startAction(name: '_EditText.set');
    try {
      return super.set(bol);
    } finally {
      _$_EditTextActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEditable: ${isEditable}
    ''';
  }
}
