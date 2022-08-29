///
///
/// Copyright (c) 2022 Razeware LLC
/// Permission is hereby granted, free of charge, to any person
/// obtaining a copy of this software and associated documentation
/// files (the "Software"), to deal in the Software without
/// restriction, including without limitation the rights to use,
/// copy, modify, merge, publish, distribute, sublicense, and/or
/// sell copies of the Software, and to permit persons to whom
/// the Software is furnished to do so, subject to the following
/// conditions:

/// The above copyright notice and this permission notice shall be
/// included in all copies or substantial portions of the Software.

/// Notwithstanding the foregoing, you may not use, copy, modify,
/// merge, publish, distribute, sublicense, create a derivative work,
/// and/or sell copies of the Software in any work that is designed,
/// intended, or marketed for pedagogical or instructional purposes
/// related to programming, coding, application development, or
/// information technology. Permission for such use, copying,
/// modification, merger, publication, distribution, sublicensing,
/// creation of derivative works, or sale is expressly withheld.

/// This project and source code may use libraries or frameworks
/// that are released under various Open-Source licenses. Use of
/// those libraries and frameworks are governed by their own
/// individual licenses.

/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
/// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
/// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
/// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
/// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
/// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
///
import 'package:article_finder/bloc/artwork_list_bloc.dart';
import 'package:article_finder/bloc/bloc_provider.dart';
import 'package:article_finder/ui/app_colors.dart';
import 'package:article_finder/ui/artworks_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ArticleFinder());
}

class ArticleFinder extends StatelessWidget {
  const ArticleFinder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArtWorkListBloc>(
        bloc: ArtWorkListBloc(),
        child: MaterialApp(
          title: 'Art Works',
          home: const ArtWorksListScreen(),
          theme: ThemeData(
            primarySwatch: AppColors.black,
            primaryColor: AppColors.black,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  secondary: AppColors.green,
                  primary: AppColors.black,
                ),
            scaffoldBackgroundColor: AppColors.grey,
            backgroundColor: AppColors.grey,
            textTheme: const TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 15.0, fontStyle: FontStyle.normal),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'eng'),
            ),
            // primaryTextTheme: TextTheme(
            //   headline6: w700BitterFont,
            // ),

          ),
        ));
  }
}
