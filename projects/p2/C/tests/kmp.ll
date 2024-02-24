; ModuleID = 'kmp.prof.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.rndmill = type { i64, i64, i64 }

@next = dso_local global ptr null, align 8
@.str = private unnamed_addr constant [29 x i8] c"Usage:\0A\09%s <ref|train|test>\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"ref\00", align 1
@.str.2 = private unnamed_addr constant [30 x i8] c"KMP with reference input set\0A\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"train\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"KMP with test input set\0A\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"test\00", align 1
@.str.6 = private unnamed_addr constant [43 x i8] c"Invalid data set use ref or train or test\0A\00", align 1
@buffer = dso_local global ptr null, align 8
@stderr = external global ptr, align 8
@.str.7 = private unnamed_addr constant [19 x i8] c"Not enough memory\0A\00", align 1
@pat = dso_local global ptr null, align 8
@.str.8 = private unnamed_addr constant [20 x i8] c"Benchmark begin...\0A\00", align 1
@.str.9 = private unnamed_addr constant [13 x i8] c"%2d Pattern:\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.11 = private unnamed_addr constant [18 x i8] c": found %d times\0A\00", align 1
@.str.12 = private unnamed_addr constant [21 x i8] c"Benchmark finish...\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @preprocpat(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds i32, ptr %7, i64 0
  store i32 -1, ptr %8, align 4
  store i32 -1, ptr %6, align 4
  br label %9

9:                                                ; preds = %65, %2
  %10 = load i32, ptr %6, align 4
  %11 = icmp eq i32 %10, -1
  br i1 %11, label %26, label %12

12:                                               ; preds = %9
  %13 = load ptr, ptr %3, align 8
  %14 = load i32, ptr %5, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i8, ptr %13, i64 %15
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i32
  %19 = load ptr, ptr %3, align 8
  %20 = load i32, ptr %6, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8, ptr %19, i64 %21
  %23 = load i8, ptr %22, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp eq i32 %18, %24
  br i1 %25, label %26, label %58

26:                                               ; preds = %12, %9
  %27 = load i32, ptr %5, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %5, align 4
  %29 = load i32, ptr %6, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %6, align 4
  %31 = load ptr, ptr %3, align 8
  %32 = load i32, ptr %6, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8, ptr %31, i64 %33
  %35 = load i8, ptr %34, align 1
  %36 = sext i8 %35 to i32
  %37 = load ptr, ptr %3, align 8
  %38 = load i32, ptr %5, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8, ptr %37, i64 %39
  %41 = load i8, ptr %40, align 1
  %42 = sext i8 %41 to i32
  %43 = icmp eq i32 %36, %42
  br i1 %43, label %44, label %50

44:                                               ; preds = %26
  %45 = load ptr, ptr %4, align 8
  %46 = load i32, ptr %6, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, ptr %45, i64 %47
  %49 = load i32, ptr %48, align 4
  br label %52

50:                                               ; preds = %26
  %51 = load i32, ptr %6, align 4
  br label %52

52:                                               ; preds = %50, %44
  %53 = phi i32 [ %49, %44 ], [ %51, %50 ]
  %54 = load ptr, ptr %4, align 8
  %55 = load i32, ptr %5, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, ptr %54, i64 %56
  store i32 %53, ptr %57, align 4
  br label %64

58:                                               ; preds = %12
  %59 = load ptr, ptr %4, align 8
  %60 = load i32, ptr %6, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, ptr %59, i64 %61
  %63 = load i32, ptr %62, align 4
  store i32 %63, ptr %6, align 4
  br label %64

64:                                               ; preds = %58, %52
  br label %65

65:                                               ; preds = %64
  %66 = load ptr, ptr %3, align 8
  %67 = load i32, ptr %5, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i8, ptr %66, i64 %68
  %70 = load i8, ptr %69, align 1
  %71 = sext i8 %70 to i32
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %9, label %73

73:                                               ; preds = %65
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @search(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i8, ptr %7, align 1
  %9 = sext i8 %8 to i32
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

11:                                               ; preds = %2
  %12 = load ptr, ptr %5, align 8
  store ptr %12, ptr %3, align 8
  br label %62

13:                                               ; preds = %2
  %14 = load ptr, ptr %4, align 8
  %15 = load ptr, ptr @next, align 8
  call void @preprocpat(ptr noundef %14, ptr noundef %15)
  store i32 0, ptr %6, align 4
  br label %16

16:                                               ; preds = %60, %13
  %17 = load ptr, ptr %5, align 8
  %18 = load i8, ptr %17, align 1
  %19 = sext i8 %18 to i32
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %61

21:                                               ; preds = %16
  %22 = load i32, ptr %6, align 4
  %23 = icmp eq i32 %22, -1
  br i1 %23, label %35, label %24

24:                                               ; preds = %21
  %25 = load ptr, ptr %4, align 8
  %26 = load i32, ptr %6, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i8, ptr %25, i64 %27
  %29 = load i8, ptr %28, align 1
  %30 = sext i8 %29 to i32
  %31 = load ptr, ptr %5, align 8
  %32 = load i8, ptr %31, align 1
  %33 = sext i8 %32 to i32
  %34 = icmp eq i32 %30, %33
  br i1 %34, label %35, label %54

35:                                               ; preds = %24, %21
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds i8, ptr %36, i32 1
  store ptr %37, ptr %5, align 8
  %38 = load i32, ptr %6, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %6, align 4
  %40 = load ptr, ptr %4, align 8
  %41 = load i32, ptr %6, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, ptr %40, i64 %42
  %44 = load i8, ptr %43, align 1
  %45 = sext i8 %44 to i32
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %53

47:                                               ; preds = %35
  %48 = load ptr, ptr %5, align 8
  %49 = load i32, ptr %6, align 4
  %50 = sext i32 %49 to i64
  %51 = sub i64 0, %50
  %52 = getelementptr inbounds i8, ptr %48, i64 %51
  store ptr %52, ptr %3, align 8
  br label %62

53:                                               ; preds = %35
  br label %60

54:                                               ; preds = %24
  %55 = load ptr, ptr @next, align 8
  %56 = load i32, ptr %6, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, ptr %55, i64 %57
  %59 = load i32, ptr %58, align 4
  store i32 %59, ptr %6, align 4
  br label %60

60:                                               ; preds = %54, %53
  br label %16

61:                                               ; preds = %16
  store ptr null, ptr %3, align 8
  br label %62

62:                                               ; preds = %61, %47, %11
  %63 = load ptr, ptr %3, align 8
  ret ptr %63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %13 = load i32, ptr %4, align 4
  %14 = icmp slt i32 %13, 2
  br i1 %14, label %15, label %20

15:                                               ; preds = %2
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds ptr, ptr %16, i64 0
  %18 = load ptr, ptr %17, align 8
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %18)
  call void @exit(i32 noundef 0) #6
  unreachable

20:                                               ; preds = %2
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds ptr, ptr %21, i64 1
  %23 = load ptr, ptr %22, align 8
  %24 = call i32 @strcasecmp(ptr noundef %23, ptr noundef @.str.1) #7
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %28

26:                                               ; preds = %20
  store i32 524305, ptr %9, align 4
  store i32 6, ptr %8, align 4
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %48

28:                                               ; preds = %20
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds ptr, ptr %29, i64 1
  %31 = load ptr, ptr %30, align 8
  %32 = call i32 @strcasecmp(ptr noundef %31, ptr noundef @.str.3) #7
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %36

34:                                               ; preds = %28
  store i32 98321, ptr %9, align 4
  store i32 5, ptr %8, align 4
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %47

36:                                               ; preds = %28
  %37 = load ptr, ptr %5, align 8
  %38 = getelementptr inbounds ptr, ptr %37, i64 1
  %39 = load ptr, ptr %38, align 8
  %40 = call i32 @strcasecmp(ptr noundef %39, ptr noundef @.str.5) #7
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %44

42:                                               ; preds = %36
  store i32 32785, ptr %9, align 4
  store i32 4, ptr %8, align 4
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %46

44:                                               ; preds = %36
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  call void @exit(i32 noundef -1) #6
  unreachable

46:                                               ; preds = %42
  br label %47

47:                                               ; preds = %46, %34
  br label %48

48:                                               ; preds = %47, %26
  %49 = load i32, ptr %9, align 4
  %50 = sext i32 %49 to i64
  %51 = call noalias ptr @malloc(i64 noundef %50) #8
  store ptr %51, ptr @buffer, align 8
  %52 = load ptr, ptr @buffer, align 8
  %53 = icmp ne ptr %52, null
  br i1 %53, label %57, label %54

54:                                               ; preds = %48
  %55 = load ptr, ptr @stderr, align 8
  %56 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %55, ptr noundef @.str.7)
  call void @exit(i32 noundef 0) #6
  unreachable

57:                                               ; preds = %48
  %58 = call ptr @init_mill(i64 noundef 63009, i64 noundef 12584, i64 noundef 33363)
  store ptr %58, ptr %10, align 8
  %59 = load i32, ptr %8, align 4
  %60 = add nsw i32 %59, 1
  %61 = sext i32 %60 to i64
  %62 = call noalias ptr @malloc(i64 noundef %61) #8
  store ptr %62, ptr @pat, align 8
  %63 = load i32, ptr %8, align 4
  %64 = sext i32 %63 to i64
  %65 = mul i64 4, %64
  %66 = call noalias ptr @malloc(i64 noundef %65) #8
  store ptr %66, ptr @next, align 8
  %67 = load ptr, ptr @pat, align 8
  %68 = icmp ne ptr %67, null
  br i1 %68, label %69, label %72

69:                                               ; preds = %57
  %70 = load ptr, ptr @next, align 8
  %71 = icmp ne ptr %70, null
  br i1 %71, label %75, label %72

72:                                               ; preds = %69, %57
  %73 = load ptr, ptr @stderr, align 8
  %74 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %73, ptr noundef @.str.7)
  call void @exit(i32 noundef 0) #6
  unreachable

75:                                               ; preds = %69
  %76 = load ptr, ptr @stderr, align 8
  %77 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %76, ptr noundef @.str.8)
  store i32 0, ptr %6, align 4
  br label %78

78:                                               ; preds = %92, %75
  %79 = load i32, ptr %6, align 4
  %80 = load i32, ptr %9, align 4
  %81 = icmp slt i32 %79, %80
  br i1 %81, label %82, label %95

82:                                               ; preds = %78
  %83 = load ptr, ptr %10, align 8
  %84 = call i64 @rndnum(ptr noundef %83)
  %85 = urem i64 %84, 7
  %86 = add i64 %85, 97
  %87 = trunc i64 %86 to i8
  %88 = load ptr, ptr @buffer, align 8
  %89 = load i32, ptr %6, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i8, ptr %88, i64 %90
  store i8 %87, ptr %91, align 1
  br label %92

92:                                               ; preds = %82
  %93 = load i32, ptr %6, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, ptr %6, align 4
  br label %78

95:                                               ; preds = %78
  %96 = load ptr, ptr @buffer, align 8
  %97 = load i32, ptr %9, align 4
  %98 = sub nsw i32 %97, 1
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i8, ptr %96, i64 %99
  store i8 0, ptr %100, align 1
  store i32 0, ptr %7, align 4
  br label %101

101:                                              ; preds = %183, %95
  %102 = load i32, ptr %7, align 4
  %103 = icmp slt i32 %102, 23
  br i1 %103, label %104, label %186

104:                                              ; preds = %101
  %105 = load i32, ptr %7, align 4
  %106 = add nsw i32 %105, 1
  %107 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %106)
  store i32 0, ptr %6, align 4
  br label %108

108:                                              ; preds = %129, %104
  %109 = load i32, ptr %6, align 4
  %110 = load i32, ptr %8, align 4
  %111 = icmp slt i32 %109, %110
  br i1 %111, label %112, label %132

112:                                              ; preds = %108
  %113 = load ptr, ptr %10, align 8
  %114 = call i64 @rndnum(ptr noundef %113)
  %115 = urem i64 %114, 7
  %116 = add i64 %115, 97
  %117 = trunc i64 %116 to i8
  %118 = load ptr, ptr @pat, align 8
  %119 = load i32, ptr %6, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i8, ptr %118, i64 %120
  store i8 %117, ptr %121, align 1
  %122 = load ptr, ptr @pat, align 8
  %123 = load i32, ptr %6, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i8, ptr %122, i64 %124
  %126 = load i8, ptr %125, align 1
  %127 = sext i8 %126 to i32
  %128 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %127)
  br label %129

129:                                              ; preds = %112
  %130 = load i32, ptr %6, align 4
  %131 = add nsw i32 %130, 1
  store i32 %131, ptr %6, align 4
  br label %108

132:                                              ; preds = %108
  %133 = load ptr, ptr @pat, align 8
  %134 = load i32, ptr %8, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i8, ptr %133, i64 %135
  store i8 0, ptr %136, align 1
  %137 = load ptr, ptr @buffer, align 8
  %138 = load i32, ptr %9, align 4
  %139 = mul nsw i32 3, %138
  %140 = load i32, ptr %7, align 4
  %141 = srem i32 %140, 3
  %142 = add nsw i32 %141, 3
  %143 = sdiv i32 %139, %142
  %144 = sub nsw i32 %143, 1
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i8, ptr %137, i64 %145
  store i8 0, ptr %146, align 1
  store i32 0, ptr %12, align 4
  %147 = load ptr, ptr @buffer, align 8
  %148 = load i32, ptr %9, align 4
  %149 = mul nsw i32 3, %148
  %150 = load i32, ptr %7, align 4
  %151 = srem i32 %150, 3
  %152 = add nsw i32 %151, 3
  %153 = sdiv i32 %149, %152
  %154 = sub nsw i32 %153, 1
  %155 = sdiv i32 %154, 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds i8, ptr %147, i64 %156
  store ptr %157, ptr %11, align 8
  br label %158

158:                                              ; preds = %132, %165
  %159 = load ptr, ptr @pat, align 8
  %160 = load ptr, ptr %11, align 8
  %161 = call ptr @search(ptr noundef %159, ptr noundef %160)
  store ptr %161, ptr %11, align 8
  %162 = load ptr, ptr %11, align 8
  %163 = icmp eq ptr %162, null
  br i1 %163, label %164, label %165

164:                                              ; preds = %158
  br label %170

165:                                              ; preds = %158
  %166 = load ptr, ptr %11, align 8
  %167 = getelementptr inbounds i8, ptr %166, i32 1
  store ptr %167, ptr %11, align 8
  %168 = load i32, ptr %12, align 4
  %169 = add nsw i32 %168, 1
  store i32 %169, ptr %12, align 4
  br label %158

170:                                              ; preds = %164
  %171 = load i32, ptr %12, align 4
  %172 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %171)
  %173 = load ptr, ptr @buffer, align 8
  %174 = load i32, ptr %9, align 4
  %175 = mul nsw i32 3, %174
  %176 = load i32, ptr %7, align 4
  %177 = srem i32 %176, 3
  %178 = add nsw i32 %177, 3
  %179 = sdiv i32 %175, %178
  %180 = sub nsw i32 %179, 1
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds i8, ptr %173, i64 %181
  store i8 97, ptr %182, align 1
  br label %183

183:                                              ; preds = %170
  %184 = load i32, ptr %7, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, ptr %7, align 4
  br label %101

186:                                              ; preds = %101
  %187 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %188 = load ptr, ptr %10, align 8
  call void @nuke_mill(ptr noundef %188)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcasecmp(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #4

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @init_mill(i64 noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  store i64 %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %8 = call noalias ptr @malloc(i64 noundef 24) #8
  store ptr %8, ptr %7, align 8
  %9 = load i64, ptr %4, align 8
  %10 = load ptr, ptr %7, align 8
  %11 = getelementptr inbounds %struct.rndmill, ptr %10, i32 0, i32 0
  store i64 %9, ptr %11, align 8
  %12 = load i64, ptr %5, align 8
  %13 = load ptr, ptr %7, align 8
  %14 = getelementptr inbounds %struct.rndmill, ptr %13, i32 0, i32 1
  store i64 %12, ptr %14, align 8
  %15 = load i64, ptr %6, align 8
  %16 = load ptr, ptr %7, align 8
  %17 = getelementptr inbounds %struct.rndmill, ptr %16, i32 0, i32 2
  store i64 %15, ptr %17, align 8
  %18 = load ptr, ptr %7, align 8
  ret ptr %18
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @nuke_mill(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %3) #9
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @rndnum(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i64 0, ptr %3, align 8
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %104, %1
  %7 = load i32, ptr %5, align 4
  %8 = icmp slt i32 %7, 32
  br i1 %8, label %9, label %107

9:                                                ; preds = %6
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.rndmill, ptr %10, i32 0, i32 0
  %12 = load i64, ptr %11, align 8
  %13 = lshr i64 %12, 31
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.rndmill, ptr %14, i32 0, i32 0
  %16 = load i64, ptr %15, align 8
  %17 = lshr i64 %16, 6
  %18 = xor i64 %13, %17
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.rndmill, ptr %19, i32 0, i32 0
  %21 = load i64, ptr %20, align 8
  %22 = lshr i64 %21, 4
  %23 = xor i64 %18, %22
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds %struct.rndmill, ptr %24, i32 0, i32 0
  %26 = load i64, ptr %25, align 8
  %27 = lshr i64 %26, 2
  %28 = xor i64 %23, %27
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds %struct.rndmill, ptr %29, i32 0, i32 0
  %31 = load i64, ptr %30, align 8
  %32 = shl i64 %31, 1
  %33 = xor i64 %28, %32
  %34 = load ptr, ptr %2, align 8
  %35 = getelementptr inbounds %struct.rndmill, ptr %34, i32 0, i32 0
  %36 = load i64, ptr %35, align 8
  %37 = xor i64 %33, %36
  %38 = and i64 %37, 1
  %39 = shl i64 %38, 31
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr inbounds %struct.rndmill, ptr %40, i32 0, i32 0
  %42 = load i64, ptr %41, align 8
  %43 = lshr i64 %42, 1
  %44 = or i64 %39, %43
  %45 = load ptr, ptr %2, align 8
  %46 = getelementptr inbounds %struct.rndmill, ptr %45, i32 0, i32 0
  store i64 %44, ptr %46, align 8
  %47 = load ptr, ptr %2, align 8
  %48 = getelementptr inbounds %struct.rndmill, ptr %47, i32 0, i32 1
  %49 = load i64, ptr %48, align 8
  %50 = lshr i64 %49, 30
  %51 = load ptr, ptr %2, align 8
  %52 = getelementptr inbounds %struct.rndmill, ptr %51, i32 0, i32 1
  %53 = load i64, ptr %52, align 8
  %54 = lshr i64 %53, 2
  %55 = xor i64 %50, %54
  %56 = and i64 %55, 1
  %57 = shl i64 %56, 30
  %58 = load ptr, ptr %2, align 8
  %59 = getelementptr inbounds %struct.rndmill, ptr %58, i32 0, i32 1
  %60 = load i64, ptr %59, align 8
  %61 = lshr i64 %60, 1
  %62 = or i64 %57, %61
  %63 = load ptr, ptr %2, align 8
  %64 = getelementptr inbounds %struct.rndmill, ptr %63, i32 0, i32 1
  store i64 %62, ptr %64, align 8
  %65 = load ptr, ptr %2, align 8
  %66 = getelementptr inbounds %struct.rndmill, ptr %65, i32 0, i32 2
  %67 = load i64, ptr %66, align 8
  %68 = lshr i64 %67, 28
  %69 = load ptr, ptr %2, align 8
  %70 = getelementptr inbounds %struct.rndmill, ptr %69, i32 0, i32 2
  %71 = load i64, ptr %70, align 8
  %72 = lshr i64 %71, 1
  %73 = xor i64 %68, %72
  %74 = and i64 %73, 1
  %75 = shl i64 %74, 28
  %76 = load ptr, ptr %2, align 8
  %77 = getelementptr inbounds %struct.rndmill, ptr %76, i32 0, i32 2
  %78 = load i64, ptr %77, align 8
  %79 = lshr i64 %78, 1
  %80 = or i64 %75, %79
  %81 = load ptr, ptr %2, align 8
  %82 = getelementptr inbounds %struct.rndmill, ptr %81, i32 0, i32 2
  store i64 %80, ptr %82, align 8
  %83 = load ptr, ptr %2, align 8
  %84 = getelementptr inbounds %struct.rndmill, ptr %83, i32 0, i32 0
  %85 = load i64, ptr %84, align 8
  %86 = load ptr, ptr %2, align 8
  %87 = getelementptr inbounds %struct.rndmill, ptr %86, i32 0, i32 1
  %88 = load i64, ptr %87, align 8
  %89 = and i64 %85, %88
  %90 = load ptr, ptr %2, align 8
  %91 = getelementptr inbounds %struct.rndmill, ptr %90, i32 0, i32 0
  %92 = load i64, ptr %91, align 8
  %93 = xor i64 %92, -1
  %94 = load ptr, ptr %2, align 8
  %95 = getelementptr inbounds %struct.rndmill, ptr %94, i32 0, i32 2
  %96 = load i64, ptr %95, align 8
  %97 = and i64 %93, %96
  %98 = or i64 %89, %97
  %99 = and i64 %98, 1
  store i64 %99, ptr %4, align 8
  %100 = load i64, ptr %3, align 8
  %101 = shl i64 %100, 1
  %102 = load i64, ptr %4, align 8
  %103 = xor i64 %101, %102
  store i64 %103, ptr %3, align 8
  br label %104

104:                                              ; preds = %9
  %105 = load i32, ptr %5, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %5, align 4
  br label %6

107:                                              ; preds = %6
  %108 = load i64, ptr %3, align 8
  ret i64 %108
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @checkpoint_mill(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.rndmill, ptr %3, i32 0, i32 0
  %5 = load i64, ptr %4, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.rndmill, ptr %6, i32 0, i32 1
  %8 = load i64, ptr %7, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.rndmill, ptr %9, i32 0, i32 2
  %11 = load i64, ptr %10, align 8
  %12 = call ptr @init_mill(i64 noundef %5, i64 noundef %8, i64 noundef %11)
  ret ptr %12
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @reset_mill(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %struct.rndmill, ptr %5, i32 0, i32 0
  %7 = load i64, ptr %6, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.rndmill, ptr %8, i32 0, i32 0
  store i64 %7, ptr %9, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.rndmill, ptr %10, i32 0, i32 1
  %12 = load i64, ptr %11, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.rndmill, ptr %13, i32 0, i32 1
  store i64 %12, ptr %14, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.rndmill, ptr %15, i32 0, i32 2
  %17 = load i64, ptr %16, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.rndmill, ptr %18, i32 0, i32 2
  store i64 %17, ptr %19, align 8
  ret void
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind willreturn memory(read) }
attributes #8 = { nounwind allocsize(0) }
attributes #9 = { nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
