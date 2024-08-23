import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sys_gallery/src/common/presentation/image_card.dart';
import 'package:sys_gallery/src/common/presentation/text_field/text_field.dart';
import 'package:sys_gallery/src/constants/app_colors_constants.dart';
import 'package:sys_gallery/src/constants/cm_constants.dart';
import 'package:sys_gallery/src/constants/sg_icons.dart';
import 'package:sys_gallery/src/constants/text_constants.dart';
import 'package:sys_gallery/src/features/images/add_image/presentation/add_image_screen.dart';
import 'package:sys_gallery/src/features/images/image_list/presentation/controller/image_list_controller.dart';
import 'package:sys_gallery/src/utils/base_provider.dart';

class ImageListScreen extends StatefulWidget {
  const ImageListScreen({super.key});

  static const path = '/';

  @override
  State<ImageListScreen> createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<ImageListController>().fetchImages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTextChange: (query) {
          if(query == null) return;
          context.read<ImageListController>().filterImagesByTitle(query);
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<ImageListController>().fetchImages(),
            backgroundColor: kRoyalBluePrimary,
            shape: const StadiumBorder(),
            child: kRefreshIcon,
          ),
          const SizedBox(height: 5),
          FloatingActionButton(
            onPressed: () => context.push(AddImageScreen.path),
            backgroundColor: kRoyalBluePrimary,
            shape: const StadiumBorder(),
            child: kAddIcon,
          ),
        ],
      ),
      backgroundColor: kLightSilver,
      body: Padding(
        padding: kPagePadding,
        child: Consumer<ImageListController>(
          builder: (context, ref, child) {
            switch (ref.getCurrentState) {
              case ProviderState.success:
                final list = ref.imageListFiltered;

                return RefreshIndicator(
                  onRefresh: () => ref.fetchImages(),
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final image = list[index];
                      return ImageCard(image);
                    },
                    staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ),
                );
              case ProviderState.dataNotFound:
                return Center(
                    child: Text("No se encontró información", style: kSubtitleTextStyle.copyWith(color: kDark)));
              default:
                return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.onTextChange});

  final Function(String?) onTextChange;

  @override
  CustomAppBarState createState() => CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppBarState extends State<CustomAppBar> {
  bool _showSearchField = false;

  void _toggleSearchField() {
    setState(() {
      _showSearchField = !_showSearchField;
      if(!_showSearchField) {
        context.read<ImageListController>().filterImagesByTitle("");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final toggleButton = GestureDetector(
      onTap: _toggleSearchField,
      child: Icon(_showSearchField ? Icons.close : Icons.search),
    );

    return AppBar(
      backgroundColor: kLightSilver,
      title: Visibility(
        visible: !_showSearchField,
        replacement: Row(
          children: [
            Expanded(child: TextCustomTextField(onTextChange: widget.onTextChange)),
            const SizedBox(width: 10),
            toggleButton,
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sys Gallery', style: kSubtitleTextStyle.copyWith(fontWeight: FontWeight.w600)),
            toggleButton,
          ],
        ),
      ),
    );
  }
}
