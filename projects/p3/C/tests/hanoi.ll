; ModuleID = 'hanoi.prof.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@SCCSid = dso_local global [41 x i8] c"@(#) @(#)hanoi.c:3.3 -- 5/15/91 19:30:20\00", align 16
@iter = dso_local global i64 0, align 8
@num = dso_local global [4 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [30 x i8] c"Usage: %s iterations [disks]\0A\00", align 1
@cnt = dso_local global i64 0, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @mov(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %10, label %21

10:                                               ; preds = %3
  %11 = load i32, ptr %5, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [4 x i32], ptr @num, i64 0, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %14, -1
  store i32 %15, ptr %13, align 4
  %16 = load i32, ptr %6, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [4 x i32], ptr @num, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %18, align 4
  br label %36

21:                                               ; preds = %3
  %22 = load i32, ptr %5, align 4
  %23 = load i32, ptr %6, align 4
  %24 = add nsw i32 %22, %23
  %25 = sub nsw i32 6, %24
  store i32 %25, ptr %7, align 4
  %26 = load i32, ptr %4, align 4
  %27 = sub nsw i32 %26, 1
  %28 = load i32, ptr %5, align 4
  %29 = load i32, ptr %7, align 4
  call void @mov(i32 noundef %27, i32 noundef %28, i32 noundef %29)
  %30 = load i32, ptr %5, align 4
  %31 = load i32, ptr %6, align 4
  call void @mov(i32 noundef 1, i32 noundef %30, i32 noundef %31)
  %32 = load i32, ptr %4, align 4
  %33 = sub nsw i32 %32, 1
  %34 = load i32, ptr %7, align 4
  %35 = load i32, ptr %6, align 4
  call void @mov(i32 noundef %33, i32 noundef %34, i32 noundef %35)
  br label %36

36:                                               ; preds = %21, %10
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 10, ptr %6, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %9, 2
  br i1 %10, label %11, label %16

11:                                               ; preds = %2
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds ptr, ptr %12, i64 0
  %14 = load ptr, ptr %13, align 8
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %14)
  call void @exit(i32 noundef 1) #4
  unreachable

16:                                               ; preds = %2
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds ptr, ptr %17, i64 1
  %19 = load ptr, ptr %18, align 8
  %20 = call i32 @atoi(ptr noundef %19) #5
  store i32 %20, ptr %7, align 4
  %21 = load i32, ptr %4, align 4
  %22 = icmp sgt i32 %21, 2
  br i1 %22, label %23, label %28

23:                                               ; preds = %16
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds ptr, ptr %24, i64 2
  %26 = load ptr, ptr %25, align 8
  %27 = call i32 @atoi(ptr noundef %26) #5
  store i32 %27, ptr %6, align 4
  br label %28

28:                                               ; preds = %23, %16
  %29 = load i32, ptr %6, align 4
  store i32 %29, ptr getelementptr inbounds ([4 x i32], ptr @num, i64 0, i64 1), align 4
  store i32 0, ptr %8, align 4
  br label %30

30:                                               ; preds = %38, %28
  %31 = load i32, ptr %8, align 4
  %32 = load i32, ptr %7, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %41

34:                                               ; preds = %30
  %35 = load i32, ptr %6, align 4
  call void @mov(i32 noundef %35, i32 noundef 1, i32 noundef 3)
  %36 = load i64, ptr @iter, align 8
  %37 = add i64 %36, 1
  store i64 %37, ptr @iter, align 8
  br label %38

38:                                               ; preds = %34
  %39 = load i32, ptr %8, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %8, align 4
  br label %30

41:                                               ; preds = %30
  call void @exit(i32 noundef 0) #4
  unreachable
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind willreturn memory(read) }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
