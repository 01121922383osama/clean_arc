import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arc/core/extension/navigations.dart';
import 'package:clean_arc/features/home/presentation/cubit/home_cubit.dart';
import 'package:clean_arc/features/home/presentation/widgets/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quran'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is HomeSuccess) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.quranEntity.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        final quran = state.quranEntity[index];
                        return Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: quran.smallThumbnail!,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  }
                },
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 25,
            itemBuilder: (context, index) {
              return BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is HomeSuccess) {
                    final quran = state.quranEntity[index];
                    return GestureDetector(
                      onTap: () {
                        context.push(
                          page: Details(
                            image: quran.smallThumbnail!,
                            description: quran.title!,
                            index: index,
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(),
                        ),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(),
                              ),
                              child: Hero(
                                tag: index,
                                child: CachedNetworkImage(
                                  imageUrl: quran.smallThumbnail!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                quran.authors!,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
