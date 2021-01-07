// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_paging.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserPaging> _$userPagingSerializer = new _$UserPagingSerializer();

class _$UserPagingSerializer implements StructuredSerializer<UserPaging> {
  @override
  final Iterable<Type> types = const [UserPaging, _$UserPaging];
  @override
  final String wireName = 'UserPaging';

  @override
  Iterable<Object> serialize(Serializers serializers, UserPaging object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'pages',
      serializers.serialize(object.pages, specifiedType: const FullType(int)),
      'current',
      serializers.serialize(object.current, specifiedType: const FullType(int)),
      'users',
      serializers.serialize(object.users,
          specifiedType: const FullType(
              BuiltList, const [const FullType(UserExampleModel)])),
    ];

    return result;
  }

  @override
  UserPaging deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserPagingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'pages':
          result.pages = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'current':
          result.current = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'users':
          result.users.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserExampleModel)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$UserPaging extends UserPaging {
  @override
  final int pages;
  @override
  final int current;
  @override
  final BuiltList<UserExampleModel> users;

  factory _$UserPaging([void Function(UserPagingBuilder) updates]) =>
      (new UserPagingBuilder()..update(updates)).build();

  _$UserPaging._({this.pages, this.current, this.users}) : super._() {
    if (pages == null) {
      throw new BuiltValueNullFieldError('UserPaging', 'pages');
    }
    if (current == null) {
      throw new BuiltValueNullFieldError('UserPaging', 'current');
    }
    if (users == null) {
      throw new BuiltValueNullFieldError('UserPaging', 'users');
    }
  }

  @override
  UserPaging rebuild(void Function(UserPagingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserPagingBuilder toBuilder() => new UserPagingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserPaging &&
        pages == other.pages &&
        current == other.current &&
        users == other.users;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, pages.hashCode), current.hashCode), users.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserPaging')
          ..add('pages', pages)
          ..add('current', current)
          ..add('users', users))
        .toString();
  }
}

class UserPagingBuilder implements Builder<UserPaging, UserPagingBuilder> {
  _$UserPaging _$v;

  int _pages;
  int get pages => _$this._pages;
  set pages(int pages) => _$this._pages = pages;

  int _current;
  int get current => _$this._current;
  set current(int current) => _$this._current = current;

  ListBuilder<UserExampleModel> _users;
  ListBuilder<UserExampleModel> get users =>
      _$this._users ??= new ListBuilder<UserExampleModel>();
  set users(ListBuilder<UserExampleModel> users) => _$this._users = users;

  UserPagingBuilder();

  UserPagingBuilder get _$this {
    if (_$v != null) {
      _pages = _$v.pages;
      _current = _$v.current;
      _users = _$v.users?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserPaging other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserPaging;
  }

  @override
  void update(void Function(UserPagingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserPaging build() {
    _$UserPaging _$result;
    try {
      _$result = _$v ??
          new _$UserPaging._(
              pages: pages, current: current, users: users.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'users';
        users.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserPaging', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
