// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'municipality_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MunicipalityResponse> _$municipalityResponseSerializer =
    new _$MunicipalityResponseSerializer();

class _$MunicipalityResponseSerializer
    implements StructuredSerializer<MunicipalityResponse> {
  @override
  final Iterable<Type> types = const [
    MunicipalityResponse,
    _$MunicipalityResponse
  ];
  @override
  final String wireName = 'MunicipalityResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, MunicipalityResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(int)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(
              BuiltList, const [const FullType(MunicipalityModel)])),
    ];

    return result;
  }

  @override
  MunicipalityResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MunicipalityResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MunicipalityModel)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$MunicipalityResponse extends MunicipalityResponse {
  @override
  final int code;
  @override
  final String message;
  @override
  final BuiltList<MunicipalityModel> data;

  factory _$MunicipalityResponse(
          [void Function(MunicipalityResponseBuilder) updates]) =>
      (new MunicipalityResponseBuilder()..update(updates)).build();

  _$MunicipalityResponse._({this.code, this.message, this.data}) : super._() {
    if (code == null) {
      throw new BuiltValueNullFieldError('MunicipalityResponse', 'code');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('MunicipalityResponse', 'message');
    }
    if (data == null) {
      throw new BuiltValueNullFieldError('MunicipalityResponse', 'data');
    }
  }

  @override
  MunicipalityResponse rebuild(
          void Function(MunicipalityResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MunicipalityResponseBuilder toBuilder() =>
      new MunicipalityResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MunicipalityResponse &&
        code == other.code &&
        message == other.message &&
        data == other.data;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, code.hashCode), message.hashCode), data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MunicipalityResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class MunicipalityResponseBuilder
    implements Builder<MunicipalityResponse, MunicipalityResponseBuilder> {
  _$MunicipalityResponse _$v;

  int _code;
  int get code => _$this._code;
  set code(int code) => _$this._code = code;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ListBuilder<MunicipalityModel> _data;
  ListBuilder<MunicipalityModel> get data =>
      _$this._data ??= new ListBuilder<MunicipalityModel>();
  set data(ListBuilder<MunicipalityModel> data) => _$this._data = data;

  MunicipalityResponseBuilder();

  MunicipalityResponseBuilder get _$this {
    if (_$v != null) {
      _code = _$v.code;
      _message = _$v.message;
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MunicipalityResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MunicipalityResponse;
  }

  @override
  void update(void Function(MunicipalityResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MunicipalityResponse build() {
    _$MunicipalityResponse _$result;
    try {
      _$result = _$v ??
          new _$MunicipalityResponse._(
              code: code, message: message, data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MunicipalityResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
