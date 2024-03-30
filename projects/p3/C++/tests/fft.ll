; ModuleID = 'fft.prof.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"Usage: fft <waves> <length> -i\0A\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"-i performs an inverse fft\0A\00", align 1
@.str.2 = private unnamed_addr constant [30 x i8] c"make <waves> random sinusoids\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"<length> is the number of samples\0A\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"-i\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"RealOut:\0A\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"%f \09\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"ImagOut:\0A\00", align 1
@.str.9 = private unnamed_addr constant [73 x i8] c">>> Error in fftmisc.c: argument %d to NumberOfBitsNeeded is too small.\0A\00", align 1
@stderr = external global ptr, align 8
@.str.12 = private unnamed_addr constant [52 x i8] c"Error in fft():  NumSamples=%u is not power of two\0A\00", align 1
@.str.1.13 = private unnamed_addr constant [7 x i8] c"RealIn\00", align 1
@.str.2.14 = private unnamed_addr constant [8 x i8] c"RealOut\00", align 1
@.str.3.15 = private unnamed_addr constant [8 x i8] c"ImagOut\00", align 1
@.str.4.16 = private unnamed_addr constant [35 x i8] c"Error in fft_float():  %s == NULL\0A\00", align 1

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
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 0, ptr %16, align 4
  %17 = load i32, ptr %4, align 4
  %18 = icmp slt i32 %17, 3
  br i1 %18, label %19, label %24

19:                                               ; preds = %2
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @exit(i32 noundef -1) #7
  unreachable

24:                                               ; preds = %2
  %25 = load i32, ptr %4, align 4
  %26 = icmp eq i32 %25, 4
  br i1 %26, label %27, label %35

27:                                               ; preds = %24
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds ptr, ptr %28, i64 3
  %30 = load ptr, ptr %29, align 8
  %31 = call i32 @strncmp(ptr noundef %30, ptr noundef @.str.4, i64 noundef 2) #8
  %32 = icmp ne i32 %31, 0
  %33 = xor i1 %32, true
  %34 = zext i1 %33 to i32
  store i32 %34, ptr %16, align 4
  br label %35

35:                                               ; preds = %27, %24
  br label %36

36:                                               ; preds = %35
  %37 = load ptr, ptr %5, align 8
  %38 = getelementptr inbounds ptr, ptr %37, i64 2
  %39 = load ptr, ptr %38, align 8
  %40 = call i32 @atoi(ptr noundef %39) #8
  store i32 %40, ptr %6, align 4
  %41 = load ptr, ptr %5, align 8
  %42 = getelementptr inbounds ptr, ptr %41, i64 1
  %43 = load ptr, ptr %42, align 8
  %44 = call i32 @atoi(ptr noundef %43) #8
  store i32 %44, ptr %7, align 4
  call void @srand(i32 noundef 1) #9
  %45 = load i32, ptr %6, align 4
  %46 = zext i32 %45 to i64
  %47 = mul i64 4, %46
  %48 = call noalias ptr @malloc(i64 noundef %47) #10
  store ptr %48, ptr %10, align 8
  %49 = load i32, ptr %6, align 4
  %50 = zext i32 %49 to i64
  %51 = mul i64 4, %50
  %52 = call noalias ptr @malloc(i64 noundef %51) #10
  store ptr %52, ptr %11, align 8
  %53 = load i32, ptr %6, align 4
  %54 = zext i32 %53 to i64
  %55 = mul i64 4, %54
  %56 = call noalias ptr @malloc(i64 noundef %55) #10
  store ptr %56, ptr %12, align 8
  %57 = load i32, ptr %6, align 4
  %58 = zext i32 %57 to i64
  %59 = mul i64 4, %58
  %60 = call noalias ptr @malloc(i64 noundef %59) #10
  store ptr %60, ptr %13, align 8
  %61 = load i32, ptr %7, align 4
  %62 = zext i32 %61 to i64
  %63 = mul i64 4, %62
  %64 = call noalias ptr @malloc(i64 noundef %63) #10
  store ptr %64, ptr %14, align 8
  %65 = load i32, ptr %7, align 4
  %66 = zext i32 %65 to i64
  %67 = mul i64 4, %66
  %68 = call noalias ptr @malloc(i64 noundef %67) #10
  store ptr %68, ptr %15, align 8
  store i32 0, ptr %8, align 4
  br label %69

69:                                               ; preds = %88, %36
  %70 = load i32, ptr %8, align 4
  %71 = load i32, ptr %7, align 4
  %72 = icmp ult i32 %70, %71
  br i1 %72, label %73, label %91

73:                                               ; preds = %69
  %74 = call i32 @rand() #9
  %75 = srem i32 %74, 1000
  %76 = sitofp i32 %75 to float
  %77 = load ptr, ptr %14, align 8
  %78 = load i32, ptr %8, align 4
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, ptr %77, i64 %79
  store float %76, ptr %80, align 4
  %81 = call i32 @rand() #9
  %82 = srem i32 %81, 1000
  %83 = sitofp i32 %82 to float
  %84 = load ptr, ptr %15, align 8
  %85 = load i32, ptr %8, align 4
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, ptr %84, i64 %86
  store float %83, ptr %87, align 4
  br label %88

88:                                               ; preds = %73
  %89 = load i32, ptr %8, align 4
  %90 = add i32 %89, 1
  store i32 %90, ptr %8, align 4
  br label %69

91:                                               ; preds = %69
  store i32 0, ptr %8, align 4
  br label %92

92:                                               ; preds = %168, %91
  %93 = load i32, ptr %8, align 4
  %94 = load i32, ptr %6, align 4
  %95 = icmp ult i32 %93, %94
  br i1 %95, label %96, label %171

96:                                               ; preds = %92
  %97 = load ptr, ptr %10, align 8
  %98 = load i32, ptr %8, align 4
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds float, ptr %97, i64 %99
  store float 0.000000e+00, ptr %100, align 4
  store i32 0, ptr %9, align 4
  br label %101

101:                                              ; preds = %164, %96
  %102 = load i32, ptr %9, align 4
  %103 = load i32, ptr %7, align 4
  %104 = icmp ult i32 %102, %103
  br i1 %104, label %105, label %167

105:                                              ; preds = %101
  %106 = call i32 @rand() #9
  %107 = srem i32 %106, 2
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %109, label %134

109:                                              ; preds = %105
  %110 = load ptr, ptr %14, align 8
  %111 = load i32, ptr %9, align 4
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds float, ptr %110, i64 %112
  %114 = load float, ptr %113, align 4
  %115 = fpext float %114 to double
  %116 = load ptr, ptr %15, align 8
  %117 = load i32, ptr %9, align 4
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds float, ptr %116, i64 %118
  %120 = load float, ptr %119, align 4
  %121 = load i32, ptr %8, align 4
  %122 = uitofp i32 %121 to float
  %123 = fmul float %120, %122
  %124 = fpext float %123 to double
  %125 = call double @cos(double noundef %124) #9
  %126 = load ptr, ptr %10, align 8
  %127 = load i32, ptr %8, align 4
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds float, ptr %126, i64 %128
  %130 = load float, ptr %129, align 4
  %131 = fpext float %130 to double
  %132 = call double @llvm.fmuladd.f64(double %115, double %125, double %131)
  %133 = fptrunc double %132 to float
  store float %133, ptr %129, align 4
  br label %159

134:                                              ; preds = %105
  %135 = load ptr, ptr %14, align 8
  %136 = load i32, ptr %9, align 4
  %137 = zext i32 %136 to i64
  %138 = getelementptr inbounds float, ptr %135, i64 %137
  %139 = load float, ptr %138, align 4
  %140 = fpext float %139 to double
  %141 = load ptr, ptr %15, align 8
  %142 = load i32, ptr %9, align 4
  %143 = zext i32 %142 to i64
  %144 = getelementptr inbounds float, ptr %141, i64 %143
  %145 = load float, ptr %144, align 4
  %146 = load i32, ptr %8, align 4
  %147 = uitofp i32 %146 to float
  %148 = fmul float %145, %147
  %149 = fpext float %148 to double
  %150 = call double @sin(double noundef %149) #9
  %151 = load ptr, ptr %10, align 8
  %152 = load i32, ptr %8, align 4
  %153 = zext i32 %152 to i64
  %154 = getelementptr inbounds float, ptr %151, i64 %153
  %155 = load float, ptr %154, align 4
  %156 = fpext float %155 to double
  %157 = call double @llvm.fmuladd.f64(double %140, double %150, double %156)
  %158 = fptrunc double %157 to float
  store float %158, ptr %154, align 4
  br label %159

159:                                              ; preds = %134, %109
  %160 = load ptr, ptr %11, align 8
  %161 = load i32, ptr %8, align 4
  %162 = zext i32 %161 to i64
  %163 = getelementptr inbounds float, ptr %160, i64 %162
  store float 0.000000e+00, ptr %163, align 4
  br label %164

164:                                              ; preds = %159
  %165 = load i32, ptr %9, align 4
  %166 = add i32 %165, 1
  store i32 %166, ptr %9, align 4
  br label %101

167:                                              ; preds = %101
  br label %168

168:                                              ; preds = %167
  %169 = load i32, ptr %8, align 4
  %170 = add i32 %169, 1
  store i32 %170, ptr %8, align 4
  br label %92

171:                                              ; preds = %92
  %172 = load i32, ptr %6, align 4
  %173 = load i32, ptr %16, align 4
  %174 = load ptr, ptr %10, align 8
  %175 = load ptr, ptr %11, align 8
  %176 = load ptr, ptr %12, align 8
  %177 = load ptr, ptr %13, align 8
  %178 = call i32 (i32, i32, ptr, ptr, ptr, ptr, ...) @fft_float(i32 noundef %172, i32 noundef %173, ptr noundef %174, ptr noundef %175, ptr noundef %176, ptr noundef %177)
  %179 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  store i32 0, ptr %8, align 4
  br label %180

180:                                              ; preds = %192, %171
  %181 = load i32, ptr %8, align 4
  %182 = load i32, ptr %6, align 4
  %183 = icmp ult i32 %181, %182
  br i1 %183, label %184, label %195

184:                                              ; preds = %180
  %185 = load ptr, ptr %12, align 8
  %186 = load i32, ptr %8, align 4
  %187 = zext i32 %186 to i64
  %188 = getelementptr inbounds float, ptr %185, i64 %187
  %189 = load float, ptr %188, align 4
  %190 = fpext float %189 to double
  %191 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, double noundef %190)
  br label %192

192:                                              ; preds = %184
  %193 = load i32, ptr %8, align 4
  %194 = add i32 %193, 1
  store i32 %194, ptr %8, align 4
  br label %180

195:                                              ; preds = %180
  %196 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %197 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  store i32 0, ptr %8, align 4
  br label %198

198:                                              ; preds = %210, %195
  %199 = load i32, ptr %8, align 4
  %200 = load i32, ptr %6, align 4
  %201 = icmp ult i32 %199, %200
  br i1 %201, label %202, label %213

202:                                              ; preds = %198
  %203 = load ptr, ptr %13, align 8
  %204 = load i32, ptr %8, align 4
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds float, ptr %203, i64 %205
  %207 = load float, ptr %206, align 4
  %208 = fpext float %207 to double
  %209 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, double noundef %208)
  br label %210

210:                                              ; preds = %202
  %211 = load i32, ptr %8, align 4
  %212 = add i32 %211, 1
  store i32 %212, ptr %8, align 4
  br label %198

213:                                              ; preds = %198
  %214 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %215 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %215) #9
  %216 = load ptr, ptr %11, align 8
  call void @free(ptr noundef %216) #9
  %217 = load ptr, ptr %12, align 8
  call void @free(ptr noundef %217) #9
  %218 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %218) #9
  %219 = load ptr, ptr %14, align 8
  call void @free(ptr noundef %219) #9
  %220 = load ptr, ptr %15, align 8
  call void @free(ptr noundef %220) #9
  call void @exit(i32 noundef 0) #7
  unreachable
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #3

; Function Attrs: nounwind
declare void @srand(i32 noundef) #4

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #5

; Function Attrs: nounwind
declare i32 @rand() #4

; Function Attrs: nounwind
declare double @cos(double noundef) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #6

; Function Attrs: nounwind
declare double @sin(double noundef) #4

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @IsPowerOfTwo(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp ult i32 %4, 2
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %15

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %3, align 4
  %10 = sub i32 %9, 1
  %11 = and i32 %8, %10
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %7
  store i32 0, ptr %2, align 4
  br label %15

14:                                               ; preds = %7
  store i32 1, ptr %2, align 4
  br label %15

15:                                               ; preds = %14, %13, %6
  %16 = load i32, ptr %2, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @NumberOfBitsNeeded(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = icmp ult i32 %4, 2
  br i1 %5, label %6, label %10

6:                                                ; preds = %1
  %7 = load ptr, ptr @stderr, align 8
  %8 = load i32, ptr %2, align 4
  %9 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef @.str.9, i32 noundef %8)
  call void @exit(i32 noundef 1) #7
  unreachable

10:                                               ; preds = %1
  store i32 0, ptr %3, align 4
  br label %11

11:                                               ; preds = %20, %10
  %12 = load i32, ptr %2, align 4
  %13 = load i32, ptr %3, align 4
  %14 = shl i32 1, %13
  %15 = and i32 %12, %14
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %11
  %18 = load i32, ptr %3, align 4
  ret i32 %18

19:                                               ; preds = %11
  br label %20

20:                                               ; preds = %19
  %21 = load i32, ptr %3, align 4
  %22 = add i32 %21, 1
  store i32 %22, ptr %3, align 4
  br label %11
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ReverseBits(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %19, %2
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp ult i32 %8, %9
  br i1 %10, label %11, label %22

11:                                               ; preds = %7
  %12 = load i32, ptr %6, align 4
  %13 = shl i32 %12, 1
  %14 = load i32, ptr %3, align 4
  %15 = and i32 %14, 1
  %16 = or i32 %13, %15
  store i32 %16, ptr %6, align 4
  %17 = load i32, ptr %3, align 4
  %18 = lshr i32 %17, 1
  store i32 %18, ptr %3, align 4
  br label %19

19:                                               ; preds = %11
  %20 = load i32, ptr %5, align 4
  %21 = add i32 %20, 1
  store i32 %21, ptr %5, align 4
  br label %7

22:                                               ; preds = %7
  %23 = load i32, ptr %6, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @Index_to_frequency(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %5, align 4
  %7 = load i32, ptr %4, align 4
  %8 = icmp uge i32 %6, %7
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  store double 0.000000e+00, ptr %3, align 8
  br label %31

10:                                               ; preds = %2
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %4, align 4
  %13 = udiv i32 %12, 2
  %14 = icmp ule i32 %11, %13
  br i1 %14, label %15, label %21

15:                                               ; preds = %10
  %16 = load i32, ptr %5, align 4
  %17 = uitofp i32 %16 to double
  %18 = load i32, ptr %4, align 4
  %19 = uitofp i32 %18 to double
  %20 = fdiv double %17, %19
  store double %20, ptr %3, align 8
  br label %31

21:                                               ; preds = %10
  br label %22

22:                                               ; preds = %21
  %23 = load i32, ptr %4, align 4
  %24 = load i32, ptr %5, align 4
  %25 = sub i32 %23, %24
  %26 = uitofp i32 %25 to double
  %27 = fneg double %26
  %28 = load i32, ptr %4, align 4
  %29 = uitofp i32 %28 to double
  %30 = fdiv double %27, %29
  store double %30, ptr %3, align 8
  br label %31

31:                                               ; preds = %22, %15, %9
  %32 = load double, ptr %3, align 8
  ret double %32
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @fft_float(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca double, align 8
  %21 = alloca double, align 8
  %22 = alloca double, align 8
  %23 = alloca double, align 8
  %24 = alloca double, align 8
  %25 = alloca double, align 8
  %26 = alloca double, align 8
  %27 = alloca double, align 8
  %28 = alloca double, align 8
  %29 = alloca [3 x double], align 16
  %30 = alloca [3 x double], align 16
  %31 = alloca double, align 8
  %32 = alloca double, align 8
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  store double 0x401921FB54442D18, ptr %20, align 8
  %33 = load i32, ptr %7, align 4
  %34 = call i32 @IsPowerOfTwo(i32 noundef %33)
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %40, label %36

36:                                               ; preds = %6
  %37 = load ptr, ptr @stderr, align 8
  %38 = load i32, ptr %7, align 4
  %39 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %37, ptr noundef @.str.12, i32 noundef %38)
  call void @exit(i32 noundef 1) #7
  unreachable

40:                                               ; preds = %6
  %41 = load i32, ptr %8, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %46

43:                                               ; preds = %40
  %44 = load double, ptr %20, align 8
  %45 = fneg double %44
  store double %45, ptr %20, align 8
  br label %46

46:                                               ; preds = %43, %40
  %47 = load ptr, ptr %9, align 8
  call void @CheckPointer(ptr noundef %47, ptr noundef @.str.1.13)
  %48 = load ptr, ptr %11, align 8
  call void @CheckPointer(ptr noundef %48, ptr noundef @.str.2.14)
  %49 = load ptr, ptr %12, align 8
  call void @CheckPointer(ptr noundef %49, ptr noundef @.str.3.15)
  %50 = load i32, ptr %7, align 4
  %51 = call i32 @NumberOfBitsNeeded(i32 noundef %50)
  store i32 %51, ptr %13, align 4
  store i32 0, ptr %14, align 4
  br label %52

52:                                               ; preds = %86, %46
  %53 = load i32, ptr %14, align 4
  %54 = load i32, ptr %7, align 4
  %55 = icmp ult i32 %53, %54
  br i1 %55, label %56, label %89

56:                                               ; preds = %52
  %57 = load i32, ptr %14, align 4
  %58 = load i32, ptr %13, align 4
  %59 = call i32 @ReverseBits(i32 noundef %57, i32 noundef %58)
  store i32 %59, ptr %15, align 4
  %60 = load ptr, ptr %9, align 8
  %61 = load i32, ptr %14, align 4
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, ptr %60, i64 %62
  %64 = load float, ptr %63, align 4
  %65 = load ptr, ptr %11, align 8
  %66 = load i32, ptr %15, align 4
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds float, ptr %65, i64 %67
  store float %64, ptr %68, align 4
  %69 = load ptr, ptr %10, align 8
  %70 = icmp eq ptr %69, null
  br i1 %70, label %71, label %72

71:                                               ; preds = %56
  br label %79

72:                                               ; preds = %56
  %73 = load ptr, ptr %10, align 8
  %74 = load i32, ptr %14, align 4
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds float, ptr %73, i64 %75
  %77 = load float, ptr %76, align 4
  %78 = fpext float %77 to double
  br label %79

79:                                               ; preds = %72, %71
  %80 = phi double [ 0.000000e+00, %71 ], [ %78, %72 ]
  %81 = fptrunc double %80 to float
  %82 = load ptr, ptr %12, align 8
  %83 = load i32, ptr %15, align 4
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds float, ptr %82, i64 %84
  store float %81, ptr %85, align 4
  br label %86

86:                                               ; preds = %79
  %87 = load i32, ptr %14, align 4
  %88 = add i32 %87, 1
  store i32 %88, ptr %14, align 4
  br label %52

89:                                               ; preds = %52
  store i32 1, ptr %19, align 4
  store i32 2, ptr %18, align 4
  br label %90

90:                                               ; preds = %256, %89
  %91 = load i32, ptr %18, align 4
  %92 = load i32, ptr %7, align 4
  %93 = icmp ule i32 %91, %92
  br i1 %93, label %94, label %259

94:                                               ; preds = %90
  %95 = load double, ptr %20, align 8
  %96 = load i32, ptr %18, align 4
  %97 = uitofp i32 %96 to double
  %98 = fdiv double %95, %97
  store double %98, ptr %23, align 8
  %99 = load double, ptr %23, align 8
  %100 = fmul double -2.000000e+00, %99
  %101 = call double @sin(double noundef %100) #9
  store double %101, ptr %24, align 8
  %102 = load double, ptr %23, align 8
  %103 = fneg double %102
  %104 = call double @sin(double noundef %103) #9
  store double %104, ptr %25, align 8
  %105 = load double, ptr %23, align 8
  %106 = fmul double -2.000000e+00, %105
  %107 = call double @cos(double noundef %106) #9
  store double %107, ptr %26, align 8
  %108 = load double, ptr %23, align 8
  %109 = fneg double %108
  %110 = call double @cos(double noundef %109) #9
  store double %110, ptr %27, align 8
  %111 = load double, ptr %27, align 8
  %112 = fmul double 2.000000e+00, %111
  store double %112, ptr %28, align 8
  store i32 0, ptr %14, align 4
  br label %113

113:                                              ; preds = %250, %94
  %114 = load i32, ptr %14, align 4
  %115 = load i32, ptr %7, align 4
  %116 = icmp ult i32 %114, %115
  br i1 %116, label %117, label %254

117:                                              ; preds = %113
  %118 = load double, ptr %26, align 8
  %119 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 2
  store double %118, ptr %119, align 16
  %120 = load double, ptr %27, align 8
  %121 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 1
  store double %120, ptr %121, align 8
  %122 = load double, ptr %24, align 8
  %123 = getelementptr inbounds [3 x double], ptr %30, i64 0, i64 2
  store double %122, ptr %123, align 16
  %124 = load double, ptr %25, align 8
  %125 = getelementptr inbounds [3 x double], ptr %30, i64 0, i64 1
  store double %124, ptr %125, align 8
  %126 = load i32, ptr %14, align 4
  store i32 %126, ptr %15, align 4
  store i32 0, ptr %17, align 4
  br label %127

127:                                              ; preds = %244, %117
  %128 = load i32, ptr %17, align 4
  %129 = load i32, ptr %19, align 4
  %130 = icmp ult i32 %128, %129
  br i1 %130, label %131, label %249

131:                                              ; preds = %127
  %132 = load double, ptr %28, align 8
  %133 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 1
  %134 = load double, ptr %133, align 8
  %135 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 2
  %136 = load double, ptr %135, align 16
  %137 = fneg double %136
  %138 = call double @llvm.fmuladd.f64(double %132, double %134, double %137)
  %139 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 0
  store double %138, ptr %139, align 16
  %140 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 1
  %141 = load double, ptr %140, align 8
  %142 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 2
  store double %141, ptr %142, align 16
  %143 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 0
  %144 = load double, ptr %143, align 16
  %145 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 1
  store double %144, ptr %145, align 8
  %146 = load double, ptr %28, align 8
  %147 = getelementptr inbounds [3 x double], ptr %30, i64 0, i64 1
  %148 = load double, ptr %147, align 8
  %149 = getelementptr inbounds [3 x double], ptr %30, i64 0, i64 2
  %150 = load double, ptr %149, align 16
  %151 = fneg double %150
  %152 = call double @llvm.fmuladd.f64(double %146, double %148, double %151)
  %153 = getelementptr inbounds [3 x double], ptr %30, i64 0, i64 0
  store double %152, ptr %153, align 16
  %154 = getelementptr inbounds [3 x double], ptr %30, i64 0, i64 1
  %155 = load double, ptr %154, align 8
  %156 = getelementptr inbounds [3 x double], ptr %30, i64 0, i64 2
  store double %155, ptr %156, align 16
  %157 = getelementptr inbounds [3 x double], ptr %30, i64 0, i64 0
  %158 = load double, ptr %157, align 16
  %159 = getelementptr inbounds [3 x double], ptr %30, i64 0, i64 1
  store double %158, ptr %159, align 8
  %160 = load i32, ptr %15, align 4
  %161 = load i32, ptr %19, align 4
  %162 = add i32 %160, %161
  store i32 %162, ptr %16, align 4
  %163 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 0
  %164 = load double, ptr %163, align 16
  %165 = load ptr, ptr %11, align 8
  %166 = load i32, ptr %16, align 4
  %167 = zext i32 %166 to i64
  %168 = getelementptr inbounds float, ptr %165, i64 %167
  %169 = load float, ptr %168, align 4
  %170 = fpext float %169 to double
  %171 = getelementptr inbounds [3 x double], ptr %30, i64 0, i64 0
  %172 = load double, ptr %171, align 16
  %173 = load ptr, ptr %12, align 8
  %174 = load i32, ptr %16, align 4
  %175 = zext i32 %174 to i64
  %176 = getelementptr inbounds float, ptr %173, i64 %175
  %177 = load float, ptr %176, align 4
  %178 = fpext float %177 to double
  %179 = fmul double %172, %178
  %180 = fneg double %179
  %181 = call double @llvm.fmuladd.f64(double %164, double %170, double %180)
  store double %181, ptr %21, align 8
  %182 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 0
  %183 = load double, ptr %182, align 16
  %184 = load ptr, ptr %12, align 8
  %185 = load i32, ptr %16, align 4
  %186 = zext i32 %185 to i64
  %187 = getelementptr inbounds float, ptr %184, i64 %186
  %188 = load float, ptr %187, align 4
  %189 = fpext float %188 to double
  %190 = getelementptr inbounds [3 x double], ptr %30, i64 0, i64 0
  %191 = load double, ptr %190, align 16
  %192 = load ptr, ptr %11, align 8
  %193 = load i32, ptr %16, align 4
  %194 = zext i32 %193 to i64
  %195 = getelementptr inbounds float, ptr %192, i64 %194
  %196 = load float, ptr %195, align 4
  %197 = fpext float %196 to double
  %198 = fmul double %191, %197
  %199 = call double @llvm.fmuladd.f64(double %183, double %189, double %198)
  store double %199, ptr %22, align 8
  %200 = load ptr, ptr %11, align 8
  %201 = load i32, ptr %15, align 4
  %202 = zext i32 %201 to i64
  %203 = getelementptr inbounds float, ptr %200, i64 %202
  %204 = load float, ptr %203, align 4
  %205 = fpext float %204 to double
  %206 = load double, ptr %21, align 8
  %207 = fsub double %205, %206
  %208 = fptrunc double %207 to float
  %209 = load ptr, ptr %11, align 8
  %210 = load i32, ptr %16, align 4
  %211 = zext i32 %210 to i64
  %212 = getelementptr inbounds float, ptr %209, i64 %211
  store float %208, ptr %212, align 4
  %213 = load ptr, ptr %12, align 8
  %214 = load i32, ptr %15, align 4
  %215 = zext i32 %214 to i64
  %216 = getelementptr inbounds float, ptr %213, i64 %215
  %217 = load float, ptr %216, align 4
  %218 = fpext float %217 to double
  %219 = load double, ptr %22, align 8
  %220 = fsub double %218, %219
  %221 = fptrunc double %220 to float
  %222 = load ptr, ptr %12, align 8
  %223 = load i32, ptr %16, align 4
  %224 = zext i32 %223 to i64
  %225 = getelementptr inbounds float, ptr %222, i64 %224
  store float %221, ptr %225, align 4
  %226 = load double, ptr %21, align 8
  %227 = load ptr, ptr %11, align 8
  %228 = load i32, ptr %15, align 4
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds float, ptr %227, i64 %229
  %231 = load float, ptr %230, align 4
  %232 = fpext float %231 to double
  %233 = fadd double %232, %226
  %234 = fptrunc double %233 to float
  store float %234, ptr %230, align 4
  %235 = load double, ptr %22, align 8
  %236 = load ptr, ptr %12, align 8
  %237 = load i32, ptr %15, align 4
  %238 = zext i32 %237 to i64
  %239 = getelementptr inbounds float, ptr %236, i64 %238
  %240 = load float, ptr %239, align 4
  %241 = fpext float %240 to double
  %242 = fadd double %241, %235
  %243 = fptrunc double %242 to float
  store float %243, ptr %239, align 4
  br label %244

244:                                              ; preds = %131
  %245 = load i32, ptr %15, align 4
  %246 = add i32 %245, 1
  store i32 %246, ptr %15, align 4
  %247 = load i32, ptr %17, align 4
  %248 = add i32 %247, 1
  store i32 %248, ptr %17, align 4
  br label %127

249:                                              ; preds = %127
  br label %250

250:                                              ; preds = %249
  %251 = load i32, ptr %18, align 4
  %252 = load i32, ptr %14, align 4
  %253 = add i32 %252, %251
  store i32 %253, ptr %14, align 4
  br label %113

254:                                              ; preds = %113
  %255 = load i32, ptr %18, align 4
  store i32 %255, ptr %19, align 4
  br label %256

256:                                              ; preds = %254
  %257 = load i32, ptr %18, align 4
  %258 = shl i32 %257, 1
  store i32 %258, ptr %18, align 4
  br label %90

259:                                              ; preds = %90
  %260 = load i32, ptr %8, align 4
  %261 = icmp ne i32 %260, 0
  br i1 %261, label %262, label %292

262:                                              ; preds = %259
  %263 = load i32, ptr %7, align 4
  %264 = uitofp i32 %263 to double
  store double %264, ptr %32, align 8
  store i32 0, ptr %14, align 4
  br label %265

265:                                              ; preds = %288, %262
  %266 = load i32, ptr %14, align 4
  %267 = load i32, ptr %7, align 4
  %268 = icmp ult i32 %266, %267
  br i1 %268, label %269, label %291

269:                                              ; preds = %265
  %270 = load double, ptr %32, align 8
  %271 = load ptr, ptr %11, align 8
  %272 = load i32, ptr %14, align 4
  %273 = zext i32 %272 to i64
  %274 = getelementptr inbounds float, ptr %271, i64 %273
  %275 = load float, ptr %274, align 4
  %276 = fpext float %275 to double
  %277 = fdiv double %276, %270
  %278 = fptrunc double %277 to float
  store float %278, ptr %274, align 4
  %279 = load double, ptr %32, align 8
  %280 = load ptr, ptr %12, align 8
  %281 = load i32, ptr %14, align 4
  %282 = zext i32 %281 to i64
  %283 = getelementptr inbounds float, ptr %280, i64 %282
  %284 = load float, ptr %283, align 4
  %285 = fpext float %284 to double
  %286 = fdiv double %285, %279
  %287 = fptrunc double %286 to float
  store float %287, ptr %283, align 4
  br label %288

288:                                              ; preds = %269
  %289 = load i32, ptr %14, align 4
  %290 = add i32 %289, 1
  store i32 %290, ptr %14, align 4
  br label %265

291:                                              ; preds = %265
  br label %292

292:                                              ; preds = %291, %259
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @CheckPointer(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %11

7:                                                ; preds = %2
  %8 = load ptr, ptr @stderr, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %8, ptr noundef @.str.4.16, ptr noundef %9)
  call void @exit(i32 noundef 1) #7
  unreachable

11:                                               ; preds = %2
  ret void
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind willreturn memory(read) }
attributes #9 = { nounwind }
attributes #10 = { nounwind allocsize(0) }

!llvm.ident = !{!0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
