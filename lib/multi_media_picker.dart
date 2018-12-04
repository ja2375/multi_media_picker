// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Specifies the source where the picked image should come from.
enum ImageSource {
  /// Opens up the device camera, letting the user to take a new picture.
  camera,

  /// Opens the user's photo gallery.
  gallery,
}

class MultiMediaPicker {
  static const MethodChannel _channel =
  MethodChannel('plugins.javih.com/multi_media_picker');

  /// Returns a [List] of [File] objects pointing to the image that was picked.
  ///
  /// The [source] argument controls where the image comes from. This can
  /// be either [ImageSource.camera] or [ImageSource.gallery]. The default for this is gallery.
  ///
  /// If specified, the image will be at most [maxWidth] wide and
  /// [maxHeight] tall. Otherwise the image will be returned at it's
  /// original width and height.
  ///
  /// You can also control if you want the user to pick only one image or various
  /// with the [singleImage] argument. The default for this is false (let the user pick multiple images).
  static Future<List<File>> pickImages({
    ImageSource source = ImageSource.gallery,
    bool singleImage = false,
    double maxWidth,
    double maxHeight,
  }) async {
    assert(source != null);

    if (maxWidth != null && maxWidth < 0) {
      throw new ArgumentError.value(maxWidth, 'maxWidth cannot be negative');
    }

    if (maxHeight != null && maxHeight < 0) {
      throw new ArgumentError.value(maxHeight, 'maxHeight cannot be negative');
    }

    try {
      List<dynamic> path = await _channel.invokeMethod(
        'pickImage',
        <String, dynamic>{
          'source': source.index,
          'singleImage': singleImage,
          'maxWidth': maxWidth,
          'maxHeight': maxHeight,
        },
      );
      List<File> imgs = List<File>();
      for(String img in path){
        imgs.add(File(img));
      }
      return imgs;
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<File> pickVideo({
    @required ImageSource source,
  }) async {
    assert(source != null);

    final String path = await _channel.invokeMethod(
      'pickVideo',
      <String, dynamic>{
        'source': source.index,
      },
    );
    return path == null ? null : File(path);
  }
}