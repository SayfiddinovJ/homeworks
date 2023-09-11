import 'package:homeworks/data/graphql/api_service.dart';
import 'package:homeworks/data/graphql/queries/ships_query.dart' as queries;
import 'package:graphql/client.dart';

class GetJobsRequestFailure implements Exception {}

class ShipsApiClient {
  const ShipsApiClient({required this.graphQLClient});

  factory ShipsApiClient.create() {
    final httpLink = HttpLink('https://spacex-production.up.railway.app/');
    final link = Link.from([httpLink]);

    return ShipsApiClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }

  final GraphQLClient graphQLClient;

  Future<List<ShipsModel>> getCountries() async {
    final result = await graphQLClient.query(
      QueryOptions(document: gql(queries.getJobs)),
    );

    if (result.hasException) throw GetJobsRequestFailure();
    return (result.data?['ships'] as List?)
        ?.map((dynamic e) => ShipsModel.fromJson(e as Map<String, dynamic>))
        .toList() ??
        [];
  }
}