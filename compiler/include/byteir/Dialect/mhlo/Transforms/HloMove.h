//===- HloMove.h ---------------------------------------------*--- C++ -*-===//
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

#ifndef BYTEIR_DIALECT_MHLO_TRANSFORMS_HLOMOVE_H
#define BYTEIR_DIALECT_MHLO_TRANSFORMS_HLOMOVE_H

#include "mlir/Pass/Pass.h"
#include "llvm/ADT/DenseSet.h"
#include "llvm/ADT/StringRef.h"
#include <memory>

namespace mlir {
class RewritePatternSet;
namespace func {
class FuncOp;
} // namespace func

// Note MoveDown and MoveUp are mutual exclusive
// in an applyPatternsAndFoldGreedily pass.
// However, they can still run together in different passes in a pipeline.

void populateHloMoveDownPattern(
    RewritePatternSet &patterns,
    const llvm::DenseSet<llvm::StringRef> &blocker = {},
    bool allMultiUser = false, bool multiUser = false);

void populateHloMoveUpPattern(
    RewritePatternSet &patterns,
    const llvm::DenseSet<llvm::StringRef> &blocker = {},
    bool multiInput = false);

void populateSliceMoveDownAndMergePattern(RewritePatternSet &patterns);

// TODO add more target or list of op in arg
std::unique_ptr<OperationPass<func::FuncOp>>
createHloMoveDownPass(bool allMultiUser = false, bool multiUser = false);

std::unique_ptr<OperationPass<func::FuncOp>> createSliceMoveDownAndMergePass();

std::unique_ptr<OperationPass<func::FuncOp>>
createHloMoveUpPass(bool multiInput = false);

} // namespace mlir

#endif // BYTEIR_DIALECT_MHLO_TRANSFORMS_HLOMOVE_H