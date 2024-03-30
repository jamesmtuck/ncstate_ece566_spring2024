; ModuleID = 'arm.prof.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@nlinks = dso_local global i32 0, align 4
@target = dso_local global [2 x i32] zeroinitializer, align 4
@.str = private unnamed_addr constant [9 x i8] c"newpath\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"Solven: no solutions!\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"closepath stroke\0A\00", align 1
@linklen = dso_local global [20 x i32] zeroinitializer, align 16
@.str.3 = private unnamed_addr constant [31 x i8] c"%%==>Solve3: links = %d,%d,%d\0A\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"%%Solve3: link1=%d, link2=%d, joint=\0A\00", align 1
@.str.5 = private unnamed_addr constant [49 x i8] c"%%Solve3: link1=%d, link2=%d, link3=%d, joints=\0A\00", align 1
@.str.6 = private unnamed_addr constant [63 x i8] c"%%<==Solve2: L1=%d, L2=%d; nsoln=%d, target=(%d,%d),J=(%g,%g)\0A\00", align 1
@.str.7 = private unnamed_addr constant [27 x i8] c"%%TwoCircles00: p=(%g,%g)\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.9 = private unnamed_addr constant [26 x i8] c"%%Target point = (%d,%d)\0A\00", align 1
@.str.10 = private unnamed_addr constant [22 x i8] c"%5d    %5d    lineto\0A\00", align 1
@.str.11 = private unnamed_addr constant [22 x i8] c"%5d    %5d    moveto\0A\00", align 1
@.str.12 = private unnamed_addr constant [22 x i8] c"%8.2lf %8.2lf lineto\0A\00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"%%\00", align 1
@.str.14 = private unnamed_addr constant [7 x i8] c"%d:%d\09\00", align 1
@.str.15 = private unnamed_addr constant [7 x i8] c"%%!PS\0A\00", align 1
@.str.16 = private unnamed_addr constant [38 x i8] c"%%%%Creator: arm.c (Joseph O'Rourke)\0A\00", align 1
@.str.17 = private unnamed_addr constant [30 x i8] c"%%%%BoundingBox: %d %d %d %d\0A\00", align 1
@.str.18 = private unnamed_addr constant [17 x i8] c"%%%%EndComments\0A\00", align 1
@.str.19 = private unnamed_addr constant [22 x i8] c".00 .00 setlinewidth\0A\00", align 1
@.str.20 = private unnamed_addr constant [17 x i8] c"%d %d translate\0A\00", align 1
@.str.21 = private unnamed_addr constant [18 x i8] c"showpage\0A%%%%EOF\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [2 x i32], align 4
  store i32 0, ptr %1, align 4
  call void @llvm.memset.p0.i64(ptr align 4 %2, i8 0, i64 8, i1 false)
  %3 = call i32 @ReadLinks()
  store i32 %3, ptr @nlinks, align 4
  call void @PostscriptOpen()
  br label %4

4:                                                ; preds = %0, %12
  call void @ReadTarget(ptr noundef @target)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %6 = getelementptr inbounds [2 x i32], ptr %2, i64 0, i64 0
  call void @MoveTo_i(ptr noundef %6)
  %7 = load i32, ptr @nlinks, align 4
  %8 = call i32 @Solven(i32 noundef %7)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %4
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %12

12:                                               ; preds = %10, %4
  call void @LineTo_i(ptr noundef @target)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %4
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ReadLinks() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.8, ptr noundef @nlinks)
  store i32 0, ptr %1, align 4
  br label %4

4:                                                ; preds = %14, %0
  %5 = load i32, ptr %1, align 4
  %6 = load i32, ptr @nlinks, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %17

8:                                                ; preds = %4
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.8, ptr noundef %2)
  %10 = load i32, ptr %2, align 4
  %11 = load i32, ptr %1, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [20 x i32], ptr @linklen, i64 0, i64 %12
  store i32 %10, ptr %13, align 4
  br label %14

14:                                               ; preds = %8
  %15 = load i32, ptr %1, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %1, align 4
  br label %4

17:                                               ; preds = %4
  %18 = load i32, ptr @nlinks, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @PostscriptOpen() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %18, %0
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr @nlinks, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %21

11:                                               ; preds = %7
  %12 = load i32, ptr %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [20 x i32], ptr @linklen, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = load i32, ptr %6, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %6, align 4
  br label %18

18:                                               ; preds = %11
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %5, align 4
  br label %7

21:                                               ; preds = %7
  %22 = load i32, ptr %6, align 4
  %23 = sub nsw i32 0, %22
  store i32 %23, ptr %3, align 4
  store i32 %23, ptr %1, align 4
  %24 = load i32, ptr %6, align 4
  store i32 %24, ptr %4, align 4
  store i32 %24, ptr %2, align 4
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %27 = load i32, ptr %1, align 4
  %28 = load i32, ptr %3, align 4
  %29 = load i32, ptr %2, align 4
  %30 = load i32, ptr %4, align 4
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.17, i32 noundef %27, i32 noundef %28, i32 noundef %29, i32 noundef %30)
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %34 = load i32, ptr %1, align 4
  %35 = sub nsw i32 0, %34
  %36 = add nsw i32 %35, 100
  %37 = load i32, ptr %3, align 4
  %38 = sub nsw i32 0, %37
  %39 = add nsw i32 %38, 100
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, i32 noundef %36, i32 noundef %39)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @ReadTarget(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %18, %1
  %6 = load i32, ptr %3, align 4
  %7 = icmp slt i32 %6, 2
  br i1 %7, label %8, label %21

8:                                                ; preds = %5
  %9 = load ptr, ptr %2, align 8
  %10 = load i32, ptr %3, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i32, ptr %9, i64 %11
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.8, ptr noundef %12)
  store i32 %13, ptr %4, align 4
  %14 = load i32, ptr %4, align 4
  %15 = icmp eq i32 %14, -1
  br i1 %15, label %16, label %17

16:                                               ; preds = %8
  call void @PostscriptClose()
  call void @exit(i32 noundef 0) #6
  unreachable

17:                                               ; preds = %8
  br label %18

18:                                               ; preds = %17
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %3, align 4
  br label %5

21:                                               ; preds = %5
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds i32, ptr %22, i64 0
  %24 = load i32, ptr %23, align 4
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds i32, ptr %25, i64 1
  %27 = load i32, ptr %26, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %24, i32 noundef %27)
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @MoveTo_i(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i32, ptr %3, i64 0
  %5 = load i32, ptr %4, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds i32, ptr %6, i64 1
  %8 = load i32, ptr %7, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %5, i32 noundef %8)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Solven(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %9, align 4
  store i32 0, ptr %4, align 4
  br label %11

11:                                               ; preds = %22, %1
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %3, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %25

15:                                               ; preds = %11
  %16 = load i32, ptr %4, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [20 x i32], ptr @linklen, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = load i32, ptr %9, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %9, align 4
  br label %22

22:                                               ; preds = %15
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %4, align 4
  br label %11

25:                                               ; preds = %11
  %26 = load i32, ptr %9, align 4
  %27 = sdiv i32 %26, 2
  store i32 %27, ptr %10, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %5, align 4
  br label %28

28:                                               ; preds = %49, %25
  %29 = load i32, ptr %5, align 4
  %30 = load i32, ptr %3, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %52

32:                                               ; preds = %28
  %33 = load i32, ptr %6, align 4
  %34 = load i32, ptr %5, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [20 x i32], ptr @linklen, i64 0, i64 %35
  %37 = load i32, ptr %36, align 4
  %38 = add nsw i32 %33, %37
  %39 = load i32, ptr %10, align 4
  %40 = icmp sgt i32 %38, %39
  br i1 %40, label %41, label %42

41:                                               ; preds = %32
  br label %52

42:                                               ; preds = %32
  %43 = load i32, ptr %5, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [20 x i32], ptr @linklen, i64 0, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = load i32, ptr %6, align 4
  %48 = add nsw i32 %47, %46
  store i32 %48, ptr %6, align 4
  br label %49

49:                                               ; preds = %42
  %50 = load i32, ptr %5, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %5, align 4
  br label %28

52:                                               ; preds = %41, %28
  %53 = load i32, ptr %5, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [20 x i32], ptr @linklen, i64 0, i64 %54
  %56 = load i32, ptr %55, align 4
  store i32 %56, ptr %7, align 4
  %57 = load i32, ptr %9, align 4
  %58 = load i32, ptr %6, align 4
  %59 = sub nsw i32 %57, %58
  %60 = load i32, ptr %7, align 4
  %61 = sub nsw i32 %59, %60
  store i32 %61, ptr %8, align 4
  %62 = load i32, ptr %6, align 4
  %63 = load i32, ptr %7, align 4
  %64 = load i32, ptr %8, align 4
  %65 = call i32 @Solve3(i32 noundef %62, i32 noundef %63, i32 noundef %64, ptr noundef @target)
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %68

67:                                               ; preds = %52
  store i32 1, ptr %2, align 4
  br label %69

68:                                               ; preds = %52
  store i32 0, ptr %2, align 4
  br label %69

69:                                               ; preds = %68, %67
  %70 = load i32, ptr %2, align 4
  ret i32 %70
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @LineTo_i(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i32, ptr %3, i64 0
  %5 = load i32, ptr %4, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds i32, ptr %6, i64 1
  %8 = load i32, ptr %7, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %5, i32 noundef %8)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Solve3(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca [2 x double], align 16
  %11 = alloca [2 x i32], align 4
  %12 = alloca [2 x i32], align 4
  store i32 %0, ptr %6, align 4
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store ptr %3, ptr %9, align 8
  %13 = load i32, ptr %6, align 4
  %14 = load i32, ptr %7, align 4
  %15 = load i32, ptr %8, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %13, i32 noundef %14, i32 noundef %15)
  %17 = load i32, ptr %6, align 4
  %18 = load i32, ptr %7, align 4
  %19 = add nsw i32 %17, %18
  %20 = load i32, ptr %8, align 4
  %21 = load ptr, ptr %9, align 8
  %22 = getelementptr inbounds [2 x double], ptr %10, i64 0, i64 0
  %23 = call i32 @Solve2(i32 noundef %19, i32 noundef %20, ptr noundef %21, ptr noundef %22)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %32

25:                                               ; preds = %4
  %26 = load i32, ptr %6, align 4
  %27 = load i32, ptr %7, align 4
  %28 = add nsw i32 %26, %27
  %29 = load i32, ptr %8, align 4
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %28, i32 noundef %29)
  %31 = getelementptr inbounds [2 x double], ptr %10, i64 0, i64 0
  call void @LineTo_d(ptr noundef %31)
  store i32 1, ptr %5, align 4
  br label %74

32:                                               ; preds = %4
  %33 = load i32, ptr %6, align 4
  %34 = load i32, ptr %7, align 4
  %35 = load i32, ptr %8, align 4
  %36 = add nsw i32 %34, %35
  %37 = load ptr, ptr %9, align 8
  %38 = getelementptr inbounds [2 x double], ptr %10, i64 0, i64 0
  %39 = call i32 @Solve2(i32 noundef %33, i32 noundef %36, ptr noundef %37, ptr noundef %38)
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %48

41:                                               ; preds = %32
  %42 = load i32, ptr %6, align 4
  %43 = load i32, ptr %7, align 4
  %44 = load i32, ptr %8, align 4
  %45 = add nsw i32 %43, %44
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %42, i32 noundef %45)
  %47 = getelementptr inbounds [2 x double], ptr %10, i64 0, i64 0
  call void @LineTo_d(ptr noundef %47)
  store i32 1, ptr %5, align 4
  br label %74

48:                                               ; preds = %32
  %49 = load i32, ptr %6, align 4
  %50 = getelementptr inbounds [2 x i32], ptr %11, i64 0, i64 0
  store i32 %49, ptr %50, align 4
  %51 = getelementptr inbounds [2 x i32], ptr %11, i64 0, i64 1
  store i32 0, ptr %51, align 4
  %52 = load ptr, ptr %9, align 8
  %53 = getelementptr inbounds [2 x i32], ptr %11, i64 0, i64 0
  %54 = getelementptr inbounds [2 x i32], ptr %12, i64 0, i64 0
  call void @SubVec(ptr noundef %52, ptr noundef %53, ptr noundef %54)
  %55 = load i32, ptr %7, align 4
  %56 = load i32, ptr %8, align 4
  %57 = getelementptr inbounds [2 x i32], ptr %12, i64 0, i64 0
  %58 = getelementptr inbounds [2 x double], ptr %10, i64 0, i64 0
  %59 = call i32 @Solve2(i32 noundef %55, i32 noundef %56, ptr noundef %57, ptr noundef %58)
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %73

61:                                               ; preds = %48
  %62 = load i32, ptr %6, align 4
  %63 = sitofp i32 %62 to double
  %64 = getelementptr inbounds [2 x double], ptr %10, i64 0, i64 0
  %65 = load double, ptr %64, align 16
  %66 = fadd double %65, %63
  store double %66, ptr %64, align 16
  %67 = load i32, ptr %6, align 4
  %68 = load i32, ptr %7, align 4
  %69 = load i32, ptr %8, align 4
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %67, i32 noundef %68, i32 noundef %69)
  %71 = getelementptr inbounds [2 x i32], ptr %11, i64 0, i64 0
  call void @LineTo_i(ptr noundef %71)
  %72 = getelementptr inbounds [2 x double], ptr %10, i64 0, i64 0
  call void @LineTo_d(ptr noundef %72)
  store i32 1, ptr %5, align 4
  br label %74

73:                                               ; preds = %48
  store i32 0, ptr %5, align 4
  br label %74

74:                                               ; preds = %73, %61, %41, %25
  %75 = load i32, ptr %5, align 4
  ret i32 %75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Solve2(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca [2 x i32], align 4
  %10 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  call void @llvm.memset.p0.i64(ptr align 4 %9, i8 0, i64 8, i1 false)
  %11 = getelementptr inbounds [2 x i32], ptr %9, i64 0, i64 0
  %12 = load i32, ptr %5, align 4
  %13 = load ptr, ptr %7, align 8
  %14 = load i32, ptr %6, align 4
  %15 = load ptr, ptr %8, align 8
  %16 = call i32 @TwoCircles(ptr noundef %11, i32 noundef %12, ptr noundef %13, i32 noundef %14, ptr noundef %15)
  store i32 %16, ptr %10, align 4
  %17 = load i32, ptr %5, align 4
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %10, align 4
  %20 = load ptr, ptr %7, align 8
  %21 = getelementptr inbounds i32, ptr %20, i64 0
  %22 = load i32, ptr %21, align 4
  %23 = load ptr, ptr %7, align 8
  %24 = getelementptr inbounds i32, ptr %23, i64 1
  %25 = load i32, ptr %24, align 4
  %26 = load ptr, ptr %8, align 8
  %27 = getelementptr inbounds double, ptr %26, i64 0
  %28 = load double, ptr %27, align 8
  %29 = load ptr, ptr %8, align 8
  %30 = getelementptr inbounds double, ptr %29, i64 1
  %31 = load double, ptr %30, align 8
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %17, i32 noundef %18, i32 noundef %19, i32 noundef %22, i32 noundef %25, double noundef %28, double noundef %31)
  %33 = load i32, ptr %10, align 4
  %34 = icmp ne i32 %33, 0
  %35 = zext i1 %34 to i32
  ret i32 %35
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @LineTo_d(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds double, ptr %3, i64 0
  %5 = load double, ptr %4, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds double, ptr %6, i64 1
  %8 = load double, ptr %7, align 8
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, double noundef %5, double noundef %8)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @SubVec(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %8

8:                                                ; preds = %27, %3
  %9 = load i32, ptr %7, align 4
  %10 = icmp slt i32 %9, 2
  br i1 %10, label %11, label %30

11:                                               ; preds = %8
  %12 = load ptr, ptr %4, align 8
  %13 = load i32, ptr %7, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr %12, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = load ptr, ptr %5, align 8
  %18 = load i32, ptr %7, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, ptr %17, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = sub nsw i32 %16, %21
  %23 = load ptr, ptr %6, align 8
  %24 = load i32, ptr %7, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, ptr %23, i64 %25
  store i32 %22, ptr %26, align 4
  br label %27

27:                                               ; preds = %11
  %28 = load i32, ptr %7, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %7, align 4
  br label %8

30:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @TwoCircles(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3, ptr noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca [2 x i32], align 4
  %12 = alloca [2 x double], align 16
  %13 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  store ptr %4, ptr %10, align 8
  store i32 -1, ptr %13, align 4
  %14 = load ptr, ptr %8, align 8
  %15 = load ptr, ptr %6, align 8
  %16 = getelementptr inbounds [2 x i32], ptr %11, i64 0, i64 0
  call void @SubVec(ptr noundef %14, ptr noundef %15, ptr noundef %16)
  %17 = load i32, ptr %7, align 4
  %18 = getelementptr inbounds [2 x i32], ptr %11, i64 0, i64 0
  %19 = load i32, ptr %9, align 4
  %20 = getelementptr inbounds [2 x double], ptr %12, i64 0, i64 0
  %21 = call i32 @TwoCircles0a(i32 noundef %17, ptr noundef %18, i32 noundef %19, ptr noundef %20)
  store i32 %21, ptr %13, align 4
  %22 = getelementptr inbounds [2 x double], ptr %12, i64 0, i64 0
  %23 = load double, ptr %22, align 16
  %24 = load ptr, ptr %6, align 8
  %25 = getelementptr inbounds i32, ptr %24, i64 0
  %26 = load i32, ptr %25, align 4
  %27 = sitofp i32 %26 to double
  %28 = fadd double %23, %27
  %29 = load ptr, ptr %10, align 8
  %30 = getelementptr inbounds double, ptr %29, i64 0
  store double %28, ptr %30, align 8
  %31 = getelementptr inbounds [2 x double], ptr %12, i64 0, i64 1
  %32 = load double, ptr %31, align 8
  %33 = load ptr, ptr %6, align 8
  %34 = getelementptr inbounds i32, ptr %33, i64 1
  %35 = load i32, ptr %34, align 4
  %36 = sitofp i32 %35 to double
  %37 = fadd double %32, %36
  %38 = load ptr, ptr %10, align 8
  %39 = getelementptr inbounds double, ptr %38, i64 1
  store double %37, ptr %39, align 8
  %40 = load i32, ptr %13, align 4
  ret i32 %40
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @TwoCircles0a(i32 noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  store i32 %0, ptr %6, align 4
  store ptr %1, ptr %7, align 8
  store i32 %2, ptr %8, align 4
  store ptr %3, ptr %9, align 8
  %14 = load ptr, ptr %7, align 8
  %15 = call double @Length2(ptr noundef %14)
  store double %15, ptr %10, align 8
  %16 = load i32, ptr %6, align 4
  %17 = load i32, ptr %8, align 4
  %18 = add nsw i32 %16, %17
  %19 = load i32, ptr %6, align 4
  %20 = load i32, ptr %8, align 4
  %21 = add nsw i32 %19, %20
  %22 = mul nsw i32 %18, %21
  %23 = sitofp i32 %22 to double
  store double %23, ptr %11, align 8
  %24 = load i32, ptr %6, align 4
  %25 = load i32, ptr %8, align 4
  %26 = sub nsw i32 %24, %25
  %27 = load i32, ptr %6, align 4
  %28 = load i32, ptr %8, align 4
  %29 = sub nsw i32 %27, %28
  %30 = mul nsw i32 %26, %29
  %31 = sitofp i32 %30 to double
  store double %31, ptr %12, align 8
  %32 = load double, ptr %10, align 8
  %33 = load double, ptr %11, align 8
  %34 = fcmp ogt double %32, %33
  br i1 %34, label %39, label %35

35:                                               ; preds = %4
  %36 = load double, ptr %10, align 8
  %37 = load double, ptr %12, align 8
  %38 = fcmp olt double %36, %37
  br i1 %38, label %39, label %40

39:                                               ; preds = %35, %4
  store i32 0, ptr %5, align 4
  br label %112

40:                                               ; preds = %35
  %41 = load double, ptr %10, align 8
  %42 = load double, ptr %11, align 8
  %43 = fcmp oeq double %41, %42
  br i1 %43, label %44, label %68

44:                                               ; preds = %40
  %45 = load i32, ptr %6, align 4
  %46 = sitofp i32 %45 to double
  %47 = load i32, ptr %6, align 4
  %48 = load i32, ptr %8, align 4
  %49 = add nsw i32 %47, %48
  %50 = sitofp i32 %49 to double
  %51 = fdiv double %46, %50
  store double %51, ptr %13, align 8
  %52 = load double, ptr %13, align 8
  %53 = load ptr, ptr %7, align 8
  %54 = getelementptr inbounds i32, ptr %53, i64 0
  %55 = load i32, ptr %54, align 4
  %56 = sitofp i32 %55 to double
  %57 = fmul double %52, %56
  %58 = load ptr, ptr %9, align 8
  %59 = getelementptr inbounds double, ptr %58, i64 0
  store double %57, ptr %59, align 8
  %60 = load double, ptr %13, align 8
  %61 = load ptr, ptr %7, align 8
  %62 = getelementptr inbounds i32, ptr %61, i64 1
  %63 = load i32, ptr %62, align 4
  %64 = sitofp i32 %63 to double
  %65 = fmul double %60, %64
  %66 = load ptr, ptr %9, align 8
  %67 = getelementptr inbounds double, ptr %66, i64 1
  store double %65, ptr %67, align 8
  store i32 1, ptr %5, align 4
  br label %112

68:                                               ; preds = %40
  %69 = load double, ptr %10, align 8
  %70 = load double, ptr %12, align 8
  %71 = fcmp oeq double %69, %70
  br i1 %71, label %72, label %106

72:                                               ; preds = %68
  %73 = load double, ptr %12, align 8
  %74 = fcmp oeq double %73, 0.000000e+00
  br i1 %74, label %75, label %82

75:                                               ; preds = %72
  %76 = load i32, ptr %6, align 4
  %77 = sitofp i32 %76 to double
  %78 = load ptr, ptr %9, align 8
  %79 = getelementptr inbounds double, ptr %78, i64 0
  store double %77, ptr %79, align 8
  %80 = load ptr, ptr %9, align 8
  %81 = getelementptr inbounds double, ptr %80, i64 1
  store double 0.000000e+00, ptr %81, align 8
  store i32 3, ptr %5, align 4
  br label %112

82:                                               ; preds = %72
  %83 = load i32, ptr %6, align 4
  %84 = sitofp i32 %83 to double
  %85 = load i32, ptr %6, align 4
  %86 = load i32, ptr %8, align 4
  %87 = sub nsw i32 %85, %86
  %88 = sitofp i32 %87 to double
  %89 = fdiv double %84, %88
  store double %89, ptr %13, align 8
  %90 = load double, ptr %13, align 8
  %91 = load ptr, ptr %7, align 8
  %92 = getelementptr inbounds i32, ptr %91, i64 0
  %93 = load i32, ptr %92, align 4
  %94 = sitofp i32 %93 to double
  %95 = fmul double %90, %94
  %96 = load ptr, ptr %9, align 8
  %97 = getelementptr inbounds double, ptr %96, i64 0
  store double %95, ptr %97, align 8
  %98 = load double, ptr %13, align 8
  %99 = load ptr, ptr %7, align 8
  %100 = getelementptr inbounds i32, ptr %99, i64 1
  %101 = load i32, ptr %100, align 4
  %102 = sitofp i32 %101 to double
  %103 = fmul double %98, %102
  %104 = load ptr, ptr %9, align 8
  %105 = getelementptr inbounds double, ptr %104, i64 1
  store double %103, ptr %105, align 8
  store i32 1, ptr %5, align 4
  br label %112

106:                                              ; preds = %68
  %107 = load i32, ptr %6, align 4
  %108 = load ptr, ptr %7, align 8
  %109 = load i32, ptr %8, align 4
  %110 = load ptr, ptr %9, align 8
  %111 = call i32 @TwoCircles0b(i32 noundef %107, ptr noundef %108, i32 noundef %109, ptr noundef %110)
  store i32 %111, ptr %5, align 4
  br label %112

112:                                              ; preds = %106, %82, %75, %44, %39
  %113 = load i32, ptr %5, align 4
  ret i32 %113
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @Length2(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca double, align 8
  store ptr %0, ptr %2, align 8
  store double 0.000000e+00, ptr %4, align 8
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %23, %1
  %6 = load i32, ptr %3, align 4
  %7 = icmp slt i32 %6, 2
  br i1 %7, label %8, label %26

8:                                                ; preds = %5
  %9 = load ptr, ptr %2, align 8
  %10 = load i32, ptr %3, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i32, ptr %9, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = sitofp i32 %13 to double
  %15 = load ptr, ptr %2, align 8
  %16 = load i32, ptr %3, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, ptr %15, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = sitofp i32 %19 to double
  %21 = load double, ptr %4, align 8
  %22 = call double @llvm.fmuladd.f64(double %14, double %20, double %21)
  store double %22, ptr %4, align 8
  br label %23

23:                                               ; preds = %8
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %3, align 4
  br label %5

26:                                               ; preds = %5
  %27 = load double, ptr %4, align 8
  ret double %27
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @TwoCircles0b(i32 noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca double, align 8
  %10 = alloca [2 x double], align 16
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  store i32 %0, ptr %5, align 4
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store ptr %3, ptr %8, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = call double @Length2(ptr noundef %13)
  %15 = call double @sqrt(double noundef %14) #7
  store double %15, ptr %9, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = getelementptr inbounds i32, ptr %16, i64 0
  %18 = load i32, ptr %17, align 4
  %19 = sitofp i32 %18 to double
  %20 = load double, ptr %9, align 8
  %21 = fdiv double %19, %20
  store double %21, ptr %11, align 8
  %22 = load ptr, ptr %6, align 8
  %23 = getelementptr inbounds i32, ptr %22, i64 1
  %24 = load i32, ptr %23, align 4
  %25 = sitofp i32 %24 to double
  %26 = load double, ptr %9, align 8
  %27 = fdiv double %25, %26
  store double %27, ptr %12, align 8
  %28 = load i32, ptr %5, align 4
  %29 = load double, ptr %9, align 8
  %30 = load i32, ptr %7, align 4
  %31 = getelementptr inbounds [2 x double], ptr %10, i64 0, i64 0
  call void @TwoCircles00(i32 noundef %28, double noundef %29, i32 noundef %30, ptr noundef %31)
  %32 = load double, ptr %11, align 8
  %33 = getelementptr inbounds [2 x double], ptr %10, i64 0, i64 0
  %34 = load double, ptr %33, align 16
  %35 = load double, ptr %12, align 8
  %36 = fneg double %35
  %37 = getelementptr inbounds [2 x double], ptr %10, i64 0, i64 1
  %38 = load double, ptr %37, align 8
  %39 = fmul double %36, %38
  %40 = call double @llvm.fmuladd.f64(double %32, double %34, double %39)
  %41 = load ptr, ptr %8, align 8
  %42 = getelementptr inbounds double, ptr %41, i64 0
  store double %40, ptr %42, align 8
  %43 = load double, ptr %12, align 8
  %44 = getelementptr inbounds [2 x double], ptr %10, i64 0, i64 0
  %45 = load double, ptr %44, align 16
  %46 = load double, ptr %11, align 8
  %47 = getelementptr inbounds [2 x double], ptr %10, i64 0, i64 1
  %48 = load double, ptr %47, align 8
  %49 = fmul double %46, %48
  %50 = call double @llvm.fmuladd.f64(double %43, double %45, double %49)
  %51 = load ptr, ptr %8, align 8
  %52 = getelementptr inbounds double, ptr %51, i64 1
  store double %50, ptr %52, align 8
  ret i32 2
}

; Function Attrs: nounwind
declare double @sqrt(double noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @TwoCircles00(i32 noundef %0, double noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  store i32 %0, ptr %5, align 4
  store double %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store ptr %3, ptr %8, align 8
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %5, align 4
  %13 = mul nsw i32 %11, %12
  %14 = sitofp i32 %13 to double
  store double %14, ptr %9, align 8
  %15 = load i32, ptr %7, align 4
  %16 = load i32, ptr %7, align 4
  %17 = mul nsw i32 %15, %16
  %18 = sitofp i32 %17 to double
  store double %18, ptr %10, align 8
  %19 = load double, ptr %6, align 8
  %20 = load double, ptr %9, align 8
  %21 = load double, ptr %10, align 8
  %22 = fsub double %20, %21
  %23 = load double, ptr %6, align 8
  %24 = fdiv double %22, %23
  %25 = fadd double %19, %24
  %26 = fdiv double %25, 2.000000e+00
  %27 = load ptr, ptr %8, align 8
  %28 = getelementptr inbounds double, ptr %27, i64 0
  store double %26, ptr %28, align 8
  %29 = load double, ptr %9, align 8
  %30 = load ptr, ptr %8, align 8
  %31 = getelementptr inbounds double, ptr %30, i64 0
  %32 = load double, ptr %31, align 8
  %33 = load ptr, ptr %8, align 8
  %34 = getelementptr inbounds double, ptr %33, i64 0
  %35 = load double, ptr %34, align 8
  %36 = fneg double %32
  %37 = call double @llvm.fmuladd.f64(double %36, double %35, double %29)
  %38 = call double @sqrt(double noundef %37) #7
  %39 = load ptr, ptr %8, align 8
  %40 = getelementptr inbounds double, ptr %39, i64 1
  store double %38, ptr %40, align 8
  %41 = load ptr, ptr %8, align 8
  %42 = getelementptr inbounds double, ptr %41, i64 0
  %43 = load double, ptr %42, align 8
  %44 = load ptr, ptr %8, align 8
  %45 = getelementptr inbounds double, ptr %44, i64 1
  %46 = load double, ptr %45, align 8
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, double noundef %43, double noundef %46)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #4

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @PostscriptClose() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @PrintLinks() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %14, %0
  %4 = load i32, ptr %1, align 4
  %5 = load i32, ptr @nlinks, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %17

7:                                                ; preds = %3
  %8 = load i32, ptr %1, align 4
  %9 = load i32, ptr %1, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [20 x i32], ptr @linklen, i64 0, i64 %10
  %12 = load i32, ptr %11, align 4
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %8, i32 noundef %12)
  br label %14

14:                                               ; preds = %7
  %15 = load i32, ptr %1, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %1, align 4
  br label %3

17:                                               ; preds = %3
  %18 = call i32 @putchar(i32 noundef 10)
  ret void
}

declare i32 @putchar(i32 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @EqPointi(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %24, %2
  %8 = load i32, ptr %6, align 4
  %9 = icmp slt i32 %8, 2
  br i1 %9, label %10, label %27

10:                                               ; preds = %7
  %11 = load ptr, ptr %4, align 8
  %12 = load i32, ptr %6, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr %11, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = load ptr, ptr %5, align 8
  %17 = load i32, ptr %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, ptr %16, i64 %18
  %20 = load i32, ptr %19, align 4
  %21 = icmp ne i32 %15, %20
  br i1 %21, label %22, label %23

22:                                               ; preds = %10
  store i32 0, ptr %3, align 4
  br label %28

23:                                               ; preds = %10
  br label %24

24:                                               ; preds = %23
  %25 = load i32, ptr %6, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %6, align 4
  br label %7

27:                                               ; preds = %7
  store i32 1, ptr %3, align 4
  br label %28

28:                                               ; preds = %27, %22
  %29 = load i32, ptr %3, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @RadDeg(double noundef %0) #0 {
  %2 = alloca double, align 8
  store double %0, ptr %2, align 8
  %3 = load double, ptr %2, align 8
  %4 = fmul double 1.800000e+02, %3
  %5 = fdiv double %4, 0x400921FB54442D18
  ret double %5
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
