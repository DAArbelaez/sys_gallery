import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sys_gallery/src/common/presentation/image_card.dart';
import 'package:sys_gallery/src/features/common/domain/image_data_model.dart';

import '../../../components/base/base_component_app.dart';

void main() {
  testWidgets('ImageCard displays image, title, and description', (WidgetTester tester) async {
    // Arrange
    const  imageData =  ImageDataModel(
      id: '1',
      title: 'Sample Image',
      description: 'This is a sample description',
      imageBase64: "",
    );

    const Widget imageCard = ImageCard(imageData);

    // Act
    await tester.pumpWidget(baseComponentApp(imageCard));

    // Assert
    expect(find.text('Sample Image'), findsOneWidget);
    expect(find.text('This is a sample description'), findsOneWidget);
  });
}
