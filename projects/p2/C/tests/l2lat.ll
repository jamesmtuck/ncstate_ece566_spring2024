; ModuleID = 'l2lat.prof.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }

@a = dso_local global [160000 x ptr] zeroinitializer, align 16
@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [12 x i8] c"Time is %g\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"L2 Latency (ns) is %g\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"L2 BW is %f MB/sec\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"b is %ld\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  store i32 0, ptr %1, align 4
  store i64 0, ptr %5, align 8
  br label %10

10:                                               ; preds = %19, %0
  %11 = load i64, ptr %5, align 8
  %12 = icmp slt i64 %11, 160000
  br i1 %12, label %13, label %22

13:                                               ; preds = %10
  %14 = load i64, ptr %5, align 8
  %15 = add nsw i64 %14, 1
  %16 = getelementptr inbounds [160000 x ptr], ptr @a, i64 0, i64 %15
  %17 = load i64, ptr %5, align 8
  %18 = getelementptr inbounds [160000 x ptr], ptr @a, i64 0, i64 %17
  store ptr %16, ptr %18, align 8
  br label %19

19:                                               ; preds = %13
  %20 = load i64, ptr %5, align 8
  %21 = add nsw i64 %20, 1
  store i64 %21, ptr %5, align 8
  br label %10

22:                                               ; preds = %10
  %23 = call double (...) @second()
  store double %23, ptr %2, align 8
  store i64 0, ptr %5, align 8
  br label %24

24:                                               ; preds = %40, %22
  %25 = load i64, ptr %5, align 8
  %26 = icmp slt i64 %25, 1500
  br i1 %26, label %27, label %43

27:                                               ; preds = %24
  %28 = load ptr, ptr getelementptr inbounds ([160000 x ptr], ptr @a, i64 0, i64 7), align 8
  store ptr %28, ptr %3, align 8
  store i64 0, ptr %7, align 8
  br label %29

29:                                               ; preds = %36, %27
  %30 = load i64, ptr %7, align 8
  %31 = icmp slt i64 %30, 5000
  br i1 %31, label %32, label %39

32:                                               ; preds = %29
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds ptr, ptr %33, i64 8
  %35 = load ptr, ptr %34, align 8
  store ptr %35, ptr %3, align 8
  br label %36

36:                                               ; preds = %32
  %37 = load i64, ptr %7, align 8
  %38 = add nsw i64 %37, 1
  store i64 %38, ptr %7, align 8
  br label %29

39:                                               ; preds = %29
  br label %40

40:                                               ; preds = %39
  %41 = load i64, ptr %5, align 8
  %42 = add nsw i64 %41, 1
  store i64 %42, ptr %5, align 8
  br label %24

43:                                               ; preds = %24
  %44 = call double (...) @second()
  %45 = load double, ptr %2, align 8
  %46 = fsub double %44, %45
  store double %46, ptr %2, align 8
  %47 = load ptr, ptr @stderr, align 8
  %48 = load double, ptr %2, align 8
  %49 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %47, ptr noundef @.str, double noundef %48)
  %50 = load ptr, ptr @stderr, align 8
  %51 = load double, ptr %2, align 8
  %52 = fdiv double %51, 7.500000e+06
  %53 = fmul double %52, 1.000000e+09
  %54 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %50, ptr noundef @.str.1, double noundef %53)
  %55 = load ptr, ptr @stderr, align 8
  %56 = load double, ptr %2, align 8
  %57 = fmul double %56, 1.000000e+06
  %58 = fdiv double 4.800000e+08, %57
  %59 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %55, ptr noundef @.str.2, double noundef %58)
  %60 = load ptr, ptr @stderr, align 8
  %61 = load ptr, ptr %3, align 8
  %62 = ptrtoint ptr %61 to i64
  %63 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %60, ptr noundef @.str.3, i64 noundef %62)
  ret i32 0
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @second() #0 {
  %1 = alloca double, align 8
  %2 = alloca %struct.timeval, align 8
  %3 = call i32 @gettimeofday(ptr noundef %2, ptr noundef null) #3
  %4 = getelementptr inbounds %struct.timeval, ptr %2, i32 0, i32 1
  %5 = load i64, ptr %4, align 8
  %6 = sitofp i64 %5 to double
  store double %6, ptr %1, align 8
  %7 = load double, ptr %1, align 8
  %8 = fdiv double %7, 1.000000e+06
  store double %8, ptr %1, align 8
  %9 = getelementptr inbounds %struct.timeval, ptr %2, i32 0, i32 0
  %10 = load i64, ptr %9, align 8
  %11 = sitofp i64 %10 to double
  %12 = load double, ptr %1, align 8
  %13 = fadd double %12, %11
  store double %13, ptr %1, align 8
  %14 = load double, ptr %1, align 8
  ret double %14
}

; Function Attrs: nounwind
declare i32 @gettimeofday(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
