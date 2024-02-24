; ModuleID = 'em3d.prof.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node_t = type { ptr, ptr, ptr, ptr, ptr, i32, i32 }
%struct.graph_t = type { [64 x ptr], [64 x ptr] }

@.str = private unnamed_addr constant [47 x i8] c"Hello world--Doing em3d with args %d %d %d %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"nonlocals = %d\0A\00", align 1
@nonlocals = dso_local global i32 0, align 4
@.str.7 = private unnamed_addr constant [7 x i8] c"retval\00", align 1
@.str.1.8 = private unnamed_addr constant [56 x i8] c"/ece566/wtest/../wolfbench/Benchmarks/em3d/make_graph.c\00", align 1
@__MyNodeId = dso_local global i32 0, align 4
@IDMASK = dso_local global i32 0, align 4
@.str.2 = private unnamed_addr constant [23 x i8] c"Uncaught malloc error\0A\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"Error! on dest %d @ %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [45 x i8] c"pre other_node = 0x%x,number = %d,dest = %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [34 x i8] c"Error! no to_nodes filed on 0x%x\0A\00", align 1
@.str.6 = private unnamed_addr constant [24 x i8] c"post other_node = 0x%x\0A\00", align 1
@.str.7.9 = private unnamed_addr constant [21 x i8] c"Help! no from count\0A\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"Help!!\0A\00", align 1
@.str.9 = private unnamed_addr constant [30 x i8] c"node 0x%x list 0x%x count %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [16 x i8] c"making tables \0A\00", align 1
@.str.11 = private unnamed_addr constant [18 x i8] c"making neighbors\0A\00", align 1
@.str.12 = private unnamed_addr constant [26 x i8] c"updating from and coeffs\0A\00", align 1
@.str.13 = private unnamed_addr constant [21 x i8] c"filling from fields\0A\00", align 1
@.str.14 = private unnamed_addr constant [31 x i8] c"localizing coeffs, from_nodes\0A\00", align 1
@.str.15 = private unnamed_addr constant [24 x i8] c"cleanup for return now\0A\00", align 1
@percentcheck = internal global i32 0, align 4
@numlocal = internal global i32 0, align 4
@.str.24 = private unnamed_addr constant [29 x i8] c"percentcheck=%d,numlocal=%d\0A\00", align 1
@DebugFlag = dso_local global i32 0, align 4
@__NumNodes = dso_local global i32 0, align 4
@n_nodes = dso_local global i32 0, align 4
@d_nodes = dso_local global i32 0, align 4
@local_p = dso_local global i32 0, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local void @compute_nodes(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  store ptr %0, ptr %2, align 8
  br label %10

10:                                               ; preds = %118, %1
  %11 = load ptr, ptr %2, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %126

13:                                               ; preds = %10
  %14 = load ptr, ptr %2, align 8
  store ptr %14, ptr %4, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.node_t, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = load double, ptr %17, align 8
  store double %18, ptr %5, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.node_t, ptr %19, i32 0, i32 5
  %21 = load i32, ptr %20, align 8
  %22 = sub nsw i32 %21, 1
  store i32 %22, ptr %6, align 4
  store i32 0, ptr %3, align 4
  br label %23

23:                                               ; preds = %83, %13
  %24 = load i32, ptr %3, align 4
  %25 = load i32, ptr %6, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %86

27:                                               ; preds = %23
  %28 = load ptr, ptr %4, align 8
  %29 = getelementptr inbounds %struct.node_t, ptr %28, i32 0, i32 3
  %30 = load ptr, ptr %29, align 8
  %31 = load i32, ptr %3, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds ptr, ptr %30, i64 %32
  %34 = load ptr, ptr %33, align 8
  store ptr %34, ptr %7, align 8
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds %struct.node_t, ptr %35, i32 0, i32 4
  %37 = load ptr, ptr %36, align 8
  %38 = load i32, ptr %3, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds double, ptr %37, i64 %39
  %41 = load double, ptr %40, align 8
  store double %41, ptr %8, align 8
  %42 = load ptr, ptr %7, align 8
  %43 = icmp ne ptr %42, null
  br i1 %43, label %47, label %44

44:                                               ; preds = %27
  %45 = load i32, ptr @nonlocals, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr @nonlocals, align 4
  br label %47

47:                                               ; preds = %44, %27
  %48 = load ptr, ptr %7, align 8
  %49 = load double, ptr %48, align 8
  store double %49, ptr %9, align 8
  %50 = load double, ptr %8, align 8
  %51 = load double, ptr %9, align 8
  %52 = load double, ptr %5, align 8
  %53 = fneg double %50
  %54 = call double @llvm.fmuladd.f64(double %53, double %51, double %52)
  store double %54, ptr %5, align 8
  %55 = load ptr, ptr %4, align 8
  %56 = getelementptr inbounds %struct.node_t, ptr %55, i32 0, i32 3
  %57 = load ptr, ptr %56, align 8
  %58 = load i32, ptr %3, align 4
  %59 = add nsw i32 %58, 1
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds ptr, ptr %57, i64 %60
  %62 = load ptr, ptr %61, align 8
  store ptr %62, ptr %7, align 8
  %63 = load ptr, ptr %4, align 8
  %64 = getelementptr inbounds %struct.node_t, ptr %63, i32 0, i32 4
  %65 = load ptr, ptr %64, align 8
  %66 = load i32, ptr %3, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, ptr %65, i64 %67
  %69 = load double, ptr %68, align 8
  store double %69, ptr %8, align 8
  %70 = load ptr, ptr %7, align 8
  %71 = icmp ne ptr %70, null
  br i1 %71, label %75, label %72

72:                                               ; preds = %47
  %73 = load i32, ptr @nonlocals, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr @nonlocals, align 4
  br label %75

75:                                               ; preds = %72, %47
  %76 = load ptr, ptr %7, align 8
  %77 = load double, ptr %76, align 8
  store double %77, ptr %9, align 8
  %78 = load double, ptr %8, align 8
  %79 = load double, ptr %9, align 8
  %80 = load double, ptr %5, align 8
  %81 = fneg double %78
  %82 = call double @llvm.fmuladd.f64(double %81, double %79, double %80)
  store double %82, ptr %5, align 8
  br label %83

83:                                               ; preds = %75
  %84 = load i32, ptr %3, align 4
  %85 = add nsw i32 %84, 2
  store i32 %85, ptr %3, align 4
  br label %23

86:                                               ; preds = %23
  %87 = load i32, ptr %3, align 4
  %88 = load i32, ptr %6, align 4
  %89 = icmp eq i32 %87, %88
  br i1 %89, label %90, label %118

90:                                               ; preds = %86
  %91 = load ptr, ptr %4, align 8
  %92 = getelementptr inbounds %struct.node_t, ptr %91, i32 0, i32 3
  %93 = load ptr, ptr %92, align 8
  %94 = load i32, ptr %3, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds ptr, ptr %93, i64 %95
  %97 = load ptr, ptr %96, align 8
  store ptr %97, ptr %7, align 8
  %98 = load ptr, ptr %4, align 8
  %99 = getelementptr inbounds %struct.node_t, ptr %98, i32 0, i32 4
  %100 = load ptr, ptr %99, align 8
  %101 = load i32, ptr %3, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds double, ptr %100, i64 %102
  %104 = load double, ptr %103, align 8
  store double %104, ptr %8, align 8
  %105 = load ptr, ptr %7, align 8
  %106 = icmp ne ptr %105, null
  br i1 %106, label %110, label %107

107:                                              ; preds = %90
  %108 = load i32, ptr @nonlocals, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, ptr @nonlocals, align 4
  br label %110

110:                                              ; preds = %107, %90
  %111 = load ptr, ptr %7, align 8
  %112 = load double, ptr %111, align 8
  store double %112, ptr %9, align 8
  %113 = load double, ptr %8, align 8
  %114 = load double, ptr %9, align 8
  %115 = load double, ptr %5, align 8
  %116 = fneg double %113
  %117 = call double @llvm.fmuladd.f64(double %116, double %114, double %115)
  store double %117, ptr %5, align 8
  br label %118

118:                                              ; preds = %110, %86
  %119 = load double, ptr %5, align 8
  %120 = load ptr, ptr %4, align 8
  %121 = getelementptr inbounds %struct.node_t, ptr %120, i32 0, i32 0
  %122 = load ptr, ptr %121, align 8
  store double %119, ptr %122, align 8
  %123 = load ptr, ptr %4, align 8
  %124 = getelementptr inbounds %struct.node_t, ptr %123, i32 0, i32 1
  %125 = load ptr, ptr %124, align 8
  store ptr %125, ptr %2, align 8
  br label %10

126:                                              ; preds = %10
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %8 = load i32, ptr %4, align 4
  %9 = load ptr, ptr %5, align 8
  %10 = call i32 (i32, ptr, ...) @dealwithargs(i32 noundef %8, ptr noundef %9)
  %11 = load i32, ptr @n_nodes, align 4
  %12 = load i32, ptr @d_nodes, align 4
  %13 = load i32, ptr @local_p, align 4
  %14 = load i32, ptr @__NumNodes, align 4
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %11, i32 noundef %12, i32 noundef %13, i32 noundef %14)
  %16 = call ptr (...) @initialize_graph()
  store ptr %16, ptr %7, align 8
  %17 = load i32, ptr @DebugFlag, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %29

19:                                               ; preds = %2
  store i32 0, ptr %6, align 4
  br label %20

20:                                               ; preds = %25, %19
  %21 = load i32, ptr %6, align 4
  %22 = load i32, ptr @__NumNodes, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %28

24:                                               ; preds = %20
  br label %25

25:                                               ; preds = %24
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %6, align 4
  br label %20

28:                                               ; preds = %20
  br label %29

29:                                               ; preds = %28, %2
  %30 = load ptr, ptr %7, align 8
  %31 = getelementptr inbounds %struct.graph_t, ptr %30, i32 0, i32 0
  %32 = getelementptr inbounds [64 x ptr], ptr %31, i64 0, i64 0
  %33 = load ptr, ptr %32, align 8
  call void (ptr, ...) @compute_nodes(ptr noundef %33)
  %34 = load ptr, ptr %7, align 8
  %35 = getelementptr inbounds %struct.graph_t, ptr %34, i32 0, i32 1
  %36 = getelementptr inbounds [64 x ptr], ptr %35, i64 0, i64 0
  %37 = load ptr, ptr %36, align 8
  call void (ptr, ...) @compute_nodes(ptr noundef %37)
  %38 = load i32, ptr @nonlocals, align 4
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %38)
  %40 = call i32 (...) @printstats()
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ATOMICINC(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load i32, ptr %3, align 4
  %5 = add nsw i32 %4, 1
  store i32 %5, ptr %3, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @make_table(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %3, align 4
  %7 = sext i32 %6 to i64
  %8 = mul i64 %7, 8
  %9 = call noalias ptr @malloc(i64 noundef %8) #6
  store ptr %9, ptr %5, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %2
  br label %15

13:                                               ; preds = %2
  call void @__assert_fail(ptr noundef @.str.7, ptr noundef @.str.1.8, i32 noundef 51, ptr noundef null) #7
  unreachable

14:                                               ; No predecessors!
  br label %15

15:                                               ; preds = %14, %12
  %16 = load ptr, ptr %5, align 8
  ret ptr %16
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @fill_table(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %12 = call noalias ptr @malloc(i64 noundef 48) #6
  store ptr %12, ptr %10, align 8
  %13 = load ptr, ptr %10, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds ptr, ptr %14, i64 0
  store ptr %13, ptr %15, align 8
  %16 = call double (...) @gen_uniform_double()
  %17 = load ptr, ptr %6, align 8
  store double %16, ptr %17, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds double, ptr %18, i32 1
  store ptr %19, ptr %6, align 8
  %20 = load ptr, ptr %10, align 8
  %21 = getelementptr inbounds %struct.node_t, ptr %20, i32 0, i32 0
  store ptr %18, ptr %21, align 8
  %22 = load ptr, ptr %10, align 8
  %23 = getelementptr inbounds %struct.node_t, ptr %22, i32 0, i32 5
  store i32 0, ptr %23, align 8
  store i32 1, ptr %11, align 4
  br label %24

24:                                               ; preds = %47, %4
  %25 = load i32, ptr %11, align 4
  %26 = load i32, ptr %7, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %50

28:                                               ; preds = %24
  %29 = call noalias ptr @malloc(i64 noundef 48) #6
  store ptr %29, ptr %9, align 8
  %30 = call double (...) @gen_uniform_double()
  %31 = load ptr, ptr %6, align 8
  store double %30, ptr %31, align 8
  %32 = load ptr, ptr %6, align 8
  %33 = getelementptr inbounds double, ptr %32, i32 1
  store ptr %33, ptr %6, align 8
  %34 = load ptr, ptr %9, align 8
  %35 = getelementptr inbounds %struct.node_t, ptr %34, i32 0, i32 0
  store ptr %32, ptr %35, align 8
  %36 = load ptr, ptr %9, align 8
  %37 = getelementptr inbounds %struct.node_t, ptr %36, i32 0, i32 5
  store i32 0, ptr %37, align 8
  %38 = load ptr, ptr %9, align 8
  %39 = load ptr, ptr %5, align 8
  %40 = load i32, ptr %11, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds ptr, ptr %39, i64 %41
  store ptr %38, ptr %42, align 8
  %43 = load ptr, ptr %9, align 8
  %44 = load ptr, ptr %10, align 8
  %45 = getelementptr inbounds %struct.node_t, ptr %44, i32 0, i32 1
  store ptr %43, ptr %45, align 8
  %46 = load ptr, ptr %9, align 8
  store ptr %46, ptr %10, align 8
  br label %47

47:                                               ; preds = %28
  %48 = load i32, ptr %11, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %11, align 4
  br label %24

50:                                               ; preds = %24
  %51 = load ptr, ptr %10, align 8
  %52 = getelementptr inbounds %struct.node_t, ptr %51, i32 0, i32 1
  store ptr null, ptr %52, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @make_neighbors(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 {
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  %20 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store i32 %2, ptr %9, align 4
  store i32 %3, ptr %10, align 4
  store i32 %4, ptr %11, align 4
  store i32 %5, ptr %12, align 4
  %21 = load i32, ptr @__MyNodeId, align 4
  %22 = load i32, ptr @IDMASK, align 4
  %23 = and i32 %21, %22
  store i32 %23, ptr %14, align 4
  %24 = load ptr, ptr %7, align 8
  store ptr %24, ptr %13, align 8
  br label %25

25:                                               ; preds = %152, %6
  %26 = load ptr, ptr %13, align 8
  %27 = icmp ne ptr %26, null
  br i1 %27, label %28, label %156

28:                                               ; preds = %25
  %29 = load i32, ptr %10, align 4
  %30 = sext i32 %29 to i64
  %31 = mul i64 %30, 8
  %32 = call noalias ptr @malloc(i64 noundef %31) #6
  %33 = load ptr, ptr %13, align 8
  %34 = getelementptr inbounds %struct.node_t, ptr %33, i32 0, i32 2
  store ptr %32, ptr %34, align 8
  %35 = load ptr, ptr %13, align 8
  %36 = getelementptr inbounds %struct.node_t, ptr %35, i32 0, i32 2
  %37 = load ptr, ptr %36, align 8
  %38 = icmp ne ptr %37, null
  br i1 %38, label %41, label %39

39:                                               ; preds = %28
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @exit(i32 noundef 0) #7
  unreachable

41:                                               ; preds = %28
  store i32 0, ptr %16, align 4
  br label %42

42:                                               ; preds = %148, %41
  %43 = load i32, ptr %16, align 4
  %44 = load i32, ptr %10, align 4
  %45 = icmp slt i32 %43, %44
  br i1 %45, label %46, label %151

46:                                               ; preds = %42
  br label %47

47:                                               ; preds = %112, %46
  %48 = load i32, ptr %9, align 4
  %49 = call i32 @gen_number(i32 noundef %48)
  store i32 %49, ptr %20, align 4
  %50 = load i32, ptr %11, align 4
  %51 = call i32 @check_percent(i32 noundef %50)
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %55

53:                                               ; preds = %47
  %54 = load i32, ptr %12, align 4
  br label %62

55:                                               ; preds = %47
  %56 = load i32, ptr %12, align 4
  %57 = add nsw i32 %56, 64
  %58 = call i32 @gen_signed_number(i32 noundef 1)
  %59 = mul nsw i32 4, %58
  %60 = add nsw i32 %57, %59
  %61 = srem i32 %60, 64
  br label %62

62:                                               ; preds = %55, %53
  %63 = phi i32 [ %54, %53 ], [ %61, %55 ]
  store i32 %63, ptr %18, align 4
  %64 = load ptr, ptr %8, align 8
  %65 = load i32, ptr %18, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds ptr, ptr %64, i64 %66
  %68 = load ptr, ptr %67, align 8
  store ptr %68, ptr %19, align 8
  %69 = load ptr, ptr %19, align 8
  %70 = load i32, ptr %20, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds ptr, ptr %69, i64 %71
  %73 = load ptr, ptr %72, align 8
  store ptr %73, ptr %15, align 8
  %74 = load ptr, ptr %15, align 8
  %75 = icmp ne ptr %74, null
  br i1 %75, label %80, label %76

76:                                               ; preds = %62
  %77 = load i32, ptr %20, align 4
  %78 = load i32, ptr %18, align 4
  %79 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %77, i32 noundef %78)
  call void @exit(i32 noundef 0) #7
  unreachable

80:                                               ; preds = %62
  store i32 0, ptr %17, align 4
  br label %81

81:                                               ; preds = %97, %80
  %82 = load i32, ptr %17, align 4
  %83 = load i32, ptr %16, align 4
  %84 = icmp slt i32 %82, %83
  br i1 %84, label %85, label %100

85:                                               ; preds = %81
  %86 = load ptr, ptr %15, align 8
  %87 = load ptr, ptr %13, align 8
  %88 = getelementptr inbounds %struct.node_t, ptr %87, i32 0, i32 2
  %89 = load ptr, ptr %88, align 8
  %90 = load i32, ptr %17, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds ptr, ptr %89, i64 %91
  %93 = load ptr, ptr %92, align 8
  %94 = icmp eq ptr %86, %93
  br i1 %94, label %95, label %96

95:                                               ; preds = %85
  br label %100

96:                                               ; preds = %85
  br label %97

97:                                               ; preds = %96
  %98 = load i32, ptr %17, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, ptr %17, align 4
  br label %81

100:                                              ; preds = %95, %81
  %101 = load ptr, ptr %15, align 8
  %102 = ptrtoint ptr %101 to i32
  %103 = lshr i32 %102, 7
  %104 = icmp ult i32 %103, 2048
  br i1 %104, label %105, label %111

105:                                              ; preds = %100
  %106 = load ptr, ptr %15, align 8
  %107 = ptrtoint ptr %106 to i32
  %108 = load i32, ptr %20, align 4
  %109 = load i32, ptr %18, align 4
  %110 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %107, i32 noundef %108, i32 noundef %109)
  br label %111

111:                                              ; preds = %105, %100
  br label %112

112:                                              ; preds = %111
  %113 = load i32, ptr %17, align 4
  %114 = load i32, ptr %16, align 4
  %115 = icmp slt i32 %113, %114
  br i1 %115, label %47, label %116

116:                                              ; preds = %112
  %117 = load ptr, ptr %13, align 8
  %118 = icmp ne ptr %117, null
  br i1 %118, label %119, label %124

119:                                              ; preds = %116
  %120 = load ptr, ptr %13, align 8
  %121 = getelementptr inbounds %struct.node_t, ptr %120, i32 0, i32 2
  %122 = load ptr, ptr %121, align 8
  %123 = icmp ne ptr %122, null
  br i1 %123, label %128, label %124

124:                                              ; preds = %119, %116
  %125 = load ptr, ptr %13, align 8
  %126 = ptrtoint ptr %125 to i32
  %127 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %126)
  call void @exit(i32 noundef 0) #7
  unreachable

128:                                              ; preds = %119
  %129 = load ptr, ptr %15, align 8
  %130 = load ptr, ptr %13, align 8
  %131 = getelementptr inbounds %struct.node_t, ptr %130, i32 0, i32 2
  %132 = load ptr, ptr %131, align 8
  %133 = load i32, ptr %16, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds ptr, ptr %132, i64 %134
  store ptr %129, ptr %135, align 8
  %136 = load ptr, ptr %15, align 8
  %137 = ptrtoint ptr %136 to i32
  %138 = lshr i32 %137, 7
  %139 = icmp ult i32 %138, 2048
  br i1 %139, label %140, label %144

140:                                              ; preds = %128
  %141 = load ptr, ptr %15, align 8
  %142 = ptrtoint ptr %141 to i32
  %143 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %142)
  br label %144

144:                                              ; preds = %140, %128
  %145 = load ptr, ptr %15, align 8
  %146 = getelementptr inbounds %struct.node_t, ptr %145, i32 0, i32 5
  %147 = call i32 @ATOMICINC(ptr noundef %146)
  br label %148

148:                                              ; preds = %144
  %149 = load i32, ptr %16, align 4
  %150 = add nsw i32 %149, 1
  store i32 %150, ptr %16, align 4
  br label %42

151:                                              ; preds = %42
  br label %152

152:                                              ; preds = %151
  %153 = load ptr, ptr %13, align 8
  %154 = getelementptr inbounds %struct.node_t, ptr %153, i32 0, i32 1
  %155 = load ptr, ptr %154, align 8
  store ptr %155, ptr %13, align 8
  br label %25

156:                                              ; preds = %25
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @update_from_coeffs(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %7 = load i32, ptr @__MyNodeId, align 4
  %8 = load i32, ptr @IDMASK, align 4
  %9 = and i32 %7, %8
  store i32 %9, ptr %4, align 4
  %10 = load ptr, ptr %2, align 8
  store ptr %10, ptr %3, align 8
  br label %11

11:                                               ; preds = %37, %1
  %12 = load ptr, ptr %3, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %41

14:                                               ; preds = %11
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.node_t, ptr %15, i32 0, i32 5
  %17 = load i32, ptr %16, align 8
  store i32 %17, ptr %5, align 4
  %18 = load i32, ptr %5, align 4
  %19 = icmp slt i32 %18, 1
  br i1 %19, label %20, label %22

20:                                               ; preds = %14
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.7.9)
  br label %22

22:                                               ; preds = %20, %14
  %23 = load i32, ptr %5, align 4
  %24 = sext i32 %23 to i64
  %25 = mul i64 %24, 8
  %26 = call noalias ptr @malloc(i64 noundef %25) #6
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds %struct.node_t, ptr %27, i32 0, i32 3
  store ptr %26, ptr %28, align 8
  %29 = load i32, ptr %5, align 4
  %30 = sext i32 %29 to i64
  %31 = mul i64 %30, 8
  %32 = call noalias ptr @malloc(i64 noundef %31) #6
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds %struct.node_t, ptr %33, i32 0, i32 4
  store ptr %32, ptr %34, align 8
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds %struct.node_t, ptr %35, i32 0, i32 6
  store i32 0, ptr %36, align 4
  br label %37

37:                                               ; preds = %22
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds %struct.node_t, ptr %38, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8
  store ptr %40, ptr %3, align 8
  br label %11

41:                                               ; preds = %11
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @fill_from_fields(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %12 = load ptr, ptr %3, align 8
  store ptr %12, ptr %5, align 8
  br label %13

13:                                               ; preds = %75, %2
  %14 = load ptr, ptr %5, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %79

16:                                               ; preds = %13
  store i32 0, ptr %6, align 4
  br label %17

17:                                               ; preds = %71, %16
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %4, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %74

21:                                               ; preds = %17
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds %struct.node_t, ptr %22, i32 0, i32 2
  %24 = load ptr, ptr %23, align 8
  %25 = load i32, ptr %6, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds ptr, ptr %24, i64 %26
  %28 = load ptr, ptr %27, align 8
  store ptr %28, ptr %9, align 8
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds %struct.node_t, ptr %29, i32 0, i32 0
  %31 = load ptr, ptr %30, align 8
  store ptr %31, ptr %11, align 8
  %32 = load ptr, ptr %9, align 8
  %33 = icmp ne ptr %32, null
  br i1 %33, label %36, label %34

34:                                               ; preds = %21
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %36

36:                                               ; preds = %34, %21
  %37 = load ptr, ptr %9, align 8
  %38 = getelementptr inbounds %struct.node_t, ptr %37, i32 0, i32 6
  %39 = call i32 @ATOMICINC(ptr noundef %38)
  store i32 %39, ptr %7, align 4
  %40 = load ptr, ptr %9, align 8
  %41 = getelementptr inbounds %struct.node_t, ptr %40, i32 0, i32 3
  %42 = load ptr, ptr %41, align 8
  store ptr %42, ptr %10, align 8
  %43 = load ptr, ptr %9, align 8
  %44 = getelementptr inbounds %struct.node_t, ptr %43, i32 0, i32 5
  %45 = load i32, ptr %44, align 8
  store i32 %45, ptr %8, align 4
  %46 = load ptr, ptr %10, align 8
  %47 = icmp ne ptr %46, null
  br i1 %47, label %58, label %48

48:                                               ; preds = %36
  %49 = load ptr, ptr %9, align 8
  %50 = ptrtoint ptr %49 to i32
  %51 = load ptr, ptr %10, align 8
  %52 = ptrtoint ptr %51 to i32
  %53 = load i32, ptr %8, align 4
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %50, i32 noundef %52, i32 noundef %53)
  %55 = load ptr, ptr %9, align 8
  %56 = getelementptr inbounds %struct.node_t, ptr %55, i32 0, i32 3
  %57 = load ptr, ptr %56, align 8
  store ptr %57, ptr %10, align 8
  br label %58

58:                                               ; preds = %48, %36
  %59 = load ptr, ptr %11, align 8
  %60 = load ptr, ptr %10, align 8
  %61 = load i32, ptr %7, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds ptr, ptr %60, i64 %62
  store ptr %59, ptr %63, align 8
  %64 = call double (...) @gen_uniform_double()
  %65 = load ptr, ptr %9, align 8
  %66 = getelementptr inbounds %struct.node_t, ptr %65, i32 0, i32 4
  %67 = load ptr, ptr %66, align 8
  %68 = load i32, ptr %7, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, ptr %67, i64 %69
  store double %64, ptr %70, align 8
  br label %71

71:                                               ; preds = %58
  %72 = load i32, ptr %6, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, ptr %6, align 4
  br label %17

74:                                               ; preds = %17
  br label %75

75:                                               ; preds = %74
  %76 = load ptr, ptr %5, align 8
  %77 = getelementptr inbounds %struct.node_t, ptr %76, i32 0, i32 1
  %78 = load ptr, ptr %77, align 8
  store ptr %78, ptr %5, align 8
  br label %13

79:                                               ; preds = %13
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @localize_local(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  store ptr %7, ptr %3, align 8
  br label %8

8:                                                ; preds = %30, %1
  %9 = load ptr, ptr %3, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %34

11:                                               ; preds = %8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.node_t, ptr %12, i32 0, i32 4
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %4, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.node_t, ptr %16, i32 0, i32 4
  store ptr %15, ptr %17, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.node_t, ptr %18, i32 0, i32 3
  %20 = load ptr, ptr %19, align 8
  store ptr %20, ptr %6, align 8
  %21 = load ptr, ptr %6, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.node_t, ptr %22, i32 0, i32 3
  store ptr %21, ptr %23, align 8
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.node_t, ptr %24, i32 0, i32 0
  %26 = load ptr, ptr %25, align 8
  store ptr %26, ptr %5, align 8
  %27 = load ptr, ptr %5, align 8
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds %struct.node_t, ptr %28, i32 0, i32 0
  store ptr %27, ptr %29, align 8
  br label %30

30:                                               ; preds = %11
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds %struct.node_t, ptr %31, i32 0, i32 1
  %33 = load ptr, ptr %32, align 8
  store ptr %33, ptr %3, align 8
  br label %8

34:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @make_tables(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %10 = load i32, ptr @__MyNodeId, align 4
  %11 = load i32, ptr @IDMASK, align 4
  %12 = and i32 %10, %11
  store i32 %12, ptr %9, align 4
  %13 = load i32, ptr %4, align 4
  %14 = mul nsw i32 793, %13
  call void @init_random(i32 noundef %14)
  %15 = load i32, ptr @n_nodes, align 4
  %16 = sdiv i32 %15, 64
  %17 = sext i32 %16 to i64
  %18 = mul i64 %17, 8
  %19 = call noalias ptr @malloc(i64 noundef %18) #6
  store ptr %19, ptr %7, align 8
  %20 = load i32, ptr @n_nodes, align 4
  %21 = sdiv i32 %20, 64
  %22 = load i32, ptr %9, align 4
  %23 = call ptr @make_table(i32 noundef %21, i32 noundef %22)
  store ptr %23, ptr %5, align 8
  %24 = load ptr, ptr %5, align 8
  %25 = load ptr, ptr %7, align 8
  %26 = load i32, ptr @n_nodes, align 4
  %27 = sdiv i32 %26, 64
  %28 = load i32, ptr %9, align 4
  call void @fill_table(ptr noundef %24, ptr noundef %25, i32 noundef %27, i32 noundef %28)
  %29 = load i32, ptr @n_nodes, align 4
  %30 = sdiv i32 %29, 64
  %31 = sext i32 %30 to i64
  %32 = mul i64 %31, 8
  %33 = call noalias ptr @malloc(i64 noundef %32) #6
  store ptr %33, ptr %8, align 8
  %34 = load i32, ptr @n_nodes, align 4
  %35 = sdiv i32 %34, 64
  %36 = load i32, ptr %9, align 4
  %37 = call ptr @make_table(i32 noundef %35, i32 noundef %36)
  store ptr %37, ptr %6, align 8
  %38 = load ptr, ptr %6, align 8
  %39 = load ptr, ptr %8, align 8
  %40 = load i32, ptr @n_nodes, align 4
  %41 = sdiv i32 %40, 64
  %42 = load i32, ptr %9, align 4
  call void @fill_table(ptr noundef %38, ptr noundef %39, i32 noundef %41, i32 noundef %42)
  %43 = load ptr, ptr %6, align 8
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds %struct.graph_t, ptr %44, i32 0, i32 0
  %46 = load i32, ptr %4, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [64 x ptr], ptr %45, i64 0, i64 %47
  store ptr %43, ptr %48, align 8
  %49 = load ptr, ptr %5, align 8
  %50 = load ptr, ptr %3, align 8
  %51 = getelementptr inbounds %struct.graph_t, ptr %50, i32 0, i32 1
  %52 = load i32, ptr %4, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [64 x ptr], ptr %51, i64 0, i64 %53
  store ptr %49, ptr %54, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @make_all_neighbors(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %8 = load i32, ptr %4, align 4
  %9 = mul nsw i32 39, %8
  call void @init_random(i32 noundef %9)
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.graph_t, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %4, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [64 x ptr], ptr %11, i64 0, i64 %13
  %15 = load ptr, ptr %14, align 8
  store ptr %15, ptr %6, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.graph_t, ptr %16, i32 0, i32 0
  %18 = getelementptr inbounds [64 x ptr], ptr %17, i64 0, i64 0
  store ptr %18, ptr %7, align 8
  %19 = load ptr, ptr %6, align 8
  %20 = getelementptr inbounds ptr, ptr %19, i64 0
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %5, align 8
  %22 = load ptr, ptr %5, align 8
  %23 = load ptr, ptr %7, align 8
  %24 = load i32, ptr @n_nodes, align 4
  %25 = sdiv i32 %24, 64
  %26 = load i32, ptr @d_nodes, align 4
  %27 = load i32, ptr @local_p, align 4
  %28 = load i32, ptr %4, align 4
  call void @make_neighbors(ptr noundef %22, ptr noundef %23, i32 noundef %25, i32 noundef %26, i32 noundef %27, i32 noundef %28)
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.graph_t, ptr %29, i32 0, i32 0
  %31 = load i32, ptr %4, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [64 x ptr], ptr %30, i64 0, i64 %32
  %34 = load ptr, ptr %33, align 8
  store ptr %34, ptr %6, align 8
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds %struct.graph_t, ptr %35, i32 0, i32 1
  %37 = getelementptr inbounds [64 x ptr], ptr %36, i64 0, i64 0
  store ptr %37, ptr %7, align 8
  %38 = load ptr, ptr %6, align 8
  %39 = getelementptr inbounds ptr, ptr %38, i64 0
  %40 = load ptr, ptr %39, align 8
  store ptr %40, ptr %5, align 8
  %41 = load ptr, ptr %5, align 8
  %42 = load ptr, ptr %7, align 8
  %43 = load i32, ptr @n_nodes, align 4
  %44 = sdiv i32 %43, 64
  %45 = load i32, ptr @d_nodes, align 4
  %46 = load i32, ptr @local_p, align 4
  %47 = load i32, ptr %4, align 4
  call void @make_neighbors(ptr noundef %41, ptr noundef %42, i32 noundef %44, i32 noundef %45, i32 noundef %46, i32 noundef %47)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @update_all_from_coeffs(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.graph_t, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %4, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [64 x ptr], ptr %8, i64 0, i64 %10
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds ptr, ptr %13, i64 0
  %15 = load ptr, ptr %14, align 8
  store ptr %15, ptr %6, align 8
  %16 = load ptr, ptr %6, align 8
  call void @update_from_coeffs(ptr noundef %16)
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.graph_t, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %4, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [64 x ptr], ptr %18, i64 0, i64 %20
  %22 = load ptr, ptr %21, align 8
  store ptr %22, ptr %5, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds ptr, ptr %23, i64 0
  %25 = load ptr, ptr %24, align 8
  store ptr %25, ptr %6, align 8
  %26 = load ptr, ptr %6, align 8
  call void @update_from_coeffs(ptr noundef %26)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @fill_all_from_fields(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %4, align 4
  %8 = mul nsw i32 17, %7
  call void @init_random(i32 noundef %8)
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.graph_t, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %4, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [64 x ptr], ptr %10, i64 0, i64 %12
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %5, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 0
  %17 = load ptr, ptr %16, align 8
  store ptr %17, ptr %6, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = load i32, ptr @d_nodes, align 4
  call void @fill_from_fields(ptr noundef %18, i32 noundef %19)
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.graph_t, ptr %20, i32 0, i32 0
  %22 = load i32, ptr %4, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [64 x ptr], ptr %21, i64 0, i64 %23
  %25 = load ptr, ptr %24, align 8
  store ptr %25, ptr %5, align 8
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds ptr, ptr %26, i64 0
  %28 = load ptr, ptr %27, align 8
  store ptr %28, ptr %6, align 8
  %29 = load ptr, ptr %6, align 8
  %30 = load i32, ptr @d_nodes, align 4
  call void @fill_from_fields(ptr noundef %29, i32 noundef %30)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @localize(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.graph_t, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %4, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [64 x ptr], ptr %8, i64 0, i64 %10
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds ptr, ptr %13, i64 0
  %15 = load ptr, ptr %14, align 8
  store ptr %15, ptr %6, align 8
  %16 = load ptr, ptr %6, align 8
  call void @localize_local(ptr noundef %16)
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.graph_t, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %4, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [64 x ptr], ptr %18, i64 0, i64 %20
  %22 = load ptr, ptr %21, align 8
  store ptr %22, ptr %5, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds ptr, ptr %23, i64 0
  %25 = load ptr, ptr %24, align 8
  store ptr %25, ptr %6, align 8
  %26 = load ptr, ptr %6, align 8
  call void @localize_local(ptr noundef %26)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @do_all(ptr noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, i32 noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store ptr %3, ptr %9, align 8
  store i32 %4, ptr %10, align 4
  %12 = load i32, ptr %7, align 4
  %13 = load i32, ptr %10, align 4
  %14 = sdiv i32 %12, %13
  store i32 %14, ptr %11, align 4
  %15 = load i32, ptr %8, align 4
  %16 = icmp sgt i32 %15, 1
  br i1 %16, label %17, label %33

17:                                               ; preds = %5
  %18 = load ptr, ptr %6, align 8
  %19 = load i32, ptr %7, align 4
  %20 = load i32, ptr %8, align 4
  %21 = sdiv i32 %20, 2
  %22 = add nsw i32 %19, %21
  %23 = load i32, ptr %8, align 4
  %24 = sdiv i32 %23, 2
  %25 = load ptr, ptr %9, align 8
  %26 = load i32, ptr %10, align 4
  call void @do_all(ptr noundef %18, i32 noundef %22, i32 noundef %24, ptr noundef %25, i32 noundef %26)
  %27 = load ptr, ptr %6, align 8
  %28 = load i32, ptr %7, align 4
  %29 = load i32, ptr %8, align 4
  %30 = sdiv i32 %29, 2
  %31 = load ptr, ptr %9, align 8
  %32 = load i32, ptr %10, align 4
  call void @do_all(ptr noundef %27, i32 noundef %28, i32 noundef %30, ptr noundef %31, i32 noundef %32)
  br label %37

33:                                               ; preds = %5
  %34 = load ptr, ptr %9, align 8
  %35 = load ptr, ptr %6, align 8
  %36 = load i32, ptr %7, align 4
  call void %34(ptr noundef %35, i32 noundef %36)
  br label %37

37:                                               ; preds = %33, %17
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @initialize_graph() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = call noalias ptr @malloc(i64 noundef 1024) #6
  store ptr %10, ptr %1, align 8
  %11 = call noalias ptr @malloc(i64 noundef 1024) #6
  store ptr %11, ptr %2, align 8
  %12 = load i32, ptr @__NumNodes, align 4
  %13 = sdiv i32 64, %12
  store i32 %13, ptr %6, align 4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %15 = load ptr, ptr %1, align 8
  %16 = load i32, ptr %6, align 4
  call void @do_all(ptr noundef %15, i32 noundef 0, i32 noundef 64, ptr noundef @make_tables, i32 noundef %16)
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %18 = load ptr, ptr %1, align 8
  %19 = load i32, ptr %6, align 4
  call void @do_all(ptr noundef %18, i32 noundef 0, i32 noundef 64, ptr noundef @make_all_neighbors, i32 noundef %19)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %21 = load ptr, ptr %1, align 8
  %22 = load i32, ptr %6, align 4
  call void @do_all(ptr noundef %21, i32 noundef 0, i32 noundef 64, ptr noundef @update_all_from_coeffs, i32 noundef %22)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %24 = load ptr, ptr %1, align 8
  %25 = load i32, ptr %6, align 4
  call void @do_all(ptr noundef %24, i32 noundef 0, i32 noundef 64, ptr noundef @fill_all_from_fields, i32 noundef %25)
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %27 = load ptr, ptr %1, align 8
  %28 = load i32, ptr %6, align 4
  call void @do_all(ptr noundef %27, i32 noundef 0, i32 noundef 64, ptr noundef @localize, i32 noundef %28)
  %29 = load i32, ptr @__NumNodes, align 4
  %30 = sdiv i32 64, %29
  store i32 %30, ptr %5, align 4
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  store i32 0, ptr %3, align 4
  br label %32

32:                                               ; preds = %148, %0
  %33 = load i32, ptr %3, align 4
  %34 = load i32, ptr @__NumNodes, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %151

36:                                               ; preds = %32
  %37 = load ptr, ptr %1, align 8
  %38 = getelementptr inbounds %struct.graph_t, ptr %37, i32 0, i32 0
  %39 = load i32, ptr %3, align 4
  %40 = load i32, ptr %5, align 4
  %41 = mul nsw i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [64 x ptr], ptr %38, i64 0, i64 %42
  %44 = load ptr, ptr %43, align 8
  store ptr %44, ptr %7, align 8
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr inbounds ptr, ptr %45, i64 0
  %47 = load ptr, ptr %46, align 8
  store ptr %47, ptr %8, align 8
  %48 = load ptr, ptr %8, align 8
  %49 = load ptr, ptr %2, align 8
  %50 = getelementptr inbounds %struct.graph_t, ptr %49, i32 0, i32 0
  %51 = load i32, ptr %3, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [64 x ptr], ptr %50, i64 0, i64 %52
  store ptr %48, ptr %53, align 8
  %54 = load ptr, ptr %1, align 8
  %55 = getelementptr inbounds %struct.graph_t, ptr %54, i32 0, i32 1
  %56 = load i32, ptr %3, align 4
  %57 = load i32, ptr %5, align 4
  %58 = mul nsw i32 %56, %57
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [64 x ptr], ptr %55, i64 0, i64 %59
  %61 = load ptr, ptr %60, align 8
  store ptr %61, ptr %7, align 8
  %62 = load ptr, ptr %7, align 8
  %63 = getelementptr inbounds ptr, ptr %62, i64 0
  %64 = load ptr, ptr %63, align 8
  store ptr %64, ptr %8, align 8
  %65 = load ptr, ptr %8, align 8
  %66 = load ptr, ptr %2, align 8
  %67 = getelementptr inbounds %struct.graph_t, ptr %66, i32 0, i32 1
  %68 = load i32, ptr %3, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [64 x ptr], ptr %67, i64 0, i64 %69
  store ptr %65, ptr %70, align 8
  store i32 1, ptr %4, align 4
  br label %71

71:                                               ; preds = %144, %36
  %72 = load i32, ptr %4, align 4
  %73 = load i32, ptr %5, align 4
  %74 = icmp slt i32 %72, %73
  br i1 %74, label %75, label %147

75:                                               ; preds = %71
  %76 = load ptr, ptr %1, align 8
  %77 = getelementptr inbounds %struct.graph_t, ptr %76, i32 0, i32 0
  %78 = load i32, ptr %3, align 4
  %79 = load i32, ptr %5, align 4
  %80 = mul nsw i32 %78, %79
  %81 = load i32, ptr %4, align 4
  %82 = add nsw i32 %80, %81
  %83 = sub nsw i32 %82, 1
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [64 x ptr], ptr %77, i64 0, i64 %84
  %86 = load ptr, ptr %85, align 8
  store ptr %86, ptr %7, align 8
  %87 = load ptr, ptr %7, align 8
  %88 = load i32, ptr @n_nodes, align 4
  %89 = sdiv i32 %88, 64
  %90 = sub nsw i32 %89, 1
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds ptr, ptr %87, i64 %91
  %93 = load ptr, ptr %92, align 8
  store ptr %93, ptr %9, align 8
  %94 = load ptr, ptr %1, align 8
  %95 = getelementptr inbounds %struct.graph_t, ptr %94, i32 0, i32 0
  %96 = load i32, ptr %3, align 4
  %97 = load i32, ptr %5, align 4
  %98 = mul nsw i32 %96, %97
  %99 = load i32, ptr %4, align 4
  %100 = add nsw i32 %98, %99
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [64 x ptr], ptr %95, i64 0, i64 %101
  %103 = load ptr, ptr %102, align 8
  store ptr %103, ptr %7, align 8
  %104 = load ptr, ptr %7, align 8
  %105 = getelementptr inbounds ptr, ptr %104, i64 0
  %106 = load ptr, ptr %105, align 8
  store ptr %106, ptr %8, align 8
  %107 = load ptr, ptr %8, align 8
  %108 = load ptr, ptr %9, align 8
  %109 = getelementptr inbounds %struct.node_t, ptr %108, i32 0, i32 1
  store ptr %107, ptr %109, align 8
  %110 = load ptr, ptr %1, align 8
  %111 = getelementptr inbounds %struct.graph_t, ptr %110, i32 0, i32 1
  %112 = load i32, ptr %3, align 4
  %113 = load i32, ptr %5, align 4
  %114 = mul nsw i32 %112, %113
  %115 = load i32, ptr %4, align 4
  %116 = add nsw i32 %114, %115
  %117 = sub nsw i32 %116, 1
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [64 x ptr], ptr %111, i64 0, i64 %118
  %120 = load ptr, ptr %119, align 8
  store ptr %120, ptr %7, align 8
  %121 = load ptr, ptr %7, align 8
  %122 = load i32, ptr @n_nodes, align 4
  %123 = sdiv i32 %122, 64
  %124 = sub nsw i32 %123, 1
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds ptr, ptr %121, i64 %125
  %127 = load ptr, ptr %126, align 8
  store ptr %127, ptr %9, align 8
  %128 = load ptr, ptr %1, align 8
  %129 = getelementptr inbounds %struct.graph_t, ptr %128, i32 0, i32 1
  %130 = load i32, ptr %3, align 4
  %131 = load i32, ptr %5, align 4
  %132 = mul nsw i32 %130, %131
  %133 = load i32, ptr %4, align 4
  %134 = add nsw i32 %132, %133
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [64 x ptr], ptr %129, i64 0, i64 %135
  %137 = load ptr, ptr %136, align 8
  store ptr %137, ptr %7, align 8
  %138 = load ptr, ptr %7, align 8
  %139 = getelementptr inbounds ptr, ptr %138, i64 0
  %140 = load ptr, ptr %139, align 8
  store ptr %140, ptr %8, align 8
  %141 = load ptr, ptr %8, align 8
  %142 = load ptr, ptr %9, align 8
  %143 = getelementptr inbounds %struct.node_t, ptr %142, i32 0, i32 1
  store ptr %141, ptr %143, align 8
  br label %144

144:                                              ; preds = %75
  %145 = load i32, ptr %4, align 4
  %146 = add nsw i32 %145, 1
  store i32 %146, ptr %4, align 4
  br label %71

147:                                              ; preds = %71
  br label %148

148:                                              ; preds = %147
  %149 = load i32, ptr %3, align 4
  %150 = add nsw i32 %149, 1
  store i32 %150, ptr %3, align 4
  br label %32

151:                                              ; preds = %32
  %152 = load ptr, ptr %2, align 8
  ret ptr %152
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @init_random(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = call i32 (i32, ...) @srand48(i32 noundef %3)
  ret void
}

declare i32 @srand48(...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @gen_number(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = call i64 (...) @lrand48()
  %4 = load i32, ptr %2, align 4
  %5 = sext i32 %4 to i64
  %6 = srem i64 %3, %5
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

declare i64 @lrand48(...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @gen_signed_number(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = call i64 (...) @lrand48()
  %5 = load i32, ptr %2, align 4
  %6 = mul nsw i32 2, %5
  %7 = sext i32 %6 to i64
  %8 = srem i64 %4, %7
  %9 = trunc i64 %8 to i32
  store i32 %9, ptr %3, align 4
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %2, align 4
  %12 = sub nsw i32 %10, %11
  store i32 %12, ptr %3, align 4
  %13 = load i32, ptr %3, align 4
  %14 = icmp sge i32 %13, 0
  br i1 %14, label %15, label %18

15:                                               ; preds = %1
  %16 = load i32, ptr %3, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %3, align 4
  br label %18

18:                                               ; preds = %15, %1
  %19 = load i32, ptr %3, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @gen_uniform_double() #0 {
  %1 = call double (...) @drand48()
  ret double %1
}

declare double @drand48(...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @check_percent(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = call double (...) @drand48()
  %5 = load i32, ptr %2, align 4
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 1.000000e+02
  %8 = fcmp olt double %4, %7
  %9 = zext i1 %8 to i32
  store i32 %9, ptr %3, align 4
  %10 = load i32, ptr @percentcheck, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr @percentcheck, align 4
  %12 = load i32, ptr %3, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %17

14:                                               ; preds = %1
  %15 = load i32, ptr @numlocal, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr @numlocal, align 4
  br label %17

17:                                               ; preds = %14, %1
  %18 = load i32, ptr %3, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printstats() #0 {
  %1 = load i32, ptr @percentcheck, align 4
  %2 = load i32, ptr @numlocal, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.24, i32 noundef %1, i32 noundef %2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @dealwithargs(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  %5 = load i32, ptr %3, align 4
  %6 = icmp sgt i32 %5, 5
  br i1 %6, label %7, label %12

7:                                                ; preds = %2
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds ptr, ptr %8, i64 5
  %10 = load ptr, ptr %9, align 8
  %11 = call i32 @atoi(ptr noundef %10) #8
  store i32 %11, ptr @DebugFlag, align 4
  br label %13

12:                                               ; preds = %2
  store i32 0, ptr @DebugFlag, align 4
  br label %13

13:                                               ; preds = %12, %7
  %14 = load i32, ptr %3, align 4
  %15 = icmp sgt i32 %14, 4
  br i1 %15, label %16, label %21

16:                                               ; preds = %13
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds ptr, ptr %17, i64 4
  %19 = load ptr, ptr %18, align 8
  %20 = call i32 @atoi(ptr noundef %19) #8
  store i32 %20, ptr @__NumNodes, align 4
  br label %22

21:                                               ; preds = %13
  store i32 4, ptr @__NumNodes, align 4
  br label %22

22:                                               ; preds = %21, %16
  %23 = load i32, ptr %3, align 4
  %24 = icmp sgt i32 %23, 1
  br i1 %24, label %25, label %30

25:                                               ; preds = %22
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds ptr, ptr %26, i64 1
  %28 = load ptr, ptr %27, align 8
  %29 = call i32 @atoi(ptr noundef %28) #8
  store i32 %29, ptr @n_nodes, align 4
  br label %31

30:                                               ; preds = %22
  store i32 64, ptr @n_nodes, align 4
  br label %31

31:                                               ; preds = %30, %25
  %32 = load i32, ptr %3, align 4
  %33 = icmp sgt i32 %32, 2
  br i1 %33, label %34, label %39

34:                                               ; preds = %31
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds ptr, ptr %35, i64 2
  %37 = load ptr, ptr %36, align 8
  %38 = call i32 @atoi(ptr noundef %37) #8
  store i32 %38, ptr @d_nodes, align 4
  br label %40

39:                                               ; preds = %31
  store i32 3, ptr @d_nodes, align 4
  br label %40

40:                                               ; preds = %39, %34
  %41 = load i32, ptr %3, align 4
  %42 = icmp sgt i32 %41, 3
  br i1 %42, label %43, label %48

43:                                               ; preds = %40
  %44 = load ptr, ptr %4, align 8
  %45 = getelementptr inbounds ptr, ptr %44, i64 3
  %46 = load ptr, ptr %45, align 8
  %47 = call i32 @atoi(ptr noundef %46) #8
  store i32 %47, ptr @local_p, align 4
  br label %49

48:                                               ; preds = %40
  store i32 75, ptr @local_p, align 4
  br label %49

49:                                               ; preds = %48, %43
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind willreturn memory(read) }

!llvm.ident = !{!0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
