// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


/// PersistentState is being used as an interface as mixin.
/// 
/// @author Fredrick Allan Grott.
abstract class PersistentState<T> {
  Future<bool> localSave();
  Future<bool> localDelete();
  Future<T?> fromStorage();
}
