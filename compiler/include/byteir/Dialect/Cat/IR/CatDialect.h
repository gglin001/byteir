//===- CatDialect.h - MLIR Dialect for ByteTemplate Extension ---*- C++ -*-===//
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
//
// This file defines the ByteTemplate operations
//
//===----------------------------------------------------------------------===//

#ifndef BYTEIR_DIALECT_CAT_IR_CATDIALECT_H
#define BYTEIR_DIALECT_CAT_IR_CATDIALECT_H

#include "mlir/Bytecode/BytecodeOpInterface.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpDefinition.h"
#include "mlir/IR/OpImplementation.h"
#include "mlir/IR/SymbolTable.h"
#include "mlir/Interfaces/FunctionInterfaces.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"

#include "byteir/Dialect/Cat/IR/CatOpInterfaces.h.inc"
#include "byteir/Dialect/Cat/IR/CatOpsDialect.h.inc"

#define GET_OP_CLASSES
#include "byteir/Dialect/Cat/IR/CatOps.h.inc"

#endif // BYTEIR_DIALECT_CAT_IR_CATDIALECT_H
