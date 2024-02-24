; ModuleID = 'bitcount.prof.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.anon = type { i64 }
%struct.bfile = type { ptr, i8, i8, i8, i8 }

@bits = internal global [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16
@bits.1 = internal global [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16
@main.pBitCntFunc = internal global [7 x ptr] [ptr @bit_count, ptr @bitcount, ptr @ntbl_bitcnt, ptr @ntbl_bitcount, ptr @BW_btbl_bitcount, ptr @AR_btbl_bitcount, ptr @bit_shifter], align 16
@main.text = internal global [7 x ptr] [ptr @.str, ptr @.str.1, ptr @.str.2, ptr @.str.3, ptr @.str.4, ptr @.str.5, ptr @.str.6], align 16
@.str = private unnamed_addr constant [29 x i8] c"Optimized 1 bit/loop counter\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"Ratko's mystery algorithm\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"Recursive bit count by nybbles\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"Non-recursive bit count by nybbles\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"Non-recursive bit count by bytes (BW)\00", align 1
@.str.5 = private unnamed_addr constant [38 x i8] c"Non-recursive bit count by bytes (AR)\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Shift and count bits\00", align 1
@stderr = external global ptr, align 8
@.str.7 = private unnamed_addr constant [29 x i8] c"Usage: bitcnts <iterations>\0A\00", align 1
@.str.8 = private unnamed_addr constant [33 x i8] c"Bit counter algorithm benchmark\0A\00", align 1
@.str.9 = private unnamed_addr constant [36 x i8] c"%-38s> Time: %7.3f sec.; Bits: %ld\0A\00", align 1
@.str.10 = private unnamed_addr constant [13 x i8] c"\0ABest  > %s\0A\00", align 1
@.str.11 = private unnamed_addr constant [12 x i8] c"Worst > %s\0A\00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c"01\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bit_count(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i64 %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  %4 = load i64, ptr %2, align 8
  %5 = icmp ne i64 %4, 0
  br i1 %5, label %6, label %17

6:                                                ; preds = %1
  br label %7

7:                                                ; preds = %10, %6
  %8 = load i32, ptr %3, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, ptr %3, align 4
  br label %10

10:                                               ; preds = %7
  %11 = load i64, ptr %2, align 8
  %12 = load i64, ptr %2, align 8
  %13 = sub nsw i64 %12, 1
  %14 = and i64 %11, %13
  store i64 %14, ptr %2, align 8
  %15 = icmp ne i64 0, %14
  br i1 %15, label %7, label %16

16:                                               ; preds = %10
  br label %17

17:                                               ; preds = %16, %1
  %18 = load i32, ptr %3, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bitcount(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, ptr %2, align 8
  %3 = load i64, ptr %2, align 8
  %4 = and i64 %3, 2863311530
  %5 = ashr i64 %4, 1
  %6 = load i64, ptr %2, align 8
  %7 = and i64 %6, 1431655765
  %8 = add nsw i64 %5, %7
  store i64 %8, ptr %2, align 8
  %9 = load i64, ptr %2, align 8
  %10 = and i64 %9, 3435973836
  %11 = ashr i64 %10, 2
  %12 = load i64, ptr %2, align 8
  %13 = and i64 %12, 858993459
  %14 = add nsw i64 %11, %13
  store i64 %14, ptr %2, align 8
  %15 = load i64, ptr %2, align 8
  %16 = and i64 %15, 4042322160
  %17 = ashr i64 %16, 4
  %18 = load i64, ptr %2, align 8
  %19 = and i64 %18, 252645135
  %20 = add nsw i64 %17, %19
  store i64 %20, ptr %2, align 8
  %21 = load i64, ptr %2, align 8
  %22 = and i64 %21, 4278255360
  %23 = ashr i64 %22, 8
  %24 = load i64, ptr %2, align 8
  %25 = and i64 %24, 16711935
  %26 = add nsw i64 %23, %25
  store i64 %26, ptr %2, align 8
  %27 = load i64, ptr %2, align 8
  %28 = and i64 %27, 4294901760
  %29 = ashr i64 %28, 16
  %30 = load i64, ptr %2, align 8
  %31 = and i64 %30, 65535
  %32 = add nsw i64 %29, %31
  store i64 %32, ptr %2, align 8
  %33 = load i64, ptr %2, align 8
  %34 = trunc i64 %33 to i32
  ret i32 %34
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ntbl_bitcount(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, ptr %2, align 8
  %3 = load i64, ptr %2, align 8
  %4 = and i64 %3, 15
  %5 = trunc i64 %4 to i32
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %6
  %8 = load i8, ptr %7, align 1
  %9 = sext i8 %8 to i32
  %10 = load i64, ptr %2, align 8
  %11 = and i64 %10, 240
  %12 = lshr i64 %11, 4
  %13 = trunc i64 %12 to i32
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %14
  %16 = load i8, ptr %15, align 1
  %17 = sext i8 %16 to i32
  %18 = add nsw i32 %9, %17
  %19 = load i64, ptr %2, align 8
  %20 = and i64 %19, 3840
  %21 = lshr i64 %20, 8
  %22 = trunc i64 %21 to i32
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %23
  %25 = load i8, ptr %24, align 1
  %26 = sext i8 %25 to i32
  %27 = add nsw i32 %18, %26
  %28 = load i64, ptr %2, align 8
  %29 = and i64 %28, 61440
  %30 = lshr i64 %29, 12
  %31 = trunc i64 %30 to i32
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %32
  %34 = load i8, ptr %33, align 1
  %35 = sext i8 %34 to i32
  %36 = add nsw i32 %27, %35
  %37 = load i64, ptr %2, align 8
  %38 = and i64 %37, 983040
  %39 = lshr i64 %38, 16
  %40 = trunc i64 %39 to i32
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %41
  %43 = load i8, ptr %42, align 1
  %44 = sext i8 %43 to i32
  %45 = add nsw i32 %36, %44
  %46 = load i64, ptr %2, align 8
  %47 = and i64 %46, 15728640
  %48 = lshr i64 %47, 20
  %49 = trunc i64 %48 to i32
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %50
  %52 = load i8, ptr %51, align 1
  %53 = sext i8 %52 to i32
  %54 = add nsw i32 %45, %53
  %55 = load i64, ptr %2, align 8
  %56 = and i64 %55, 251658240
  %57 = lshr i64 %56, 24
  %58 = trunc i64 %57 to i32
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %59
  %61 = load i8, ptr %60, align 1
  %62 = sext i8 %61 to i32
  %63 = add nsw i32 %54, %62
  %64 = load i64, ptr %2, align 8
  %65 = and i64 %64, 4026531840
  %66 = lshr i64 %65, 28
  %67 = trunc i64 %66 to i32
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %68
  %70 = load i8, ptr %69, align 1
  %71 = sext i8 %70 to i32
  %72 = add nsw i32 %63, %71
  ret i32 %72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @BW_btbl_bitcount(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca %union.anon, align 8
  store i64 %0, ptr %2, align 8
  %4 = load i64, ptr %2, align 8
  store i64 %4, ptr %3, align 8
  %5 = getelementptr inbounds [4 x i8], ptr %3, i64 0, i64 0
  %6 = load i8, ptr %5, align 8
  %7 = zext i8 %6 to i64
  %8 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %7
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i32
  %11 = getelementptr inbounds [4 x i8], ptr %3, i64 0, i64 1
  %12 = load i8, ptr %11, align 1
  %13 = zext i8 %12 to i64
  %14 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %13
  %15 = load i8, ptr %14, align 1
  %16 = sext i8 %15 to i32
  %17 = add nsw i32 %10, %16
  %18 = getelementptr inbounds [4 x i8], ptr %3, i64 0, i64 3
  %19 = load i8, ptr %18, align 1
  %20 = zext i8 %19 to i64
  %21 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %20
  %22 = load i8, ptr %21, align 1
  %23 = sext i8 %22 to i32
  %24 = add nsw i32 %17, %23
  %25 = getelementptr inbounds [4 x i8], ptr %3, i64 0, i64 2
  %26 = load i8, ptr %25, align 2
  %27 = zext i8 %26 to i64
  %28 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %27
  %29 = load i8, ptr %28, align 1
  %30 = sext i8 %29 to i32
  %31 = add nsw i32 %24, %30
  ret i32 %31
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @AR_btbl_bitcount(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store i64 %0, ptr %2, align 8
  store ptr %2, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds i8, ptr %5, i32 1
  store ptr %6, ptr %3, align 8
  %7 = load i8, ptr %5, align 1
  %8 = zext i8 %7 to i64
  %9 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %8
  %10 = load i8, ptr %9, align 1
  %11 = sext i8 %10 to i32
  store i32 %11, ptr %4, align 4
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds i8, ptr %12, i32 1
  store ptr %13, ptr %3, align 8
  %14 = load i8, ptr %12, align 1
  %15 = zext i8 %14 to i64
  %16 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %15
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i32
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %4, align 4
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds i8, ptr %21, i32 1
  store ptr %22, ptr %3, align 8
  %23 = load i8, ptr %21, align 1
  %24 = zext i8 %23 to i64
  %25 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %24
  %26 = load i8, ptr %25, align 1
  %27 = sext i8 %26 to i32
  %28 = load i32, ptr %4, align 4
  %29 = add nsw i32 %28, %27
  store i32 %29, ptr %4, align 4
  %30 = load ptr, ptr %3, align 8
  %31 = load i8, ptr %30, align 1
  %32 = zext i8 %31 to i64
  %33 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %32
  %34 = load i8, ptr %33, align 1
  %35 = sext i8 %34 to i32
  %36 = load i32, ptr %4, align 4
  %37 = add nsw i32 %36, %35
  store i32 %37, ptr %4, align 4
  %38 = load i32, ptr %4, align 4
  ret i32 %38
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ntbl_bitcnt(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i64 %0, ptr %2, align 8
  %4 = load i64, ptr %2, align 8
  %5 = and i64 %4, 15
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [256 x i8], ptr @bits.1, i64 0, i64 %7
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i32
  store i32 %10, ptr %3, align 4
  %11 = load i64, ptr %2, align 8
  %12 = ashr i64 %11, 4
  store i64 %12, ptr %2, align 8
  %13 = icmp ne i64 0, %12
  br i1 %13, label %14, label %19

14:                                               ; preds = %1
  %15 = load i64, ptr %2, align 8
  %16 = call i32 @ntbl_bitcnt(i64 noundef %15)
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %3, align 4
  br label %19

19:                                               ; preds = %14, %1
  %20 = load i32, ptr %3, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @btbl_bitcnt(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i64 %0, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %2, i64 0
  %5 = load i8, ptr %4, align 8
  %6 = sext i8 %5 to i32
  %7 = and i32 %6, 255
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [256 x i8], ptr @bits.1, i64 0, i64 %8
  %10 = load i8, ptr %9, align 1
  %11 = sext i8 %10 to i32
  store i32 %11, ptr %3, align 4
  %12 = load i64, ptr %2, align 8
  %13 = ashr i64 %12, 8
  store i64 %13, ptr %2, align 8
  %14 = icmp ne i64 0, %13
  br i1 %14, label %15, label %20

15:                                               ; preds = %1
  %16 = load i64, ptr %2, align 8
  %17 = call i32 @btbl_bitcnt(i64 noundef %16)
  %18 = load i32, ptr %3, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %3, align 4
  br label %20

20:                                               ; preds = %15, %1
  %21 = load i32, ptr %3, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store double 0x7FEFFFFFFFFFFFFF, ptr %9, align 8
  store double 0.000000e+00, ptr %10, align 8
  %18 = load i32, ptr %4, align 4
  %19 = icmp slt i32 %18, 2
  br i1 %19, label %20, label %23

20:                                               ; preds = %2
  %21 = load ptr, ptr @stderr, align 8
  %22 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %21, ptr noundef @.str.7)
  call void @exit(i32 noundef -1) #6
  unreachable

23:                                               ; preds = %2
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds ptr, ptr %24, i64 1
  %26 = load ptr, ptr %25, align 8
  %27 = call i32 @atoi(ptr noundef %26) #7
  store i32 %27, ptr %17, align 4
  %28 = call i32 @puts(ptr noundef @.str.8)
  store i32 0, ptr %11, align 4
  br label %29

29:                                               ; preds = %84, %23
  %30 = load i32, ptr %11, align 4
  %31 = icmp slt i32 %30, 7
  br i1 %31, label %32, label %87

32:                                               ; preds = %29
  %33 = call i64 @clock() #8
  store i64 %33, ptr %6, align 8
  store i64 0, ptr %15, align 8
  store i64 0, ptr %14, align 8
  %34 = call i32 @rand() #8
  %35 = sext i32 %34 to i64
  store i64 %35, ptr %16, align 8
  br label %36

36:                                               ; preds = %51, %32
  %37 = load i64, ptr %14, align 8
  %38 = load i32, ptr %17, align 4
  %39 = sext i32 %38 to i64
  %40 = icmp slt i64 %37, %39
  br i1 %40, label %41, label %56

41:                                               ; preds = %36
  %42 = load i32, ptr %11, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [7 x ptr], ptr @main.pBitCntFunc, i64 0, i64 %43
  %45 = load ptr, ptr %44, align 8
  %46 = load i64, ptr %16, align 8
  %47 = call i32 %45(i64 noundef %46)
  %48 = sext i32 %47 to i64
  %49 = load i64, ptr %15, align 8
  %50 = add nsw i64 %49, %48
  store i64 %50, ptr %15, align 8
  br label %51

51:                                               ; preds = %41
  %52 = load i64, ptr %14, align 8
  %53 = add nsw i64 %52, 1
  store i64 %53, ptr %14, align 8
  %54 = load i64, ptr %16, align 8
  %55 = add nsw i64 %54, 13
  store i64 %55, ptr %16, align 8
  br label %36

56:                                               ; preds = %36
  %57 = call i64 @clock() #8
  store i64 %57, ptr %7, align 8
  %58 = load i64, ptr %7, align 8
  %59 = load i64, ptr %6, align 8
  %60 = sub nsw i64 %58, %59
  %61 = sitofp i64 %60 to double
  %62 = fdiv double %61, 1.000000e+06
  store double %62, ptr %8, align 8
  %63 = load double, ptr %8, align 8
  %64 = load double, ptr %9, align 8
  %65 = fcmp olt double %63, %64
  br i1 %65, label %66, label %69

66:                                               ; preds = %56
  %67 = load double, ptr %8, align 8
  store double %67, ptr %9, align 8
  %68 = load i32, ptr %11, align 4
  store i32 %68, ptr %12, align 4
  br label %69

69:                                               ; preds = %66, %56
  %70 = load double, ptr %8, align 8
  %71 = load double, ptr %10, align 8
  %72 = fcmp ogt double %70, %71
  br i1 %72, label %73, label %76

73:                                               ; preds = %69
  %74 = load double, ptr %8, align 8
  store double %74, ptr %10, align 8
  %75 = load i32, ptr %11, align 4
  store i32 %75, ptr %13, align 4
  br label %76

76:                                               ; preds = %73, %69
  %77 = load i32, ptr %11, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [7 x ptr], ptr @main.text, i64 0, i64 %78
  %80 = load ptr, ptr %79, align 8
  %81 = load double, ptr %8, align 8
  %82 = load i64, ptr %15, align 8
  %83 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %80, double noundef %81, i64 noundef %82)
  br label %84

84:                                               ; preds = %76
  %85 = load i32, ptr %11, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr %11, align 4
  br label %29

87:                                               ; preds = %29
  %88 = load i32, ptr %12, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [7 x ptr], ptr @main.text, i64 0, i64 %89
  %91 = load ptr, ptr %90, align 8
  %92 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %91)
  %93 = load i32, ptr %13, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [7 x ptr], ptr @main.text, i64 0, i64 %94
  %96 = load ptr, ptr %95, align 8
  %97 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %96)
  ret i32 0
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #3

declare i32 @puts(ptr noundef) #1

; Function Attrs: nounwind
declare i64 @clock() #4

; Function Attrs: nounwind
declare i32 @rand() #4

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @bit_shifter(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i64 %0, ptr %2, align 8
  store i32 0, ptr %4, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %20, %1
  %6 = load i64, ptr %2, align 8
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %8, label %12

8:                                                ; preds = %5
  %9 = load i32, ptr %3, align 4
  %10 = sext i32 %9 to i64
  %11 = icmp ult i64 %10, 64
  br label %12

12:                                               ; preds = %8, %5
  %13 = phi i1 [ false, %5 ], [ %11, %8 ]
  br i1 %13, label %14, label %25

14:                                               ; preds = %12
  %15 = load i64, ptr %2, align 8
  %16 = and i64 %15, 1
  %17 = trunc i64 %16 to i32
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %4, align 4
  br label %20

20:                                               ; preds = %14
  %21 = load i32, ptr %3, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %3, align 4
  %23 = load i64, ptr %2, align 8
  %24 = ashr i64 %23, 1
  store i64 %24, ptr %2, align 8
  br label %5

25:                                               ; preds = %12
  %26 = load i32, ptr %4, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @bfopen(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = call noalias ptr @malloc(i64 noundef 16) #9
  store ptr %7, ptr %6, align 8
  %8 = load ptr, ptr %6, align 8
  %9 = icmp eq ptr null, %8
  br i1 %9, label %10, label %11

10:                                               ; preds = %2
  store ptr null, ptr %3, align 8
  br label %29

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = call noalias ptr @fopen(ptr noundef %12, ptr noundef %13)
  %15 = load ptr, ptr %6, align 8
  %16 = getelementptr inbounds %struct.bfile, ptr %15, i32 0, i32 0
  store ptr %14, ptr %16, align 8
  %17 = load ptr, ptr %6, align 8
  %18 = getelementptr inbounds %struct.bfile, ptr %17, i32 0, i32 0
  %19 = load ptr, ptr %18, align 8
  %20 = icmp eq ptr null, %19
  br i1 %20, label %21, label %23

21:                                               ; preds = %11
  %22 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %22) #8
  store ptr null, ptr %3, align 8
  br label %29

23:                                               ; preds = %11
  %24 = load ptr, ptr %6, align 8
  %25 = getelementptr inbounds %struct.bfile, ptr %24, i32 0, i32 2
  store i8 0, ptr %25, align 1
  %26 = load ptr, ptr %6, align 8
  %27 = getelementptr inbounds %struct.bfile, ptr %26, i32 0, i32 4
  store i8 0, ptr %27, align 1
  %28 = load ptr, ptr %6, align 8
  store ptr %28, ptr %3, align 8
  br label %29

29:                                               ; preds = %23, %21, %10
  %30 = load ptr, ptr %3, align 8
  ret ptr %30
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #5

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bfread(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.bfile, ptr %3, i32 0, i32 2
  %5 = load i8, ptr %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp eq i32 0, %6
  br i1 %7, label %8, label %18

8:                                                ; preds = %1
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.bfile, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = call i32 @fgetc(ptr noundef %11)
  %13 = trunc i32 %12 to i8
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.bfile, ptr %14, i32 0, i32 1
  store i8 %13, ptr %15, align 8
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.bfile, ptr %16, i32 0, i32 2
  store i8 8, ptr %17, align 1
  br label %18

18:                                               ; preds = %8, %1
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.bfile, ptr %19, i32 0, i32 2
  %21 = load i8, ptr %20, align 1
  %22 = add i8 %21, -1
  store i8 %22, ptr %20, align 1
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds %struct.bfile, ptr %23, i32 0, i32 1
  %25 = load i8, ptr %24, align 8
  %26 = sext i8 %25 to i32
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds %struct.bfile, ptr %27, i32 0, i32 2
  %29 = load i8, ptr %28, align 1
  %30 = sext i8 %29 to i32
  %31 = shl i32 1, %30
  %32 = and i32 %26, %31
  %33 = icmp ne i32 %32, 0
  %34 = zext i1 %33 to i32
  ret i32 %34
}

declare i32 @fgetc(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @bfwrite(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %struct.bfile, ptr %5, i32 0, i32 4
  %7 = load i8, ptr %6, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp eq i32 8, %8
  br i1 %9, label %10, label %21

10:                                               ; preds = %2
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %struct.bfile, ptr %11, i32 0, i32 3
  %13 = load i8, ptr %12, align 2
  %14 = sext i8 %13 to i32
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.bfile, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 @fputc(i32 noundef %14, ptr noundef %17)
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.bfile, ptr %19, i32 0, i32 4
  store i8 0, ptr %20, align 1
  br label %21

21:                                               ; preds = %10, %2
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds %struct.bfile, ptr %22, i32 0, i32 4
  %24 = load i8, ptr %23, align 1
  %25 = add i8 %24, 1
  store i8 %25, ptr %23, align 1
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.bfile, ptr %26, i32 0, i32 3
  %28 = load i8, ptr %27, align 2
  %29 = sext i8 %28 to i32
  %30 = shl i32 %29, 1
  %31 = trunc i32 %30 to i8
  store i8 %31, ptr %27, align 2
  %32 = load i32, ptr %3, align 4
  %33 = and i32 %32, 1
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds %struct.bfile, ptr %34, i32 0, i32 3
  %36 = load i8, ptr %35, align 2
  %37 = sext i8 %36 to i32
  %38 = or i32 %37, %33
  %39 = trunc i32 %38 to i8
  store i8 %39, ptr %35, align 2
  ret void
}

declare i32 @fputc(i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @bfclose(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.bfile, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = call i32 @fclose(ptr noundef %5)
  %7 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %7) #8
  ret void
}

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @bitstring(ptr noundef %0, i64 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %11 = load i32, ptr %8, align 4
  %12 = load i32, ptr %7, align 4
  %13 = load i32, ptr %7, align 4
  %14 = ashr i32 %13, 2
  %15 = add nsw i32 %12, %14
  %16 = load i32, ptr %7, align 4
  %17 = srem i32 %16, 4
  %18 = icmp ne i32 %17, 0
  %19 = zext i1 %18 to i64
  %20 = select i1 %18, i32 0, i32 1
  %21 = sub nsw i32 %15, %20
  %22 = sub nsw i32 %11, %21
  store i32 %22, ptr %10, align 4
  store i32 0, ptr %9, align 4
  br label %23

23:                                               ; preds = %30, %4
  %24 = load i32, ptr %9, align 4
  %25 = load i32, ptr %10, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %33

27:                                               ; preds = %23
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds i8, ptr %28, i32 1
  store ptr %29, ptr %5, align 8
  store i8 32, ptr %28, align 1
  br label %30

30:                                               ; preds = %27
  %31 = load i32, ptr %9, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %9, align 4
  br label %23

33:                                               ; preds = %23
  br label %34

34:                                               ; preds = %57, %33
  %35 = load i32, ptr %7, align 4
  %36 = add nsw i32 %35, -1
  store i32 %36, ptr %7, align 4
  %37 = icmp sge i32 %36, 0
  br i1 %37, label %38, label %58

38:                                               ; preds = %34
  %39 = load i64, ptr %6, align 8
  %40 = load i32, ptr %7, align 4
  %41 = zext i32 %40 to i64
  %42 = ashr i64 %39, %41
  %43 = and i64 %42, 1
  %44 = add nsw i64 %43, 48
  %45 = trunc i64 %44 to i8
  %46 = load ptr, ptr %5, align 8
  %47 = getelementptr inbounds i8, ptr %46, i32 1
  store ptr %47, ptr %5, align 8
  store i8 %45, ptr %46, align 1
  %48 = load i32, ptr %7, align 4
  %49 = srem i32 %48, 4
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %57, label %51

51:                                               ; preds = %38
  %52 = load i32, ptr %7, align 4
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %57

54:                                               ; preds = %51
  %55 = load ptr, ptr %5, align 8
  %56 = getelementptr inbounds i8, ptr %55, i32 1
  store ptr %56, ptr %5, align 8
  store i8 32, ptr %55, align 1
  br label %57

57:                                               ; preds = %54, %51, %38
  br label %34

58:                                               ; preds = %34
  %59 = load ptr, ptr %5, align 8
  store i8 0, ptr %59, align 1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bstr_i(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %21, %1
  %6 = load ptr, ptr %2, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %19

8:                                                ; preds = %5
  %9 = load ptr, ptr %2, align 8
  %10 = load i8, ptr %9, align 1
  %11 = sext i8 %10 to i32
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %19

13:                                               ; preds = %8
  %14 = load ptr, ptr %2, align 8
  %15 = load i8, ptr %14, align 1
  %16 = sext i8 %15 to i32
  %17 = call ptr @strchr(ptr noundef @.str.12, i32 noundef %16) #7
  %18 = icmp ne ptr %17, null
  br label %19

19:                                               ; preds = %13, %8, %5
  %20 = phi i1 [ false, %8 ], [ false, %5 ], [ %18, %13 ]
  br i1 %20, label %21, label %33

21:                                               ; preds = %19
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds i8, ptr %22, i32 1
  store ptr %23, ptr %2, align 8
  %24 = load i8, ptr %22, align 1
  %25 = sext i8 %24 to i32
  %26 = sub nsw i32 %25, 48
  store i32 %26, ptr %3, align 4
  %27 = load i32, ptr %4, align 4
  %28 = shl i32 %27, 1
  store i32 %28, ptr %4, align 4
  %29 = load i32, ptr %3, align 4
  %30 = and i32 %29, 1
  %31 = load i32, ptr %4, align 4
  %32 = or i32 %31, %30
  store i32 %32, ptr %4, align 4
  br label %5

33:                                               ; preds = %19
  %34 = load i32, ptr %4, align 4
  ret i32 %34
}

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strchr(ptr noundef, i32 noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind willreturn memory(read) }
attributes #8 = { nounwind }
attributes #9 = { nounwind allocsize(0) }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
