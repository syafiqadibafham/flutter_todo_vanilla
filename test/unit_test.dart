// import 'package:dio/dio.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';

// // Generate a MockDio class with the same API as the Dio class.
// @GenerateMocks([Dio])
// import 'unit_test.mocks.dart';

// void main() {
//   group('Repository', () {
//     late dynamic repository;
//     late MockDio mockDio;

//     setUp(() {
//       mockDio = MockDio();
//       //repository = EmployeesRepository(dio: mockDio);
//     });

//     // test('getEmployees returns a list of employees', () async {
//     //   // Since getEmployees is currently mocked with a delay and a static list,
//     //   // we are not testing the dio interaction here, but the method itself.
//     //   // When a real API is implemented, this test will need to be updated
//     //   // to mock the dio response.
//     //   final employees = await repository.getEmployees();
//     //   expect(employees, isA<List<String>>());
//     //   expect(employees.isNotEmpty, isTrue);
//     // });

//     // test('searchEmployees returns filtered list for a query', () async {
//     //   final query = 'Alice';
//     //   final employees = await repository.searchEmployees(query);
//     //   expect(employees, isA<List<String>>());
//     //   expect(employees.length, 1);
//     //   expect(employees.first, 'Alice Johnson');
//     // });

//     // test('searchEmployees returns all employees for an empty query', () async {
//     //   final query = '';
//     //   final employees = await repository.searchEmployees(query);
//     //   expect(employees, isA<List<String>>());
//     //   // Should be the full list
//     //   expect(employees.length, 8);
//     // });
//   });
// }
