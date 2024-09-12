import 'package:clean_arc/features/home/presentation/cubit/home_cubit.dart';
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
                          margin: const EdgeInsets.all(10),
                          width: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(quran.smallThumbnail!),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              quran.authors!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
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
              return Container(
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
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(),
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Text('Name of books'),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
