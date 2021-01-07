// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_example_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserExampleResponse> _$userExampleResponseSerializer =
    new _$UserExampleResponseSerializer();

class _$UserExampleResponseSerializer
    implements StructuredSerializer<UserExampleResponse> {
  @override
  final Iterable<Type> types = const [
    UserExampleResponse,
    _$UserExampleResponse
  ];
  @override
  final String wireName = 'UserExampleResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, UserExampleResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(int)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(UserPaging)),
    ];

    return result;
  }

  @override
  UserExampleResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserExampleResponseBuilder();

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
              specifiedType: const FullType(UserPaging)) as UserPaging);
          break;
      }
    }

    return result.build();
  }
}

class _$UserExampleResponse extends UserExampleResponse {
  @override
  final int code;
  @override
  final String message;
  @override
  final UserPaging data;

  factory _$UserExampleResponse(
          [void Function(UserExampleResponseBuilder) updates]) =>
      (new UserExampleResponseBuilder()..update(updates)).build();

  _$UserExampleResponse._({this.code, this.message, this.data}) : super._() {
    if (code == null) {
      throw new BuiltValueNullFieldError('UserExampleResponse', 'code');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('UserExampleResponse', 'message');
    }
    if (data == null) {
      throw new BuiltValueNullFieldError('UserExampleResponse', 'data');
    }
  }

  @override
  UserExampleResponse rebuild(
          void Function(UserExampleResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserExampleResponseBuilder toBuilder() =>
      new UserExampleResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserExampleResponse &&
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
    return (newBuiltValueToStringHelper('UserExampleResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('data', data))
        .toString();
  }
}

class UserExampleResponseBuilder
    implements Builder<UserExampleResponse, UserExampleResponseBuilder> {
  _$UserExampleResponse _$v;

  int _code;
  int get code => _$this._code;
  set code(int code) => _$this._code = code;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  UserPagingBuilder _data;
  UserPagingBuilder get data => _$this._data ??= new UserPagingBuilder();
  set data(UserPagingBuilder data) => _$this._data = data;

  UserExampleResponseBuilder();

  UserExampleResponseBuilder get _$this {
    if (_$v != null) {
      _code = _$v.code;
      _message = _$v.message;
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserExampleResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserExampleResponse;
  }

  @override
  void update(void Function(UserExampleResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserExampleResponse build() {
    _$UserExampleResponse _$result;
    try {
      _$result = _$v ??
          new _$UserExampleResponse._(
              code: code, message: message, data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserExampleResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
