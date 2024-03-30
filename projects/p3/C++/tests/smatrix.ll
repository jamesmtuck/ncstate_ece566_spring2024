; ModuleID = 'smatrix.prof.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@size = dso_local global i32 64, align 4
@total = dso_local global double 0.000000e+00, align 8
@.str = private unnamed_addr constant [30 x i8] c"Native Matrix Multiplication\0A\00", align 1
@RC = dso_local global [1048576 x float] zeroinitializer, align 16
@C = dso_local global [1024 x [1024 x i32]] zeroinitializer, align 16
@RA = dso_local global [1048576 x float] zeroinitializer, align 16
@A = dso_local global [1024 x [1024 x i32]] zeroinitializer, align 16
@RB = dso_local global [1048576 x float] zeroinitializer, align 16
@B = dso_local global [1024 x [1024 x i32]] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [24 x i8] c"usage:\0A\09smatrix [size]\0A\00", align 1
@.str.2 = private unnamed_addr constant [38 x i8] c"Matrix Multiplication Kernel (%dx%d)\0A\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"Phase 2\0A\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"Phase 3\0A\00", align 1
@.str.5 = private unnamed_addr constant [41 x i8] c"Verification total=%g should be 31599.2\0A\00", align 1
@.str.6 = private unnamed_addr constant [23 x i8] c"Verification total=%g\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @matmult() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %1, align 4
  br label %5

5:                                                ; preds = %75, %0
  %6 = load i32, ptr %1, align 4
  %7 = load i32, ptr @size, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %78

9:                                                ; preds = %5
  store i32 0, ptr %2, align 4
  br label %10

10:                                               ; preds = %71, %9
  %11 = load i32, ptr %2, align 4
  %12 = load i32, ptr @size, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %74

14:                                               ; preds = %10
  %15 = load i32, ptr %1, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [1024 x [1024 x i32]], ptr @C, i64 0, i64 %16
  %18 = getelementptr inbounds [1024 x i32], ptr %17, i64 0, i64 0
  %19 = load i32, ptr %18, align 16
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [1048576 x float], ptr @RC, i64 0, i64 %20
  store float 0.000000e+00, ptr %21, align 4
  store i32 0, ptr %3, align 4
  br label %22

22:                                               ; preds = %67, %14
  %23 = load i32, ptr %3, align 4
  %24 = load i32, ptr @size, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %70

26:                                               ; preds = %22
  %27 = load i32, ptr %1, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [1024 x [1024 x i32]], ptr @C, i64 0, i64 %28
  %30 = load i32, ptr %2, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [1024 x i32], ptr %29, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [1048576 x float], ptr @RC, i64 0, i64 %34
  %36 = load float, ptr %35, align 4
  %37 = load i32, ptr %1, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [1024 x [1024 x i32]], ptr @A, i64 0, i64 %38
  %40 = load i32, ptr %2, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [1024 x i32], ptr %39, i64 0, i64 %41
  %43 = load i32, ptr %42, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [1048576 x float], ptr @RA, i64 0, i64 %44
  %46 = load float, ptr %45, align 4
  %47 = load i32, ptr %2, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [1024 x [1024 x i32]], ptr @B, i64 0, i64 %48
  %50 = load i32, ptr %3, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [1024 x i32], ptr %49, i64 0, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [1048576 x float], ptr @RB, i64 0, i64 %54
  %56 = load float, ptr %55, align 4
  %57 = call float @llvm.fmuladd.f32(float %46, float %56, float %36)
  %58 = load i32, ptr %1, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [1024 x [1024 x i32]], ptr @C, i64 0, i64 %59
  %61 = load i32, ptr %2, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [1024 x i32], ptr %60, i64 0, i64 %62
  %64 = load i32, ptr %63, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [1048576 x float], ptr @RC, i64 0, i64 %65
  store float %57, ptr %66, align 4
  br label %67

67:                                               ; preds = %26
  %68 = load i32, ptr %3, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr %3, align 4
  br label %22

70:                                               ; preds = %22
  br label %71

71:                                               ; preds = %70
  %72 = load i32, ptr %2, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, ptr %2, align 4
  br label %10

74:                                               ; preds = %10
  br label %75

75:                                               ; preds = %74
  %76 = load i32, ptr %1, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, ptr %1, align 4
  br label %5

78:                                               ; preds = %5
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %10 = load i32, ptr %4, align 4
  %11 = icmp sgt i32 %10, 2
  br i1 %11, label %12, label %14

12:                                               ; preds = %2
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @exit(i32 noundef 0) #5
  unreachable

14:                                               ; preds = %2
  %15 = load i32, ptr %4, align 4
  %16 = icmp sgt i32 %15, 1
  br i1 %16, label %17, label %29

17:                                               ; preds = %14
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds ptr, ptr %18, i64 1
  %20 = load ptr, ptr %19, align 8
  %21 = call i32 @atoi(ptr noundef %20) #6
  store i32 %21, ptr @size, align 4
  %22 = load i32, ptr @size, align 4
  %23 = icmp slt i32 %22, 2
  br i1 %23, label %27, label %24

24:                                               ; preds = %17
  %25 = load i32, ptr @size, align 4
  %26 = icmp sgt i32 %25, 1024
  br i1 %26, label %27, label %28

27:                                               ; preds = %24, %17
  store i32 1024, ptr @size, align 4
  br label %28

28:                                               ; preds = %27, %24
  br label %29

29:                                               ; preds = %28, %14
  %30 = load i32, ptr @size, align 4
  %31 = load i32, ptr @size, align 4
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %30, i32 noundef %31)
  store i32 0, ptr %6, align 4
  br label %33

33:                                               ; preds = %90, %29
  %34 = load i32, ptr %6, align 4
  %35 = load i32, ptr @size, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %93

37:                                               ; preds = %33
  store i32 0, ptr %7, align 4
  br label %38

38:                                               ; preds = %86, %37
  %39 = load i32, ptr %7, align 4
  %40 = load i32, ptr @size, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %89

42:                                               ; preds = %38
  %43 = load i32, ptr %6, align 4
  %44 = load i32, ptr @size, align 4
  %45 = mul nsw i32 %43, %44
  %46 = load i32, ptr %7, align 4
  %47 = load i32, ptr @size, align 4
  %48 = mul nsw i32 %46, %47
  %49 = add nsw i32 %45, %48
  %50 = load i32, ptr @size, align 4
  %51 = srem i32 %49, %50
  %52 = load i32, ptr %6, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [1024 x [1024 x i32]], ptr @A, i64 0, i64 %53
  %55 = load i32, ptr %7, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [1024 x i32], ptr %54, i64 0, i64 %56
  store i32 %51, ptr %57, align 4
  %58 = load i32, ptr %6, align 4
  %59 = load i32, ptr @size, align 4
  %60 = mul nsw i32 %58, %59
  %61 = load i32, ptr %7, align 4
  %62 = add nsw i32 %60, %61
  %63 = load i32, ptr %6, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [1024 x [1024 x i32]], ptr @B, i64 0, i64 %64
  %66 = load i32, ptr %7, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [1024 x i32], ptr %65, i64 0, i64 %67
  store i32 %62, ptr %68, align 4
  %69 = load i32, ptr %6, align 4
  %70 = load i32, ptr @size, align 4
  %71 = mul nsw i32 %69, %70
  %72 = sdiv i32 %71, 2
  %73 = load i32, ptr %7, align 4
  %74 = load i32, ptr @size, align 4
  %75 = mul nsw i32 %73, %74
  %76 = sdiv i32 %75, 2
  %77 = add nsw i32 %72, %76
  %78 = load i32, ptr @size, align 4
  %79 = srem i32 %77, %78
  %80 = load i32, ptr %6, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [1024 x [1024 x i32]], ptr @C, i64 0, i64 %81
  %83 = load i32, ptr %7, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [1024 x i32], ptr %82, i64 0, i64 %84
  store i32 %79, ptr %85, align 4
  br label %86

86:                                               ; preds = %42
  %87 = load i32, ptr %7, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, ptr %7, align 4
  br label %38

89:                                               ; preds = %38
  br label %90

90:                                               ; preds = %89
  %91 = load i32, ptr %6, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, ptr %6, align 4
  br label %33

93:                                               ; preds = %33
  store i32 0, ptr %6, align 4
  br label %94

94:                                               ; preds = %145, %93
  %95 = load i32, ptr %6, align 4
  %96 = load i32, ptr @size, align 4
  %97 = icmp slt i32 %95, %96
  br i1 %97, label %98, label %148

98:                                               ; preds = %94
  store i32 0, ptr %7, align 4
  br label %99

99:                                               ; preds = %141, %98
  %100 = load i32, ptr %7, align 4
  %101 = load i32, ptr @size, align 4
  %102 = icmp slt i32 %100, %101
  br i1 %102, label %103, label %144

103:                                              ; preds = %99
  %104 = load i32, ptr %6, align 4
  %105 = load i32, ptr %7, align 4
  %106 = mul nsw i32 %104, %105
  %107 = load i32, ptr %6, align 4
  %108 = mul nsw i32 %106, %107
  %109 = add nsw i32 %108, 10
  %110 = sitofp i32 %109 to float
  %111 = load i32, ptr %6, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [1024 x [1024 x i32]], ptr @A, i64 0, i64 %112
  %114 = load i32, ptr %7, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [1024 x i32], ptr %113, i64 0, i64 %115
  %117 = load i32, ptr %116, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [1048576 x float], ptr @RA, i64 0, i64 %118
  store float %110, ptr %119, align 4
  %120 = load i32, ptr %6, align 4
  %121 = load i32, ptr %7, align 4
  %122 = load i32, ptr %6, align 4
  %123 = mul nsw i32 %121, %122
  %124 = load i32, ptr %6, align 4
  %125 = load i32, ptr %7, align 4
  %126 = mul nsw i32 %124, %125
  %127 = sdiv i32 %126, 3
  %128 = sub nsw i32 %123, %127
  %129 = add nsw i32 %128, 3
  %130 = sdiv i32 %120, %129
  %131 = sitofp i32 %130 to float
  %132 = load i32, ptr %6, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [1024 x [1024 x i32]], ptr @B, i64 0, i64 %133
  %135 = load i32, ptr %7, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [1024 x i32], ptr %134, i64 0, i64 %136
  %138 = load i32, ptr %137, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [1048576 x float], ptr @RB, i64 0, i64 %139
  store float %131, ptr %140, align 4
  br label %141

141:                                              ; preds = %103
  %142 = load i32, ptr %7, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, ptr %7, align 4
  br label %99

144:                                              ; preds = %99
  br label %145

145:                                              ; preds = %144
  %146 = load i32, ptr %6, align 4
  %147 = add nsw i32 %146, 1
  store i32 %147, ptr %6, align 4
  br label %94

148:                                              ; preds = %94
  %149 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @matmult()
  %150 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 0, ptr %6, align 4
  br label %151

151:                                              ; preds = %192, %148
  %152 = load i32, ptr %6, align 4
  %153 = load i32, ptr @size, align 4
  %154 = icmp slt i32 %152, %153
  br i1 %154, label %155, label %195

155:                                              ; preds = %151
  store i32 0, ptr %7, align 4
  br label %156

156:                                              ; preds = %188, %155
  %157 = load i32, ptr %7, align 4
  %158 = load i32, ptr @size, align 4
  %159 = icmp slt i32 %157, %158
  br i1 %159, label %160, label %191

160:                                              ; preds = %156
  %161 = load i32, ptr %6, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds [1024 x [1024 x i32]], ptr @C, i64 0, i64 %162
  %164 = load i32, ptr %7, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [1024 x i32], ptr %163, i64 0, i64 %165
  %167 = load i32, ptr %166, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [1048576 x float], ptr @RC, i64 0, i64 %168
  %170 = load float, ptr %169, align 4
  %171 = fcmp ogt float %170, 3.000000e+06
  br i1 %171, label %172, label %187

172:                                              ; preds = %160
  %173 = load i32, ptr %6, align 4
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [1024 x [1024 x i32]], ptr @C, i64 0, i64 %174
  %176 = load i32, ptr %7, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [1024 x i32], ptr %175, i64 0, i64 %177
  %179 = load i32, ptr %178, align 4
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds [1048576 x float], ptr @RC, i64 0, i64 %180
  %182 = load float, ptr %181, align 4
  %183 = fdiv float %182, 1.000000e+06
  %184 = fpext float %183 to double
  %185 = load double, ptr @total, align 8
  %186 = fadd double %185, %184
  store double %186, ptr @total, align 8
  br label %187

187:                                              ; preds = %172, %160
  br label %188

188:                                              ; preds = %187
  %189 = load i32, ptr %7, align 4
  %190 = add nsw i32 %189, 3
  store i32 %190, ptr %7, align 4
  br label %156

191:                                              ; preds = %156
  br label %192

192:                                              ; preds = %191
  %193 = load i32, ptr %6, align 4
  %194 = add nsw i32 %193, 2
  store i32 %194, ptr %6, align 4
  br label %151

195:                                              ; preds = %151
  %196 = load i32, ptr @size, align 4
  %197 = icmp eq i32 %196, 64
  br i1 %197, label %198, label %201

198:                                              ; preds = %195
  %199 = load double, ptr @total, align 8
  %200 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, double noundef %199)
  br label %204

201:                                              ; preds = %195
  %202 = load double, ptr @total, align 8
  %203 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, double noundef %202)
  br label %204

204:                                              ; preds = %201, %198
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind willreturn memory(read) }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
