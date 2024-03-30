; ModuleID = 'qsort.prof.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.my3DVertexStruct = type { i32, i32, i32, double }

@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [27 x i8] c"Usage: qsort_large <file>\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [57 x i8] c"\0ASorting %d vectors based on distance from the origin.\0A\0A\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @compare(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.my3DVertexStruct, ptr %7, i32 0, i32 3
  %9 = load double, ptr %8, align 8
  store double %9, ptr %5, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.my3DVertexStruct, ptr %10, i32 0, i32 3
  %12 = load double, ptr %11, align 8
  store double %12, ptr %6, align 8
  %13 = load double, ptr %5, align 8
  %14 = load double, ptr %6, align 8
  %15 = fcmp ogt double %13, %14
  br i1 %15, label %16, label %17

16:                                               ; preds = %2
  br label %23

17:                                               ; preds = %2
  %18 = load double, ptr %5, align 8
  %19 = load double, ptr %6, align 8
  %20 = fcmp oeq double %18, %19
  %21 = zext i1 %20 to i64
  %22 = select i1 %20, i32 0, i32 -1
  br label %23

23:                                               ; preds = %17, %16
  %24 = phi i32 [ 1, %16 ], [ %22, %17 ]
  ret i32 %24
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca [60000 x %struct.my3DVertexStruct], align 16
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 0, ptr %9, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp slt i32 %13, 2
  br i1 %14, label %15, label %18

15:                                               ; preds = %2
  %16 = load ptr, ptr @stderr, align 8
  %17 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %16, ptr noundef @.str)
  call void @exit(i32 noundef -1) #4
  unreachable

18:                                               ; preds = %2
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds ptr, ptr %19, i64 1
  %21 = load ptr, ptr %20, align 8
  %22 = call noalias ptr @fopen(ptr noundef %21, ptr noundef @.str.1)
  store ptr %22, ptr %7, align 8
  br label %23

23:                                               ; preds = %40, %18
  %24 = load ptr, ptr %7, align 8
  %25 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %24, ptr noundef @.str.2, ptr noundef %10)
  %26 = icmp eq i32 %25, 1
  br i1 %26, label %27, label %38

27:                                               ; preds = %23
  %28 = load ptr, ptr %7, align 8
  %29 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %28, ptr noundef @.str.2, ptr noundef %11)
  %30 = icmp eq i32 %29, 1
  br i1 %30, label %31, label %38

31:                                               ; preds = %27
  %32 = load ptr, ptr %7, align 8
  %33 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %32, ptr noundef @.str.2, ptr noundef %12)
  %34 = icmp eq i32 %33, 1
  br i1 %34, label %35, label %38

35:                                               ; preds = %31
  %36 = load i32, ptr %9, align 4
  %37 = icmp slt i32 %36, 60000
  br label %38

38:                                               ; preds = %35, %31, %27, %23
  %39 = phi i1 [ false, %31 ], [ false, %27 ], [ false, %23 ], [ %37, %35 ]
  br i1 %39, label %40, label %74

40:                                               ; preds = %38
  %41 = load i32, ptr %10, align 4
  %42 = load i32, ptr %9, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %6, i64 0, i64 %43
  %45 = getelementptr inbounds %struct.my3DVertexStruct, ptr %44, i32 0, i32 0
  store i32 %41, ptr %45, align 8
  %46 = load i32, ptr %11, align 4
  %47 = load i32, ptr %9, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %6, i64 0, i64 %48
  %50 = getelementptr inbounds %struct.my3DVertexStruct, ptr %49, i32 0, i32 1
  store i32 %46, ptr %50, align 4
  %51 = load i32, ptr %12, align 4
  %52 = load i32, ptr %9, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %6, i64 0, i64 %53
  %55 = getelementptr inbounds %struct.my3DVertexStruct, ptr %54, i32 0, i32 2
  store i32 %51, ptr %55, align 8
  %56 = load i32, ptr %10, align 4
  %57 = sitofp i32 %56 to double
  %58 = call double @pow(double noundef %57, double noundef 2.000000e+00) #5
  %59 = load i32, ptr %11, align 4
  %60 = sitofp i32 %59 to double
  %61 = call double @pow(double noundef %60, double noundef 2.000000e+00) #5
  %62 = fadd double %58, %61
  %63 = load i32, ptr %12, align 4
  %64 = sitofp i32 %63 to double
  %65 = call double @pow(double noundef %64, double noundef 2.000000e+00) #5
  %66 = fadd double %62, %65
  %67 = call double @sqrt(double noundef %66) #5
  %68 = load i32, ptr %9, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %6, i64 0, i64 %69
  %71 = getelementptr inbounds %struct.my3DVertexStruct, ptr %70, i32 0, i32 3
  store double %67, ptr %71, align 8
  %72 = load i32, ptr %9, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, ptr %9, align 4
  br label %23

74:                                               ; preds = %38
  br label %75

75:                                               ; preds = %74
  %76 = load i32, ptr %9, align 4
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %76)
  %78 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %6, i64 0, i64 0
  %79 = load i32, ptr %9, align 4
  %80 = sext i32 %79 to i64
  call void @qsort(ptr noundef %78, i64 noundef %80, i64 noundef 24, ptr noundef @compare)
  store i32 0, ptr %8, align 4
  br label %81

81:                                               ; preds = %102, %75
  %82 = load i32, ptr %8, align 4
  %83 = load i32, ptr %9, align 4
  %84 = icmp slt i32 %82, %83
  br i1 %84, label %85, label %105

85:                                               ; preds = %81
  %86 = load i32, ptr %8, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %6, i64 0, i64 %87
  %89 = getelementptr inbounds %struct.my3DVertexStruct, ptr %88, i32 0, i32 0
  %90 = load i32, ptr %89, align 8
  %91 = load i32, ptr %8, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %6, i64 0, i64 %92
  %94 = getelementptr inbounds %struct.my3DVertexStruct, ptr %93, i32 0, i32 1
  %95 = load i32, ptr %94, align 4
  %96 = load i32, ptr %8, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %6, i64 0, i64 %97
  %99 = getelementptr inbounds %struct.my3DVertexStruct, ptr %98, i32 0, i32 2
  %100 = load i32, ptr %99, align 8
  %101 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %90, i32 noundef %95, i32 noundef %100)
  br label %102

102:                                              ; preds = %85
  %103 = load i32, ptr %8, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, ptr %8, align 4
  br label %81

105:                                              ; preds = %81
  ret i32 0
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #3

; Function Attrs: nounwind
declare double @sqrt(double noundef) #3

declare i32 @printf(ptr noundef, ...) #1

declare void @qsort(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
