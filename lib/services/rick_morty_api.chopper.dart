// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rick_morty_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$RickMortyApiService extends RickMortyApiService {
  _$RickMortyApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = RickMortyApiService;

  @override
  Future<Response<dynamic>> getCharecters() {
    final Uri $url = Uri.parse('/charecter');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
