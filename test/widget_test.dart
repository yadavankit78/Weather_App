import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/view-model/help_vm.dart';
import 'package:weather_app/views/screens/home_screen.dart';


// Mock class for HelpVm
class MockHelpVm extends Mock implements HelpVm {}

void main() {
  late MockHelpVm mockHelpVm;

  setUp(() {
    mockHelpVm = MockHelpVm();
  });

  testWidgets('HomeScreen renders correctly and shows loading initially', (WidgetTester tester) async {
    // Arrange
    when(mockHelpVm.weather).thenReturn(null); // No weather data initially
    when(mockHelpVm.getWeather()).thenAnswer((_) async => {});

    // Act
    await tester.pumpWidget(
      ChangeNotifierProvider<HelpVm>.value(
        value: mockHelpVm,
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    // Assert: AppBar is displayed
    expect(find.text('Weather App'), findsOneWidget);

    // Assert: TextFormField is displayed
    expect(find.byType(TextFormField), findsOneWidget);

    // Assert: Save button is displayed
    expect(find.text('Save'), findsOneWidget);

    // Assert: CircularProgressIndicator (loading state) is displayed
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Entering location and pressing Save button fetches weather', (WidgetTester tester) async {
    // Arrange
  //     when(mockHelpVm.weather).thenReturn(null);
  // when(mockHelpVm.getWeatherByLocation(any<String>())).thenAnswer((_) async => {});

    // Act
    await tester.pumpWidget(
      ChangeNotifierProvider<HelpVm>.value(
        value: mockHelpVm,
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    // Enter location in TextFormField
    await tester.enterText(find.byType(TextFormField), 'London');

    // Tap Save button
    await tester.tap(find.text('Save'));
    await tester.pump();

    // Assert: Check if the method to fetch weather by location was called
    verify(mockHelpVm.getWeatherByLocation('London')).called(1);
  });

  testWidgets('Displays weather information when data is available', (WidgetTester tester) async {
    // Arrange: Mock weather data
    final mockWeather = Weather(
      location: Location(name: 'London'),
      current: Current(tempC: 15.0, condition: Condition(text: 'Clear')),
    );
    when(mockHelpVm.weather).thenReturn(mockWeather);

    // Act
    await tester.pumpWidget(
      ChangeNotifierProvider<HelpVm>.value(
        value: mockHelpVm,
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    // Assert: Weather data is displayed
    expect(find.text('15.0°C'), findsOneWidget);
    expect(find.text('Clear'), findsOneWidget);
    expect(find.text('London'), findsOneWidget);
  });
}
