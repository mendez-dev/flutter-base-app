// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'municipality_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MunicipalityModel> _$municipalityModelSerializer =
    new _$MunicipalityModelSerializer();

class _$MunicipalityModelSerializer
    implements StructuredSerializer<MunicipalityModel> {
  @override
  final Iterable<Type> types = const [MunicipalityModel, _$MunicipalityModel];
  @override
  final String wireName = 'MunicipalityModel';

  @override
  Iterable<Object> serialize(Serializers serializers, MunicipalityModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'stateId',
      serializers.serialize(object.stateId, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  MunicipalityModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MunicipalityModelBuilder();

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
        case 'stateId':
          result.stateId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MunicipalityModel extends MunicipalityModel {
  @override
  final int id;
  @override
  final int stateId;
  @override
  final String name;

  factory _$MunicipalityModel(
          [void Function(MunicipalityModelBuilder) updates]) =>
      (new MunicipalityModelBuilder()..update(updates)).build();

  _$MunicipalityModel._({this.id, this.stateId, this.name}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('MunicipalityModel', 'id');
    }
    if (stateId == null) {
      throw new BuiltValueNullFieldError('MunicipalityModel', 'stateId');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('MunicipalityModel', 'name');
    }
  }

  @override
  MunicipalityModel rebuild(void Function(MunicipalityModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MunicipalityModelBuilder toBuilder() =>
      new MunicipalityModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MunicipalityModel &&
        id == other.id &&
        stateId == other.stateId &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), stateId.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MunicipalityModel')
          ..add('id', id)
          ..add('stateId', stateId)
          ..add('name', name))
        .toString();
  }
}

class MunicipalityModelBuilder
    implements Builder<MunicipalityModel, MunicipalityModelBuilder> {
  _$MunicipalityModel _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _stateId;
  int get stateId => _$this._stateId;
  set stateId(int stateId) => _$this._stateId = stateId;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  MunicipalityModelBuilder();

  MunicipalityModelBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _stateId = _$v.stateId;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MunicipalityModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MunicipalityModel;
  }

  @override
  void update(void Function(MunicipalityModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MunicipalityModel build() {
    final _$result =
        _$v ?? new _$MunicipalityModel._(id: id, stateId: stateId, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
