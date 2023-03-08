import 'dart:math';

import 'package:counter_app/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Counter counter;

  setUp(() {
    counter = Counter();
  });

// Testing
  group('Counter Class - ', () {
    test(
      'given counter class when it is instantiated then value of count should be 0',
      () {
        // Act
        final val = counter.count;
        // Assert
        expect(val, 0);
      },
    );

    test(
      'given counter class when it is incremented then the value of count should be 1',
      () {
        // Act
        counter.incrementCounter();
        final val = counter.count;
        // Assert
        expect(val, 1);
      },
    );

    test(
      'given counter class when it is decremented then the value of count should be -1',
      () {
        counter.decrementCounter();
        final val = counter.count;
        expect(val, -1);
      },
    );

    test(
      'given counter class when it is reset then the value of count should be 0',
      () {
        counter.reset();
        expect(counter.count, 0);
      },
    );
  });
}
