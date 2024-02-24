; ModuleID = 'dijkstra.prof.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._NODE = type { i32, i32 }
%struct._QITEM = type { i32, i32, i32, ptr }

@qHead = dso_local global ptr null, align 8
@g_qCount = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@stdout = external global ptr, align 8
@stderr = external global ptr, align 8
@.str.1 = private unnamed_addr constant [16 x i8] c"Out of memory.\0A\00", align 1
@ch = dso_local global i32 0, align 4
@rgnNodes = dso_local global [100 x %struct._NODE] zeroinitializer, align 16
@.str.2 = private unnamed_addr constant [54 x i8] c"Shortest path is 0 in cost. Just stay where you are.\0A\00", align 1
@iNode = dso_local global i32 0, align 4
@iDist = dso_local global i32 0, align 4
@iPrev = dso_local global i32 0, align 4
@i = dso_local global i32 0, align 4
@AdjMatrix = dso_local global [100 x [100 x i32]] zeroinitializer, align 16
@iCost = dso_local global i32 0, align 4
@.str.3 = private unnamed_addr constant [30 x i8] c"Shortest path is %d in cost. \00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"Path is: \00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [28 x i8] c"Usage: dijkstra <filename>\0A\00", align 1
@.str.7 = private unnamed_addr constant [41 x i8] c"Only supports matrix size is #define'd.\0A\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_path(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = load i32, ptr %4, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds %struct._NODE, ptr %5, i64 %7
  %9 = getelementptr inbounds %struct._NODE, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = icmp ne i32 %10, 9999
  br i1 %11, label %12, label %20

12:                                               ; preds = %2
  %13 = load ptr, ptr %3, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = load i32, ptr %4, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds %struct._NODE, ptr %14, i64 %16
  %18 = getelementptr inbounds %struct._NODE, ptr %17, i32 0, i32 1
  %19 = load i32, ptr %18, align 4
  call void @print_path(ptr noundef %13, i32 noundef %19)
  br label %20

20:                                               ; preds = %12, %2
  %21 = load i32, ptr %4, align 4
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %21)
  %23 = load ptr, ptr @stdout, align 8
  %24 = call i32 @fflush(ptr noundef %23)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @fflush(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @enqueue0(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %9 = call noalias ptr @malloc(i64 noundef 24) #5
  store ptr %9, ptr %7, align 8
  %10 = load ptr, ptr @qHead, align 8
  store ptr %10, ptr %8, align 8
  %11 = load ptr, ptr %7, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %16, label %13

13:                                               ; preds = %3
  %14 = load ptr, ptr @stderr, align 8
  %15 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %14, ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #6
  unreachable

16:                                               ; preds = %3
  %17 = load i32, ptr %4, align 4
  %18 = load ptr, ptr %7, align 8
  %19 = getelementptr inbounds %struct._QITEM, ptr %18, i32 0, i32 0
  store i32 %17, ptr %19, align 8
  %20 = load i32, ptr %5, align 4
  %21 = load ptr, ptr %7, align 8
  %22 = getelementptr inbounds %struct._QITEM, ptr %21, i32 0, i32 1
  store i32 %20, ptr %22, align 4
  %23 = load i32, ptr %6, align 4
  %24 = load ptr, ptr %7, align 8
  %25 = getelementptr inbounds %struct._QITEM, ptr %24, i32 0, i32 2
  store i32 %23, ptr %25, align 8
  %26 = load ptr, ptr %7, align 8
  %27 = getelementptr inbounds %struct._QITEM, ptr %26, i32 0, i32 3
  store ptr null, ptr %27, align 8
  %28 = load ptr, ptr %8, align 8
  %29 = icmp ne ptr %28, null
  br i1 %29, label %32, label %30

30:                                               ; preds = %16
  %31 = load ptr, ptr %7, align 8
  store ptr %31, ptr @qHead, align 8
  br label %46

32:                                               ; preds = %16
  br label %33

33:                                               ; preds = %38, %32
  %34 = load ptr, ptr %8, align 8
  %35 = getelementptr inbounds %struct._QITEM, ptr %34, i32 0, i32 3
  %36 = load ptr, ptr %35, align 8
  %37 = icmp ne ptr %36, null
  br i1 %37, label %38, label %42

38:                                               ; preds = %33
  %39 = load ptr, ptr %8, align 8
  %40 = getelementptr inbounds %struct._QITEM, ptr %39, i32 0, i32 3
  %41 = load ptr, ptr %40, align 8
  store ptr %41, ptr %8, align 8
  br label %33

42:                                               ; preds = %33
  %43 = load ptr, ptr %7, align 8
  %44 = load ptr, ptr %8, align 8
  %45 = getelementptr inbounds %struct._QITEM, ptr %44, i32 0, i32 3
  store ptr %43, ptr %45, align 8
  br label %46

46:                                               ; preds = %42, %30
  %47 = load i32, ptr @g_qCount, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr @g_qCount, align 4
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @dequeue0(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr @qHead, align 8
  store ptr %8, ptr %7, align 8
  %9 = load ptr, ptr @qHead, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %30

11:                                               ; preds = %3
  %12 = load ptr, ptr @qHead, align 8
  %13 = getelementptr inbounds %struct._QITEM, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %13, align 8
  %15 = load ptr, ptr %4, align 8
  store i32 %14, ptr %15, align 4
  %16 = load ptr, ptr @qHead, align 8
  %17 = getelementptr inbounds %struct._QITEM, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = load ptr, ptr %5, align 8
  store i32 %18, ptr %19, align 4
  %20 = load ptr, ptr @qHead, align 8
  %21 = getelementptr inbounds %struct._QITEM, ptr %20, i32 0, i32 2
  %22 = load i32, ptr %21, align 8
  %23 = load ptr, ptr %6, align 8
  store i32 %22, ptr %23, align 4
  %24 = load ptr, ptr @qHead, align 8
  %25 = getelementptr inbounds %struct._QITEM, ptr %24, i32 0, i32 3
  %26 = load ptr, ptr %25, align 8
  store ptr %26, ptr @qHead, align 8
  %27 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %27) #7
  %28 = load i32, ptr @g_qCount, align 4
  %29 = add nsw i32 %28, -1
  store i32 %29, ptr @g_qCount, align 4
  br label %30

30:                                               ; preds = %11, %3
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @qcount() #0 {
  %1 = load i32, ptr @g_qCount, align 4
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dijkstra(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr @ch, align 4
  br label %5

5:                                                ; preds = %17, %2
  %6 = load i32, ptr @ch, align 4
  %7 = icmp slt i32 %6, 100
  br i1 %7, label %8, label %20

8:                                                ; preds = %5
  %9 = load i32, ptr @ch, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [100 x %struct._NODE], ptr @rgnNodes, i64 0, i64 %10
  %12 = getelementptr inbounds %struct._NODE, ptr %11, i32 0, i32 0
  store i32 9999, ptr %12, align 8
  %13 = load i32, ptr @ch, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [100 x %struct._NODE], ptr @rgnNodes, i64 0, i64 %14
  %16 = getelementptr inbounds %struct._NODE, ptr %15, i32 0, i32 1
  store i32 9999, ptr %16, align 4
  br label %17

17:                                               ; preds = %8
  %18 = load i32, ptr @ch, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr @ch, align 4
  br label %5

20:                                               ; preds = %5
  %21 = load i32, ptr %3, align 4
  %22 = load i32, ptr %4, align 4
  %23 = icmp eq i32 %21, %22
  br i1 %23, label %24, label %26

24:                                               ; preds = %20
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %103

26:                                               ; preds = %20
  %27 = load i32, ptr %3, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [100 x %struct._NODE], ptr @rgnNodes, i64 0, i64 %28
  %30 = getelementptr inbounds %struct._NODE, ptr %29, i32 0, i32 0
  store i32 0, ptr %30, align 8
  %31 = load i32, ptr %3, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [100 x %struct._NODE], ptr @rgnNodes, i64 0, i64 %32
  %34 = getelementptr inbounds %struct._NODE, ptr %33, i32 0, i32 1
  store i32 9999, ptr %34, align 4
  %35 = load i32, ptr %3, align 4
  call void @enqueue0(i32 noundef %35, i32 noundef 0, i32 noundef 9999)
  br label %36

36:                                               ; preds = %92, %26
  %37 = call i32 @qcount()
  %38 = icmp sgt i32 %37, 0
  br i1 %38, label %39, label %93

39:                                               ; preds = %36
  call void @dequeue0(ptr noundef @iNode, ptr noundef @iDist, ptr noundef @iPrev)
  store i32 0, ptr @i, align 4
  br label %40

40:                                               ; preds = %89, %39
  %41 = load i32, ptr @i, align 4
  %42 = icmp slt i32 %41, 100
  br i1 %42, label %43, label %92

43:                                               ; preds = %40
  %44 = load i32, ptr @iNode, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [100 x [100 x i32]], ptr @AdjMatrix, i64 0, i64 %45
  %47 = load i32, ptr @i, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [100 x i32], ptr %46, i64 0, i64 %48
  %50 = load i32, ptr %49, align 4
  store i32 %50, ptr @iCost, align 4
  %51 = icmp ne i32 %50, 9999
  br i1 %51, label %52, label %88

52:                                               ; preds = %43
  %53 = load i32, ptr @i, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [100 x %struct._NODE], ptr @rgnNodes, i64 0, i64 %54
  %56 = getelementptr inbounds %struct._NODE, ptr %55, i32 0, i32 0
  %57 = load i32, ptr %56, align 8
  %58 = icmp eq i32 9999, %57
  br i1 %58, label %69, label %59

59:                                               ; preds = %52
  %60 = load i32, ptr @i, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [100 x %struct._NODE], ptr @rgnNodes, i64 0, i64 %61
  %63 = getelementptr inbounds %struct._NODE, ptr %62, i32 0, i32 0
  %64 = load i32, ptr %63, align 8
  %65 = load i32, ptr @iCost, align 4
  %66 = load i32, ptr @iDist, align 4
  %67 = add nsw i32 %65, %66
  %68 = icmp sgt i32 %64, %67
  br i1 %68, label %69, label %87

69:                                               ; preds = %59, %52
  %70 = load i32, ptr @iDist, align 4
  %71 = load i32, ptr @iCost, align 4
  %72 = add nsw i32 %70, %71
  %73 = load i32, ptr @i, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [100 x %struct._NODE], ptr @rgnNodes, i64 0, i64 %74
  %76 = getelementptr inbounds %struct._NODE, ptr %75, i32 0, i32 0
  store i32 %72, ptr %76, align 8
  %77 = load i32, ptr @iNode, align 4
  %78 = load i32, ptr @i, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [100 x %struct._NODE], ptr @rgnNodes, i64 0, i64 %79
  %81 = getelementptr inbounds %struct._NODE, ptr %80, i32 0, i32 1
  store i32 %77, ptr %81, align 4
  %82 = load i32, ptr @i, align 4
  %83 = load i32, ptr @iDist, align 4
  %84 = load i32, ptr @iCost, align 4
  %85 = add nsw i32 %83, %84
  %86 = load i32, ptr @iNode, align 4
  call void @enqueue0(i32 noundef %82, i32 noundef %85, i32 noundef %86)
  br label %87

87:                                               ; preds = %69, %59
  br label %88

88:                                               ; preds = %87, %43
  br label %89

89:                                               ; preds = %88
  %90 = load i32, ptr @i, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, ptr @i, align 4
  br label %40

92:                                               ; preds = %40
  br label %36

93:                                               ; preds = %36
  %94 = load i32, ptr %4, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [100 x %struct._NODE], ptr @rgnNodes, i64 0, i64 %95
  %97 = getelementptr inbounds %struct._NODE, ptr %96, i32 0, i32 0
  %98 = load i32, ptr %97, align 8
  %99 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %98)
  %100 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %101 = load i32, ptr %4, align 4
  call void @print_path(ptr noundef @rgnNodes, i32 noundef %101)
  %102 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %103

103:                                              ; preds = %93, %24
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %10 = load i32, ptr %4, align 4
  %11 = icmp slt i32 %10, 2
  br i1 %11, label %12, label %17

12:                                               ; preds = %2
  %13 = load ptr, ptr @stderr, align 8
  %14 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %13, ptr noundef @.str.6)
  %15 = load ptr, ptr @stderr, align 8
  %16 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %15, ptr noundef @.str.7)
  br label %17

17:                                               ; preds = %12, %2
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds ptr, ptr %18, i64 1
  %20 = load ptr, ptr %19, align 8
  %21 = call noalias ptr @fopen(ptr noundef %20, ptr noundef @.str.8)
  store ptr %21, ptr %9, align 8
  store i32 0, ptr %6, align 4
  br label %22

22:                                               ; preds = %43, %17
  %23 = load i32, ptr %6, align 4
  %24 = icmp slt i32 %23, 100
  br i1 %24, label %25, label %46

25:                                               ; preds = %22
  store i32 0, ptr %7, align 4
  br label %26

26:                                               ; preds = %39, %25
  %27 = load i32, ptr %7, align 4
  %28 = icmp slt i32 %27, 100
  br i1 %28, label %29, label %42

29:                                               ; preds = %26
  %30 = load ptr, ptr %9, align 8
  %31 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %30, ptr noundef @.str.9, ptr noundef %8)
  %32 = load i32, ptr %8, align 4
  %33 = load i32, ptr %6, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [100 x [100 x i32]], ptr @AdjMatrix, i64 0, i64 %34
  %36 = load i32, ptr %7, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [100 x i32], ptr %35, i64 0, i64 %37
  store i32 %32, ptr %38, align 4
  br label %39

39:                                               ; preds = %29
  %40 = load i32, ptr %7, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %7, align 4
  br label %26

42:                                               ; preds = %26
  br label %43

43:                                               ; preds = %42
  %44 = load i32, ptr %6, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %6, align 4
  br label %22

46:                                               ; preds = %22
  store i32 0, ptr %6, align 4
  store i32 50, ptr %7, align 4
  br label %47

47:                                               ; preds = %56, %46
  %48 = load i32, ptr %6, align 4
  %49 = icmp slt i32 %48, 100
  br i1 %49, label %50, label %61

50:                                               ; preds = %47
  %51 = load i32, ptr %7, align 4
  %52 = srem i32 %51, 100
  store i32 %52, ptr %7, align 4
  %53 = load i32, ptr %6, align 4
  %54 = load i32, ptr %7, align 4
  %55 = call i32 @dijkstra(i32 noundef %53, i32 noundef %54)
  br label %56

56:                                               ; preds = %50
  %57 = load i32, ptr %6, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %6, align 4
  %59 = load i32, ptr %7, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %7, align 4
  br label %47

61:                                               ; preds = %47
  call void @exit(i32 noundef 0) #6
  unreachable
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
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
