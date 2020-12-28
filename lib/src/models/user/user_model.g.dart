// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserModel> _$userModelSerializer = new _$UserModelSerializer();

class _$UserModelSerializer implements StructuredSerializer<UserModel> {
  @override
  final Iterable<Type> types = const [UserModel, _$UserModel];
  @override
  final String wireName = 'UserModel';

  @override
  Iterable<Object> serialize(Serializers serializers, UserModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'userName',
      serializers.serialize(object.userName,
          specifiedType: const FullType(String)),
    ];
    if (object.idUSer != null) {
      result
        ..add('idUSer')
        ..add(serializers.serialize(object.idUSer,
            specifiedType: const FullType(int)));
    }
    if (object.token != null) {
      result
        ..add('token')
        ..add(serializers.serialize(object.token,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'idUSer':
          result.idUSer = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userName':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserModel extends UserModel {
  @override
  final int idUSer;
  @override
  final String name;
  @override
  final String userName;
  @override
  final String token;

  factory _$UserModel([void Function(UserModelBuilder) updates]) =>
      (new UserModelBuilder()..update(updates)).build();

  _$UserModel._({this.idUSer, this.name, this.userName, this.token})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('UserModel', 'name');
    }
    if (userName == null) {
      throw new BuiltValueNullFieldError('UserModel', 'userName');
    }
  }

  @override
  UserModel rebuild(void Function(UserModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserModelBuilder toBuilder() => new UserModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserModel &&
        idUSer == other.idUSer &&
        name == other.name &&
        userName == other.userName &&
        token == other.token;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, idUSer.hashCode), name.hashCode), userName.hashCode),
        token.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserModel')
          ..add('idUSer', idUSer)
          ..add('name', name)
          ..add('userName', userName)
          ..add('token', token))
        .toString();
  }
}

class UserModelBuilder implements Builder<UserModel, UserModelBuilder> {
  _$UserModel _$v;

  int _idUSer;
  int get idUSer => _$this._idUSer;
  set idUSer(int idUSer) => _$this._idUSer = idUSer;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _userName;
  String get userName => _$this._userName;
  set userName(String userName) => _$this._userName = userName;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  UserModelBuilder();

  UserModelBuilder get _$this {
    if (_$v != null) {
      _idUSer = _$v.idUSer;
      _name = _$v.name;
      _userName = _$v.userName;
      _token = _$v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserModel;
  }

  @override
  void update(void Function(UserModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserModel build() {
    final _$result = _$v ??
        new _$UserModel._(
            idUSer: idUSer, name: name, userName: userName, token: token);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
