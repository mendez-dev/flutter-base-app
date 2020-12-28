// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LoginModel> _$loginModelSerializer = new _$LoginModelSerializer();

class _$LoginModelSerializer implements StructuredSerializer<LoginModel> {
  @override
  final Iterable<Type> types = const [LoginModel, _$LoginModel];
  @override
  final String wireName = 'LoginModel';

  @override
  Iterable<Object> serialize(Serializers serializers, LoginModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
      'fcmToken',
      serializers.serialize(object.fcmToken,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  LoginModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fcmToken':
          result.fcmToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LoginModel extends LoginModel {
  @override
  final String user;
  @override
  final String password;
  @override
  final String fcmToken;

  factory _$LoginModel([void Function(LoginModelBuilder) updates]) =>
      (new LoginModelBuilder()..update(updates)).build();

  _$LoginModel._({this.user, this.password, this.fcmToken}) : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('LoginModel', 'user');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('LoginModel', 'password');
    }
    if (fcmToken == null) {
      throw new BuiltValueNullFieldError('LoginModel', 'fcmToken');
    }
  }

  @override
  LoginModel rebuild(void Function(LoginModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginModelBuilder toBuilder() => new LoginModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginModel &&
        user == other.user &&
        password == other.password &&
        fcmToken == other.fcmToken;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, user.hashCode), password.hashCode), fcmToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginModel')
          ..add('user', user)
          ..add('password', password)
          ..add('fcmToken', fcmToken))
        .toString();
  }
}

class LoginModelBuilder implements Builder<LoginModel, LoginModelBuilder> {
  _$LoginModel _$v;

  String _user;
  String get user => _$this._user;
  set user(String user) => _$this._user = user;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _fcmToken;
  String get fcmToken => _$this._fcmToken;
  set fcmToken(String fcmToken) => _$this._fcmToken = fcmToken;

  LoginModelBuilder();

  LoginModelBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user;
      _password = _$v.password;
      _fcmToken = _$v.fcmToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginModel;
  }

  @override
  void update(void Function(LoginModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginModel build() {
    final _$result = _$v ??
        new _$LoginModel._(user: user, password: password, fcmToken: fcmToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
