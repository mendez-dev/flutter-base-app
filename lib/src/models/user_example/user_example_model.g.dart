// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_example_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserExampleModel> _$userExampleModelSerializer =
    new _$UserExampleModelSerializer();

class _$UserExampleModelSerializer
    implements StructuredSerializer<UserExampleModel> {
  @override
  final Iterable<Type> types = const [UserExampleModel, _$UserExampleModel];
  @override
  final String wireName = 'UserExampleModel';

  @override
  Iterable<Object> serialize(Serializers serializers, UserExampleModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UserExampleModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserExampleModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserExampleModel extends UserExampleModel {
  @override
  final int id;
  @override
  final String name;
  @override
  final String address;

  factory _$UserExampleModel(
          [void Function(UserExampleModelBuilder) updates]) =>
      (new UserExampleModelBuilder()..update(updates)).build();

  _$UserExampleModel._({this.id, this.name, this.address}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('UserExampleModel', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('UserExampleModel', 'name');
    }
    if (address == null) {
      throw new BuiltValueNullFieldError('UserExampleModel', 'address');
    }
  }

  @override
  UserExampleModel rebuild(void Function(UserExampleModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserExampleModelBuilder toBuilder() =>
      new UserExampleModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserExampleModel &&
        id == other.id &&
        name == other.name &&
        address == other.address;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), name.hashCode), address.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserExampleModel')
          ..add('id', id)
          ..add('name', name)
          ..add('address', address))
        .toString();
  }
}

class UserExampleModelBuilder
    implements Builder<UserExampleModel, UserExampleModelBuilder> {
  _$UserExampleModel _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  UserExampleModelBuilder();

  UserExampleModelBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _address = _$v.address;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserExampleModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserExampleModel;
  }

  @override
  void update(void Function(UserExampleModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserExampleModel build() {
    final _$result =
        _$v ?? new _$UserExampleModel._(id: id, name: name, address: address);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
