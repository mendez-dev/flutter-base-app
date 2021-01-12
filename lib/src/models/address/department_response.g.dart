// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DepartmentResponse> _$departmentResponseSerializer =
    new _$DepartmentResponseSerializer();

class _$DepartmentResponseSerializer
    implements StructuredSerializer<DepartmentResponse> {
  @override
  final Iterable<Type> types = const [DepartmentResponse, _$DepartmentResponse];
  @override
  final String wireName = 'DepartmentResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, DepartmentResponse object,
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
              BuiltList, const [const FullType(DepartmentModel)])),
    ];

    return result;
  }

  @override
  DepartmentResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DepartmentResponseBuilder();

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
                      BuiltList, const [const FullType(DepartmentModel)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$DepartmentResponse extends DepartmentResponse {
  @override
  final int code;
  @override
  final String message;
  @override
  final BuiltList<DepartmentModel> data;

  factory _$DepartmentResponse(
          [void Function(DepartmentResponseBuilder) updates]) =>
      (new DepartmentResponseBuilder()..update(updates)).build();

  _$DepartmentResponse._({this.code, this.message, this.data}) : super._() {
    if (code == null) {
      throw new BuiltValueNullFieldError('DepartmentResponse', 'code');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('DepartmentResponse', 'message');
    }
    if (data == null) {
      throw new BuiltValueNullFieldError('DepartmentResponse', 'data');
    }
  }

  @override
  DepartmentResponse rebuild(
          void Function(DepartmentResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DepartmentResponseBuilder toBuilder() =>
      new DepartmentResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DepartmentResponse &&
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
    return (newBuiltValueToStringHelper('DepartmentResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class DepartmentResponseBuilder
    implements Builder<DepartmentResponse, DepartmentResponseBuilder> {
  _$DepartmentResponse _$v;

  int _code;
  int get code => _$this._code;
  set code(int code) => _$this._code = code;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ListBuilder<DepartmentModel> _data;
  ListBuilder<DepartmentModel> get data =>
      _$this._data ??= new ListBuilder<DepartmentModel>();
  set data(ListBuilder<DepartmentModel> data) => _$this._data = data;

  DepartmentResponseBuilder();

  DepartmentResponseBuilder get _$this {
    if (_$v != null) {
      _code = _$v.code;
      _message = _$v.message;
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DepartmentResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DepartmentResponse;
  }

  @override
  void update(void Function(DepartmentResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DepartmentResponse build() {
    _$DepartmentResponse _$result;
    try {
      _$result = _$v ??
          new _$DepartmentResponse._(
              code: code, message: message, data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DepartmentResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
