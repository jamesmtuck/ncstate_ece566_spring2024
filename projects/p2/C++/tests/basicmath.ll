; ModuleID = 'basicmath.prof.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.int_sqrt = type { i32, i32 }

@.str = private unnamed_addr constant [39 x i8] c"********* CUBIC FUNCTIONS ***********\0A\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"Solutions:\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c" %f\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.4 = private unnamed_addr constant [41 x i8] c"********* INTEGER SQR ROOTS ***********\0A\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"sqrt(%3d) = %2d\0A\00", align 1
@.str.6 = private unnamed_addr constant [33 x i8] c"\0Asqrt(%lX) = %X, remainder = %X\0A\00", align 1
@.str.7 = private unnamed_addr constant [16 x i8] c"sqrt(%lX) = %X\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca [3 x double], align 16
  %7 = alloca double, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  %11 = alloca %struct.int_sqrt, align 4
  %12 = alloca i64, align 8
  store i32 0, ptr %1, align 4
  store double 1.000000e+00, ptr %2, align 8
  store double -1.050000e+01, ptr %3, align 8
  store double 3.200000e+01, ptr %4, align 8
  store double -3.000000e+01, ptr %5, align 8
  store i64 1072497001, ptr %10, align 8
  store i64 0, ptr %12, align 8
  %13 = load double, ptr %2, align 8
  %14 = load double, ptr %3, align 8
  %15 = load double, ptr %4, align 8
  %16 = load double, ptr %5, align 8
  %17 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 0
  call void @SolveCubic(double noundef %13, double noundef %14, double noundef %15, double noundef %16, ptr noundef %8, ptr noundef %17)
  store i32 0, ptr %9, align 4
  br label %18

18:                                               ; preds = %24, %0
  %19 = load i32, ptr %9, align 4
  %20 = icmp slt i32 %19, 100
  br i1 %20, label %21, label %27

21:                                               ; preds = %18
  %22 = load i32, ptr %9, align 4
  %23 = sext i32 %22 to i64
  call void @usqrt(i64 noundef %23, ptr noundef %11)
  br label %24

24:                                               ; preds = %21
  %25 = load i32, ptr %9, align 4
  %26 = add nsw i32 %25, 2
  store i32 %26, ptr %9, align 4
  br label %18

27:                                               ; preds = %18
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %29 = load double, ptr %2, align 8
  %30 = load double, ptr %3, align 8
  %31 = load double, ptr %4, align 8
  %32 = load double, ptr %5, align 8
  %33 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 0
  call void @SolveCubic(double noundef %29, double noundef %30, double noundef %31, double noundef %32, ptr noundef %8, ptr noundef %33)
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %9, align 4
  br label %35

35:                                               ; preds = %45, %27
  %36 = load i32, ptr %9, align 4
  %37 = load i32, ptr %8, align 4
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %39, label %48

39:                                               ; preds = %35
  %40 = load i32, ptr %9, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %41
  %43 = load double, ptr %42, align 8
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %43)
  br label %45

45:                                               ; preds = %39
  %46 = load i32, ptr %9, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %9, align 4
  br label %35

48:                                               ; preds = %35
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store double 1.000000e+00, ptr %2, align 8
  store double -4.500000e+00, ptr %3, align 8
  store double 1.700000e+01, ptr %4, align 8
  store double -3.000000e+01, ptr %5, align 8
  %50 = load double, ptr %2, align 8
  %51 = load double, ptr %3, align 8
  %52 = load double, ptr %4, align 8
  %53 = load double, ptr %5, align 8
  %54 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 0
  call void @SolveCubic(double noundef %50, double noundef %51, double noundef %52, double noundef %53, ptr noundef %8, ptr noundef %54)
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %9, align 4
  br label %56

56:                                               ; preds = %66, %48
  %57 = load i32, ptr %9, align 4
  %58 = load i32, ptr %8, align 4
  %59 = icmp slt i32 %57, %58
  br i1 %59, label %60, label %69

60:                                               ; preds = %56
  %61 = load i32, ptr %9, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %62
  %64 = load double, ptr %63, align 8
  %65 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %64)
  br label %66

66:                                               ; preds = %60
  %67 = load i32, ptr %9, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, ptr %9, align 4
  br label %56

69:                                               ; preds = %56
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store double 1.000000e+00, ptr %2, align 8
  store double -3.500000e+00, ptr %3, align 8
  store double 2.200000e+01, ptr %4, align 8
  store double -3.100000e+01, ptr %5, align 8
  %71 = load double, ptr %2, align 8
  %72 = load double, ptr %3, align 8
  %73 = load double, ptr %4, align 8
  %74 = load double, ptr %5, align 8
  %75 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 0
  call void @SolveCubic(double noundef %71, double noundef %72, double noundef %73, double noundef %74, ptr noundef %8, ptr noundef %75)
  %76 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %9, align 4
  br label %77

77:                                               ; preds = %87, %69
  %78 = load i32, ptr %9, align 4
  %79 = load i32, ptr %8, align 4
  %80 = icmp slt i32 %78, %79
  br i1 %80, label %81, label %90

81:                                               ; preds = %77
  %82 = load i32, ptr %9, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %83
  %85 = load double, ptr %84, align 8
  %86 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %85)
  br label %87

87:                                               ; preds = %81
  %88 = load i32, ptr %9, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, ptr %9, align 4
  br label %77

90:                                               ; preds = %77
  %91 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store double 1.000000e+00, ptr %2, align 8
  store double -1.370000e+01, ptr %3, align 8
  store double 1.000000e+00, ptr %4, align 8
  store double -3.500000e+01, ptr %5, align 8
  %92 = load double, ptr %2, align 8
  %93 = load double, ptr %3, align 8
  %94 = load double, ptr %4, align 8
  %95 = load double, ptr %5, align 8
  %96 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 0
  call void @SolveCubic(double noundef %92, double noundef %93, double noundef %94, double noundef %95, ptr noundef %8, ptr noundef %96)
  %97 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %9, align 4
  br label %98

98:                                               ; preds = %108, %90
  %99 = load i32, ptr %9, align 4
  %100 = load i32, ptr %8, align 4
  %101 = icmp slt i32 %99, %100
  br i1 %101, label %102, label %111

102:                                              ; preds = %98
  %103 = load i32, ptr %9, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %104
  %106 = load double, ptr %105, align 8
  %107 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %106)
  br label %108

108:                                              ; preds = %102
  %109 = load i32, ptr %9, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, ptr %9, align 4
  br label %98

111:                                              ; preds = %98
  %112 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store double 3.000000e+00, ptr %2, align 8
  store double 1.234000e+01, ptr %3, align 8
  store double 5.000000e+00, ptr %4, align 8
  store double 1.200000e+01, ptr %5, align 8
  %113 = load double, ptr %2, align 8
  %114 = load double, ptr %3, align 8
  %115 = load double, ptr %4, align 8
  %116 = load double, ptr %5, align 8
  %117 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 0
  call void @SolveCubic(double noundef %113, double noundef %114, double noundef %115, double noundef %116, ptr noundef %8, ptr noundef %117)
  %118 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %9, align 4
  br label %119

119:                                              ; preds = %129, %111
  %120 = load i32, ptr %9, align 4
  %121 = load i32, ptr %8, align 4
  %122 = icmp slt i32 %120, %121
  br i1 %122, label %123, label %132

123:                                              ; preds = %119
  %124 = load i32, ptr %9, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %125
  %127 = load double, ptr %126, align 8
  %128 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %127)
  br label %129

129:                                              ; preds = %123
  %130 = load i32, ptr %9, align 4
  %131 = add nsw i32 %130, 1
  store i32 %131, ptr %9, align 4
  br label %119

132:                                              ; preds = %119
  %133 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store double -8.000000e+00, ptr %2, align 8
  store double -6.789000e+01, ptr %3, align 8
  store double 6.000000e+00, ptr %4, align 8
  store double -2.360000e+01, ptr %5, align 8
  %134 = load double, ptr %2, align 8
  %135 = load double, ptr %3, align 8
  %136 = load double, ptr %4, align 8
  %137 = load double, ptr %5, align 8
  %138 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 0
  call void @SolveCubic(double noundef %134, double noundef %135, double noundef %136, double noundef %137, ptr noundef %8, ptr noundef %138)
  %139 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %140 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store double 4.500000e+01, ptr %2, align 8
  store double 8.670000e+00, ptr %3, align 8
  store double 7.500000e+00, ptr %4, align 8
  store double 3.400000e+01, ptr %5, align 8
  %141 = load double, ptr %2, align 8
  %142 = load double, ptr %3, align 8
  %143 = load double, ptr %4, align 8
  %144 = load double, ptr %5, align 8
  %145 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 0
  call void @SolveCubic(double noundef %141, double noundef %142, double noundef %143, double noundef %144, ptr noundef %8, ptr noundef %145)
  %146 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %147 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store double -1.200000e+01, ptr %2, align 8
  store double -1.700000e+00, ptr %3, align 8
  store double 5.300000e+00, ptr %4, align 8
  store double 1.600000e+01, ptr %5, align 8
  %148 = load double, ptr %2, align 8
  %149 = load double, ptr %3, align 8
  %150 = load double, ptr %4, align 8
  %151 = load double, ptr %5, align 8
  %152 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 0
  call void @SolveCubic(double noundef %148, double noundef %149, double noundef %150, double noundef %151, ptr noundef %8, ptr noundef %152)
  %153 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %9, align 4
  br label %154

154:                                              ; preds = %164, %132
  %155 = load i32, ptr %9, align 4
  %156 = load i32, ptr %8, align 4
  %157 = icmp slt i32 %155, %156
  br i1 %157, label %158, label %167

158:                                              ; preds = %154
  %159 = load i32, ptr %9, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %160
  %162 = load double, ptr %161, align 8
  %163 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %162)
  br label %164

164:                                              ; preds = %158
  %165 = load i32, ptr %9, align 4
  %166 = add nsw i32 %165, 1
  store i32 %166, ptr %9, align 4
  br label %154

167:                                              ; preds = %154
  %168 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store double 1.000000e+00, ptr %2, align 8
  br label %169

169:                                              ; preds = %218, %167
  %170 = load double, ptr %2, align 8
  %171 = fcmp olt double %170, 1.000000e+01
  br i1 %171, label %172, label %221

172:                                              ; preds = %169
  store double 1.000000e+01, ptr %3, align 8
  br label %173

173:                                              ; preds = %214, %172
  %174 = load double, ptr %3, align 8
  %175 = fcmp ogt double %174, 0.000000e+00
  br i1 %175, label %176, label %217

176:                                              ; preds = %173
  store double 5.000000e+00, ptr %4, align 8
  br label %177

177:                                              ; preds = %210, %176
  %178 = load double, ptr %4, align 8
  %179 = fcmp olt double %178, 1.500000e+01
  br i1 %179, label %180, label %213

180:                                              ; preds = %177
  store double -1.000000e+00, ptr %5, align 8
  br label %181

181:                                              ; preds = %206, %180
  %182 = load double, ptr %5, align 8
  %183 = fcmp ogt double %182, -5.000000e+00
  br i1 %183, label %184, label %209

184:                                              ; preds = %181
  %185 = load double, ptr %2, align 8
  %186 = load double, ptr %3, align 8
  %187 = load double, ptr %4, align 8
  %188 = load double, ptr %5, align 8
  %189 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 0
  call void @SolveCubic(double noundef %185, double noundef %186, double noundef %187, double noundef %188, ptr noundef %8, ptr noundef %189)
  %190 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %9, align 4
  br label %191

191:                                              ; preds = %201, %184
  %192 = load i32, ptr %9, align 4
  %193 = load i32, ptr %8, align 4
  %194 = icmp slt i32 %192, %193
  br i1 %194, label %195, label %204

195:                                              ; preds = %191
  %196 = load i32, ptr %9, align 4
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %197
  %199 = load double, ptr %198, align 8
  %200 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %199)
  br label %201

201:                                              ; preds = %195
  %202 = load i32, ptr %9, align 4
  %203 = add nsw i32 %202, 1
  store i32 %203, ptr %9, align 4
  br label %191

204:                                              ; preds = %191
  %205 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %206

206:                                              ; preds = %204
  %207 = load double, ptr %5, align 8
  %208 = fsub double %207, 4.510000e-01
  store double %208, ptr %5, align 8
  br label %181

209:                                              ; preds = %181
  br label %210

210:                                              ; preds = %209
  %211 = load double, ptr %4, align 8
  %212 = fadd double %211, 6.100000e-01
  store double %212, ptr %4, align 8
  br label %177

213:                                              ; preds = %177
  br label %214

214:                                              ; preds = %213
  %215 = load double, ptr %3, align 8
  %216 = fsub double %215, 2.500000e-01
  store double %216, ptr %3, align 8
  br label %173

217:                                              ; preds = %173
  br label %218

218:                                              ; preds = %217
  %219 = load double, ptr %2, align 8
  %220 = fadd double %219, 1.000000e+00
  store double %220, ptr %2, align 8
  br label %169

221:                                              ; preds = %169
  %222 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 0, ptr %9, align 4
  br label %223

223:                                              ; preds = %233, %221
  %224 = load i32, ptr %9, align 4
  %225 = icmp slt i32 %224, 100000
  br i1 %225, label %226, label %236

226:                                              ; preds = %223
  %227 = load i32, ptr %9, align 4
  %228 = sext i32 %227 to i64
  call void @usqrt(i64 noundef %228, ptr noundef %11)
  %229 = load i32, ptr %9, align 4
  %230 = getelementptr inbounds %struct.int_sqrt, ptr %11, i32 0, i32 0
  %231 = load i32, ptr %230, align 4
  %232 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %229, i32 noundef %231)
  br label %233

233:                                              ; preds = %226
  %234 = load i32, ptr %9, align 4
  %235 = add nsw i32 %234, 2
  store i32 %235, ptr %9, align 4
  br label %223

236:                                              ; preds = %223
  %237 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i64 1072497001, ptr %10, align 8
  br label %238

238:                                              ; preds = %253, %236
  %239 = load i64, ptr %10, align 8
  %240 = icmp ult i64 %239, 1072513385
  br i1 %240, label %241, label %256

241:                                              ; preds = %238
  %242 = load i64, ptr %10, align 8
  call void @usqrt(i64 noundef %242, ptr noundef %11)
  %243 = load i64, ptr %10, align 8
  %244 = getelementptr inbounds %struct.int_sqrt, ptr %11, i32 0, i32 0
  %245 = load i32, ptr %244, align 4
  %246 = getelementptr inbounds %struct.int_sqrt, ptr %11, i32 0, i32 1
  %247 = load i32, ptr %246, align 4
  %248 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i64 noundef %243, i32 noundef %245, i32 noundef %247)
  %249 = load i64, ptr %10, align 8
  %250 = getelementptr inbounds %struct.int_sqrt, ptr %11, i32 0, i32 0
  %251 = load i32, ptr %250, align 4
  %252 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i64 noundef %249, i32 noundef %251)
  br label %253

253:                                              ; preds = %241
  %254 = load i64, ptr %10, align 8
  %255 = add i64 %254, 1
  store i64 %255, ptr %10, align 8
  br label %238

256:                                              ; preds = %238
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @rad2deg(double noundef %0) #0 {
  %2 = alloca double, align 8
  store double %0, ptr %2, align 8
  %3 = load double, ptr %2, align 8
  %4 = fmul double 1.800000e+02, %3
  %5 = call double @atan(double noundef 1.000000e+00) #5
  %6 = fmul double 4.000000e+00, %5
  %7 = fdiv double %4, %6
  ret double %7
}

; Function Attrs: nounwind
declare double @atan(double noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @deg2rad(double noundef %0) #0 {
  %2 = alloca double, align 8
  store double %0, ptr %2, align 8
  %3 = call double @atan(double noundef 1.000000e+00) #5
  %4 = fmul double 4.000000e+00, %3
  %5 = load double, ptr %2, align 8
  %6 = fmul double %4, %5
  %7 = fdiv double %6, 1.800000e+02
  ret double %7
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @SolveCubic(double noundef %0, double noundef %1, double noundef %2, double noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca x86_fp80, align 16
  %14 = alloca x86_fp80, align 16
  %15 = alloca x86_fp80, align 16
  %16 = alloca x86_fp80, align 16
  %17 = alloca x86_fp80, align 16
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  store double %0, ptr %7, align 8
  store double %1, ptr %8, align 8
  store double %2, ptr %9, align 8
  store double %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  %20 = load double, ptr %8, align 8
  %21 = load double, ptr %7, align 8
  %22 = fdiv double %20, %21
  %23 = fpext double %22 to x86_fp80
  store x86_fp80 %23, ptr %13, align 16
  %24 = load double, ptr %9, align 8
  %25 = load double, ptr %7, align 8
  %26 = fdiv double %24, %25
  %27 = fpext double %26 to x86_fp80
  store x86_fp80 %27, ptr %14, align 16
  %28 = load double, ptr %10, align 8
  %29 = load double, ptr %7, align 8
  %30 = fdiv double %28, %29
  %31 = fpext double %30 to x86_fp80
  store x86_fp80 %31, ptr %15, align 16
  %32 = load x86_fp80, ptr %13, align 16
  %33 = load x86_fp80, ptr %13, align 16
  %34 = load x86_fp80, ptr %14, align 16
  %35 = fmul x86_fp80 0xK4000C000000000000000, %34
  %36 = fneg x86_fp80 %35
  %37 = call x86_fp80 @llvm.fmuladd.f80(x86_fp80 %32, x86_fp80 %33, x86_fp80 %36)
  %38 = fdiv x86_fp80 %37, 0xK40029000000000000000
  store x86_fp80 %38, ptr %16, align 16
  %39 = load x86_fp80, ptr %13, align 16
  %40 = fmul x86_fp80 0xK40008000000000000000, %39
  %41 = load x86_fp80, ptr %13, align 16
  %42 = fmul x86_fp80 %40, %41
  %43 = load x86_fp80, ptr %13, align 16
  %44 = load x86_fp80, ptr %13, align 16
  %45 = fmul x86_fp80 0xK40029000000000000000, %44
  %46 = load x86_fp80, ptr %14, align 16
  %47 = fmul x86_fp80 %45, %46
  %48 = fneg x86_fp80 %47
  %49 = call x86_fp80 @llvm.fmuladd.f80(x86_fp80 %42, x86_fp80 %43, x86_fp80 %48)
  %50 = load x86_fp80, ptr %15, align 16
  %51 = call x86_fp80 @llvm.fmuladd.f80(x86_fp80 0xK4003D800000000000000, x86_fp80 %50, x86_fp80 %49)
  %52 = fdiv x86_fp80 %51, 0xK4004D800000000000000
  store x86_fp80 %52, ptr %17, align 16
  %53 = load x86_fp80, ptr %17, align 16
  %54 = load x86_fp80, ptr %17, align 16
  %55 = load x86_fp80, ptr %16, align 16
  %56 = load x86_fp80, ptr %16, align 16
  %57 = fmul x86_fp80 %55, %56
  %58 = load x86_fp80, ptr %16, align 16
  %59 = fmul x86_fp80 %57, %58
  %60 = fneg x86_fp80 %59
  %61 = call x86_fp80 @llvm.fmuladd.f80(x86_fp80 %53, x86_fp80 %54, x86_fp80 %60)
  %62 = fptrunc x86_fp80 %61 to double
  store double %62, ptr %18, align 8
  %63 = load double, ptr %18, align 8
  %64 = fcmp ole double %63, 0.000000e+00
  br i1 %64, label %65, label %130

65:                                               ; preds = %6
  %66 = load ptr, ptr %11, align 8
  store i32 3, ptr %66, align 4
  %67 = load x86_fp80, ptr %17, align 16
  %68 = load x86_fp80, ptr %16, align 16
  %69 = load x86_fp80, ptr %16, align 16
  %70 = fmul x86_fp80 %68, %69
  %71 = load x86_fp80, ptr %16, align 16
  %72 = fmul x86_fp80 %70, %71
  %73 = fptrunc x86_fp80 %72 to double
  %74 = call double @sqrt(double noundef %73) #5
  %75 = fpext double %74 to x86_fp80
  %76 = fdiv x86_fp80 %67, %75
  %77 = fptrunc x86_fp80 %76 to double
  %78 = call double @acos(double noundef %77) #5
  store double %78, ptr %19, align 8
  %79 = load x86_fp80, ptr %16, align 16
  %80 = fptrunc x86_fp80 %79 to double
  %81 = call double @sqrt(double noundef %80) #5
  %82 = fmul double -2.000000e+00, %81
  %83 = load double, ptr %19, align 8
  %84 = fdiv double %83, 3.000000e+00
  %85 = call double @cos(double noundef %84) #5
  %86 = fmul double %82, %85
  %87 = fpext double %86 to x86_fp80
  %88 = load x86_fp80, ptr %13, align 16
  %89 = fdiv x86_fp80 %88, 0xK4000C000000000000000
  %90 = fsub x86_fp80 %87, %89
  %91 = fptrunc x86_fp80 %90 to double
  %92 = load ptr, ptr %12, align 8
  %93 = getelementptr inbounds double, ptr %92, i64 0
  store double %91, ptr %93, align 8
  %94 = load x86_fp80, ptr %16, align 16
  %95 = fptrunc x86_fp80 %94 to double
  %96 = call double @sqrt(double noundef %95) #5
  %97 = fmul double -2.000000e+00, %96
  %98 = load double, ptr %19, align 8
  %99 = call double @atan(double noundef 1.000000e+00) #5
  %100 = fmul double 4.000000e+00, %99
  %101 = call double @llvm.fmuladd.f64(double 2.000000e+00, double %100, double %98)
  %102 = fdiv double %101, 3.000000e+00
  %103 = call double @cos(double noundef %102) #5
  %104 = fmul double %97, %103
  %105 = fpext double %104 to x86_fp80
  %106 = load x86_fp80, ptr %13, align 16
  %107 = fdiv x86_fp80 %106, 0xK4000C000000000000000
  %108 = fsub x86_fp80 %105, %107
  %109 = fptrunc x86_fp80 %108 to double
  %110 = load ptr, ptr %12, align 8
  %111 = getelementptr inbounds double, ptr %110, i64 1
  store double %109, ptr %111, align 8
  %112 = load x86_fp80, ptr %16, align 16
  %113 = fptrunc x86_fp80 %112 to double
  %114 = call double @sqrt(double noundef %113) #5
  %115 = fmul double -2.000000e+00, %114
  %116 = load double, ptr %19, align 8
  %117 = call double @atan(double noundef 1.000000e+00) #5
  %118 = fmul double 4.000000e+00, %117
  %119 = call double @llvm.fmuladd.f64(double 4.000000e+00, double %118, double %116)
  %120 = fdiv double %119, 3.000000e+00
  %121 = call double @cos(double noundef %120) #5
  %122 = fmul double %115, %121
  %123 = fpext double %122 to x86_fp80
  %124 = load x86_fp80, ptr %13, align 16
  %125 = fdiv x86_fp80 %124, 0xK4000C000000000000000
  %126 = fsub x86_fp80 %123, %125
  %127 = fptrunc x86_fp80 %126 to double
  %128 = load ptr, ptr %12, align 8
  %129 = getelementptr inbounds double, ptr %128, i64 2
  store double %127, ptr %129, align 8
  br label %170

130:                                              ; preds = %6
  %131 = load ptr, ptr %11, align 8
  store i32 1, ptr %131, align 4
  %132 = load double, ptr %18, align 8
  %133 = call double @sqrt(double noundef %132) #5
  %134 = load x86_fp80, ptr %17, align 16
  %135 = fptrunc x86_fp80 %134 to double
  %136 = call double @llvm.fabs.f64(double %135)
  %137 = fadd double %133, %136
  %138 = call double @pow(double noundef %137, double noundef 0x3FD5555555555555) #5
  %139 = load ptr, ptr %12, align 8
  %140 = getelementptr inbounds double, ptr %139, i64 0
  store double %138, ptr %140, align 8
  %141 = load x86_fp80, ptr %16, align 16
  %142 = load ptr, ptr %12, align 8
  %143 = getelementptr inbounds double, ptr %142, i64 0
  %144 = load double, ptr %143, align 8
  %145 = fpext double %144 to x86_fp80
  %146 = fdiv x86_fp80 %141, %145
  %147 = load ptr, ptr %12, align 8
  %148 = getelementptr inbounds double, ptr %147, i64 0
  %149 = load double, ptr %148, align 8
  %150 = fpext double %149 to x86_fp80
  %151 = fadd x86_fp80 %150, %146
  %152 = fptrunc x86_fp80 %151 to double
  store double %152, ptr %148, align 8
  %153 = load x86_fp80, ptr %17, align 16
  %154 = fcmp olt x86_fp80 %153, 0xK00000000000000000000
  %155 = zext i1 %154 to i64
  %156 = select i1 %154, i32 1, i32 -1
  %157 = sitofp i32 %156 to double
  %158 = load ptr, ptr %12, align 8
  %159 = getelementptr inbounds double, ptr %158, i64 0
  %160 = load double, ptr %159, align 8
  %161 = fmul double %160, %157
  store double %161, ptr %159, align 8
  %162 = load x86_fp80, ptr %13, align 16
  %163 = fdiv x86_fp80 %162, 0xK4000C000000000000000
  %164 = load ptr, ptr %12, align 8
  %165 = getelementptr inbounds double, ptr %164, i64 0
  %166 = load double, ptr %165, align 8
  %167 = fpext double %166 to x86_fp80
  %168 = fsub x86_fp80 %167, %163
  %169 = fptrunc x86_fp80 %168 to double
  store double %169, ptr %165, align 8
  br label %170

170:                                              ; preds = %130, %65
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare x86_fp80 @llvm.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80) #3

; Function Attrs: nounwind
declare double @sqrt(double noundef) #2

; Function Attrs: nounwind
declare double @acos(double noundef) #2

; Function Attrs: nounwind
declare double @cos(double noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #3

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @usqrt(i64 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  store i64 %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i64 0, ptr %5, align 8
  store i64 0, ptr %6, align 8
  store i64 0, ptr %7, align 8
  store i32 0, ptr %8, align 4
  br label %9

9:                                                ; preds = %36, %2
  %10 = load i32, ptr %8, align 4
  %11 = icmp slt i32 %10, 32
  br i1 %11, label %12, label %39

12:                                               ; preds = %9
  %13 = load i64, ptr %6, align 8
  %14 = shl i64 %13, 2
  %15 = load i64, ptr %3, align 8
  %16 = and i64 %15, 3221225472
  %17 = lshr i64 %16, 30
  %18 = add i64 %14, %17
  store i64 %18, ptr %6, align 8
  %19 = load i64, ptr %3, align 8
  %20 = shl i64 %19, 2
  store i64 %20, ptr %3, align 8
  %21 = load i64, ptr %5, align 8
  %22 = shl i64 %21, 1
  store i64 %22, ptr %5, align 8
  %23 = load i64, ptr %5, align 8
  %24 = shl i64 %23, 1
  %25 = add i64 %24, 1
  store i64 %25, ptr %7, align 8
  %26 = load i64, ptr %6, align 8
  %27 = load i64, ptr %7, align 8
  %28 = icmp uge i64 %26, %27
  br i1 %28, label %29, label %35

29:                                               ; preds = %12
  %30 = load i64, ptr %7, align 8
  %31 = load i64, ptr %6, align 8
  %32 = sub i64 %31, %30
  store i64 %32, ptr %6, align 8
  %33 = load i64, ptr %5, align 8
  %34 = add i64 %33, 1
  store i64 %34, ptr %5, align 8
  br label %35

35:                                               ; preds = %29, %12
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %8, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %8, align 4
  br label %9

39:                                               ; preds = %9
  %40 = load ptr, ptr %4, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %40, ptr align 8 %5, i64 8, i1 false)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nounwind }

!llvm.ident = !{!0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
