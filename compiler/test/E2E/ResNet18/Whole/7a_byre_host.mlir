// RUN: byteir-opt %s -byre-host="device-file-name=your_file target=cuda" | FileCheck %s

// CHECK-LABEL: func.func @main

module @IrToMhlo.2452 attributes {byre.container_module, gpu.container_module} {
  gpu.module @unified {
    gpu.func @Unknown164(%arg0: memref<1000xf32>, %arg1: memref<1000xf32>) kernel {
      %c1000 = arith.constant 1000 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c1000 : index
      scf.if %5 {
        %6 = memref.load %arg0[%4] : memref<1000xf32>
        %7 = arith.truncf %6 : f32 to f16
        %8 = arith.extf %7 : f16 to f32
        memref.store %8, %arg1[%4] : memref<1000xf32>
      }
      gpu.return
    }
    gpu.func @Unknown163(%arg0: memref<1000x512xf16>, %arg1: memref<1000x512xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c512000 = arith.constant 512000 : index
      %c512 = arith.constant 512 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c512000 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c512 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c512 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c512 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg0[%15, %9] : memref<1000x512xf16>
        %17 = arith.extf %16 : f16 to f32
        memref.store %17, %arg1[%15, %9] : memref<1000x512xf32>
      }
      gpu.return
    }
    gpu.func @Unknown161(%arg0: memref<512x512x3x3xf16>, %arg1: memref<512x512x3x3xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c2359296 = arith.constant 2359296 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c2359296 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<512x512x3x3xf16>
        %37 = arith.extf %36 : f16 to f32
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<512x512x3x3xf32>
      }
      gpu.return
    }
    gpu.func @Unknown160(%arg0: memref<512x512x3x3xf16>, %arg1: memref<512x512x3x3xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c2359296 = arith.constant 2359296 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c2359296 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<512x512x3x3xf16>
        %37 = arith.extf %36 : f16 to f32
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<512x512x3x3xf32>
      }
      gpu.return
    }
    gpu.func @Unknown159(%arg0: memref<512x256x1x1xf16>, %arg1: memref<512x256x1x1xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c131072 = arith.constant 131072 : index
      %c256 = arith.constant 256 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c131072 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c256 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c256 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c256 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg0[%15, %9, %c0, %c0] : memref<512x256x1x1xf16>
        %17 = arith.extf %16 : f16 to f32
        memref.store %17, %arg1[%15, %9, %c0, %c0] : memref<512x256x1x1xf32>
      }
      gpu.return
    }
    gpu.func @Unknown158(%arg0: memref<512x512x3x3xf16>, %arg1: memref<512x512x3x3xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c2359296 = arith.constant 2359296 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c2359296 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<512x512x3x3xf16>
        %37 = arith.extf %36 : f16 to f32
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<512x512x3x3xf32>
      }
      gpu.return
    }
    gpu.func @Unknown157(%arg0: memref<512x256x3x3xf16>, %arg1: memref<512x256x3x3xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c1179648 = arith.constant 1179648 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c1179648 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<512x256x3x3xf16>
        %37 = arith.extf %36 : f16 to f32
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<512x256x3x3xf32>
      }
      gpu.return
    }
    gpu.func @Unknown156(%arg0: memref<256x256x3x3xf16>, %arg1: memref<256x256x3x3xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c589824 = arith.constant 589824 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c589824 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<256x256x3x3xf16>
        %37 = arith.extf %36 : f16 to f32
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<256x256x3x3xf32>
      }
      gpu.return
    }
    gpu.func @Unknown155(%arg0: memref<256x256x3x3xf16>, %arg1: memref<256x256x3x3xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c589824 = arith.constant 589824 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c589824 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<256x256x3x3xf16>
        %37 = arith.extf %36 : f16 to f32
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<256x256x3x3xf32>
      }
      gpu.return
    }
    gpu.func @Unknown154(%arg0: memref<256x128x1x1xf16>, %arg1: memref<256x128x1x1xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c32768 = arith.constant 32768 : index
      %c128 = arith.constant 128 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c32768 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c128 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c128 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c128 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg0[%15, %9, %c0, %c0] : memref<256x128x1x1xf16>
        %17 = arith.extf %16 : f16 to f32
        memref.store %17, %arg1[%15, %9, %c0, %c0] : memref<256x128x1x1xf32>
      }
      gpu.return
    }
    gpu.func @Unknown153(%arg0: memref<256x256x3x3xf16>, %arg1: memref<256x256x3x3xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c589824 = arith.constant 589824 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c589824 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<256x256x3x3xf16>
        %37 = arith.extf %36 : f16 to f32
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<256x256x3x3xf32>
      }
      gpu.return
    }
    gpu.func @Unknown152(%arg0: memref<256x128x3x3xf16>, %arg1: memref<256x128x3x3xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c294912 = arith.constant 294912 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c294912 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<256x128x3x3xf16>
        %37 = arith.extf %36 : f16 to f32
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<256x128x3x3xf32>
      }
      gpu.return
    }
    gpu.func @Unknown151(%arg0: memref<128x128x3x3xf16>, %arg1: memref<128x128x3x3xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c147456 = arith.constant 147456 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c147456 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<128x128x3x3xf16>
        %37 = arith.extf %36 : f16 to f32
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<128x128x3x3xf32>
      }
      gpu.return
    }
    gpu.func @Unknown150(%arg0: memref<128x128x3x3xf16>, %arg1: memref<128x128x3x3xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c147456 = arith.constant 147456 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c147456 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<128x128x3x3xf16>
        %37 = arith.extf %36 : f16 to f32
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<128x128x3x3xf32>
      }
      gpu.return
    }
    gpu.func @Unknown149(%arg0: memref<128x64x1x1xf16>, %arg1: memref<128x64x1x1xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c8192 = arith.constant 8192 : index
      %c64 = arith.constant 64 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c8192 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c64 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c64 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c64 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg0[%15, %9, %c0, %c0] : memref<128x64x1x1xf16>
        %17 = arith.extf %16 : f16 to f32
        memref.store %17, %arg1[%15, %9, %c0, %c0] : memref<128x64x1x1xf32>
      }
      gpu.return
    }
    gpu.func @Unknown148(%arg0: memref<128x128x3x3xf16>, %arg1: memref<128x128x3x3xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c147456 = arith.constant 147456 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c147456 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<128x128x3x3xf16>
        %37 = arith.extf %36 : f16 to f32
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<128x128x3x3xf32>
      }
      gpu.return
    }
    gpu.func @Unknown147(%arg0: memref<128x64x3x3xf16>, %arg1: memref<128x64x3x3xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c73728 = arith.constant 73728 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c73728 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<128x64x3x3xf16>
        %37 = arith.extf %36 : f16 to f32
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<128x64x3x3xf32>
      }
      gpu.return
    }
    gpu.func @Unknown146(%arg0: memref<64x64x3x3xf16>, %arg1: memref<64x64x3x3xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c36864 = arith.constant 36864 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c36864 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<64x64x3x3xf16>
        %37 = arith.extf %36 : f16 to f32
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<64x64x3x3xf32>
      }
      gpu.return
    }
    gpu.func @Unknown145(%arg0: memref<64x64x3x3xf16>, %arg1: memref<64x64x3x3xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c36864 = arith.constant 36864 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c36864 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<64x64x3x3xf16>
        %37 = arith.extf %36 : f16 to f32
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<64x64x3x3xf32>
      }
      gpu.return
    }
    gpu.func @Unknown144(%arg0: memref<64x64x3x3xf16>, %arg1: memref<64x64x3x3xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c36864 = arith.constant 36864 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c36864 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<64x64x3x3xf16>
        %37 = arith.extf %36 : f16 to f32
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<64x64x3x3xf32>
      }
      gpu.return
    }
    gpu.func @Unknown143(%arg0: memref<64x64x3x3xf16>, %arg1: memref<64x64x3x3xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c36864 = arith.constant 36864 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c36864 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<64x64x3x3xf16>
        %37 = arith.extf %36 : f16 to f32
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<64x64x3x3xf32>
      }
      gpu.return
    }
    gpu.func @Unknown142(%arg0: memref<64x3x7x7xf16>, %arg1: memref<64x3x7x7xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c9408 = arith.constant 9408 : index
      %c7 = arith.constant 7 : index
      %c-1 = arith.constant -1 : index
      %c3 = arith.constant 3 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c9408 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c7 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c7 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c7 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c7 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c7 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c7 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c3 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c3 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c3 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<64x3x7x7xf16>
        %37 = arith.extf %36 : f16 to f32
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<64x3x7x7xf32>
      }
      gpu.return
    }
    gpu.func @Unknown141(%arg0: memref<f32>, %arg1: memref<f32>) kernel {
      %cst = arith.constant 4.000000e+00 : f32
      %c1 = arith.constant 1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c1 : index
      scf.if %5 {
        %6 = memref.load %arg0[] : memref<f32>
        %7 = arith.negf %6 : f32
        %8 = arith.divf %7, %cst : f32
        memref.store %8, %arg1[] : memref<f32>
      }
      gpu.return
    }
    gpu.func @Unknown138(%arg0: memref<4x64x112x112xi1>, %arg1: memref<4x64x112x112xf16>, %arg2: memref<4x64x112x112xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c3211264 = arith.constant 3211264 : index
      %c112 = arith.constant 112 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c3211264 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c112 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c112 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c112 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c112 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c112 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c112 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x64x112x112xi1>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<4x64x112x112xf16>
        %38 = arith.select %36, %37, %cst : f16
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x64x112x112xf16>
      }
      gpu.return
    }
    gpu.func @Unknown137(%arg0: memref<4x64x56x56xf16>, %arg1: memref<4x64x56x56xf16>, %arg2: memref<4x64x56x56xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c802816 = arith.constant 802816 : index
      %c56 = arith.constant 56 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c802816 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c56 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c56 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c56 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c56 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c56 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c56 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x64x56x56xf16>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<4x64x56x56xf16>
        %38 = arith.addf %36, %37 : f16
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x64x56x56xf16>
      }
      gpu.return
    }
    gpu.func @Unknown133(%arg0: memref<4x64x56x56xi1>, %arg1: memref<4x64x56x56xf16>, %arg2: memref<4x64x56x56xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c802816 = arith.constant 802816 : index
      %c56 = arith.constant 56 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c802816 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c56 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c56 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c56 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c56 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c56 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c56 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x64x56x56xi1>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<4x64x56x56xf16>
        %38 = arith.select %36, %37, %cst : f16
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x64x56x56xf16>
      }
      gpu.return
    }
    gpu.func @Unknown129(%arg0: memref<4x64x56x56xf16>, %arg1: memref<4x64x56x56xf16>, %arg2: memref<4x64x56x56xi1>, %arg3: memref<4x64x56x56xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c802816 = arith.constant 802816 : index
      %c56 = arith.constant 56 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c802816 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c56 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c56 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c56 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c56 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c56 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c56 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg2[%35, %29, %19, %9] : memref<4x64x56x56xi1>
        %37 = memref.load %arg0[%35, %29, %19, %9] : memref<4x64x56x56xf16>
        %38 = memref.load %arg1[%35, %29, %19, %9] : memref<4x64x56x56xf16>
        %39 = arith.addf %37, %38 : f16
        %40 = arith.select %36, %39, %cst : f16
        memref.store %40, %arg3[%35, %29, %19, %9] : memref<4x64x56x56xf16>
      }
      gpu.return
    }
    gpu.func @Unknown125(%arg0: memref<4x64x56x56xi1>, %arg1: memref<4x64x56x56xf16>, %arg2: memref<4x64x56x56xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c802816 = arith.constant 802816 : index
      %c56 = arith.constant 56 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c802816 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c56 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c56 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c56 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c56 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c56 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c56 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x64x56x56xi1>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<4x64x56x56xf16>
        %38 = arith.select %36, %37, %cst : f16
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x64x56x56xf16>
      }
      gpu.return
    }
    gpu.func @Unknown121(%arg0: memref<4x64x56x56xf16>, %arg1: memref<4x64x56x56xf16>, %arg2: memref<4x64x56x56xi1>, %arg3: memref<4x64x56x56xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c802816 = arith.constant 802816 : index
      %c56 = arith.constant 56 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c802816 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c56 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c56 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c56 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c56 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c56 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c56 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg2[%35, %29, %19, %9] : memref<4x64x56x56xi1>
        %37 = memref.load %arg0[%35, %29, %19, %9] : memref<4x64x56x56xf16>
        %38 = memref.load %arg1[%35, %29, %19, %9] : memref<4x64x56x56xf16>
        %39 = arith.addf %37, %38 : f16
        %40 = arith.select %36, %39, %cst : f16
        memref.store %40, %arg3[%35, %29, %19, %9] : memref<4x64x56x56xf16>
      }
      gpu.return
    }
    gpu.func @Unknown114(%arg0: memref<4x128x28x28xi1>, %arg1: memref<4x128x28x28xf16>, %arg2: memref<4x128x28x28xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c401408 = arith.constant 401408 : index
      %c28 = arith.constant 28 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c401408 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c28 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c28 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c28 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c28 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c28 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c28 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x128x28x28xi1>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<4x128x28x28xf16>
        %38 = arith.select %36, %37, %cst : f16
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x128x28x28xf16>
      }
      gpu.return
    }
    gpu.func @Unknown110(%arg0: memref<4x128x28x28xf16>, %arg1: memref<4x128x28x28xf16>, %arg2: memref<4x128x28x28xi1>, %arg3: memref<4x128x28x28xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c401408 = arith.constant 401408 : index
      %c28 = arith.constant 28 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c401408 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c28 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c28 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c28 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c28 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c28 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c28 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg2[%35, %29, %19, %9] : memref<4x128x28x28xi1>
        %37 = memref.load %arg0[%35, %29, %19, %9] : memref<4x128x28x28xf16>
        %38 = memref.load %arg1[%35, %29, %19, %9] : memref<4x128x28x28xf16>
        %39 = arith.addf %37, %38 : f16
        %40 = arith.select %36, %39, %cst : f16
        memref.store %40, %arg3[%35, %29, %19, %9] : memref<4x128x28x28xf16>
      }
      gpu.return
    }
    gpu.func @Unknown106(%arg0: memref<4x128x28x28xi1>, %arg1: memref<4x128x28x28xf16>, %arg2: memref<4x128x28x28xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c401408 = arith.constant 401408 : index
      %c28 = arith.constant 28 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c401408 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c28 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c28 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c28 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c28 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c28 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c28 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x128x28x28xi1>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<4x128x28x28xf16>
        %38 = arith.select %36, %37, %cst : f16
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x128x28x28xf16>
      }
      gpu.return
    }
    gpu.func @Unknown102(%arg0: memref<4x128x28x28xf16>, %arg1: memref<4x128x28x28xf16>, %arg2: memref<4x128x28x28xi1>, %arg3: memref<4x128x28x28xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c401408 = arith.constant 401408 : index
      %c28 = arith.constant 28 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c401408 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c28 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c28 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c28 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c28 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c28 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c28 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg2[%35, %29, %19, %9] : memref<4x128x28x28xi1>
        %37 = memref.load %arg0[%35, %29, %19, %9] : memref<4x128x28x28xf16>
        %38 = memref.load %arg1[%35, %29, %19, %9] : memref<4x128x28x28xf16>
        %39 = arith.addf %37, %38 : f16
        %40 = arith.select %36, %39, %cst : f16
        memref.store %40, %arg3[%35, %29, %19, %9] : memref<4x128x28x28xf16>
      }
      gpu.return
    }
    gpu.func @Unknown95(%arg0: memref<4x256x14x14xi1>, %arg1: memref<4x256x14x14xf16>, %arg2: memref<4x256x14x14xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c200704 = arith.constant 200704 : index
      %c14 = arith.constant 14 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c200704 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c14 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c14 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c14 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c14 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c14 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c14 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x256x14x14xi1>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<4x256x14x14xf16>
        %38 = arith.select %36, %37, %cst : f16
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x256x14x14xf16>
      }
      gpu.return
    }
    gpu.func @Unknown91(%arg0: memref<4x256x14x14xf16>, %arg1: memref<4x256x14x14xf16>, %arg2: memref<4x256x14x14xi1>, %arg3: memref<4x256x14x14xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c200704 = arith.constant 200704 : index
      %c14 = arith.constant 14 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c200704 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c14 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c14 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c14 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c14 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c14 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c14 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg2[%35, %29, %19, %9] : memref<4x256x14x14xi1>
        %37 = memref.load %arg0[%35, %29, %19, %9] : memref<4x256x14x14xf16>
        %38 = memref.load %arg1[%35, %29, %19, %9] : memref<4x256x14x14xf16>
        %39 = arith.addf %37, %38 : f16
        %40 = arith.select %36, %39, %cst : f16
        memref.store %40, %arg3[%35, %29, %19, %9] : memref<4x256x14x14xf16>
      }
      gpu.return
    }
    gpu.func @Unknown87(%arg0: memref<4x256x14x14xi1>, %arg1: memref<4x256x14x14xf16>, %arg2: memref<4x256x14x14xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c200704 = arith.constant 200704 : index
      %c14 = arith.constant 14 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c200704 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c14 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c14 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c14 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c14 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c14 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c14 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x256x14x14xi1>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<4x256x14x14xf16>
        %38 = arith.select %36, %37, %cst : f16
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x256x14x14xf16>
      }
      gpu.return
    }
    gpu.func @Unknown83(%arg0: memref<4x256x14x14xf16>, %arg1: memref<4x256x14x14xf16>, %arg2: memref<4x256x14x14xi1>, %arg3: memref<4x256x14x14xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c200704 = arith.constant 200704 : index
      %c14 = arith.constant 14 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c200704 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c14 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c14 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c14 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c14 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c14 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c14 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg2[%35, %29, %19, %9] : memref<4x256x14x14xi1>
        %37 = memref.load %arg0[%35, %29, %19, %9] : memref<4x256x14x14xf16>
        %38 = memref.load %arg1[%35, %29, %19, %9] : memref<4x256x14x14xf16>
        %39 = arith.addf %37, %38 : f16
        %40 = arith.select %36, %39, %cst : f16
        memref.store %40, %arg3[%35, %29, %19, %9] : memref<4x256x14x14xf16>
      }
      gpu.return
    }
    gpu.func @Unknown76(%arg0: memref<4x512x7x7xi1>, %arg1: memref<4x512x7x7xf16>, %arg2: memref<4x512x7x7xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c100352 = arith.constant 100352 : index
      %c7 = arith.constant 7 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c100352 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c7 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c7 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c7 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c7 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c7 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c7 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x512x7x7xi1>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<4x512x7x7xf16>
        %38 = arith.select %36, %37, %cst : f16
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x512x7x7xf16>
      }
      gpu.return
    }
    gpu.func @Unknown72(%arg0: memref<4x512x7x7xf16>, %arg1: memref<4x512x7x7xf16>, %arg2: memref<4x512x7x7xi1>, %arg3: memref<4x512x7x7xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c100352 = arith.constant 100352 : index
      %c7 = arith.constant 7 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c100352 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c7 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c7 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c7 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c7 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c7 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c7 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg2[%35, %29, %19, %9] : memref<4x512x7x7xi1>
        %37 = memref.load %arg0[%35, %29, %19, %9] : memref<4x512x7x7xf16>
        %38 = memref.load %arg1[%35, %29, %19, %9] : memref<4x512x7x7xf16>
        %39 = arith.addf %37, %38 : f16
        %40 = arith.select %36, %39, %cst : f16
        memref.store %40, %arg3[%35, %29, %19, %9] : memref<4x512x7x7xf16>
      }
      gpu.return
    }
    gpu.func @Unknown68(%arg0: memref<4x512x7x7xi1>, %arg1: memref<4x512x7x7xf16>, %arg2: memref<4x512x7x7xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c100352 = arith.constant 100352 : index
      %c7 = arith.constant 7 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c100352 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c7 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c7 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c7 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c7 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c7 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c7 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x512x7x7xi1>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<4x512x7x7xf16>
        %38 = arith.select %36, %37, %cst : f16
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x512x7x7xf16>
      }
      gpu.return
    }
    gpu.func @Unknown64(%arg0: memref<4x512xf16>, %arg1: memref<4x512x7x7xi1>, %arg2: memref<4x512x7x7xf16>) kernel {
      %cst = arith.constant 4.900000e+01 : f16
      %cst_0 = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c100352 = arith.constant 100352 : index
      %c7 = arith.constant 7 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c100352 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c7 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c7 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c7 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c7 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c7 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c7 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg1[%35, %29, %19, %9] : memref<4x512x7x7xi1>
        %37 = memref.load %arg0[%35, %29] : memref<4x512xf16>
        %38 = arith.divf %37, %cst : f16
        %39 = arith.select %36, %38, %cst_0 : f16
        memref.store %39, %arg2[%35, %29, %19, %9] : memref<4x512x7x7xf16>
      }
      gpu.return
    }
    gpu.func @Unknown63(%arg0: memref<4xf16>, %arg1: memref<4x1000xf16>, %arg2: memref<4xf16>, %arg3: memref<4x1000xf16>, %arg4: memref<4x1000xf32>, %arg5: memref<4x1000xf16>, %arg6: memref<4x1000xf32>, %arg7: memref<4x1000xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c4000 = arith.constant 4000 : index
      %c1000 = arith.constant 1000 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c4000 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c1000 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c1000 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c1000 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg3[%15, %9] : memref<4x1000xf16>
        %17 = memref.load %arg1[%15, %9] : memref<4x1000xf16>
        %18 = memref.load %arg0[%15] : memref<4xf16>
        %19 = memref.load %arg2[%15] : memref<4xf16>
        %20 = memref.load %arg4[%15, %9] : memref<4x1000xf32>
        %21 = math.log %18 : f16
        %22 = arith.subf %17, %21 : f16
        %23 = math.exp %22 : f16
        %24 = arith.mulf %23, %19 : f16
        %25 = arith.subf %16, %24 : f16
        %26 = arith.extf %22 : f16 to f32
        %27 = arith.mulf %26, %20 : f32
        %28 = arith.extf %25 : f16 to f32
        memref.store %25, %arg5[%15, %9] : memref<4x1000xf16>
        memref.store %27, %arg6[%15, %9] : memref<4x1000xf32>
        memref.store %28, %arg7[%15, %9] : memref<4x1000xf32>
      }
      gpu.return
    }
    gpu.func @Unknown62(%arg0: memref<4xf16>, %arg1: memref<4x1000xf16>, %arg2: memref<4x1000xf16>, %arg3: memref<4x1000xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c4000 = arith.constant 4000 : index
      %c1000 = arith.constant 1000 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c4000 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c1000 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c1000 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c1000 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg1[%15, %9] : memref<4x1000xf16>
        %17 = memref.load %arg0[%15] : memref<4xf16>
        %18 = arith.subf %16, %17 : f16
        %19 = math.exp %18 : f16
        memref.store %18, %arg2[%15, %9] : memref<4x1000xf16>
        memref.store %19, %arg3[%15, %9] : memref<4x1000xf16>
      }
      gpu.return
    }
    gpu.func @Unknown61(%arg0: memref<1000xf32>, %arg1: memref<4x1000xf16>, %arg2: memref<4x1000xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c4000 = arith.constant 4000 : index
      %c1000 = arith.constant 1000 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c4000 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c1000 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c1000 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c1000 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg1[%15, %9] : memref<4x1000xf16>
        %17 = memref.load %arg0[%9] : memref<1000xf32>
        %18 = arith.truncf %17 : f32 to f16
        %19 = arith.addf %16, %18 : f16
        memref.store %19, %arg2[%15, %9] : memref<4x1000xf16>
      }
      gpu.return
    }
    gpu.func @Unknown60(%arg0: memref<4x512xf16>, %arg1: memref<4x512xf16>) kernel {
      %cst = arith.constant 2.040100e-02 : f16
      %c0 = arith.constant 0 : index
      %c2048 = arith.constant 2048 : index
      %c512 = arith.constant 512 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c2048 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c512 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c512 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c512 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg0[%15, %9] : memref<4x512xf16>
        %17 = arith.mulf %16, %cst : f16
        memref.store %17, %arg1[%15, %9] : memref<4x512xf16>
      }
      gpu.return
    }
    gpu.func @Unknown59(%arg0: memref<4x512x7x7xf16>, %arg1: memref<4x512x7x7xf16>, %arg2: memref<4x512x7x7xf16>, %arg3: memref<4x512x7x7xi1>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c100352 = arith.constant 100352 : index
      %c7 = arith.constant 7 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c100352 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c7 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c7 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c7 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c7 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c7 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c7 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x512x7x7xf16>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<4x512x7x7xf16>
        %38 = arith.addf %36, %37 : f16
        %39 = arith.maxf %38, %cst : f16
        %40 = arith.cmpf ogt, %39, %cst : f16
        memref.store %39, %arg2[%35, %29, %19, %9] : memref<4x512x7x7xf16>
        memref.store %40, %arg3[%35, %29, %19, %9] : memref<4x512x7x7xi1>
      }
      gpu.return
    }
    gpu.func @Unknown57(%arg0: memref<4x512x7x7xf16>, %arg1: memref<4x512x7x7xf16>, %arg2: memref<4x512x7x7xi1>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c100352 = arith.constant 100352 : index
      %c7 = arith.constant 7 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c100352 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c7 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c7 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c7 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c7 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c7 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c7 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x512x7x7xf16>
        %37 = arith.maxf %36, %cst : f16
        %38 = arith.cmpf ogt, %37, %cst : f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<4x512x7x7xf16>
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x512x7x7xi1>
      }
      gpu.return
    }
    gpu.func @Unknown55(%arg0: memref<4x512x7x7xf16>, %arg1: memref<4x512x7x7xf16>, %arg2: memref<4x512x7x7xf16>, %arg3: memref<4x512x7x7xi1>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c100352 = arith.constant 100352 : index
      %c7 = arith.constant 7 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c100352 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c7 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c7 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c7 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c7 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c7 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c7 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x512x7x7xf16>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<4x512x7x7xf16>
        %38 = arith.addf %36, %37 : f16
        %39 = arith.maxf %38, %cst : f16
        %40 = arith.cmpf ogt, %39, %cst : f16
        memref.store %39, %arg2[%35, %29, %19, %9] : memref<4x512x7x7xf16>
        memref.store %40, %arg3[%35, %29, %19, %9] : memref<4x512x7x7xi1>
      }
      gpu.return
    }
    gpu.func @Unknown53(%arg0: memref<4x512x7x7xf16>, %arg1: memref<4x512x7x7xf16>, %arg2: memref<4x512x7x7xi1>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c100352 = arith.constant 100352 : index
      %c7 = arith.constant 7 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c100352 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c7 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c7 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c7 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c7 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c7 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c7 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x512x7x7xf16>
        %37 = arith.maxf %36, %cst : f16
        %38 = arith.cmpf ogt, %37, %cst : f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<4x512x7x7xf16>
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x512x7x7xi1>
      }
      gpu.return
    }
    gpu.func @Unknown50(%arg0: memref<4x256x14x14xf16>, %arg1: memref<4x256x14x14xf16>, %arg2: memref<4x256x14x14xf16>, %arg3: memref<4x256x14x14xi1>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c200704 = arith.constant 200704 : index
      %c14 = arith.constant 14 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c200704 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c14 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c14 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c14 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c14 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c14 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c14 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x256x14x14xf16>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<4x256x14x14xf16>
        %38 = arith.addf %36, %37 : f16
        %39 = arith.maxf %38, %cst : f16
        %40 = arith.cmpf ogt, %39, %cst : f16
        memref.store %39, %arg2[%35, %29, %19, %9] : memref<4x256x14x14xf16>
        memref.store %40, %arg3[%35, %29, %19, %9] : memref<4x256x14x14xi1>
      }
      gpu.return
    }
    gpu.func @Unknown48(%arg0: memref<4x256x14x14xf16>, %arg1: memref<4x256x14x14xf16>, %arg2: memref<4x256x14x14xi1>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c200704 = arith.constant 200704 : index
      %c14 = arith.constant 14 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c200704 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c14 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c14 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c14 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c14 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c14 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c14 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x256x14x14xf16>
        %37 = arith.maxf %36, %cst : f16
        %38 = arith.cmpf ogt, %37, %cst : f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<4x256x14x14xf16>
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x256x14x14xi1>
      }
      gpu.return
    }
    gpu.func @Unknown46(%arg0: memref<4x256x14x14xf16>, %arg1: memref<4x256x14x14xf16>, %arg2: memref<4x256x14x14xf16>, %arg3: memref<4x256x14x14xi1>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c200704 = arith.constant 200704 : index
      %c14 = arith.constant 14 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c200704 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c14 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c14 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c14 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c14 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c14 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c14 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x256x14x14xf16>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<4x256x14x14xf16>
        %38 = arith.addf %36, %37 : f16
        %39 = arith.maxf %38, %cst : f16
        %40 = arith.cmpf ogt, %39, %cst : f16
        memref.store %39, %arg2[%35, %29, %19, %9] : memref<4x256x14x14xf16>
        memref.store %40, %arg3[%35, %29, %19, %9] : memref<4x256x14x14xi1>
      }
      gpu.return
    }
    gpu.func @Unknown44(%arg0: memref<4x256x14x14xf16>, %arg1: memref<4x256x14x14xf16>, %arg2: memref<4x256x14x14xi1>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c200704 = arith.constant 200704 : index
      %c14 = arith.constant 14 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c200704 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c14 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c14 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c14 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c14 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c14 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c14 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x256x14x14xf16>
        %37 = arith.maxf %36, %cst : f16
        %38 = arith.cmpf ogt, %37, %cst : f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<4x256x14x14xf16>
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x256x14x14xi1>
      }
      gpu.return
    }
    gpu.func @Unknown41(%arg0: memref<4x128x28x28xf16>, %arg1: memref<4x128x28x28xf16>, %arg2: memref<4x128x28x28xf16>, %arg3: memref<4x128x28x28xi1>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c401408 = arith.constant 401408 : index
      %c28 = arith.constant 28 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c401408 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c28 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c28 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c28 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c28 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c28 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c28 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x128x28x28xf16>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<4x128x28x28xf16>
        %38 = arith.addf %36, %37 : f16
        %39 = arith.maxf %38, %cst : f16
        %40 = arith.cmpf ogt, %39, %cst : f16
        memref.store %39, %arg2[%35, %29, %19, %9] : memref<4x128x28x28xf16>
        memref.store %40, %arg3[%35, %29, %19, %9] : memref<4x128x28x28xi1>
      }
      gpu.return
    }
    gpu.func @Unknown39(%arg0: memref<4x128x28x28xf16>, %arg1: memref<4x128x28x28xf16>, %arg2: memref<4x128x28x28xi1>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c401408 = arith.constant 401408 : index
      %c28 = arith.constant 28 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c401408 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c28 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c28 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c28 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c28 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c28 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c28 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x128x28x28xf16>
        %37 = arith.maxf %36, %cst : f16
        %38 = arith.cmpf ogt, %37, %cst : f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<4x128x28x28xf16>
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x128x28x28xi1>
      }
      gpu.return
    }
    gpu.func @Unknown37(%arg0: memref<4x128x28x28xf16>, %arg1: memref<4x128x28x28xf16>, %arg2: memref<4x128x28x28xf16>, %arg3: memref<4x128x28x28xi1>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c401408 = arith.constant 401408 : index
      %c28 = arith.constant 28 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c401408 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c28 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c28 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c28 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c28 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c28 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c28 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x128x28x28xf16>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<4x128x28x28xf16>
        %38 = arith.addf %36, %37 : f16
        %39 = arith.maxf %38, %cst : f16
        %40 = arith.cmpf ogt, %39, %cst : f16
        memref.store %39, %arg2[%35, %29, %19, %9] : memref<4x128x28x28xf16>
        memref.store %40, %arg3[%35, %29, %19, %9] : memref<4x128x28x28xi1>
      }
      gpu.return
    }
    gpu.func @Unknown35(%arg0: memref<4x128x28x28xf16>, %arg1: memref<4x128x28x28xf16>, %arg2: memref<4x128x28x28xi1>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c401408 = arith.constant 401408 : index
      %c28 = arith.constant 28 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c401408 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c28 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c28 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c28 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c28 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c28 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c28 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x128x28x28xf16>
        %37 = arith.maxf %36, %cst : f16
        %38 = arith.cmpf ogt, %37, %cst : f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<4x128x28x28xf16>
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x128x28x28xi1>
      }
      gpu.return
    }
    gpu.func @Unknown32(%arg0: memref<4x64x56x56xf16>, %arg1: memref<4x64x56x56xf16>, %arg2: memref<4x64x56x56xf16>, %arg3: memref<4x64x56x56xi1>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c802816 = arith.constant 802816 : index
      %c56 = arith.constant 56 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c802816 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c56 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c56 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c56 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c56 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c56 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c56 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x64x56x56xf16>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<4x64x56x56xf16>
        %38 = arith.addf %36, %37 : f16
        %39 = arith.maxf %38, %cst : f16
        %40 = arith.cmpf ogt, %39, %cst : f16
        memref.store %39, %arg2[%35, %29, %19, %9] : memref<4x64x56x56xf16>
        memref.store %40, %arg3[%35, %29, %19, %9] : memref<4x64x56x56xi1>
      }
      gpu.return
    }
    gpu.func @Unknown30(%arg0: memref<4x64x56x56xf16>, %arg1: memref<4x64x56x56xf16>, %arg2: memref<4x64x56x56xi1>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c802816 = arith.constant 802816 : index
      %c56 = arith.constant 56 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c802816 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c56 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c56 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c56 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c56 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c56 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c56 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x64x56x56xf16>
        %37 = arith.maxf %36, %cst : f16
        %38 = arith.cmpf ogt, %37, %cst : f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<4x64x56x56xf16>
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x64x56x56xi1>
      }
      gpu.return
    }
    gpu.func @Unknown28(%arg0: memref<4x64x56x56xf16>, %arg1: memref<4x64x56x56xf16>, %arg2: memref<4x64x56x56xf16>, %arg3: memref<4x64x56x56xi1>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c802816 = arith.constant 802816 : index
      %c56 = arith.constant 56 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c802816 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c56 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c56 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c56 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c56 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c56 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c56 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x64x56x56xf16>
        %37 = memref.load %arg1[%35, %29, %19, %9] : memref<4x64x56x56xf16>
        %38 = arith.addf %36, %37 : f16
        %39 = arith.maxf %38, %cst : f16
        %40 = arith.cmpf ogt, %39, %cst : f16
        memref.store %39, %arg2[%35, %29, %19, %9] : memref<4x64x56x56xf16>
        memref.store %40, %arg3[%35, %29, %19, %9] : memref<4x64x56x56xi1>
      }
      gpu.return
    }
    gpu.func @Unknown26(%arg0: memref<4x64x56x56xf16>, %arg1: memref<4x64x56x56xf16>, %arg2: memref<4x64x56x56xi1>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c802816 = arith.constant 802816 : index
      %c56 = arith.constant 56 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c802816 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c56 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c56 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c56 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c56 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c56 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c56 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x64x56x56xf16>
        %37 = arith.maxf %36, %cst : f16
        %38 = arith.cmpf ogt, %37, %cst : f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<4x64x56x56xf16>
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x64x56x56xi1>
      }
      gpu.return
    }
    gpu.func @Unknown24(%arg0: memref<4x64x112x112xf16>, %arg1: memref<4x64x112x112xf16>, %arg2: memref<4x64x112x112xi1>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %c3211264 = arith.constant 3211264 : index
      %c112 = arith.constant 112 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c3211264 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c112 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c112 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c112 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c112 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c112 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c112 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x64x112x112xf16>
        %37 = arith.maxf %36, %cst : f16
        %38 = arith.cmpf ogt, %37, %cst : f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<4x64x112x112xf16>
        memref.store %38, %arg2[%35, %29, %19, %9] : memref<4x64x112x112xi1>
      }
      gpu.return
    }
    gpu.func @Unknown23(%arg0: memref<1000x512xf32>, %arg1: memref<1000x512xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c512000 = arith.constant 512000 : index
      %c512 = arith.constant 512 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c512000 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c512 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c512 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c512 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg0[%15, %9] : memref<1000x512xf32>
        %17 = arith.truncf %16 : f32 to f16
        memref.store %17, %arg1[%15, %9] : memref<1000x512xf16>
      }
      gpu.return
    }
    gpu.func @Unknown22(%arg0: memref<4x1000xf32>, %arg1: memref<4x1000xf16>) kernel {
      %cst = arith.constant -2.500000e-01 : f32
      %c0 = arith.constant 0 : index
      %c4000 = arith.constant 4000 : index
      %c1000 = arith.constant 1000 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c4000 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c1000 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c1000 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c1000 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg0[%15, %9] : memref<4x1000xf32>
        %17 = arith.mulf %16, %cst : f32
        %18 = arith.truncf %17 : f32 to f16
        memref.store %18, %arg1[%15, %9] : memref<4x1000xf16>
      }
      gpu.return
    }
    gpu.func @Unknown21(%arg0: memref<512x512x3x3xf32>, %arg1: memref<512x512x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c2359296 = arith.constant 2359296 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c2359296 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<512x512x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<512x512x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown20(%arg0: memref<512x512x3x3xf32>, %arg1: memref<512x512x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c2359296 = arith.constant 2359296 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c2359296 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<512x512x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<512x512x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown19(%arg0: memref<512x512x3x3xf32>, %arg1: memref<512x512x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c2359296 = arith.constant 2359296 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c512 = arith.constant 512 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c2359296 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c512 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c512 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c512 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<512x512x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<512x512x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown18(%arg0: memref<512x256x3x3xf32>, %arg1: memref<512x256x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c1179648 = arith.constant 1179648 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c1179648 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<512x256x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<512x256x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown17(%arg0: memref<512x256x1x1xf32>, %arg1: memref<512x256x1x1xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c131072 = arith.constant 131072 : index
      %c256 = arith.constant 256 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c131072 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c256 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c256 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c256 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg0[%15, %9, %c0, %c0] : memref<512x256x1x1xf32>
        %17 = arith.truncf %16 : f32 to f16
        memref.store %17, %arg1[%15, %9, %c0, %c0] : memref<512x256x1x1xf16>
      }
      gpu.return
    }
    gpu.func @Unknown16(%arg0: memref<256x256x3x3xf32>, %arg1: memref<256x256x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c589824 = arith.constant 589824 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c589824 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<256x256x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<256x256x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown15(%arg0: memref<256x256x3x3xf32>, %arg1: memref<256x256x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c589824 = arith.constant 589824 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c589824 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<256x256x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<256x256x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown14(%arg0: memref<256x256x3x3xf32>, %arg1: memref<256x256x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c589824 = arith.constant 589824 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c256 = arith.constant 256 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c589824 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c256 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c256 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c256 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<256x256x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<256x256x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown13(%arg0: memref<256x128x3x3xf32>, %arg1: memref<256x128x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c294912 = arith.constant 294912 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c294912 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<256x128x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<256x128x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown12(%arg0: memref<256x128x1x1xf32>, %arg1: memref<256x128x1x1xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c32768 = arith.constant 32768 : index
      %c128 = arith.constant 128 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c32768 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c128 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c128 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c128 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg0[%15, %9, %c0, %c0] : memref<256x128x1x1xf32>
        %17 = arith.truncf %16 : f32 to f16
        memref.store %17, %arg1[%15, %9, %c0, %c0] : memref<256x128x1x1xf16>
      }
      gpu.return
    }
    gpu.func @Unknown11(%arg0: memref<128x128x3x3xf32>, %arg1: memref<128x128x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c147456 = arith.constant 147456 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c147456 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<128x128x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<128x128x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown10(%arg0: memref<128x128x3x3xf32>, %arg1: memref<128x128x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c147456 = arith.constant 147456 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c147456 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<128x128x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<128x128x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown9(%arg0: memref<128x128x3x3xf32>, %arg1: memref<128x128x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c147456 = arith.constant 147456 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c128 = arith.constant 128 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c147456 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c128 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c128 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c128 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<128x128x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<128x128x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown8(%arg0: memref<128x64x3x3xf32>, %arg1: memref<128x64x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c73728 = arith.constant 73728 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c73728 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<128x64x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<128x64x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown7(%arg0: memref<128x64x1x1xf32>, %arg1: memref<128x64x1x1xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c8192 = arith.constant 8192 : index
      %c64 = arith.constant 64 : index
      %c-1 = arith.constant -1 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c8192 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c64 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c64 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c64 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = memref.load %arg0[%15, %9, %c0, %c0] : memref<128x64x1x1xf32>
        %17 = arith.truncf %16 : f32 to f16
        memref.store %17, %arg1[%15, %9, %c0, %c0] : memref<128x64x1x1xf16>
      }
      gpu.return
    }
    gpu.func @Unknown6(%arg0: memref<64x64x3x3xf32>, %arg1: memref<64x64x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c36864 = arith.constant 36864 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c36864 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<64x64x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<64x64x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown5(%arg0: memref<64x64x3x3xf32>, %arg1: memref<64x64x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c36864 = arith.constant 36864 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c36864 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<64x64x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<64x64x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown4(%arg0: memref<64x64x3x3xf32>, %arg1: memref<64x64x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c36864 = arith.constant 36864 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c36864 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<64x64x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<64x64x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown3(%arg0: memref<64x64x3x3xf32>, %arg1: memref<64x64x3x3xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c36864 = arith.constant 36864 : index
      %c3 = arith.constant 3 : index
      %c-1 = arith.constant -1 : index
      %c64 = arith.constant 64 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c36864 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c3 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c3 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c3 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c3 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c3 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c3 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c64 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c64 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c64 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<64x64x3x3xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<64x64x3x3xf16>
      }
      gpu.return
    }
    gpu.func @Unknown1(%arg0: memref<64x3x7x7xf32>, %arg1: memref<64x3x7x7xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c9408 = arith.constant 9408 : index
      %c7 = arith.constant 7 : index
      %c-1 = arith.constant -1 : index
      %c3 = arith.constant 3 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c9408 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c7 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c7 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c7 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c7 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c7 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c7 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c3 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c3 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c3 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<64x3x7x7xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<64x3x7x7xf16>
      }
      gpu.return
    }
    gpu.func @Unknown0(%arg0: memref<4x3x224x224xf32>, %arg1: memref<4x3x224x224xf16>) kernel {
      %c0 = arith.constant 0 : index
      %c602112 = arith.constant 602112 : index
      %c224 = arith.constant 224 : index
      %c-1 = arith.constant -1 : index
      %c3 = arith.constant 3 : index
      %0 = gpu.block_id  x
      %1 = gpu.block_dim  x
      %2 = gpu.thread_id  x
      %3 = arith.muli %1, %0 : index
      %4 = arith.addi %2, %3 : index
      %5 = arith.cmpi slt, %4, %c602112 : index
      scf.if %5 {
        %6 = arith.remsi %4, %c224 : index
        %7 = arith.cmpi slt, %6, %c0 : index
        %8 = arith.addi %6, %c224 : index
        %9 = arith.select %7, %8, %6 : index
        %10 = arith.cmpi slt, %4, %c0 : index
        %11 = arith.subi %c-1, %4 : index
        %12 = arith.select %10, %11, %4 : index
        %13 = arith.divsi %12, %c224 : index
        %14 = arith.subi %c-1, %13 : index
        %15 = arith.select %10, %14, %13 : index
        %16 = arith.remsi %15, %c224 : index
        %17 = arith.cmpi slt, %16, %c0 : index
        %18 = arith.addi %16, %c224 : index
        %19 = arith.select %17, %18, %16 : index
        %20 = arith.cmpi slt, %15, %c0 : index
        %21 = arith.subi %c-1, %15 : index
        %22 = arith.select %20, %21, %15 : index
        %23 = arith.divsi %22, %c224 : index
        %24 = arith.subi %c-1, %23 : index
        %25 = arith.select %20, %24, %23 : index
        %26 = arith.remsi %25, %c3 : index
        %27 = arith.cmpi slt, %26, %c0 : index
        %28 = arith.addi %26, %c3 : index
        %29 = arith.select %27, %28, %26 : index
        %30 = arith.cmpi slt, %25, %c0 : index
        %31 = arith.subi %c-1, %25 : index
        %32 = arith.select %30, %31, %25 : index
        %33 = arith.divsi %32, %c3 : index
        %34 = arith.subi %c-1, %33 : index
        %35 = arith.select %30, %34, %33 : index
        %36 = memref.load %arg0[%35, %29, %19, %9] : memref<4x3x224x224xf32>
        %37 = arith.truncf %36 : f32 to f16
        memref.store %37, %arg1[%35, %29, %19, %9] : memref<4x3x224x224xf16>
      }
      gpu.return
    }
  }
  func.func @main(%arg0: memref<4x3x224x224xf32> {byre.argname = "Input0", byre.argtype = 1 : i32}, %arg1: memref<4x1000xf32> {byre.argname = "Input1", byre.argtype = 1 : i32}, %arg2: memref<64x3x7x7xf32> {byre.argname = "Input2", byre.argtype = 1 : i32}, %arg3: memref<64xf32> {byre.argname = "Input3", byre.argtype = 1 : i32}, %arg4: memref<64xf32> {byre.argname = "Input4", byre.argtype = 1 : i32}, %arg5: memref<64xf32> {byre.argname = "Input5", byre.argtype = 1 : i32}, %arg6: memref<64xf32> {byre.argname = "Input6", byre.argtype = 1 : i32}, %arg7: memref<64x64x3x3xf32> {byre.argname = "Input7", byre.argtype = 1 : i32}, %arg8: memref<64xf32> {byre.argname = "Input8", byre.argtype = 1 : i32}, %arg9: memref<64xf32> {byre.argname = "Input9", byre.argtype = 1 : i32}, %arg10: memref<64xf32> {byre.argname = "Input10", byre.argtype = 1 : i32}, %arg11: memref<64xf32> {byre.argname = "Input11", byre.argtype = 1 : i32}, %arg12: memref<64x64x3x3xf32> {byre.argname = "Input12", byre.argtype = 1 : i32}, %arg13: memref<64xf32> {byre.argname = "Input13", byre.argtype = 1 : i32}, %arg14: memref<64xf32> {byre.argname = "Input14", byre.argtype = 1 : i32}, %arg15: memref<64xf32> {byre.argname = "Input15", byre.argtype = 1 : i32}, %arg16: memref<64xf32> {byre.argname = "Input16", byre.argtype = 1 : i32}, %arg17: memref<64x64x3x3xf32> {byre.argname = "Input17", byre.argtype = 1 : i32}, %arg18: memref<64xf32> {byre.argname = "Input18", byre.argtype = 1 : i32}, %arg19: memref<64xf32> {byre.argname = "Input19", byre.argtype = 1 : i32}, %arg20: memref<64xf32> {byre.argname = "Input20", byre.argtype = 1 : i32}, %arg21: memref<64xf32> {byre.argname = "Input21", byre.argtype = 1 : i32}, %arg22: memref<64x64x3x3xf32> {byre.argname = "Input22", byre.argtype = 1 : i32}, %arg23: memref<64xf32> {byre.argname = "Input23", byre.argtype = 1 : i32}, %arg24: memref<64xf32> {byre.argname = "Input24", byre.argtype = 1 : i32}, %arg25: memref<64xf32> {byre.argname = "Input25", byre.argtype = 1 : i32}, %arg26: memref<64xf32> {byre.argname = "Input26", byre.argtype = 1 : i32}, %arg27: memref<128x64x3x3xf32> {byre.argname = "Input27", byre.argtype = 1 : i32}, %arg28: memref<128xf32> {byre.argname = "Input28", byre.argtype = 1 : i32}, %arg29: memref<128xf32> {byre.argname = "Input29", byre.argtype = 1 : i32}, %arg30: memref<128xf32> {byre.argname = "Input30", byre.argtype = 1 : i32}, %arg31: memref<128xf32> {byre.argname = "Input31", byre.argtype = 1 : i32}, %arg32: memref<128x128x3x3xf32> {byre.argname = "Input32", byre.argtype = 1 : i32}, %arg33: memref<128xf32> {byre.argname = "Input33", byre.argtype = 1 : i32}, %arg34: memref<128xf32> {byre.argname = "Input34", byre.argtype = 1 : i32}, %arg35: memref<128xf32> {byre.argname = "Input35", byre.argtype = 1 : i32}, %arg36: memref<128xf32> {byre.argname = "Input36", byre.argtype = 1 : i32}, %arg37: memref<128x64x1x1xf32> {byre.argname = "Input37", byre.argtype = 1 : i32}, %arg38: memref<128xf32> {byre.argname = "Input38", byre.argtype = 1 : i32}, %arg39: memref<128xf32> {byre.argname = "Input39", byre.argtype = 1 : i32}, %arg40: memref<128xf32> {byre.argname = "Input40", byre.argtype = 1 : i32}, %arg41: memref<128xf32> {byre.argname = "Input41", byre.argtype = 1 : i32}, %arg42: memref<128x128x3x3xf32> {byre.argname = "Input42", byre.argtype = 1 : i32}, %arg43: memref<128xf32> {byre.argname = "Input43", byre.argtype = 1 : i32}, %arg44: memref<128xf32> {byre.argname = "Input44", byre.argtype = 1 : i32}, %arg45: memref<128xf32> {byre.argname = "Input45", byre.argtype = 1 : i32}, %arg46: memref<128xf32> {byre.argname = "Input46", byre.argtype = 1 : i32}, %arg47: memref<128x128x3x3xf32> {byre.argname = "Input47", byre.argtype = 1 : i32}, %arg48: memref<128xf32> {byre.argname = "Input48", byre.argtype = 1 : i32}, %arg49: memref<128xf32> {byre.argname = "Input49", byre.argtype = 1 : i32}, %arg50: memref<128xf32> {byre.argname = "Input50", byre.argtype = 1 : i32}, %arg51: memref<128xf32> {byre.argname = "Input51", byre.argtype = 1 : i32}, %arg52: memref<256x128x3x3xf32> {byre.argname = "Input52", byre.argtype = 1 : i32}, %arg53: memref<256xf32> {byre.argname = "Input53", byre.argtype = 1 : i32}, %arg54: memref<256xf32> {byre.argname = "Input54", byre.argtype = 1 : i32}, %arg55: memref<256xf32> {byre.argname = "Input55", byre.argtype = 1 : i32}, %arg56: memref<256xf32> {byre.argname = "Input56", byre.argtype = 1 : i32}, %arg57: memref<256x256x3x3xf32> {byre.argname = "Input57", byre.argtype = 1 : i32}, %arg58: memref<256xf32> {byre.argname = "Input58", byre.argtype = 1 : i32}, %arg59: memref<256xf32> {byre.argname = "Input59", byre.argtype = 1 : i32}, %arg60: memref<256xf32> {byre.argname = "Input60", byre.argtype = 1 : i32}, %arg61: memref<256xf32> {byre.argname = "Input61", byre.argtype = 1 : i32}, %arg62: memref<256x128x1x1xf32> {byre.argname = "Input62", byre.argtype = 1 : i32}, %arg63: memref<256xf32> {byre.argname = "Input63", byre.argtype = 1 : i32}, %arg64: memref<256xf32> {byre.argname = "Input64", byre.argtype = 1 : i32}, %arg65: memref<256xf32> {byre.argname = "Input65", byre.argtype = 1 : i32}, %arg66: memref<256xf32> {byre.argname = "Input66", byre.argtype = 1 : i32}, %arg67: memref<256x256x3x3xf32> {byre.argname = "Input67", byre.argtype = 1 : i32}, %arg68: memref<256xf32> {byre.argname = "Input68", byre.argtype = 1 : i32}, %arg69: memref<256xf32> {byre.argname = "Input69", byre.argtype = 1 : i32}, %arg70: memref<256xf32> {byre.argname = "Input70", byre.argtype = 1 : i32}, %arg71: memref<256xf32> {byre.argname = "Input71", byre.argtype = 1 : i32}, %arg72: memref<256x256x3x3xf32> {byre.argname = "Input72", byre.argtype = 1 : i32}, %arg73: memref<256xf32> {byre.argname = "Input73", byre.argtype = 1 : i32}, %arg74: memref<256xf32> {byre.argname = "Input74", byre.argtype = 1 : i32}, %arg75: memref<256xf32> {byre.argname = "Input75", byre.argtype = 1 : i32}, %arg76: memref<256xf32> {byre.argname = "Input76", byre.argtype = 1 : i32}, %arg77: memref<512x256x3x3xf32> {byre.argname = "Input77", byre.argtype = 1 : i32}, %arg78: memref<512xf32> {byre.argname = "Input78", byre.argtype = 1 : i32}, %arg79: memref<512xf32> {byre.argname = "Input79", byre.argtype = 1 : i32}, %arg80: memref<512xf32> {byre.argname = "Input80", byre.argtype = 1 : i32}, %arg81: memref<512xf32> {byre.argname = "Input81", byre.argtype = 1 : i32}, %arg82: memref<512x512x3x3xf32> {byre.argname = "Input82", byre.argtype = 1 : i32}, %arg83: memref<512xf32> {byre.argname = "Input83", byre.argtype = 1 : i32}, %arg84: memref<512xf32> {byre.argname = "Input84", byre.argtype = 1 : i32}, %arg85: memref<512xf32> {byre.argname = "Input85", byre.argtype = 1 : i32}, %arg86: memref<512xf32> {byre.argname = "Input86", byre.argtype = 1 : i32}, %arg87: memref<512x256x1x1xf32> {byre.argname = "Input87", byre.argtype = 1 : i32}, %arg88: memref<512xf32> {byre.argname = "Input88", byre.argtype = 1 : i32}, %arg89: memref<512xf32> {byre.argname = "Input89", byre.argtype = 1 : i32}, %arg90: memref<512xf32> {byre.argname = "Input90", byre.argtype = 1 : i32}, %arg91: memref<512xf32> {byre.argname = "Input91", byre.argtype = 1 : i32}, %arg92: memref<512x512x3x3xf32> {byre.argname = "Input92", byre.argtype = 1 : i32}, %arg93: memref<512xf32> {byre.argname = "Input93", byre.argtype = 1 : i32}, %arg94: memref<512xf32> {byre.argname = "Input94", byre.argtype = 1 : i32}, %arg95: memref<512xf32> {byre.argname = "Input95", byre.argtype = 1 : i32}, %arg96: memref<512xf32> {byre.argname = "Input96", byre.argtype = 1 : i32}, %arg97: memref<512x512x3x3xf32> {byre.argname = "Input97", byre.argtype = 1 : i32}, %arg98: memref<512xf32> {byre.argname = "Input98", byre.argtype = 1 : i32}, %arg99: memref<512xf32> {byre.argname = "Input99", byre.argtype = 1 : i32}, %arg100: memref<512xf32> {byre.argname = "Input100", byre.argtype = 1 : i32}, %arg101: memref<512xf32> {byre.argname = "Input101", byre.argtype = 1 : i32}, %arg102: memref<1000x512xf32> {byre.argname = "Input102", byre.argtype = 1 : i32}, %arg103: memref<1000xf32> {byre.argname = "Input103", byre.argtype = 1 : i32}, %arg104: memref<f32> {byre.argname = "Output0", byre.argtype = 2 : i32}, %arg105: memref<64x3x7x7xf32> {byre.argname = "Output1", byre.argtype = 2 : i32}, %arg106: memref<64xf32> {byre.argname = "Output2", byre.argtype = 2 : i32}, %arg107: memref<64xf32> {byre.argname = "Output3", byre.argtype = 2 : i32}, %arg108: memref<64x64x3x3xf32> {byre.argname = "Output4", byre.argtype = 2 : i32}, %arg109: memref<64xf32> {byre.argname = "Output5", byre.argtype = 2 : i32}, %arg110: memref<64xf32> {byre.argname = "Output6", byre.argtype = 2 : i32}, %arg111: memref<64x64x3x3xf32> {byre.argname = "Output7", byre.argtype = 2 : i32}, %arg112: memref<64xf32> {byre.argname = "Output8", byre.argtype = 2 : i32}, %arg113: memref<64xf32> {byre.argname = "Output9", byre.argtype = 2 : i32}, %arg114: memref<64x64x3x3xf32> {byre.argname = "Output10", byre.argtype = 2 : i32}, %arg115: memref<64xf32> {byre.argname = "Output11", byre.argtype = 2 : i32}, %arg116: memref<64xf32> {byre.argname = "Output12", byre.argtype = 2 : i32}, %arg117: memref<64x64x3x3xf32> {byre.argname = "Output13", byre.argtype = 2 : i32}, %arg118: memref<64xf32> {byre.argname = "Output14", byre.argtype = 2 : i32}, %arg119: memref<64xf32> {byre.argname = "Output15", byre.argtype = 2 : i32}, %arg120: memref<128x64x3x3xf32> {byre.argname = "Output16", byre.argtype = 2 : i32}, %arg121: memref<128xf32> {byre.argname = "Output17", byre.argtype = 2 : i32}, %arg122: memref<128xf32> {byre.argname = "Output18", byre.argtype = 2 : i32}, %arg123: memref<128x128x3x3xf32> {byre.argname = "Output19", byre.argtype = 2 : i32}, %arg124: memref<128xf32> {byre.argname = "Output20", byre.argtype = 2 : i32}, %arg125: memref<128xf32> {byre.argname = "Output21", byre.argtype = 2 : i32}, %arg126: memref<128x64x1x1xf32> {byre.argname = "Output22", byre.argtype = 2 : i32}, %arg127: memref<128xf32> {byre.argname = "Output23", byre.argtype = 2 : i32}, %arg128: memref<128xf32> {byre.argname = "Output24", byre.argtype = 2 : i32}, %arg129: memref<128x128x3x3xf32> {byre.argname = "Output25", byre.argtype = 2 : i32}, %arg130: memref<128xf32> {byre.argname = "Output26", byre.argtype = 2 : i32}, %arg131: memref<128xf32> {byre.argname = "Output27", byre.argtype = 2 : i32}, %arg132: memref<128x128x3x3xf32> {byre.argname = "Output28", byre.argtype = 2 : i32}, %arg133: memref<128xf32> {byre.argname = "Output29", byre.argtype = 2 : i32}, %arg134: memref<128xf32> {byre.argname = "Output30", byre.argtype = 2 : i32}, %arg135: memref<256x128x3x3xf32> {byre.argname = "Output31", byre.argtype = 2 : i32}, %arg136: memref<256xf32> {byre.argname = "Output32", byre.argtype = 2 : i32}, %arg137: memref<256xf32> {byre.argname = "Output33", byre.argtype = 2 : i32}, %arg138: memref<256x256x3x3xf32> {byre.argname = "Output34", byre.argtype = 2 : i32}, %arg139: memref<256xf32> {byre.argname = "Output35", byre.argtype = 2 : i32}, %arg140: memref<256xf32> {byre.argname = "Output36", byre.argtype = 2 : i32}, %arg141: memref<256x128x1x1xf32> {byre.argname = "Output37", byre.argtype = 2 : i32}, %arg142: memref<256xf32> {byre.argname = "Output38", byre.argtype = 2 : i32}, %arg143: memref<256xf32> {byre.argname = "Output39", byre.argtype = 2 : i32}, %arg144: memref<256x256x3x3xf32> {byre.argname = "Output40", byre.argtype = 2 : i32}, %arg145: memref<256xf32> {byre.argname = "Output41", byre.argtype = 2 : i32}, %arg146: memref<256xf32> {byre.argname = "Output42", byre.argtype = 2 : i32}, %arg147: memref<256x256x3x3xf32> {byre.argname = "Output43", byre.argtype = 2 : i32}, %arg148: memref<256xf32> {byre.argname = "Output44", byre.argtype = 2 : i32}, %arg149: memref<256xf32> {byre.argname = "Output45", byre.argtype = 2 : i32}, %arg150: memref<512x256x3x3xf32> {byre.argname = "Output46", byre.argtype = 2 : i32}, %arg151: memref<512xf32> {byre.argname = "Output47", byre.argtype = 2 : i32}, %arg152: memref<512xf32> {byre.argname = "Output48", byre.argtype = 2 : i32}, %arg153: memref<512x512x3x3xf32> {byre.argname = "Output49", byre.argtype = 2 : i32}, %arg154: memref<512xf32> {byre.argname = "Output50", byre.argtype = 2 : i32}, %arg155: memref<512xf32> {byre.argname = "Output51", byre.argtype = 2 : i32}, %arg156: memref<512x256x1x1xf32> {byre.argname = "Output52", byre.argtype = 2 : i32}, %arg157: memref<512xf32> {byre.argname = "Output53", byre.argtype = 2 : i32}, %arg158: memref<512xf32> {byre.argname = "Output54", byre.argtype = 2 : i32}, %arg159: memref<512x512x3x3xf32> {byre.argname = "Output55", byre.argtype = 2 : i32}, %arg160: memref<512xf32> {byre.argname = "Output56", byre.argtype = 2 : i32}, %arg161: memref<512xf32> {byre.argname = "Output57", byre.argtype = 2 : i32}, %arg162: memref<512x512x3x3xf32> {byre.argname = "Output58", byre.argtype = 2 : i32}, %arg163: memref<512xf32> {byre.argname = "Output59", byre.argtype = 2 : i32}, %arg164: memref<512xf32> {byre.argname = "Output60", byre.argtype = 2 : i32}, %arg165: memref<1000x512xf32> {byre.argname = "Output61", byre.argtype = 2 : i32}, %arg166: memref<1000xf32> {byre.argname = "Output62", byre.argtype = 2 : i32}) attributes {byre.entry_point} {
    %alloc = memref.alloc() : memref<4096xi8>
    %alloc_0 = memref.alloc() : memref<8000xi8>
    %alloc_1 = memref.alloc() : memref<16000xi8>
    %alloc_2 = memref.alloc() : memref<16000xi8>
    %alloc_3 = memref.alloc() : memref<16384xi8>
    %alloc_4 = memref.alloc() : memref<25088xi8>
    %alloc_5 = memref.alloc() : memref<25088xi8>
    %alloc_6 = memref.alloc() : memref<25088xi8>
    %alloc_7 = memref.alloc() : memref<25088xi8>
    %alloc_8 = memref.alloc() : memref<50176xi8>
    %alloc_9 = memref.alloc() : memref<50176xi8>
    %alloc_10 = memref.alloc() : memref<50176xi8>
    %alloc_11 = memref.alloc() : memref<50176xi8>
    %alloc_12 = memref.alloc() : memref<65536xi8>
    %alloc_13 = memref.alloc() : memref<73728xi8>
    %alloc_14 = memref.alloc() : memref<73728xi8>
    %alloc_15 = memref.alloc() : memref<73728xi8>
    %alloc_16 = memref.alloc() : memref<73728xi8>
    %alloc_17 = memref.alloc() : memref<100352xi8>
    %alloc_18 = memref.alloc() : memref<100352xi8>
    %alloc_19 = memref.alloc() : memref<100352xi8>
    %alloc_20 = memref.alloc() : memref<100352xi8>
    %alloc_21 = memref.alloc() : memref<147456xi8>
    %alloc_22 = memref.alloc() : memref<200704xi8>
    %alloc_23 = memref.alloc() : memref<200704xi8>
    %alloc_24 = memref.alloc() : memref<200704xi8>
    %alloc_25 = memref.alloc() : memref<200704xi8>
    %alloc_26 = memref.alloc() : memref<200704xi8>
    %alloc_27 = memref.alloc() : memref<200704xi8>
    %alloc_28 = memref.alloc() : memref<262144xi8>
    %alloc_29 = memref.alloc() : memref<294912xi8>
    %alloc_30 = memref.alloc() : memref<294912xi8>
    %alloc_31 = memref.alloc() : memref<294912xi8>
    %alloc_32 = memref.alloc() : memref<401408xi8>
    %alloc_33 = memref.alloc() : memref<401408xi8>
    %alloc_34 = memref.alloc() : memref<401408xi8>
    %alloc_35 = memref.alloc() : memref<401408xi8>
    %alloc_36 = memref.alloc() : memref<401408xi8>
    %alloc_37 = memref.alloc() : memref<401408xi8>
    %alloc_38 = memref.alloc() : memref<401408xi8>
    %alloc_39 = memref.alloc() : memref<401408xi8>
    %alloc_40 = memref.alloc() : memref<401408xi8>
    %alloc_41 = memref.alloc() : memref<589824xi8>
    %alloc_42 = memref.alloc() : memref<802816xi8>
    %alloc_43 = memref.alloc() : memref<802816xi8>
    %alloc_44 = memref.alloc() : memref<802816xi8>
    %alloc_45 = memref.alloc() : memref<802816xi8>
    %alloc_46 = memref.alloc() : memref<802816xi8>
    %alloc_47 = memref.alloc() : memref<802816xi8>
    %alloc_48 = memref.alloc() : memref<802816xi8>
    %alloc_49 = memref.alloc() : memref<802816xi8>
    %alloc_50 = memref.alloc() : memref<802816xi8>
    %alloc_51 = memref.alloc() : memref<1179648xi8>
    %alloc_52 = memref.alloc() : memref<1179648xi8>
    %alloc_53 = memref.alloc() : memref<1179648xi8>
    %alloc_54 = memref.alloc() : memref<1179648xi8>
    %alloc_55 = memref.alloc() : memref<1204224xi8>
    %alloc_56 = memref.alloc() : memref<1605632xi8>
    %alloc_57 = memref.alloc() : memref<1605632xi8>
    %alloc_58 = memref.alloc() : memref<1605632xi8>
    %alloc_59 = memref.alloc() : memref<1605632xi8>
    %alloc_60 = memref.alloc() : memref<1605632xi8>
    %alloc_61 = memref.alloc() : memref<1605632xi8>
    %alloc_62 = memref.alloc() : memref<1605632xi8>
    %alloc_63 = memref.alloc() : memref<1605632xi8>
    %alloc_64 = memref.alloc() : memref<2359296xi8>
    %alloc_65 = memref.alloc() : memref<4718592xi8>
    %alloc_66 = memref.alloc() : memref<4718592xi8>
    %alloc_67 = memref.alloc() : memref<4718592xi8>
    %alloc_68 = memref.alloc() : memref<6422528xi8>
    %alloc_69 = memref.alloc() : memref<6422528xi8>
    %alloc_70 = memref.alloc() : memref<6422528xi8>
    %alloc_71 = memref.alloc() : memref<6422528xi8>
    %0 = "byre.alias"(%alloc_55) {offset = 0 : i64} : (memref<1204224xi8>) -> memref<4x3x224x224xf16>
    byre.compute @PTXOp(%arg0, %0) {BlockSize.x = 128 : i32, GridSize.x = 4704 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown0", memory_effects = [1 : i32, 2 : i32]} : memref<4x3x224x224xf32>, memref<4x3x224x224xf16>
    %1 = "byre.alias"(%alloc_71) {offset = 0 : i64} : (memref<6422528xi8>) -> memref<64x3x7x7xf16>
    byre.compute @PTXOp(%arg2, %1) {BlockSize.x = 128 : i32, GridSize.x = 74 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown1", memory_effects = [1 : i32, 2 : i32]} : memref<64x3x7x7xf32>, memref<64x3x7x7xf16>
    %2 = "byre.alias"(%alloc_70) {offset = 0 : i64} : (memref<6422528xi8>) -> memref<4x64x112x112xf16>
    byre.compute @ConvOp_f16f16_f16(%0, %1, %2) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<3> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x3x224x224xf16>, memref<64x3x7x7xf16>, memref<4x64x112x112xf16>
    %3 = "byre.alias"(%alloc_69) {offset = 0 : i64} : (memref<6422528xi8>) -> memref<4x64x112x112xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%2, %arg3, %arg4, %3) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x64x112x112xf16>, memref<64xf32>, memref<64xf32>, memref<4x64x112x112xf16>
    %4 = "byre.alias"(%alloc_14) {offset = 0 : i64} : (memref<73728xi8>) -> memref<64x64x3x3xf16>
    byre.compute @PTXOp(%arg7, %4) {BlockSize.x = 128 : i32, GridSize.x = 288 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown3", memory_effects = [1 : i32, 2 : i32]} : memref<64x64x3x3xf32>, memref<64x64x3x3xf16>
    %5 = "byre.alias"(%alloc_13) {offset = 0 : i64} : (memref<73728xi8>) -> memref<64x64x3x3xf16>
    byre.compute @PTXOp(%arg12, %5) {BlockSize.x = 128 : i32, GridSize.x = 288 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown4", memory_effects = [1 : i32, 2 : i32]} : memref<64x64x3x3xf32>, memref<64x64x3x3xf16>
    %6 = "byre.alias"(%alloc_16) {offset = 0 : i64} : (memref<73728xi8>) -> memref<64x64x3x3xf16>
    byre.compute @PTXOp(%arg17, %6) {BlockSize.x = 128 : i32, GridSize.x = 288 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown5", memory_effects = [1 : i32, 2 : i32]} : memref<64x64x3x3xf32>, memref<64x64x3x3xf16>
    %7 = "byre.alias"(%alloc_15) {offset = 0 : i64} : (memref<73728xi8>) -> memref<64x64x3x3xf16>
    byre.compute @PTXOp(%arg22, %7) {BlockSize.x = 128 : i32, GridSize.x = 288 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown6", memory_effects = [1 : i32, 2 : i32]} : memref<64x64x3x3xf32>, memref<64x64x3x3xf16>
    %8 = "byre.alias"(%alloc_3) {offset = 0 : i64} : (memref<16384xi8>) -> memref<128x64x1x1xf16>
    byre.compute @PTXOp(%arg37, %8) {BlockSize.x = 128 : i32, GridSize.x = 64 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown7", memory_effects = [1 : i32, 2 : i32]} : memref<128x64x1x1xf32>, memref<128x64x1x1xf16>
    %9 = "byre.alias"(%alloc_21) {offset = 0 : i64} : (memref<147456xi8>) -> memref<128x64x3x3xf16>
    byre.compute @PTXOp(%arg27, %9) {BlockSize.x = 128 : i32, GridSize.x = 576 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown8", memory_effects = [1 : i32, 2 : i32]} : memref<128x64x3x3xf32>, memref<128x64x3x3xf16>
    %10 = "byre.alias"(%alloc_30) {offset = 0 : i64} : (memref<294912xi8>) -> memref<128x128x3x3xf16>
    byre.compute @PTXOp(%arg32, %10) {BlockSize.x = 128 : i32, GridSize.x = 1152 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown9", memory_effects = [1 : i32, 2 : i32]} : memref<128x128x3x3xf32>, memref<128x128x3x3xf16>
    %11 = "byre.alias"(%alloc_29) {offset = 0 : i64} : (memref<294912xi8>) -> memref<128x128x3x3xf16>
    byre.compute @PTXOp(%arg42, %11) {BlockSize.x = 128 : i32, GridSize.x = 1152 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown10", memory_effects = [1 : i32, 2 : i32]} : memref<128x128x3x3xf32>, memref<128x128x3x3xf16>
    %12 = "byre.alias"(%alloc_31) {offset = 0 : i64} : (memref<294912xi8>) -> memref<128x128x3x3xf16>
    byre.compute @PTXOp(%arg47, %12) {BlockSize.x = 128 : i32, GridSize.x = 1152 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown11", memory_effects = [1 : i32, 2 : i32]} : memref<128x128x3x3xf32>, memref<128x128x3x3xf16>
    %13 = "byre.alias"(%alloc_12) {offset = 0 : i64} : (memref<65536xi8>) -> memref<256x128x1x1xf16>
    byre.compute @PTXOp(%arg62, %13) {BlockSize.x = 128 : i32, GridSize.x = 256 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown12", memory_effects = [1 : i32, 2 : i32]} : memref<256x128x1x1xf32>, memref<256x128x1x1xf16>
    %14 = "byre.alias"(%alloc_41) {offset = 0 : i64} : (memref<589824xi8>) -> memref<256x128x3x3xf16>
    byre.compute @PTXOp(%arg52, %14) {BlockSize.x = 128 : i32, GridSize.x = 2304 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown13", memory_effects = [1 : i32, 2 : i32]} : memref<256x128x3x3xf32>, memref<256x128x3x3xf16>
    %15 = "byre.alias"(%alloc_51) {offset = 0 : i64} : (memref<1179648xi8>) -> memref<256x256x3x3xf16>
    byre.compute @PTXOp(%arg57, %15) {BlockSize.x = 128 : i32, GridSize.x = 4608 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown14", memory_effects = [1 : i32, 2 : i32]} : memref<256x256x3x3xf32>, memref<256x256x3x3xf16>
    %16 = "byre.alias"(%alloc_53) {offset = 0 : i64} : (memref<1179648xi8>) -> memref<256x256x3x3xf16>
    byre.compute @PTXOp(%arg67, %16) {BlockSize.x = 128 : i32, GridSize.x = 4608 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown15", memory_effects = [1 : i32, 2 : i32]} : memref<256x256x3x3xf32>, memref<256x256x3x3xf16>
    %17 = "byre.alias"(%alloc_54) {offset = 0 : i64} : (memref<1179648xi8>) -> memref<256x256x3x3xf16>
    byre.compute @PTXOp(%arg72, %17) {BlockSize.x = 128 : i32, GridSize.x = 4608 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown16", memory_effects = [1 : i32, 2 : i32]} : memref<256x256x3x3xf32>, memref<256x256x3x3xf16>
    %18 = "byre.alias"(%alloc_39) {offset = 0 : i64} : (memref<401408xi8>) -> memref<512x256x1x1xf16>
    byre.compute @PTXOp(%arg87, %18) {BlockSize.x = 128 : i32, GridSize.x = 1024 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown17", memory_effects = [1 : i32, 2 : i32]} : memref<512x256x1x1xf32>, memref<512x256x1x1xf16>
    %19 = "byre.alias"(%alloc_64) {offset = 0 : i64} : (memref<2359296xi8>) -> memref<512x256x3x3xf16>
    byre.compute @PTXOp(%arg77, %19) {BlockSize.x = 128 : i32, GridSize.x = 9216 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown18", memory_effects = [1 : i32, 2 : i32]} : memref<512x256x3x3xf32>, memref<512x256x3x3xf16>
    %20 = "byre.alias"(%alloc_68) {offset = 0 : i64} : (memref<6422528xi8>) -> memref<512x512x3x3xf16>
    byre.compute @PTXOp(%arg82, %20) {BlockSize.x = 128 : i32, GridSize.x = 18432 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown19", memory_effects = [1 : i32, 2 : i32]} : memref<512x512x3x3xf32>, memref<512x512x3x3xf16>
    %21 = "byre.alias"(%alloc_67) {offset = 0 : i64} : (memref<4718592xi8>) -> memref<512x512x3x3xf16>
    byre.compute @PTXOp(%arg92, %21) {BlockSize.x = 128 : i32, GridSize.x = 18432 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown20", memory_effects = [1 : i32, 2 : i32]} : memref<512x512x3x3xf32>, memref<512x512x3x3xf16>
    %22 = "byre.alias"(%alloc_66) {offset = 0 : i64} : (memref<4718592xi8>) -> memref<512x512x3x3xf16>
    byre.compute @PTXOp(%arg97, %22) {BlockSize.x = 128 : i32, GridSize.x = 18432 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown21", memory_effects = [1 : i32, 2 : i32]} : memref<512x512x3x3xf32>, memref<512x512x3x3xf16>
    %23 = "byre.alias"(%alloc_22) {offset = 0 : i64} : (memref<200704xi8>) -> memref<4x1000xf16>
    byre.compute @PTXOp(%arg1, %23) {BlockSize.x = 128 : i32, GridSize.x = 32 : i32, arg_ranks = [2 : i32, 2 : i32], kernel_name = "Unknown22", memory_effects = [1 : i32, 2 : i32]} : memref<4x1000xf32>, memref<4x1000xf16>
    %24 = "byre.alias"(%alloc_65) {offset = 0 : i64} : (memref<4718592xi8>) -> memref<1000x512xf16>
    byre.compute @PTXOp(%arg102, %24) {BlockSize.x = 128 : i32, GridSize.x = 4000 : i32, arg_ranks = [2 : i32, 2 : i32], kernel_name = "Unknown23", memory_effects = [1 : i32, 2 : i32]} : memref<1000x512xf32>, memref<1000x512xf16>
    %25 = "byre.alias"(%alloc_22) {offset = 8000 : i64} : (memref<200704xi8>) -> memref<4xf16>
    byre.compute @ReduceSumOp_f16_f16(%23, %25) {dimensions = dense<1> : tensor<1xi64>, memory_effects = [1 : i32, 2 : i32]} : memref<4x1000xf16>, memref<4xf16>
    %26 = "byre.alias"(%alloc_71) {offset = 0 : i64} : (memref<6422528xi8>) -> memref<4x64x112x112xf16>
    %27 = "byre.alias"(%alloc_40) {offset = 0 : i64} : (memref<401408xi8>) -> memref<4x64x112x112xi1>
    byre.compute @PTXOp(%3, %26, %27) {BlockSize.x = 128 : i32, GridSize.x = 25088 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown24", memory_effects = [1 : i32, 2 : i32, 2 : i32]} : memref<4x64x112x112xf16>, memref<4x64x112x112xf16>, memref<4x64x112x112xi1>
    %28 = "byre.alias"(%alloc_62) {offset = 0 : i64} : (memref<1605632xi8>) -> memref<4x64x56x56xf16>
    byre.compute @PoolMaxOp_f16_f16(%26, %28) {base_dilations = dense<1> : tensor<4xi64>, memory_effects = [1 : i32, 2 : i32], padding = dense<[[0, 0], [0, 0], [1, 1], [1, 1]]> : tensor<4x2xi64>, window_dilations = dense<1> : tensor<4xi64>, window_dimensions = dense<[1, 1, 3, 3]> : tensor<4xi64>, window_strides = dense<[1, 1, 2, 2]> : tensor<4xi64>} : memref<4x64x112x112xf16>, memref<4x64x56x56xf16>
    %29 = "byre.alias"(%alloc_63) {offset = 0 : i64} : (memref<1605632xi8>) -> memref<4x64x56x56xf16>
    byre.compute @ConvOp_f16f16_f16(%28, %4, %29) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x64x56x56xf16>, memref<64x64x3x3xf16>, memref<4x64x56x56xf16>
    %30 = "byre.alias"(%alloc_69) {offset = 0 : i64} : (memref<6422528xi8>) -> memref<4x64x56x56xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%29, %arg8, %arg9, %30) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>, memref<4x64x56x56xf16>
    %31 = "byre.alias"(%alloc_61) {offset = 0 : i64} : (memref<1605632xi8>) -> memref<4x64x56x56xf16>
    %32 = "byre.alias"(%alloc_18) {offset = 0 : i64} : (memref<100352xi8>) -> memref<4x64x56x56xi1>
    byre.compute @PTXOp(%30, %31, %32) {BlockSize.x = 128 : i32, GridSize.x = 6272 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown26", memory_effects = [1 : i32, 2 : i32, 2 : i32]} : memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<4x64x56x56xi1>
    %33 = "byre.alias"(%alloc_60) {offset = 0 : i64} : (memref<1605632xi8>) -> memref<4x64x56x56xf16>
    byre.compute @ConvOp_f16f16_f16(%31, %5, %33) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x64x56x56xf16>, memref<64x64x3x3xf16>, memref<4x64x56x56xf16>
    %34 = "byre.alias"(%alloc_68) {offset = 4718592 : i64} : (memref<6422528xi8>) -> memref<4x64x56x56xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%33, %arg13, %arg14, %34) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>, memref<4x64x56x56xf16>
    %35 = "byre.alias"(%alloc_20) {offset = 0 : i64} : (memref<100352xi8>) -> memref<4x64x56x56xi1>
    byre.compute @PTXOp(%34, %28, %30, %35) {BlockSize.x = 128 : i32, GridSize.x = 6272 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown28", memory_effects = [1 : i32, 1 : i32, 2 : i32, 2 : i32]} : memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<4x64x56x56xi1>
    %36 = "byre.alias"(%alloc_59) {offset = 0 : i64} : (memref<1605632xi8>) -> memref<4x64x56x56xf16>
    byre.compute @ConvOp_f16f16_f16(%30, %6, %36) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x64x56x56xf16>, memref<64x64x3x3xf16>, memref<4x64x56x56xf16>
    %37 = "byre.alias"(%alloc_69) {offset = 1605632 : i64} : (memref<6422528xi8>) -> memref<4x64x56x56xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%36, %arg18, %arg19, %37) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>, memref<4x64x56x56xf16>
    %38 = "byre.alias"(%alloc_58) {offset = 0 : i64} : (memref<1605632xi8>) -> memref<4x64x56x56xf16>
    %39 = "byre.alias"(%alloc_17) {offset = 0 : i64} : (memref<100352xi8>) -> memref<4x64x56x56xi1>
    byre.compute @PTXOp(%37, %38, %39) {BlockSize.x = 128 : i32, GridSize.x = 6272 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown30", memory_effects = [1 : i32, 2 : i32, 2 : i32]} : memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<4x64x56x56xi1>
    %40 = "byre.alias"(%alloc_56) {offset = 0 : i64} : (memref<1605632xi8>) -> memref<4x64x56x56xf16>
    byre.compute @ConvOp_f16f16_f16(%38, %7, %40) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x64x56x56xf16>, memref<64x64x3x3xf16>, memref<4x64x56x56xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%40, %arg23, %arg24, %37) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>, memref<4x64x56x56xf16>
    %41 = "byre.alias"(%alloc_57) {offset = 0 : i64} : (memref<1605632xi8>) -> memref<4x64x56x56xf16>
    %42 = "byre.alias"(%alloc_19) {offset = 0 : i64} : (memref<100352xi8>) -> memref<4x64x56x56xi1>
    byre.compute @PTXOp(%37, %30, %41, %42) {BlockSize.x = 128 : i32, GridSize.x = 6272 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown32", memory_effects = [1 : i32, 1 : i32, 2 : i32, 2 : i32]} : memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<4x64x56x56xi1>
    %43 = "byre.alias"(%alloc_43) {offset = 0 : i64} : (memref<802816xi8>) -> memref<4x128x28x28xf16>
    byre.compute @ConvOp_f16f16_f16(%41, %8, %43) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x64x56x56xf16>, memref<128x64x1x1xf16>, memref<4x128x28x28xf16>
    %44 = "byre.alias"(%alloc_68) {offset = 4718592 : i64} : (memref<6422528xi8>) -> memref<4x128x28x28xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%43, %arg38, %arg39, %44) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>, memref<4x128x28x28xf16>
    %45 = "byre.alias"(%alloc_47) {offset = 0 : i64} : (memref<802816xi8>) -> memref<4x128x28x28xf16>
    byre.compute @ConvOp_f16f16_f16(%41, %9, %45) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x64x56x56xf16>, memref<128x64x3x3xf16>, memref<4x128x28x28xf16>
    %46 = "byre.alias"(%alloc_69) {offset = 1605632 : i64} : (memref<6422528xi8>) -> memref<4x128x28x28xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%45, %arg28, %arg29, %46) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>, memref<4x128x28x28xf16>
    %47 = "byre.alias"(%alloc_48) {offset = 0 : i64} : (memref<802816xi8>) -> memref<4x128x28x28xf16>
    %48 = "byre.alias"(%alloc_8) {offset = 0 : i64} : (memref<50176xi8>) -> memref<4x128x28x28xi1>
    byre.compute @PTXOp(%46, %47, %48) {BlockSize.x = 128 : i32, GridSize.x = 3136 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown35", memory_effects = [1 : i32, 2 : i32, 2 : i32]} : memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<4x128x28x28xi1>
    %49 = "byre.alias"(%alloc_49) {offset = 0 : i64} : (memref<802816xi8>) -> memref<4x128x28x28xf16>
    byre.compute @ConvOp_f16f16_f16(%47, %10, %49) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x128x28x28xf16>, memref<128x128x3x3xf16>, memref<4x128x28x28xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%49, %arg33, %arg34, %46) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>, memref<4x128x28x28xf16>
    %50 = "byre.alias"(%alloc_46) {offset = 0 : i64} : (memref<802816xi8>) -> memref<4x128x28x28xf16>
    %51 = "byre.alias"(%alloc_9) {offset = 0 : i64} : (memref<50176xi8>) -> memref<4x128x28x28xi1>
    byre.compute @PTXOp(%46, %44, %50, %51) {BlockSize.x = 128 : i32, GridSize.x = 3136 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown37", memory_effects = [1 : i32, 1 : i32, 2 : i32, 2 : i32]} : memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<4x128x28x28xi1>
    %52 = "byre.alias"(%alloc_42) {offset = 0 : i64} : (memref<802816xi8>) -> memref<4x128x28x28xf16>
    byre.compute @ConvOp_f16f16_f16(%50, %11, %52) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x128x28x28xf16>, memref<128x128x3x3xf16>, memref<4x128x28x28xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%52, %arg43, %arg44, %46) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>, memref<4x128x28x28xf16>
    %53 = "byre.alias"(%alloc_44) {offset = 0 : i64} : (memref<802816xi8>) -> memref<4x128x28x28xf16>
    %54 = "byre.alias"(%alloc_10) {offset = 0 : i64} : (memref<50176xi8>) -> memref<4x128x28x28xi1>
    byre.compute @PTXOp(%46, %53, %54) {BlockSize.x = 128 : i32, GridSize.x = 3136 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown39", memory_effects = [1 : i32, 2 : i32, 2 : i32]} : memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<4x128x28x28xi1>
    %55 = "byre.alias"(%alloc_45) {offset = 0 : i64} : (memref<802816xi8>) -> memref<4x128x28x28xf16>
    byre.compute @ConvOp_f16f16_f16(%53, %12, %55) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x128x28x28xf16>, memref<128x128x3x3xf16>, memref<4x128x28x28xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%55, %arg48, %arg49, %46) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>, memref<4x128x28x28xf16>
    %56 = "byre.alias"(%alloc_50) {offset = 0 : i64} : (memref<802816xi8>) -> memref<4x128x28x28xf16>
    %57 = "byre.alias"(%alloc_11) {offset = 0 : i64} : (memref<50176xi8>) -> memref<4x128x28x28xi1>
    byre.compute @PTXOp(%46, %50, %56, %57) {BlockSize.x = 128 : i32, GridSize.x = 3136 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown41", memory_effects = [1 : i32, 1 : i32, 2 : i32, 2 : i32]} : memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<4x128x28x28xi1>
    %58 = "byre.alias"(%alloc_32) {offset = 0 : i64} : (memref<401408xi8>) -> memref<4x256x14x14xf16>
    byre.compute @ConvOp_f16f16_f16(%56, %13, %58) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x128x28x28xf16>, memref<256x128x1x1xf16>, memref<4x256x14x14xf16>
    %59 = "byre.alias"(%alloc_69) {offset = 1605632 : i64} : (memref<6422528xi8>) -> memref<4x256x14x14xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%58, %arg63, %arg64, %59) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>, memref<4x256x14x14xf16>
    %60 = "byre.alias"(%alloc_38) {offset = 0 : i64} : (memref<401408xi8>) -> memref<4x256x14x14xf16>
    byre.compute @ConvOp_f16f16_f16(%56, %14, %60) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x128x28x28xf16>, memref<256x128x3x3xf16>, memref<4x256x14x14xf16>
    %61 = "byre.alias"(%alloc_69) {offset = 2007040 : i64} : (memref<6422528xi8>) -> memref<4x256x14x14xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%60, %arg53, %arg54, %61) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>, memref<4x256x14x14xf16>
    %62 = "byre.alias"(%alloc_37) {offset = 0 : i64} : (memref<401408xi8>) -> memref<4x256x14x14xf16>
    %63 = "byre.alias"(%alloc_4) {offset = 0 : i64} : (memref<25088xi8>) -> memref<4x256x14x14xi1>
    byre.compute @PTXOp(%61, %62, %63) {BlockSize.x = 128 : i32, GridSize.x = 1568 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown44", memory_effects = [1 : i32, 2 : i32, 2 : i32]} : memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<4x256x14x14xi1>
    %64 = "byre.alias"(%alloc_36) {offset = 0 : i64} : (memref<401408xi8>) -> memref<4x256x14x14xf16>
    byre.compute @ConvOp_f16f16_f16(%62, %15, %64) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x256x14x14xf16>, memref<256x256x3x3xf16>, memref<4x256x14x14xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%64, %arg58, %arg59, %61) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>, memref<4x256x14x14xf16>
    %65 = "byre.alias"(%alloc_35) {offset = 0 : i64} : (memref<401408xi8>) -> memref<4x256x14x14xf16>
    %66 = "byre.alias"(%alloc_5) {offset = 0 : i64} : (memref<25088xi8>) -> memref<4x256x14x14xi1>
    byre.compute @PTXOp(%61, %59, %65, %66) {BlockSize.x = 128 : i32, GridSize.x = 1568 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown46", memory_effects = [1 : i32, 1 : i32, 2 : i32, 2 : i32]} : memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<4x256x14x14xi1>
    %67 = "byre.alias"(%alloc_34) {offset = 0 : i64} : (memref<401408xi8>) -> memref<4x256x14x14xf16>
    byre.compute @ConvOp_f16f16_f16(%65, %16, %67) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x256x14x14xf16>, memref<256x256x3x3xf16>, memref<4x256x14x14xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%67, %arg68, %arg69, %59) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>, memref<4x256x14x14xf16>
    %68 = "byre.alias"(%alloc_33) {offset = 0 : i64} : (memref<401408xi8>) -> memref<4x256x14x14xf16>
    %69 = "byre.alias"(%alloc_6) {offset = 0 : i64} : (memref<25088xi8>) -> memref<4x256x14x14xi1>
    byre.compute @PTXOp(%59, %68, %69) {BlockSize.x = 128 : i32, GridSize.x = 1568 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown48", memory_effects = [1 : i32, 2 : i32, 2 : i32]} : memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<4x256x14x14xi1>
    %70 = "byre.alias"(%alloc_52) {offset = 0 : i64} : (memref<1179648xi8>) -> memref<4x256x14x14xf16>
    byre.compute @ConvOp_f16f16_f16(%68, %17, %70) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x256x14x14xf16>, memref<256x256x3x3xf16>, memref<4x256x14x14xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%70, %arg73, %arg74, %59) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>, memref<4x256x14x14xf16>
    %71 = "byre.alias"(%alloc_52) {offset = 401408 : i64} : (memref<1179648xi8>) -> memref<4x256x14x14xf16>
    %72 = "byre.alias"(%alloc_7) {offset = 0 : i64} : (memref<25088xi8>) -> memref<4x256x14x14xi1>
    byre.compute @PTXOp(%59, %65, %71, %72) {BlockSize.x = 128 : i32, GridSize.x = 1568 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown50", memory_effects = [1 : i32, 1 : i32, 2 : i32, 2 : i32]} : memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<4x256x14x14xi1>
    %73 = "byre.alias"(%alloc_23) {offset = 0 : i64} : (memref<200704xi8>) -> memref<4x512x7x7xf16>
    byre.compute @ConvOp_f16f16_f16(%71, %18, %73) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<0> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x256x14x14xf16>, memref<512x256x1x1xf16>, memref<4x512x7x7xf16>
    %74 = "byre.alias"(%alloc_68) {offset = 4718592 : i64} : (memref<6422528xi8>) -> memref<4x512x7x7xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%73, %arg88, %arg89, %74) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>, memref<4x512x7x7xf16>
    %75 = "byre.alias"(%alloc_24) {offset = 0 : i64} : (memref<200704xi8>) -> memref<4x512x7x7xf16>
    byre.compute @ConvOp_f16f16_f16(%71, %19, %75) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x256x14x14xf16>, memref<512x256x3x3xf16>, memref<4x512x7x7xf16>
    %76 = "byre.alias"(%alloc_69) {offset = 1605632 : i64} : (memref<6422528xi8>) -> memref<4x512x7x7xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%75, %arg78, %arg79, %76) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>, memref<4x512x7x7xf16>
    %77 = "byre.alias"(%alloc_25) {offset = 0 : i64} : (memref<200704xi8>) -> memref<4x512x7x7xf16>
    %78 = "byre.alias"(%alloc_39) {offset = 262144 : i64} : (memref<401408xi8>) -> memref<4x512x7x7xi1>
    byre.compute @PTXOp(%76, %77, %78) {BlockSize.x = 128 : i32, GridSize.x = 784 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown53", memory_effects = [1 : i32, 2 : i32, 2 : i32]} : memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<4x512x7x7xi1>
    %79 = "byre.alias"(%alloc_26) {offset = 0 : i64} : (memref<200704xi8>) -> memref<4x512x7x7xf16>
    byre.compute @ConvOp_f16f16_f16(%77, %20, %79) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x512x7x7xf16>, memref<512x512x3x3xf16>, memref<4x512x7x7xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%79, %arg83, %arg84, %76) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>, memref<4x512x7x7xf16>
    %80 = "byre.alias"(%alloc_27) {offset = 0 : i64} : (memref<200704xi8>) -> memref<4x512x7x7xf16>
    %81 = "byre.alias"(%alloc_39) {offset = 274688 : i64} : (memref<401408xi8>) -> memref<4x512x7x7xi1>
    byre.compute @PTXOp(%76, %74, %80, %81) {BlockSize.x = 128 : i32, GridSize.x = 784 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown55", memory_effects = [1 : i32, 1 : i32, 2 : i32, 2 : i32]} : memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<4x512x7x7xi1>
    byre.compute @ConvOp_f16f16_f16(%80, %21, %76) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x512x7x7xf16>, memref<512x512x3x3xf16>, memref<4x512x7x7xf16>
    %82 = "byre.alias"(%alloc_69) {offset = 1806336 : i64} : (memref<6422528xi8>) -> memref<4x512x7x7xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%76, %arg93, %arg94, %82) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>, memref<4x512x7x7xf16>
    %83 = "byre.alias"(%alloc_28) {offset = 0 : i64} : (memref<262144xi8>) -> memref<4x512x7x7xf16>
    %84 = "byre.alias"(%alloc_39) {offset = 287232 : i64} : (memref<401408xi8>) -> memref<4x512x7x7xi1>
    byre.compute @PTXOp(%82, %83, %84) {BlockSize.x = 128 : i32, GridSize.x = 784 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown57", memory_effects = [1 : i32, 2 : i32, 2 : i32]} : memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<4x512x7x7xi1>
    %85 = "byre.alias"(%alloc_52) {offset = 802816 : i64} : (memref<1179648xi8>) -> memref<4x512x7x7xf16>
    byre.compute @ConvOp_f16f16_f16(%83, %22, %85) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", lhs_dilation = dense<1> : tensor<2xi64>, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<2x2xi64>, rhs_dilation = dense<1> : tensor<2xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x512x7x7xf16>, memref<512x512x3x3xf16>, memref<4x512x7x7xf16>
    byre.compute @BatchNormTrainingOp_f16f32f32_f16(%85, %arg98, %arg99, %74) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>, memref<4x512x7x7xf16>
    %86 = "byre.alias"(%alloc_52) {offset = 1003520 : i64} : (memref<1179648xi8>) -> memref<4x512x7x7xi1>
    byre.compute @PTXOp(%74, %80, %82, %86) {BlockSize.x = 128 : i32, GridSize.x = 784 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown59", memory_effects = [1 : i32, 1 : i32, 2 : i32, 2 : i32]} : memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<4x512x7x7xi1>
    %87 = "byre.alias"(%alloc_68) {offset = 4718592 : i64} : (memref<6422528xi8>) -> memref<4x512xf16>
    byre.compute @ReduceSumOp_f16_f16(%82, %87) {dimensions = dense<[3, 2]> : tensor<2xi64>, memory_effects = [1 : i32, 2 : i32]} : memref<4x512x7x7xf16>, memref<4x512xf16>
    %88 = "byre.alias"(%alloc) {offset = 0 : i64} : (memref<4096xi8>) -> memref<4x512xf16>
    byre.compute @PTXOp(%87, %88) {BlockSize.x = 128 : i32, GridSize.x = 16 : i32, arg_ranks = [2 : i32, 2 : i32], kernel_name = "Unknown60", memory_effects = [1 : i32, 2 : i32]} : memref<4x512xf16>, memref<4x512xf16>
    %89 = "byre.alias"(%alloc_69) {offset = 1806336 : i64} : (memref<6422528xi8>) -> memref<4x1000xf16>
    byre.compute @MatmulOp_f16f16_f16(%88, %24, %89) {lhs_contracting_dimension = 1 : i64, memory_effects = [1 : i32, 1 : i32, 2 : i32], rhs_contracting_dimension = 1 : i64} : memref<4x512xf16>, memref<1000x512xf16>, memref<4x1000xf16>
    %90 = "byre.alias"(%alloc_65) {offset = 1024000 : i64} : (memref<4718592xi8>) -> memref<4x1000xf16>
    byre.compute @PTXOp(%arg103, %89, %90) {BlockSize.x = 128 : i32, GridSize.x = 32 : i32, arg_ranks = [1 : i32, 2 : i32, 2 : i32], kernel_name = "Unknown61", memory_effects = [1 : i32, 1 : i32, 2 : i32]} : memref<1000xf32>, memref<4x1000xf16>, memref<4x1000xf16>
    %91 = "byre.alias"(%alloc_65) {offset = 1032000 : i64} : (memref<4718592xi8>) -> memref<4xf16>
    byre.compute @ReduceMaxOp_f16_f16(%90, %91) {dimensions = dense<1> : tensor<1xi64>, memory_effects = [1 : i32, 2 : i32]} : memref<4x1000xf16>, memref<4xf16>
    %92 = "byre.alias"(%alloc_68) {offset = 4718592 : i64} : (memref<6422528xi8>) -> memref<4x1000xf16>
    byre.compute @PTXOp(%91, %90, %92, %89) {BlockSize.x = 128 : i32, GridSize.x = 32 : i32, arg_ranks = [1 : i32, 2 : i32, 2 : i32, 2 : i32], kernel_name = "Unknown62", memory_effects = [1 : i32, 1 : i32, 2 : i32, 2 : i32]} : memref<4xf16>, memref<4x1000xf16>, memref<4x1000xf16>, memref<4x1000xf16>
    %93 = "byre.alias"(%alloc_68) {offset = 4726592 : i64} : (memref<6422528xi8>) -> memref<4xf16>
    byre.compute @ReduceSumOp_f16_f16(%89, %93) {dimensions = dense<1> : tensor<1xi64>, memory_effects = [1 : i32, 2 : i32]} : memref<4x1000xf16>, memref<4xf16>
    %94 = "byre.alias"(%alloc_0) {offset = 0 : i64} : (memref<8000xi8>) -> memref<4x1000xf16>
    %95 = "byre.alias"(%alloc_1) {offset = 0 : i64} : (memref<16000xi8>) -> memref<4x1000xf32>
    %96 = "byre.alias"(%alloc_2) {offset = 0 : i64} : (memref<16000xi8>) -> memref<4x1000xf32>
    byre.compute @PTXOp(%93, %92, %25, %23, %arg1, %94, %95, %96) {BlockSize.x = 128 : i32, GridSize.x = 32 : i32, arg_ranks = [1 : i32, 2 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32, 2 : i32], kernel_name = "Unknown63", memory_effects = [1 : i32, 1 : i32, 1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4xf16>, memref<4x1000xf16>, memref<4xf16>, memref<4x1000xf16>, memref<4x1000xf32>, memref<4x1000xf16>, memref<4x1000xf32>, memref<4x1000xf32>
    %97 = "byre.alias"(%alloc_69) {offset = 1806336 : i64} : (memref<6422528xi8>) -> memref<4x512xf16>
    byre.compute @MatmulOp_f16f16_f16(%94, %24, %97) {lhs_contracting_dimension = 1 : i64, memory_effects = [1 : i32, 1 : i32, 2 : i32], rhs_contracting_dimension = 0 : i64} : memref<4x1000xf16>, memref<1000x512xf16>, memref<4x512xf16>
    %98 = "byre.alias"(%alloc_22) {offset = 0 : i64} : (memref<200704xi8>) -> memref<4x512x7x7xf16>
    byre.compute @PTXOp(%97, %86, %98) {BlockSize.x = 128 : i32, GridSize.x = 784 : i32, arg_ranks = [2 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown64", memory_effects = [1 : i32, 1 : i32, 2 : i32]} : memref<4x512xf16>, memref<4x512x7x7xi1>, memref<4x512x7x7xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%85, %arg98, %98, %82, %arg163, %arg164) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x512x7x7xf16>, memref<512xf32>, memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%82, %22, %74) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x512x7x7xf16>, memref<512x512x3x3xf16>, memref<4x512x7x7xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%83, %82, %22) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<512x512x3x3xf16>
    byre.compute @PTXOp(%84, %74, %82) {BlockSize.x = 128 : i32, GridSize.x = 784 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown68", memory_effects = [1 : i32, 1 : i32, 2 : i32]} : memref<4x512x7x7xi1>, memref<4x512x7x7xf16>, memref<4x512x7x7xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%76, %arg93, %82, %74, %arg160, %arg161) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x512x7x7xf16>, memref<512xf32>, memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%74, %21, %76) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x512x7x7xf16>, memref<512x512x3x3xf16>, memref<4x512x7x7xf16>
    %99 = "byre.alias"(%alloc_65) {offset = 0 : i64} : (memref<4718592xi8>) -> memref<512x512x3x3xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%80, %74, %99) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<512x512x3x3xf16>
    byre.compute @PTXOp(%98, %76, %81, %83) {BlockSize.x = 128 : i32, GridSize.x = 784 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown72", memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<4x512x7x7xi1>, memref<4x512x7x7xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%79, %arg83, %83, %76, %arg154, %arg155) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x512x7x7xf16>, memref<512xf32>, memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%76, %20, %85) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x512x7x7xf16>, memref<512x512x3x3xf16>, memref<4x512x7x7xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%77, %76, %21) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<512x512x3x3xf16>
    byre.compute @PTXOp(%78, %85, %76) {BlockSize.x = 128 : i32, GridSize.x = 784 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown76", memory_effects = [1 : i32, 1 : i32, 2 : i32]} : memref<4x512x7x7xi1>, memref<4x512x7x7xf16>, memref<4x512x7x7xf16>
    %100 = "byre.alias"(%alloc_68) {offset = 0 : i64} : (memref<6422528xi8>) -> memref<4x512x7x7xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%75, %arg78, %76, %100, %arg151, %arg152) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x512x7x7xf16>, memref<512xf32>, memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%100, %19, %59) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x512x7x7xf16>, memref<512x256x3x3xf16>, memref<4x256x14x14xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%71, %100, %19) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x256x14x14xf16>, memref<4x512x7x7xf16>, memref<512x256x3x3xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%73, %arg88, %83, %100, %arg157, %arg158) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x512x7x7xf16>, memref<512xf32>, memref<4x512x7x7xf16>, memref<4x512x7x7xf16>, memref<512xf32>, memref<512xf32>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%100, %18, %61) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<0> : tensor<4xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x512x7x7xf16>, memref<512x256x1x1xf16>, memref<4x256x14x14xf16>
    %101 = "byre.alias"(%alloc_28) {offset = 0 : i64} : (memref<262144xi8>) -> memref<512x256x1x1xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%71, %100, %101) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<0> : tensor<4xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x256x14x14xf16>, memref<4x512x7x7xf16>, memref<512x256x1x1xf16>
    %102 = "byre.alias"(%alloc_39) {offset = 0 : i64} : (memref<401408xi8>) -> memref<4x256x14x14xf16>
    byre.compute @PTXOp(%61, %59, %72, %102) {BlockSize.x = 128 : i32, GridSize.x = 1568 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown83", memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<4x256x14x14xi1>, memref<4x256x14x14xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%70, %arg73, %102, %59, %arg148, %arg149) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x256x14x14xf16>, memref<256xf32>, memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>
    %103 = "byre.alias"(%alloc_68) {offset = 0 : i64} : (memref<6422528xi8>) -> memref<4x256x14x14xf16>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%59, %17, %103) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x256x14x14xf16>, memref<256x256x3x3xf16>, memref<4x256x14x14xf16>
    %104 = "byre.alias"(%alloc_52) {offset = 0 : i64} : (memref<1179648xi8>) -> memref<256x256x3x3xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%68, %59, %104) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<256x256x3x3xf16>
    byre.compute @PTXOp(%69, %103, %59) {BlockSize.x = 128 : i32, GridSize.x = 1568 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown87", memory_effects = [1 : i32, 1 : i32, 2 : i32]} : memref<4x256x14x14xi1>, memref<4x256x14x14xf16>, memref<4x256x14x14xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%67, %arg68, %59, %103, %arg145, %arg146) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x256x14x14xf16>, memref<256xf32>, memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%103, %16, %59) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x256x14x14xf16>, memref<256x256x3x3xf16>, memref<4x256x14x14xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%65, %103, %16) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<256x256x3x3xf16>
    byre.compute @PTXOp(%102, %59, %66, %65) {BlockSize.x = 128 : i32, GridSize.x = 1568 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown91", memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<4x256x14x14xi1>, memref<4x256x14x14xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%64, %arg58, %65, %59, %arg139, %arg140) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x256x14x14xf16>, memref<256xf32>, memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%59, %15, %103) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x256x14x14xf16>, memref<256x256x3x3xf16>, memref<4x256x14x14xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%62, %59, %17) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<256x256x3x3xf16>
    byre.compute @PTXOp(%63, %103, %59) {BlockSize.x = 128 : i32, GridSize.x = 1568 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown95", memory_effects = [1 : i32, 1 : i32, 2 : i32]} : memref<4x256x14x14xi1>, memref<4x256x14x14xf16>, memref<4x256x14x14xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%60, %arg53, %59, %103, %arg136, %arg137) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x256x14x14xf16>, memref<256xf32>, memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%103, %14, %46) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x256x14x14xf16>, memref<256x128x3x3xf16>, memref<4x128x28x28xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%56, %103, %14) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x128x28x28xf16>, memref<4x256x14x14xf16>, memref<256x128x3x3xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%58, %arg63, %65, %103, %arg142, %arg143) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x256x14x14xf16>, memref<256xf32>, memref<4x256x14x14xf16>, memref<4x256x14x14xf16>, memref<256xf32>, memref<256xf32>
    %105 = "byre.alias"(%alloc_69) {offset = 2408448 : i64} : (memref<6422528xi8>) -> memref<4x128x28x28xf16>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%103, %13, %105) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<0> : tensor<4xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x256x14x14xf16>, memref<256x128x1x1xf16>, memref<4x128x28x28xf16>
    %106 = "byre.alias"(%alloc_39) {offset = 0 : i64} : (memref<401408xi8>) -> memref<256x128x1x1xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%56, %103, %106) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<0> : tensor<4xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x128x28x28xf16>, memref<4x256x14x14xf16>, memref<256x128x1x1xf16>
    byre.compute @PTXOp(%105, %46, %57, %56) {BlockSize.x = 128 : i32, GridSize.x = 3136 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown102", memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<4x128x28x28xi1>, memref<4x128x28x28xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%55, %arg48, %56, %46, %arg133, %arg134) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x128x28x28xf16>, memref<128xf32>, memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>
    %107 = "byre.alias"(%alloc_68) {offset = 0 : i64} : (memref<6422528xi8>) -> memref<4x128x28x28xf16>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%46, %12, %107) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x128x28x28xf16>, memref<128x128x3x3xf16>, memref<4x128x28x28xf16>
    %108 = "byre.alias"(%alloc_45) {offset = 0 : i64} : (memref<802816xi8>) -> memref<128x128x3x3xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%53, %46, %108) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<128x128x3x3xf16>
    %109 = "byre.alias"(%alloc_51) {offset = 0 : i64} : (memref<1179648xi8>) -> memref<4x128x28x28xf16>
    byre.compute @PTXOp(%54, %107, %109) {BlockSize.x = 128 : i32, GridSize.x = 3136 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown106", memory_effects = [1 : i32, 1 : i32, 2 : i32]} : memref<4x128x28x28xi1>, memref<4x128x28x28xf16>, memref<4x128x28x28xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%52, %arg43, %109, %46, %arg130, %arg131) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x128x28x28xf16>, memref<128xf32>, memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%46, %11, %107) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x128x28x28xf16>, memref<128x128x3x3xf16>, memref<4x128x28x28xf16>
    %110 = "byre.alias"(%alloc_45) {offset = 294912 : i64} : (memref<802816xi8>) -> memref<128x128x3x3xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%50, %46, %110) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<128x128x3x3xf16>
    byre.compute @PTXOp(%56, %107, %51, %109) {BlockSize.x = 128 : i32, GridSize.x = 3136 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown110", memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<4x128x28x28xi1>, memref<4x128x28x28xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%49, %arg33, %109, %46, %arg124, %arg125) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x128x28x28xf16>, memref<128xf32>, memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%46, %10, %107) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x128x28x28xf16>, memref<128x128x3x3xf16>, memref<4x128x28x28xf16>
    %111 = "byre.alias"(%alloc_50) {offset = 0 : i64} : (memref<802816xi8>) -> memref<128x128x3x3xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%47, %46, %111) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<128x128x3x3xf16>
    byre.compute @PTXOp(%48, %107, %46) {BlockSize.x = 128 : i32, GridSize.x = 3136 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown114", memory_effects = [1 : i32, 1 : i32, 2 : i32]} : memref<4x128x28x28xi1>, memref<4x128x28x28xf16>, memref<4x128x28x28xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%45, %arg28, %46, %107, %arg121, %arg122) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x128x28x28xf16>, memref<128xf32>, memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%107, %9, %37) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x128x28x28xf16>, memref<128x64x3x3xf16>, memref<4x64x56x56xf16>
    %112 = "byre.alias"(%alloc_50) {offset = 294912 : i64} : (memref<802816xi8>) -> memref<128x64x3x3xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%41, %107, %112) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x64x56x56xf16>, memref<4x128x28x28xf16>, memref<128x64x3x3xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%43, %arg38, %109, %107, %arg127, %arg128) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x128x28x28xf16>, memref<128xf32>, memref<4x128x28x28xf16>, memref<4x128x28x28xf16>, memref<128xf32>, memref<128xf32>
    %113 = "byre.alias"(%alloc_69) {offset = 3211264 : i64} : (memref<6422528xi8>) -> memref<4x64x56x56xf16>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%107, %8, %113) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<0> : tensor<4xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x128x28x28xf16>, memref<128x64x1x1xf16>, memref<4x64x56x56xf16>
    %114 = "byre.alias"(%alloc_51) {offset = 0 : i64} : (memref<1179648xi8>) -> memref<128x64x1x1xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%41, %107, %114) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<0> : tensor<4xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x64x56x56xf16>, memref<4x128x28x28xf16>, memref<128x64x1x1xf16>
    byre.compute @PTXOp(%113, %37, %42, %41) {BlockSize.x = 128 : i32, GridSize.x = 6272 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown121", memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<4x64x56x56xi1>, memref<4x64x56x56xf16>
    %115 = "byre.alias"(%alloc_68) {offset = 0 : i64} : (memref<6422528xi8>) -> memref<4x64x56x56xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%40, %arg23, %41, %115, %arg118, %arg119) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x64x56x56xf16>, memref<64xf32>, memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%115, %7, %37) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x64x56x56xf16>, memref<64x64x3x3xf16>, memref<4x64x56x56xf16>
    %116 = "byre.alias"(%alloc_56) {offset = 0 : i64} : (memref<1605632xi8>) -> memref<64x64x3x3xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%38, %115, %116) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<64x64x3x3xf16>
    byre.compute @PTXOp(%39, %37, %115) {BlockSize.x = 128 : i32, GridSize.x = 6272 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown125", memory_effects = [1 : i32, 1 : i32, 2 : i32]} : memref<4x64x56x56xi1>, memref<4x64x56x56xf16>, memref<4x64x56x56xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%36, %arg18, %115, %37, %arg115, %arg116) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x64x56x56xf16>, memref<64xf32>, memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%37, %6, %115) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x64x56x56xf16>, memref<64x64x3x3xf16>, memref<4x64x56x56xf16>
    %117 = "byre.alias"(%alloc_58) {offset = 0 : i64} : (memref<1605632xi8>) -> memref<64x64x3x3xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%30, %37, %117) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<64x64x3x3xf16>
    byre.compute @PTXOp(%41, %115, %35, %36) {BlockSize.x = 128 : i32, GridSize.x = 6272 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown129", memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32]} : memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<4x64x56x56xi1>, memref<4x64x56x56xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%33, %arg13, %36, %30, %arg112, %arg113) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x64x56x56xf16>, memref<64xf32>, memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%30, %5, %115) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x64x56x56xf16>, memref<64x64x3x3xf16>, memref<4x64x56x56xf16>
    %118 = "byre.alias"(%alloc_60) {offset = 0 : i64} : (memref<1605632xi8>) -> memref<64x64x3x3xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%31, %30, %118) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<64x64x3x3xf16>
    byre.compute @PTXOp(%32, %115, %30) {BlockSize.x = 128 : i32, GridSize.x = 6272 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown133", memory_effects = [1 : i32, 1 : i32, 2 : i32]} : memref<4x64x56x56xi1>, memref<4x64x56x56xf16>, memref<4x64x56x56xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%29, %arg8, %30, %115, %arg109, %arg110) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x64x56x56xf16>, memref<64xf32>, memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<64xf32>, memref<64xf32>
    byre.compute @ConvBackwardDataOp_f16f16_f16(%115, %4, %30) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x64x56x56xf16>, memref<64x64x3x3xf16>, memref<4x64x56x56xf16>
    %119 = "byre.alias"(%alloc_63) {offset = 0 : i64} : (memref<1605632xi8>) -> memref<64x64x3x3xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%28, %115, %119) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<1> : tensor<4xi64>, window_strides = dense<1> : tensor<2xi64>} : memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<64x64x3x3xf16>
    byre.compute @PTXOp(%36, %30, %115) {BlockSize.x = 128 : i32, GridSize.x = 6272 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown137", memory_effects = [1 : i32, 1 : i32, 2 : i32]} : memref<4x64x56x56xf16>, memref<4x64x56x56xf16>, memref<4x64x56x56xf16>
    byre.compute @PoolMaxGradOp_f16f16_f16(%26, %115, %3) {memory_effects = [1 : i32, 1 : i32, 2 : i32], padding = dense<[[0, 0], [0, 0], [1, 1], [1, 1]]> : tensor<4x2xi64>, window_dimensions = dense<[1, 1, 3, 3]> : tensor<4xi64>, window_strides = dense<[1, 1, 2, 2]> : tensor<4xi64>} : memref<4x64x112x112xf16>, memref<4x64x56x56xf16>, memref<4x64x112x112xf16>
    %120 = "byre.alias"(%alloc_68) {offset = 0 : i64} : (memref<6422528xi8>) -> memref<4x64x112x112xf16>
    byre.compute @PTXOp(%27, %3, %120) {BlockSize.x = 128 : i32, GridSize.x = 25088 : i32, arg_ranks = [4 : i32, 4 : i32, 4 : i32], kernel_name = "Unknown138", memory_effects = [1 : i32, 1 : i32, 2 : i32]} : memref<4x64x112x112xi1>, memref<4x64x112x112xf16>, memref<4x64x112x112xf16>
    byre.compute @BatchNormGradOp_f16f32f16_f16f32f32(%2, %arg3, %120, %26, %arg106, %arg107) {epsilon = 9.99999974E-6 : f32, feature_index = 1 : i64, memory_effects = [1 : i32, 1 : i32, 1 : i32, 2 : i32, 2 : i32, 2 : i32]} : memref<4x64x112x112xf16>, memref<64xf32>, memref<4x64x112x112xf16>, memref<4x64x112x112xf16>, memref<64xf32>, memref<64xf32>
    %121 = "byre.alias"(%alloc_70) {offset = 0 : i64} : (memref<6422528xi8>) -> memref<64x3x7x7xf16>
    byre.compute @ConvBackwardFilterOp_f16f16_f16(%0, %26, %121) {batch_group_count = 1 : i64, feature_group_count = 1 : i64, input_layout = "NCHW", kernel_layout = "NCHW", memory_effects = [1 : i32, 1 : i32, 2 : i32], output_layout = "NCHW", padding = dense<3> : tensor<4xi64>, window_strides = dense<2> : tensor<2xi64>} : memref<4x3x224x224xf16>, memref<4x64x112x112xf16>, memref<64x3x7x7xf16>
    %122 = "byre.alias"(%alloc_71) {offset = 0 : i64} : (memref<6422528xi8>) -> memref<f32>
    byre.compute @ReduceSumOp_f32_f32(%95, %122) {dimensions = dense<[0, 1]> : tensor<2xi64>, memory_effects = [1 : i32, 2 : i32]} : memref<4x1000xf32>, memref<f32>
    byre.compute @PTXOp(%122, %arg104) {BlockSize.x = 128 : i32, GridSize.x = 1 : i32, arg_ranks = [0 : i32, 0 : i32], kernel_name = "Unknown141", memory_effects = [1 : i32, 2 : i32]} : memref<f32>, memref<f32>
    byre.compute @PTXOp(%121, %arg105) {BlockSize.x = 128 : i32, GridSize.x = 74 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown142", memory_effects = [1 : i32, 2 : i32]} : memref<64x3x7x7xf16>, memref<64x3x7x7xf32>
    byre.compute @PTXOp(%119, %arg108) {BlockSize.x = 128 : i32, GridSize.x = 288 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown143", memory_effects = [1 : i32, 2 : i32]} : memref<64x64x3x3xf16>, memref<64x64x3x3xf32>
    byre.compute @PTXOp(%118, %arg111) {BlockSize.x = 128 : i32, GridSize.x = 288 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown144", memory_effects = [1 : i32, 2 : i32]} : memref<64x64x3x3xf16>, memref<64x64x3x3xf32>
    byre.compute @PTXOp(%117, %arg114) {BlockSize.x = 128 : i32, GridSize.x = 288 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown145", memory_effects = [1 : i32, 2 : i32]} : memref<64x64x3x3xf16>, memref<64x64x3x3xf32>
    byre.compute @PTXOp(%116, %arg117) {BlockSize.x = 128 : i32, GridSize.x = 288 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown146", memory_effects = [1 : i32, 2 : i32]} : memref<64x64x3x3xf16>, memref<64x64x3x3xf32>
    byre.compute @PTXOp(%112, %arg120) {BlockSize.x = 128 : i32, GridSize.x = 576 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown147", memory_effects = [1 : i32, 2 : i32]} : memref<128x64x3x3xf16>, memref<128x64x3x3xf32>
    byre.compute @PTXOp(%111, %arg123) {BlockSize.x = 128 : i32, GridSize.x = 1152 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown148", memory_effects = [1 : i32, 2 : i32]} : memref<128x128x3x3xf16>, memref<128x128x3x3xf32>
    byre.compute @PTXOp(%114, %arg126) {BlockSize.x = 128 : i32, GridSize.x = 64 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown149", memory_effects = [1 : i32, 2 : i32]} : memref<128x64x1x1xf16>, memref<128x64x1x1xf32>
    byre.compute @PTXOp(%110, %arg129) {BlockSize.x = 128 : i32, GridSize.x = 1152 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown150", memory_effects = [1 : i32, 2 : i32]} : memref<128x128x3x3xf16>, memref<128x128x3x3xf32>
    byre.compute @PTXOp(%108, %arg132) {BlockSize.x = 128 : i32, GridSize.x = 1152 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown151", memory_effects = [1 : i32, 2 : i32]} : memref<128x128x3x3xf16>, memref<128x128x3x3xf32>
    byre.compute @PTXOp(%14, %arg135) {BlockSize.x = 128 : i32, GridSize.x = 2304 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown152", memory_effects = [1 : i32, 2 : i32]} : memref<256x128x3x3xf16>, memref<256x128x3x3xf32>
    byre.compute @PTXOp(%17, %arg138) {BlockSize.x = 128 : i32, GridSize.x = 4608 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown153", memory_effects = [1 : i32, 2 : i32]} : memref<256x256x3x3xf16>, memref<256x256x3x3xf32>
    byre.compute @PTXOp(%106, %arg141) {BlockSize.x = 128 : i32, GridSize.x = 256 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown154", memory_effects = [1 : i32, 2 : i32]} : memref<256x128x1x1xf16>, memref<256x128x1x1xf32>
    byre.compute @PTXOp(%16, %arg144) {BlockSize.x = 128 : i32, GridSize.x = 4608 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown155", memory_effects = [1 : i32, 2 : i32]} : memref<256x256x3x3xf16>, memref<256x256x3x3xf32>
    byre.compute @PTXOp(%104, %arg147) {BlockSize.x = 128 : i32, GridSize.x = 4608 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown156", memory_effects = [1 : i32, 2 : i32]} : memref<256x256x3x3xf16>, memref<256x256x3x3xf32>
    byre.compute @PTXOp(%19, %arg150) {BlockSize.x = 128 : i32, GridSize.x = 9216 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown157", memory_effects = [1 : i32, 2 : i32]} : memref<512x256x3x3xf16>, memref<512x256x3x3xf32>
    byre.compute @PTXOp(%21, %arg153) {BlockSize.x = 128 : i32, GridSize.x = 18432 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown158", memory_effects = [1 : i32, 2 : i32]} : memref<512x512x3x3xf16>, memref<512x512x3x3xf32>
    byre.compute @PTXOp(%101, %arg156) {BlockSize.x = 128 : i32, GridSize.x = 1024 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown159", memory_effects = [1 : i32, 2 : i32]} : memref<512x256x1x1xf16>, memref<512x256x1x1xf32>
    byre.compute @PTXOp(%99, %arg159) {BlockSize.x = 128 : i32, GridSize.x = 18432 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown160", memory_effects = [1 : i32, 2 : i32]} : memref<512x512x3x3xf16>, memref<512x512x3x3xf32>
    byre.compute @PTXOp(%22, %arg162) {BlockSize.x = 128 : i32, GridSize.x = 18432 : i32, arg_ranks = [4 : i32, 4 : i32], kernel_name = "Unknown161", memory_effects = [1 : i32, 2 : i32]} : memref<512x512x3x3xf16>, memref<512x512x3x3xf32>
    %123 = "byre.alias"(%alloc_71) {offset = 0 : i64} : (memref<6422528xi8>) -> memref<1000x512xf16>
    byre.compute @MatmulOp_f16f16_f16(%88, %94, %123) {lhs_contracting_dimension = 0 : i64, memory_effects = [1 : i32, 1 : i32, 2 : i32], output_transpose, rhs_contracting_dimension = 0 : i64} : memref<4x512xf16>, memref<4x1000xf16>, memref<1000x512xf16>
    byre.compute @PTXOp(%123, %arg165) {BlockSize.x = 128 : i32, GridSize.x = 4000 : i32, arg_ranks = [2 : i32, 2 : i32], kernel_name = "Unknown163", memory_effects = [1 : i32, 2 : i32]} : memref<1000x512xf16>, memref<1000x512xf32>
    %124 = "byre.alias"(%alloc_71) {offset = 0 : i64} : (memref<6422528xi8>) -> memref<1000xf32>
    byre.compute @ReduceSumOp_f32_f32(%96, %124) {dimensions = dense<0> : tensor<1xi64>, memory_effects = [1 : i32, 2 : i32]} : memref<4x1000xf32>, memref<1000xf32>
    byre.compute @PTXOp(%124, %arg166) {BlockSize.x = 128 : i32, GridSize.x = 8 : i32, arg_ranks = [1 : i32, 1 : i32], kernel_name = "Unknown164", memory_effects = [1 : i32, 2 : i32]} : memref<1000xf32>, memref<1000xf32>
    return
  }
}