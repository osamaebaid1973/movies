import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:movies/core/app_theme/app_colors.dart';
import 'package:movies/core/app_theme/app_text_style.dart';
import 'package:movies/core/constants/app_images_paths.dart';
import 'package:movies/core/constants/dependency_injection.dart';
import 'package:movies/core/widgets/category_list_widget.dart';
import 'package:movies/features/layouts/home/tabs/search_tab/presentation/bloc/search_cubit.dart';
import 'package:movies/features/layouts/home/tabs/search_tab/presentation/bloc/search_states.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController controller = TextEditingController();
  // final SearchCubit cubit = serviceLocator<SearchCubit>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
            child: BlocProvider(
              create: (context) => serviceLocator<SearchCubit>(),
              child: BlocBuilder<SearchCubit, SearchStates>(
                builder: (context, state) {
                  var cubit = BlocProvider.of<SearchCubit>(context);
                  return Column(
                    children: [
                      TextField(
                        selectionControls: MaterialTextSelectionControls(),
                        cursorColor: AppColors.textColor,
                        controller: controller,
                        autocorrect: true,
                        onChanged: (value) {
                          if (value.trim().isEmpty) {
                            cubit.maybePerformSearch('');
                          }
                        },
                        onSubmitted: (value) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (value.trim().isNotEmpty) {
                            cubit.maybePerformSearch(value.trim());
                          } else {
                            // If submitted value is empty, emit the empty state.
                            cubit.maybePerformSearch('');
                          }
                        },
                        style: AppTextStyle.getRegularTextStyle(
                            color: AppColors.textColor),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.greyColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide:  BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide.none,
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: GestureDetector(
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              cubit.maybePerformSearch(controller.text);
                            },
                            child: const ImageIcon(
                              AssetImage(IconPath.searchIcon,),
                              color: AppColors.textColor,
                            ),
                          ),
                          suffixIcon: IconButton(
                            iconSize: 24,
                            onPressed: () {
                              controller.clear();
                              cubit.maybePerformSearch('');
                            },
                            icon: const Icon(
                              Icons.close,
                              color: AppColors.textColor,
                            ),
                          ),
                          hintText: 'search'.tr(),
                          hintStyle: AppTextStyle.getRegularTextStyle(
                              color: AppColors.textColor),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      BlocConsumer<SearchCubit, SearchStates>(
                        listener: (context, state) {
                          if (state is SearchLoadingState) {
                            context.loaderOverlay.show();
                          }
                          if (state is SearchErrorState) {
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
                            },);
                          }
                        },
                        builder: (context, state) {
                          if (state is SearchSuccessState) {
                            context.loaderOverlay.hide();
                            return CategoryListWidget(
                              results: state.searchResponse?.results,
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 20,
                              aspectRatio: 0.74,
                              itemCount:
                                  state.searchResponse?.results?.length ?? 0,
                            );
                          } else if (state is EmptySearchState) {
                            context.loaderOverlay.hide();
                            return Flexible(
                              child: Center(
                                child: Image.asset(
                                  AppImagesPaths.empty,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          } else {
                            return Flexible(
                              child: Center(
                                child: Image.asset(
                                  AppImagesPaths.empty,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
