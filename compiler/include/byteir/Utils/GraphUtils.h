//===- GraphUtils.h ------------------------------------------------ C++---===//
//
// Copyright 2022 ByteDance Ltd. and/or its affiliates. All rights reserved.
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//===----------------------------------------------------------------------===//

#ifndef BYTEIR_UTILS_GRAPHUTILS_H
#define BYTEIR_UTILS_GRAPHUTILS_H

#include "mlir/Support/LLVM.h"

namespace mlir {

class Value;
class Operation;

DenseMap<Value, int64_t> getNumberOfUsesFromRoot(Operation *root);
DenseMap<Value, int64_t> getNumberOfUsesFromRoots(ArrayRef<Operation *> roots);

} // namespace mlir

#endif // BYTEIR_UTILS_GRAPHUTILS_H
