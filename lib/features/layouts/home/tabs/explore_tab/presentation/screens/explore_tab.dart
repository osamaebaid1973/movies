import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:movies/core/app_theme/app_colors.dart';
import 'package:movies/core/constants/dependency_injection.dart';
import 'package:movies/core/widgets/category_list_widget.dart';
import 'package:movies/features/layouts/home/tabs/explore_tab/presentation/bloc/explore_cubit.dart';
import 'package:movies/features/layouts/home/tabs/explore_tab/presentation/bloc/explore_states.dart';
import 'package:movies/features/layouts/home/tabs/explore_tab/presentation/widgets/category_item.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
          child: BlocProvider(
            create: (context) => serviceLocator<ExploreCubit>()..getMovie(),
            child: BlocConsumer<ExploreCubit, ExploreStates>(
                listener: (context, state) {
              if (state is ExploreLoadingState) {
                context.loaderOverlay.show();
              }
              if (state is ExploreSuccessState) {
                context.loaderOverlay.hide();
              }
              if (state is ExploreErrorState) {
                context.loaderOverlay.hide();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Error'),
                      content: Text(state.error),
                      actions: [
                        TextButton(
                          child: const Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            }, builder: (context, state) {
              var cubit = BlocProvider.of<ExploreCubit>(context);
              if (state is ExploreLoadingState) {
                context.loaderOverlay.show();
              } else if (state is ExploreSuccessState) {
                context.loaderOverlay.hide();
                return Column(
                  children: [
                    SizedBox(
                      height: 52,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              cubit.changeGenre(index);
                              scrollController.animateTo(0.0,
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.easeInOut);
                            },
                            child: CategoryItem(
                              genreName: cubit.genres != null &&
                                      cubit.genres!.length > index
                                  ? cubit.genres![index].name
                                  : 'Loading...',
                              isSelected: cubit.currentIndex == index,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 8.w),
                        itemCount: cubit.genres?.length ?? 0,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    NotificationListener<ScrollNotification>(
                      onNotification: (scrollInfo) {
                        // Check if near the bottom, more pages are available,
                        // and we are not already fetching data.
                        if (scrollInfo.metrics.pixels >=
                                scrollInfo.metrics.maxScrollExtent - 100 &&
                            cubit.hasMorePages &&
                            !cubit.isFetching) {
                          cubit.getMovie(page: cubit.currentPage + 1);
                        }
                        return false;
                      },
                      child: CategoryListWidget(
                        controller: scrollController,
                        results: cubit.loadedMovies,
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 20,
                        aspectRatio: 0.74,
                        itemCount: cubit.loadedMovies?.length ?? 0,
                      ),
                    ),
                  ],
                );
              }
              return Container();
            }),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
