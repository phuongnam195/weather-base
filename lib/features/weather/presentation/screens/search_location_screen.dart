import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_base/core/base/base_bloc.dart';
import 'package:weather_base/core/di/injection.dart';
import 'package:weather_base/core/extensions/ui_extensions.dart';
import 'package:weather_base/core/theme/app_colors.dart';
import 'package:weather_base/core/theme/app_theme.dart';
import 'package:weather_base/core/utils/sized_box.dart';
import 'package:weather_base/features/weather/domain/dto/location_dto.dart';

import '../bloc/location/location_bloc.dart';

class SearchLocationScreen extends StatelessWidget {
  static const router = '/search-location';

  const SearchLocationScreen({super.key});

  LocationBloc get _bloc => getIt<LocationBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationBloc, BaseState>(
      bloc: _bloc,
      listenWhen: (prev, curr) => [LocationSelected].contains(curr.runtimeType),
      listener: (ctx, state) {
        if (state is LocationSelected) {
          Navigator.pop(context, state.location);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: TextField(
            onChanged: (value) {
              _bloc.add(OnEditSearch(value));
            },
            style: textTheme.bodyLarge!.regular(),
            decoration: InputDecoration(
              hintText: 'Nhập tên thành phố, zipcode',
              hintStyle: textTheme.bodyLarge!.regular().copyWith(color: AppColors.white.withOpacity(0.7)),
              border: InputBorder.none,
              suffixIcon: const Icon(Icons.search_rounded, color: AppColors.white),
            ),
            cursorColor: AppColors.white,
            cursorHeight: 20.h,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<LocationBloc, BaseState>(
                bloc: _bloc,
                buildWhen: (prev, curr) => [LocationSearched].contains(curr.runtimeType),
                builder: (ctx, state) {
                  if (state is LocationSearched) {
                    if (state.locations.isEmpty) {
                      return const Center(child: Text('Không tìm thấy địa điểm nào'));
                    } else {
                      return _buildList(state.locations);
                    }
                  }
                  return Container();
                },
              ),
            ),
            sh(10.h),
            SizedBox(
              height: 40.h,
              width: 40.h,
              child: BlocBuilder<LocationBloc, BaseState>(
                bloc: _bloc,
                buildWhen: (prev, curr) => [LoadingState, LocationSearched].contains(curr.runtimeType),
                builder: (ctx, state) {
                  if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            sh(20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<LocationDto> locations) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: ListView.separated(
        itemBuilder: (ctx, i) {
          final item = locations[i];
          return ListTile(
            onTap: () {
              _bloc.add(OnSelectLocation(item));
            },
            title: Text(
              '${item.name}, ${item.country}',
              style: textTheme.bodyLarge!.copyWith(color: AppColors.black),
            ),
          );
        },
        separatorBuilder: (ctx, index) => const Divider(),
        itemCount: locations.length,
      ),
    );
  }
}
