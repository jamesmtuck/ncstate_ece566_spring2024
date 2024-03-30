; ModuleID = 'bh.prof.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.datapoints = type { [3 x double], [3 x double], ptr, ptr }
%struct.icstruct = type { [3 x i32], i16 }
%struct.tree = type { [3 x double], double, ptr, [64 x ptr], [64 x ptr] }
%struct.bnode = type { i16, double, [3 x double], i32, i32, [3 x double], [3 x double], [3 x double], double, ptr, ptr }
%struct.hgstruct = type { ptr, [3 x double], double, [3 x double] }
%struct.cnode = type { i16, double, [3 x double], i32, i32, [8 x ptr], ptr }
%struct.node = type { i16, double, [3 x double], i32, i32 }
%struct.tms = type { i64, i64, i64, i64 }

@__NumNodes = dso_local global i32 1, align 4
@.str = private unnamed_addr constant [27 x i8] c"nbody = %d, numnodes = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"Bodies per %d = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [22 x i8] c"Assertion Failure #%d\00", align 1
@cp_free_list = dso_local global ptr null, align 8
@bp_free_list = dso_local global ptr null, align 8
@.str.3 = private unnamed_addr constant [29 x i8] c"testdata: not enough memory\0A\00", align 1
@root = dso_local global ptr null, align 8
@rmin = dso_local global [3 x double] zeroinitializer, align 16
@rsize = dso_local global double 0.000000e+00, align 8
@arg1 = dso_local global i32 0, align 4
@.str.5 = private unnamed_addr constant [21 x i8] c"times() call failed\0A\00", align 1
@stderr = external global ptr, align 8
@.str.1.8 = private unnamed_addr constant [6 x i8] c"Error\00", align 1
@nbody = dso_local global i32 0, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %7 = load i32, ptr %4, align 4
  %8 = load ptr, ptr %5, align 8
  %9 = call i32 @dealwithargs(i32 noundef %7, ptr noundef %8)
  %10 = load i32, ptr @nbody, align 4
  %11 = load i32, ptr @__NumNodes, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %10, i32 noundef %11)
  %13 = call ptr @old_main()
  store ptr %13, ptr %6, align 8
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @old_main() #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca [3 x double], align 16
  %12 = alloca [3 x double], align 16
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca [64 x i32], align 16
  %17 = alloca [64 x ptr], align 16
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca %struct.datapoints, align 8
  %21 = alloca i32, align 4
  %22 = alloca %struct.datapoints, align 8
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca %struct.icstruct, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca %struct.icstruct, align 4
  store ptr null, ptr %13, align 8
  store i32 0, ptr %14, align 4
  %31 = load i32, ptr @__NumNodes, align 4
  %32 = sdiv i32 64, %31
  store i32 %32, ptr %15, align 4
  %33 = call i32 @srand(i32 noundef 123) #9
  %34 = call noalias ptr @malloc(i64 noundef 1064) #9
  store ptr %34, ptr %6, align 8
  %35 = load ptr, ptr %6, align 8
  %36 = getelementptr inbounds %struct.tree, ptr %35, i32 0, i32 2
  store ptr null, ptr %36, align 8
  %37 = load ptr, ptr %6, align 8
  %38 = getelementptr inbounds %struct.tree, ptr %37, i32 0, i32 0
  %39 = getelementptr inbounds [3 x double], ptr %38, i64 0, i64 0
  store double -2.000000e+00, ptr %39, align 8
  %40 = load ptr, ptr %6, align 8
  %41 = getelementptr inbounds %struct.tree, ptr %40, i32 0, i32 0
  %42 = getelementptr inbounds [3 x double], ptr %41, i64 0, i64 1
  store double -2.000000e+00, ptr %42, align 8
  %43 = load ptr, ptr %6, align 8
  %44 = getelementptr inbounds %struct.tree, ptr %43, i32 0, i32 0
  %45 = getelementptr inbounds [3 x double], ptr %44, i64 0, i64 2
  store double -2.000000e+00, ptr %45, align 8
  %46 = load ptr, ptr %6, align 8
  %47 = getelementptr inbounds %struct.tree, ptr %46, i32 0, i32 1
  store double 4.000000e+00, ptr %47, align 8
  store i32 0, ptr %18, align 4
  br label %48

48:                                               ; preds = %55, %0
  %49 = load i32, ptr %18, align 4
  %50 = icmp slt i32 %49, 3
  br i1 %50, label %51, label %58

51:                                               ; preds = %48
  %52 = load i32, ptr %18, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [3 x double], ptr %11, i64 0, i64 %53
  store double 0.000000e+00, ptr %54, align 8
  br label %55

55:                                               ; preds = %51
  %56 = load i32, ptr %18, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, ptr %18, align 4
  br label %48

58:                                               ; preds = %48
  store i32 0, ptr %19, align 4
  br label %59

59:                                               ; preds = %66, %58
  %60 = load i32, ptr %19, align 4
  %61 = icmp slt i32 %60, 3
  br i1 %61, label %62, label %69

62:                                               ; preds = %59
  %63 = load i32, ptr %19, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 %64
  store double 0.000000e+00, ptr %65, align 8
  br label %66

66:                                               ; preds = %62
  %67 = load i32, ptr %19, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, ptr %19, align 4
  br label %59

69:                                               ; preds = %59
  store i32 0, ptr %3, align 4
  br label %70

70:                                               ; preds = %142, %69
  %71 = load i32, ptr %3, align 4
  %72 = icmp slt i32 %71, 32
  br i1 %72, label %73, label %145

73:                                               ; preds = %70
  %74 = load i32, ptr %3, align 4
  %75 = load i32, ptr @__NumNodes, align 4
  %76 = sdiv i32 32, %75
  %77 = sdiv i32 %74, %76
  store i32 %77, ptr %21, align 4
  %78 = load i32, ptr %21, align 4
  %79 = load i32, ptr @nbody, align 4
  %80 = sdiv i32 %79, 32
  %81 = load i32, ptr %3, align 4
  %82 = add nsw i32 %81, 1
  call void @uniform_testdata(ptr sret(%struct.datapoints) align 8 %22, i32 noundef %78, i32 noundef %80, i32 noundef %82)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %20, ptr align 8 %22, i64 64, i1 false)
  %83 = getelementptr inbounds %struct.datapoints, ptr %20, i32 0, i32 2
  %84 = load ptr, ptr %83, align 8
  %85 = load ptr, ptr %6, align 8
  %86 = getelementptr inbounds %struct.tree, ptr %85, i32 0, i32 3
  %87 = load i32, ptr %3, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [64 x ptr], ptr %86, i64 0, i64 %88
  store ptr %84, ptr %89, align 8
  %90 = load ptr, ptr %13, align 8
  %91 = icmp ne ptr %90, null
  br i1 %91, label %92, label %97

92:                                               ; preds = %73
  %93 = getelementptr inbounds %struct.datapoints, ptr %20, i32 0, i32 2
  %94 = load ptr, ptr %93, align 8
  %95 = load ptr, ptr %13, align 8
  %96 = getelementptr inbounds %struct.bnode, ptr %95, i32 0, i32 9
  store ptr %94, ptr %96, align 8
  br label %97

97:                                               ; preds = %92, %73
  %98 = getelementptr inbounds %struct.datapoints, ptr %20, i32 0, i32 3
  %99 = load ptr, ptr %98, align 8
  store ptr %99, ptr %13, align 8
  store i32 0, ptr %23, align 4
  br label %100

100:                                              ; preds = %117, %97
  %101 = load i32, ptr %23, align 4
  %102 = icmp slt i32 %101, 3
  br i1 %102, label %103, label %120

103:                                              ; preds = %100
  %104 = load i32, ptr %23, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [3 x double], ptr %11, i64 0, i64 %105
  %107 = load double, ptr %106, align 8
  %108 = getelementptr inbounds %struct.datapoints, ptr %20, i32 0, i32 0
  %109 = load i32, ptr %23, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [3 x double], ptr %108, i64 0, i64 %110
  %112 = load double, ptr %111, align 8
  %113 = fadd double %107, %112
  %114 = load i32, ptr %23, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [3 x double], ptr %11, i64 0, i64 %115
  store double %113, ptr %116, align 8
  br label %117

117:                                              ; preds = %103
  %118 = load i32, ptr %23, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, ptr %23, align 4
  br label %100

120:                                              ; preds = %100
  store i32 0, ptr %24, align 4
  br label %121

121:                                              ; preds = %138, %120
  %122 = load i32, ptr %24, align 4
  %123 = icmp slt i32 %122, 3
  br i1 %123, label %124, label %141

124:                                              ; preds = %121
  %125 = load i32, ptr %24, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 %126
  %128 = load double, ptr %127, align 8
  %129 = getelementptr inbounds %struct.datapoints, ptr %20, i32 0, i32 1
  %130 = load i32, ptr %24, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [3 x double], ptr %129, i64 0, i64 %131
  %133 = load double, ptr %132, align 8
  %134 = fadd double %128, %133
  %135 = load i32, ptr %24, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 %136
  store double %134, ptr %137, align 8
  br label %138

138:                                              ; preds = %124
  %139 = load i32, ptr %24, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, ptr %24, align 4
  br label %121

141:                                              ; preds = %121
  br label %142

142:                                              ; preds = %141
  %143 = load i32, ptr %3, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, ptr %3, align 4
  br label %70

145:                                              ; preds = %70
  store i32 0, ptr %25, align 4
  br label %146

146:                                              ; preds = %160, %145
  %147 = load i32, ptr %25, align 4
  %148 = icmp slt i32 %147, 3
  br i1 %148, label %149, label %163

149:                                              ; preds = %146
  %150 = load i32, ptr %25, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [3 x double], ptr %11, i64 0, i64 %151
  %153 = load double, ptr %152, align 8
  %154 = load i32, ptr @nbody, align 4
  %155 = sitofp i32 %154 to double
  %156 = fdiv double %153, %155
  %157 = load i32, ptr %25, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [3 x double], ptr %11, i64 0, i64 %158
  store double %156, ptr %159, align 8
  br label %160

160:                                              ; preds = %149
  %161 = load i32, ptr %25, align 4
  %162 = add nsw i32 %161, 1
  store i32 %162, ptr %25, align 4
  br label %146

163:                                              ; preds = %146
  store i32 0, ptr %26, align 4
  br label %164

164:                                              ; preds = %178, %163
  %165 = load i32, ptr %26, align 4
  %166 = icmp slt i32 %165, 3
  br i1 %166, label %167, label %181

167:                                              ; preds = %164
  %168 = load i32, ptr %26, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 %169
  %171 = load double, ptr %170, align 8
  %172 = load i32, ptr @nbody, align 4
  %173 = sitofp i32 %172 to double
  %174 = fdiv double %171, %173
  %175 = load i32, ptr %26, align 4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 %176
  store double %174, ptr %177, align 8
  br label %178

178:                                              ; preds = %167
  %179 = load i32, ptr %26, align 4
  %180 = add nsw i32 %179, 1
  store i32 %180, ptr %26, align 4
  br label %164

181:                                              ; preds = %164
  store i32 0, ptr %14, align 4
  br label %182

182:                                              ; preds = %192, %181
  %183 = load i32, ptr %14, align 4
  %184 = icmp slt i32 %183, 64
  br i1 %184, label %185, label %195

185:                                              ; preds = %182
  %186 = load i32, ptr %14, align 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [64 x i32], ptr %16, i64 0, i64 %187
  store i32 0, ptr %188, align 4
  %189 = load i32, ptr %14, align 4
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds [64 x ptr], ptr %17, i64 0, i64 %190
  store ptr null, ptr %191, align 8
  br label %192

192:                                              ; preds = %185
  %193 = load i32, ptr %14, align 4
  %194 = add nsw i32 %193, 1
  store i32 %194, ptr %14, align 4
  br label %182

195:                                              ; preds = %182
  %196 = load ptr, ptr %6, align 8
  %197 = getelementptr inbounds %struct.tree, ptr %196, i32 0, i32 3
  %198 = getelementptr inbounds [64 x ptr], ptr %197, i64 0, i64 0
  %199 = load ptr, ptr %198, align 8
  store ptr %199, ptr %8, align 8
  br label %200

200:                                              ; preds = %292, %195
  %201 = load ptr, ptr %8, align 8
  %202 = icmp ne ptr %201, null
  br i1 %202, label %203, label %296

203:                                              ; preds = %200
  store i32 0, ptr %28, align 4
  br label %204

204:                                              ; preds = %224, %203
  %205 = load i32, ptr %28, align 4
  %206 = icmp slt i32 %205, 3
  br i1 %206, label %207, label %227

207:                                              ; preds = %204
  %208 = load ptr, ptr %8, align 8
  %209 = getelementptr inbounds %struct.bnode, ptr %208, i32 0, i32 2
  %210 = load i32, ptr %28, align 4
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds [3 x double], ptr %209, i64 0, i64 %211
  %213 = load double, ptr %212, align 8
  %214 = load i32, ptr %28, align 4
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds [3 x double], ptr %11, i64 0, i64 %215
  %217 = load double, ptr %216, align 8
  %218 = fsub double %213, %217
  %219 = load ptr, ptr %8, align 8
  %220 = getelementptr inbounds %struct.bnode, ptr %219, i32 0, i32 2
  %221 = load i32, ptr %28, align 4
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds [3 x double], ptr %220, i64 0, i64 %222
  store double %218, ptr %223, align 8
  br label %224

224:                                              ; preds = %207
  %225 = load i32, ptr %28, align 4
  %226 = add nsw i32 %225, 1
  store i32 %226, ptr %28, align 4
  br label %204

227:                                              ; preds = %204
  store i32 0, ptr %29, align 4
  br label %228

228:                                              ; preds = %248, %227
  %229 = load i32, ptr %29, align 4
  %230 = icmp slt i32 %229, 3
  br i1 %230, label %231, label %251

231:                                              ; preds = %228
  %232 = load ptr, ptr %8, align 8
  %233 = getelementptr inbounds %struct.bnode, ptr %232, i32 0, i32 5
  %234 = load i32, ptr %29, align 4
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [3 x double], ptr %233, i64 0, i64 %235
  %237 = load double, ptr %236, align 8
  %238 = load i32, ptr %29, align 4
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 %239
  %241 = load double, ptr %240, align 8
  %242 = fsub double %237, %241
  %243 = load ptr, ptr %8, align 8
  %244 = getelementptr inbounds %struct.bnode, ptr %243, i32 0, i32 5
  %245 = load i32, ptr %29, align 4
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds [3 x double], ptr %244, i64 0, i64 %246
  store double %242, ptr %247, align 8
  br label %248

248:                                              ; preds = %231
  %249 = load i32, ptr %29, align 4
  %250 = add nsw i32 %249, 1
  store i32 %250, ptr %29, align 4
  br label %228

251:                                              ; preds = %228
  %252 = load ptr, ptr %8, align 8
  %253 = load ptr, ptr %6, align 8
  %254 = call { i64, i64 } @intcoord(ptr noundef %252, ptr noundef %253)
  %255 = getelementptr inbounds { i64, i64 }, ptr %30, i32 0, i32 0
  %256 = extractvalue { i64, i64 } %254, 0
  store i64 %256, ptr %255, align 4
  %257 = getelementptr inbounds { i64, i64 }, ptr %30, i32 0, i32 1
  %258 = extractvalue { i64, i64 } %254, 1
  store i64 %258, ptr %257, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %27, ptr align 4 %30, i64 16, i1 false)
  %259 = getelementptr inbounds { i64, i64 }, ptr %27, i32 0, i32 0
  %260 = load i64, ptr %259, align 4
  %261 = getelementptr inbounds { i64, i64 }, ptr %27, i32 0, i32 1
  %262 = load i64, ptr %261, align 4
  %263 = call i32 @old_subindex(i64 %260, i64 %262, i32 noundef 536870912)
  %264 = shl i32 %263, 3
  %265 = getelementptr inbounds { i64, i64 }, ptr %27, i32 0, i32 0
  %266 = load i64, ptr %265, align 4
  %267 = getelementptr inbounds { i64, i64 }, ptr %27, i32 0, i32 1
  %268 = load i64, ptr %267, align 4
  %269 = call i32 @old_subindex(i64 %266, i64 %268, i32 noundef 268435456)
  %270 = add nsw i32 %264, %269
  store i32 %270, ptr %14, align 4
  %271 = load i32, ptr %14, align 4
  %272 = load i32, ptr %15, align 4
  %273 = sdiv i32 %271, %272
  store i32 %273, ptr %14, align 4
  %274 = load i32, ptr %14, align 4
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds [64 x i32], ptr %16, i64 0, i64 %275
  %277 = load i32, ptr %276, align 4
  %278 = add nsw i32 %277, 1
  store i32 %278, ptr %276, align 4
  %279 = load i32, ptr %14, align 4
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds [64 x ptr], ptr %17, i64 0, i64 %280
  %282 = load ptr, ptr %281, align 8
  %283 = load ptr, ptr %8, align 8
  %284 = getelementptr inbounds %struct.bnode, ptr %283, i32 0, i32 10
  store ptr %282, ptr %284, align 8
  %285 = load ptr, ptr %8, align 8
  %286 = load i32, ptr %14, align 4
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds [64 x ptr], ptr %17, i64 0, i64 %287
  store ptr %285, ptr %288, align 8
  %289 = load i32, ptr %14, align 4
  %290 = load ptr, ptr %8, align 8
  %291 = getelementptr inbounds %struct.bnode, ptr %290, i32 0, i32 3
  store i32 %289, ptr %291, align 8
  br label %292

292:                                              ; preds = %251
  %293 = load ptr, ptr %8, align 8
  %294 = getelementptr inbounds %struct.bnode, ptr %293, i32 0, i32 9
  %295 = load ptr, ptr %294, align 8
  store ptr %295, ptr %8, align 8
  br label %200

296:                                              ; preds = %200
  store i32 0, ptr %14, align 4
  br label %297

297:                                              ; preds = %317, %296
  %298 = load i32, ptr %14, align 4
  %299 = load i32, ptr @__NumNodes, align 4
  %300 = icmp slt i32 %298, %299
  br i1 %300, label %301, label %320

301:                                              ; preds = %297
  %302 = load i32, ptr %14, align 4
  %303 = load i32, ptr %14, align 4
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds [64 x i32], ptr %16, i64 0, i64 %304
  %306 = load i32, ptr %305, align 4
  %307 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %302, i32 noundef %306)
  %308 = load i32, ptr %14, align 4
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds [64 x ptr], ptr %17, i64 0, i64 %309
  %311 = load ptr, ptr %310, align 8
  %312 = load ptr, ptr %6, align 8
  %313 = getelementptr inbounds %struct.tree, ptr %312, i32 0, i32 4
  %314 = load i32, ptr %14, align 4
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds [64 x ptr], ptr %313, i64 0, i64 %315
  store ptr %311, ptr %316, align 8
  br label %317

317:                                              ; preds = %301
  %318 = load i32, ptr %14, align 4
  %319 = add nsw i32 %318, 1
  store i32 %319, ptr %14, align 4
  br label %297

320:                                              ; preds = %297
  store i32 0, ptr %14, align 4
  store double 0.000000e+00, ptr %1, align 8
  store i32 0, ptr %3, align 4
  store i32 10, ptr %4, align 4
  br label %321

321:                                              ; preds = %330, %320
  %322 = load double, ptr %1, align 8
  %323 = fcmp olt double %322, 2.001250e+00
  br i1 %323, label %324, label %328

324:                                              ; preds = %321
  %325 = load i32, ptr %3, align 4
  %326 = load i32, ptr %4, align 4
  %327 = icmp slt i32 %325, %326
  br label %328

328:                                              ; preds = %324, %321
  %329 = phi i1 [ false, %321 ], [ %327, %324 ]
  br i1 %329, label %330, label %338

330:                                              ; preds = %328
  %331 = load ptr, ptr %6, align 8
  %332 = load i32, ptr %3, align 4
  %333 = call i32 @stepsystem(ptr noundef %331, i32 noundef %332)
  %334 = load double, ptr %1, align 8
  %335 = fadd double %334, 1.250000e-02
  store double %335, ptr %1, align 8
  %336 = load i32, ptr %3, align 4
  %337 = add nsw i32 %336, 1
  store i32 %337, ptr %3, align 4
  br label %321

338:                                              ; preds = %328
  %339 = load ptr, ptr %6, align 8
  ret ptr %339
}

; Function Attrs: nounwind
declare i32 @srand(i32 noundef) #2

; Function Attrs: nounwind
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @uniform_testdata(ptr noalias sret(%struct.datapoints) align 8 %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca i32, align 4
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  %20 = alloca double, align 8
  %21 = alloca i32, align 4
  %22 = alloca double, align 8
  %23 = alloca double, align 8
  %24 = alloca double, align 8
  %25 = alloca double, align 8
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  %32 = load i32, ptr %7, align 4
  %33 = sitofp i32 %32 to double
  %34 = fmul double 1.230000e+02, %33
  store double %34, ptr %20, align 8
  store double 0x3FE2D97C7F3321D2, ptr %8, align 8
  %35 = load double, ptr %8, align 8
  %36 = fdiv double 1.000000e+00, %35
  %37 = call double @sqrt(double noundef %36) #9
  store double %37, ptr %9, align 8
  store i32 0, ptr %26, align 4
  br label %38

38:                                               ; preds = %46, %4
  %39 = load i32, ptr %26, align 4
  %40 = icmp slt i32 %39, 3
  br i1 %40, label %41, label %49

41:                                               ; preds = %38
  %42 = getelementptr inbounds %struct.datapoints, ptr %0, i32 0, i32 0
  %43 = load i32, ptr %26, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [3 x double], ptr %42, i64 0, i64 %44
  store double 0.000000e+00, ptr %45, align 8
  br label %46

46:                                               ; preds = %41
  %47 = load i32, ptr %26, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %26, align 4
  br label %38

49:                                               ; preds = %38
  store i32 0, ptr %27, align 4
  br label %50

50:                                               ; preds = %58, %49
  %51 = load i32, ptr %27, align 4
  %52 = icmp slt i32 %51, 3
  br i1 %52, label %53, label %61

53:                                               ; preds = %50
  %54 = getelementptr inbounds %struct.datapoints, ptr %0, i32 0, i32 1
  %55 = load i32, ptr %27, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [3 x double], ptr %54, i64 0, i64 %56
  store double 0.000000e+00, ptr %57, align 8
  br label %58

58:                                               ; preds = %53
  %59 = load i32, ptr %27, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %27, align 4
  br label %50

61:                                               ; preds = %50
  %62 = load i32, ptr %5, align 4
  %63 = call ptr @ubody_alloc(i32 noundef %62)
  store ptr %63, ptr %14, align 8
  %64 = load ptr, ptr %14, align 8
  store ptr %64, ptr %16, align 8
  store i32 0, ptr %17, align 4
  br label %65

65:                                               ; preds = %268, %61
  %66 = load i32, ptr %17, align 4
  %67 = load i32, ptr %6, align 4
  %68 = icmp slt i32 %66, %67
  br i1 %68, label %69, label %271

69:                                               ; preds = %65
  %70 = load i32, ptr %5, align 4
  %71 = call ptr @ubody_alloc(i32 noundef %70)
  store ptr %71, ptr %15, align 8
  %72 = load ptr, ptr %15, align 8
  %73 = icmp eq ptr %72, null
  br i1 %73, label %74, label %76

74:                                               ; preds = %69
  %75 = call i32 @error(ptr noundef @.str.3)
  br label %76

76:                                               ; preds = %74, %69
  %77 = load ptr, ptr %15, align 8
  %78 = load ptr, ptr %16, align 8
  %79 = getelementptr inbounds %struct.bnode, ptr %78, i32 0, i32 9
  store ptr %77, ptr %79, align 8
  %80 = load ptr, ptr %15, align 8
  store ptr %80, ptr %16, align 8
  %81 = load ptr, ptr %15, align 8
  %82 = getelementptr inbounds %struct.bnode, ptr %81, i32 0, i32 0
  store i16 1, ptr %82, align 8
  %83 = load i32, ptr %6, align 4
  %84 = sitofp i32 %83 to double
  %85 = fdiv double 1.000000e+00, %84
  %86 = load ptr, ptr %15, align 8
  %87 = getelementptr inbounds %struct.bnode, ptr %86, i32 0, i32 1
  store double %85, ptr %87, align 8
  %88 = load double, ptr %20, align 8
  %89 = call double (double, ...) @my_rand(double noundef %88)
  store double %89, ptr %20, align 8
  %90 = load double, ptr %20, align 8
  %91 = call double (double, double, double, ...) @xrand(double noundef 0.000000e+00, double noundef 0x3FEFF7CED916872B, double noundef %90)
  store double %91, ptr %19, align 8
  %92 = load double, ptr %19, align 8
  %93 = call double @pow(double noundef %92, double noundef 0xBFE5555555555555) #9
  %94 = fsub double %93, 1.000000e+00
  store double %94, ptr %18, align 8
  %95 = load double, ptr %18, align 8
  %96 = call double @sqrt(double noundef %95) #9
  %97 = fdiv double 1.000000e+00, %96
  store double %97, ptr %10, align 8
  store double 4.000000e+00, ptr %25, align 8
  store i32 0, ptr %21, align 4
  br label %98

98:                                               ; preds = %114, %76
  %99 = load i32, ptr %21, align 4
  %100 = icmp slt i32 %99, 3
  br i1 %100, label %101, label %117

101:                                              ; preds = %98
  %102 = load double, ptr %20, align 8
  %103 = call double (double, ...) @my_rand(double noundef %102)
  store double %103, ptr %20, align 8
  %104 = load double, ptr %20, align 8
  %105 = call double (double, double, double, ...) @xrand(double noundef 0.000000e+00, double noundef 0x3FEFF7CED916872B, double noundef %104)
  store double %105, ptr %10, align 8
  %106 = load double, ptr %25, align 8
  %107 = load double, ptr %10, align 8
  %108 = fmul double %106, %107
  %109 = load ptr, ptr %15, align 8
  %110 = getelementptr inbounds %struct.bnode, ptr %109, i32 0, i32 2
  %111 = load i32, ptr %21, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [3 x double], ptr %110, i64 0, i64 %112
  store double %108, ptr %113, align 8
  br label %114

114:                                              ; preds = %101
  %115 = load i32, ptr %21, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, ptr %21, align 4
  br label %98

117:                                              ; preds = %98
  store i32 0, ptr %28, align 4
  br label %118

118:                                              ; preds = %138, %117
  %119 = load i32, ptr %28, align 4
  %120 = icmp slt i32 %119, 3
  br i1 %120, label %121, label %141

121:                                              ; preds = %118
  %122 = getelementptr inbounds %struct.datapoints, ptr %0, i32 0, i32 0
  %123 = load i32, ptr %28, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [3 x double], ptr %122, i64 0, i64 %124
  %126 = load double, ptr %125, align 8
  %127 = load ptr, ptr %15, align 8
  %128 = getelementptr inbounds %struct.bnode, ptr %127, i32 0, i32 2
  %129 = load i32, ptr %28, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [3 x double], ptr %128, i64 0, i64 %130
  %132 = load double, ptr %131, align 8
  %133 = fadd double %126, %132
  %134 = getelementptr inbounds %struct.datapoints, ptr %0, i32 0, i32 0
  %135 = load i32, ptr %28, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [3 x double], ptr %134, i64 0, i64 %136
  store double %133, ptr %137, align 8
  br label %138

138:                                              ; preds = %121
  %139 = load i32, ptr %28, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, ptr %28, align 4
  br label %118

141:                                              ; preds = %118
  br label %142

142:                                              ; preds = %151, %141
  %143 = load double, ptr %20, align 8
  %144 = call double (double, ...) @my_rand(double noundef %143)
  store double %144, ptr %20, align 8
  %145 = load double, ptr %20, align 8
  %146 = call double (double, double, double, ...) @xrand(double noundef 0.000000e+00, double noundef 1.000000e+00, double noundef %145)
  store double %146, ptr %12, align 8
  %147 = load double, ptr %20, align 8
  %148 = call double (double, ...) @my_rand(double noundef %147)
  store double %148, ptr %20, align 8
  %149 = load double, ptr %20, align 8
  %150 = call double (double, double, double, ...) @xrand(double noundef 0.000000e+00, double noundef 1.000000e-01, double noundef %149)
  store double %150, ptr %13, align 8
  br label %151

151:                                              ; preds = %142
  %152 = load double, ptr %13, align 8
  %153 = load double, ptr %12, align 8
  %154 = load double, ptr %12, align 8
  %155 = fmul double %153, %154
  %156 = load double, ptr %12, align 8
  %157 = load double, ptr %12, align 8
  %158 = fneg double %156
  %159 = call double @llvm.fmuladd.f64(double %158, double %157, double 1.000000e+00)
  %160 = call double @pow(double noundef %159, double noundef 3.500000e+00) #9
  %161 = fmul double %155, %160
  %162 = fcmp ogt double %152, %161
  br i1 %162, label %142, label %163

163:                                              ; preds = %151
  %164 = call double @sqrt(double noundef 2.000000e+00) #9
  %165 = load double, ptr %12, align 8
  %166 = fmul double %164, %165
  %167 = load double, ptr %10, align 8
  %168 = load double, ptr %10, align 8
  %169 = call double @llvm.fmuladd.f64(double %167, double %168, double 1.000000e+00)
  %170 = call double @pow(double noundef %169, double noundef 2.500000e-01) #9
  %171 = fdiv double %166, %170
  store double %171, ptr %11, align 8
  %172 = load double, ptr %9, align 8
  %173 = load double, ptr %11, align 8
  %174 = fmul double %172, %173
  store double %174, ptr %24, align 8
  br label %175

175:                                              ; preds = %215, %163
  store i32 0, ptr %21, align 4
  br label %176

176:                                              ; preds = %189, %175
  %177 = load i32, ptr %21, align 4
  %178 = icmp slt i32 %177, 3
  br i1 %178, label %179, label %192

179:                                              ; preds = %176
  %180 = load double, ptr %20, align 8
  %181 = call double (double, ...) @my_rand(double noundef %180)
  store double %181, ptr %20, align 8
  %182 = load double, ptr %20, align 8
  %183 = call double (double, double, double, ...) @xrand(double noundef -1.000000e+00, double noundef 1.000000e+00, double noundef %182)
  %184 = load ptr, ptr %15, align 8
  %185 = getelementptr inbounds %struct.bnode, ptr %184, i32 0, i32 5
  %186 = load i32, ptr %21, align 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [3 x double], ptr %185, i64 0, i64 %187
  store double %183, ptr %188, align 8
  br label %189

189:                                              ; preds = %179
  %190 = load i32, ptr %21, align 4
  %191 = add nsw i32 %190, 1
  store i32 %191, ptr %21, align 4
  br label %176

192:                                              ; preds = %176
  store double 0.000000e+00, ptr %22, align 8
  store i32 0, ptr %29, align 4
  br label %193

193:                                              ; preds = %211, %192
  %194 = load i32, ptr %29, align 4
  %195 = icmp slt i32 %194, 3
  br i1 %195, label %196, label %214

196:                                              ; preds = %193
  %197 = load ptr, ptr %15, align 8
  %198 = getelementptr inbounds %struct.bnode, ptr %197, i32 0, i32 5
  %199 = load i32, ptr %29, align 4
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds [3 x double], ptr %198, i64 0, i64 %200
  %202 = load double, ptr %201, align 8
  %203 = load ptr, ptr %15, align 8
  %204 = getelementptr inbounds %struct.bnode, ptr %203, i32 0, i32 5
  %205 = load i32, ptr %29, align 4
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds [3 x double], ptr %204, i64 0, i64 %206
  %208 = load double, ptr %207, align 8
  %209 = load double, ptr %22, align 8
  %210 = call double @llvm.fmuladd.f64(double %202, double %208, double %209)
  store double %210, ptr %22, align 8
  br label %211

211:                                              ; preds = %196
  %212 = load i32, ptr %29, align 4
  %213 = add nsw i32 %212, 1
  store i32 %213, ptr %29, align 4
  br label %193

214:                                              ; preds = %193
  br label %215

215:                                              ; preds = %214
  %216 = load double, ptr %22, align 8
  %217 = fcmp ogt double %216, 1.000000e+00
  br i1 %217, label %175, label %218

218:                                              ; preds = %215
  %219 = load double, ptr %24, align 8
  %220 = load double, ptr %22, align 8
  %221 = call double @sqrt(double noundef %220) #9
  %222 = fdiv double %219, %221
  store double %222, ptr %23, align 8
  store i32 0, ptr %30, align 4
  br label %223

223:                                              ; preds = %240, %218
  %224 = load i32, ptr %30, align 4
  %225 = icmp slt i32 %224, 3
  br i1 %225, label %226, label %243

226:                                              ; preds = %223
  %227 = load ptr, ptr %15, align 8
  %228 = getelementptr inbounds %struct.bnode, ptr %227, i32 0, i32 5
  %229 = load i32, ptr %30, align 4
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds [3 x double], ptr %228, i64 0, i64 %230
  %232 = load double, ptr %231, align 8
  %233 = load double, ptr %23, align 8
  %234 = fmul double %232, %233
  %235 = load ptr, ptr %15, align 8
  %236 = getelementptr inbounds %struct.bnode, ptr %235, i32 0, i32 5
  %237 = load i32, ptr %30, align 4
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds [3 x double], ptr %236, i64 0, i64 %238
  store double %234, ptr %239, align 8
  br label %240

240:                                              ; preds = %226
  %241 = load i32, ptr %30, align 4
  %242 = add nsw i32 %241, 1
  store i32 %242, ptr %30, align 4
  br label %223

243:                                              ; preds = %223
  store i32 0, ptr %31, align 4
  br label %244

244:                                              ; preds = %264, %243
  %245 = load i32, ptr %31, align 4
  %246 = icmp slt i32 %245, 3
  br i1 %246, label %247, label %267

247:                                              ; preds = %244
  %248 = getelementptr inbounds %struct.datapoints, ptr %0, i32 0, i32 1
  %249 = load i32, ptr %31, align 4
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds [3 x double], ptr %248, i64 0, i64 %250
  %252 = load double, ptr %251, align 8
  %253 = load ptr, ptr %15, align 8
  %254 = getelementptr inbounds %struct.bnode, ptr %253, i32 0, i32 5
  %255 = load i32, ptr %31, align 4
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds [3 x double], ptr %254, i64 0, i64 %256
  %258 = load double, ptr %257, align 8
  %259 = fadd double %252, %258
  %260 = getelementptr inbounds %struct.datapoints, ptr %0, i32 0, i32 1
  %261 = load i32, ptr %31, align 4
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds [3 x double], ptr %260, i64 0, i64 %262
  store double %259, ptr %263, align 8
  br label %264

264:                                              ; preds = %247
  %265 = load i32, ptr %31, align 4
  %266 = add nsw i32 %265, 1
  store i32 %266, ptr %31, align 4
  br label %244

267:                                              ; preds = %244
  br label %268

268:                                              ; preds = %267
  %269 = load i32, ptr %17, align 4
  %270 = add nsw i32 %269, 1
  store i32 %270, ptr %17, align 4
  br label %65

271:                                              ; preds = %65
  %272 = load ptr, ptr %16, align 8
  %273 = getelementptr inbounds %struct.bnode, ptr %272, i32 0, i32 9
  store ptr null, ptr %273, align 8
  %274 = load ptr, ptr %14, align 8
  %275 = getelementptr inbounds %struct.bnode, ptr %274, i32 0, i32 9
  %276 = load ptr, ptr %275, align 8
  %277 = getelementptr inbounds %struct.datapoints, ptr %0, i32 0, i32 2
  store ptr %276, ptr %277, align 8
  %278 = load ptr, ptr %16, align 8
  %279 = getelementptr inbounds %struct.datapoints, ptr %0, i32 0, i32 3
  store ptr %278, ptr %279, align 8
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i64 } @intcoord(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.icstruct, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca [3 x double], align 16
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %9 = getelementptr inbounds %struct.icstruct, ptr %3, i32 0, i32 1
  store i16 1, ptr %9, align 4
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds %struct.tree, ptr %10, i32 0, i32 1
  %12 = load double, ptr %11, align 8
  store double %12, ptr %7, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.bnode, ptr %13, i32 0, i32 2
  %15 = getelementptr inbounds [3 x double], ptr %14, i64 0, i64 0
  %16 = load double, ptr %15, align 8
  %17 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 0
  store double %16, ptr %17, align 16
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.bnode, ptr %18, i32 0, i32 2
  %20 = getelementptr inbounds [3 x double], ptr %19, i64 0, i64 1
  %21 = load double, ptr %20, align 8
  %22 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 1
  store double %21, ptr %22, align 8
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.bnode, ptr %23, i32 0, i32 2
  %25 = getelementptr inbounds [3 x double], ptr %24, i64 0, i64 2
  %26 = load double, ptr %25, align 8
  %27 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 2
  store double %26, ptr %27, align 16
  %28 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 0
  %29 = load double, ptr %28, align 16
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds %struct.tree, ptr %30, i32 0, i32 0
  %32 = getelementptr inbounds [3 x double], ptr %31, i64 0, i64 0
  %33 = load double, ptr %32, align 8
  %34 = fsub double %29, %33
  %35 = load double, ptr %7, align 8
  %36 = fdiv double %34, %35
  store double %36, ptr %6, align 8
  %37 = load double, ptr %6, align 8
  %38 = fcmp ole double 0.000000e+00, %37
  br i1 %38, label %39, label %49

39:                                               ; preds = %2
  %40 = load double, ptr %6, align 8
  %41 = fcmp olt double %40, 1.000000e+00
  br i1 %41, label %42, label %49

42:                                               ; preds = %39
  %43 = load double, ptr %6, align 8
  %44 = fmul double 0x41D0000000000000, %43
  %45 = call double @llvm.floor.f64(double %44)
  %46 = fptosi double %45 to i32
  %47 = getelementptr inbounds %struct.icstruct, ptr %3, i32 0, i32 0
  %48 = getelementptr inbounds [3 x i32], ptr %47, i64 0, i64 0
  store i32 %46, ptr %48, align 4
  br label %51

49:                                               ; preds = %39, %2
  %50 = getelementptr inbounds %struct.icstruct, ptr %3, i32 0, i32 1
  store i16 0, ptr %50, align 4
  br label %51

51:                                               ; preds = %49, %42
  %52 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 1
  %53 = load double, ptr %52, align 8
  %54 = load ptr, ptr %5, align 8
  %55 = getelementptr inbounds %struct.tree, ptr %54, i32 0, i32 0
  %56 = getelementptr inbounds [3 x double], ptr %55, i64 0, i64 1
  %57 = load double, ptr %56, align 8
  %58 = fsub double %53, %57
  %59 = load double, ptr %7, align 8
  %60 = fdiv double %58, %59
  store double %60, ptr %6, align 8
  %61 = load double, ptr %6, align 8
  %62 = fcmp ole double 0.000000e+00, %61
  br i1 %62, label %63, label %73

63:                                               ; preds = %51
  %64 = load double, ptr %6, align 8
  %65 = fcmp olt double %64, 1.000000e+00
  br i1 %65, label %66, label %73

66:                                               ; preds = %63
  %67 = load double, ptr %6, align 8
  %68 = fmul double 0x41D0000000000000, %67
  %69 = call double @llvm.floor.f64(double %68)
  %70 = fptosi double %69 to i32
  %71 = getelementptr inbounds %struct.icstruct, ptr %3, i32 0, i32 0
  %72 = getelementptr inbounds [3 x i32], ptr %71, i64 0, i64 1
  store i32 %70, ptr %72, align 4
  br label %75

73:                                               ; preds = %63, %51
  %74 = getelementptr inbounds %struct.icstruct, ptr %3, i32 0, i32 1
  store i16 0, ptr %74, align 4
  br label %75

75:                                               ; preds = %73, %66
  %76 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 2
  %77 = load double, ptr %76, align 16
  %78 = load ptr, ptr %5, align 8
  %79 = getelementptr inbounds %struct.tree, ptr %78, i32 0, i32 0
  %80 = getelementptr inbounds [3 x double], ptr %79, i64 0, i64 2
  %81 = load double, ptr %80, align 8
  %82 = fsub double %77, %81
  %83 = load double, ptr %7, align 8
  %84 = fdiv double %82, %83
  store double %84, ptr %6, align 8
  %85 = load double, ptr %6, align 8
  %86 = fcmp ole double 0.000000e+00, %85
  br i1 %86, label %87, label %97

87:                                               ; preds = %75
  %88 = load double, ptr %6, align 8
  %89 = fcmp olt double %88, 1.000000e+00
  br i1 %89, label %90, label %97

90:                                               ; preds = %87
  %91 = load double, ptr %6, align 8
  %92 = fmul double 0x41D0000000000000, %91
  %93 = call double @llvm.floor.f64(double %92)
  %94 = fptosi double %93 to i32
  %95 = getelementptr inbounds %struct.icstruct, ptr %3, i32 0, i32 0
  %96 = getelementptr inbounds [3 x i32], ptr %95, i64 0, i64 2
  store i32 %94, ptr %96, align 4
  br label %99

97:                                               ; preds = %87, %75
  %98 = getelementptr inbounds %struct.icstruct, ptr %3, i32 0, i32 1
  store i16 0, ptr %98, align 4
  br label %99

99:                                               ; preds = %97, %90
  %100 = load { i64, i64 }, ptr %3, align 4
  ret { i64, i64 } %100
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @old_subindex(i64 %0, i64 %1, i32 noundef %2) #0 {
  %4 = alloca %struct.icstruct, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = getelementptr inbounds { i64, i64 }, ptr %4, i32 0, i32 0
  store i64 %0, ptr %8, align 4
  %9 = getelementptr inbounds { i64, i64 }, ptr %4, i32 0, i32 1
  store i64 %1, ptr %9, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %10

10:                                               ; preds = %29, %3
  %11 = load i32, ptr %7, align 4
  %12 = icmp slt i32 %11, 3
  br i1 %12, label %13, label %32

13:                                               ; preds = %10
  %14 = getelementptr inbounds %struct.icstruct, ptr %4, i32 0, i32 0
  %15 = load i32, ptr %7, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [3 x i32], ptr %14, i64 0, i64 %16
  %18 = load i32, ptr %17, align 4
  %19 = load i32, ptr %5, align 4
  %20 = and i32 %18, %19
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %28

22:                                               ; preds = %13
  %23 = load i32, ptr %7, align 4
  %24 = add nsw i32 %23, 1
  %25 = ashr i32 8, %24
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, ptr %6, align 4
  br label %28

28:                                               ; preds = %22, %13
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %7, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %7, align 4
  br label %10

32:                                               ; preds = %10
  %33 = load i32, ptr %6, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @stepsystem(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.tree, ptr %14, i32 0, i32 2
  %16 = load ptr, ptr %15, align 8
  store ptr %16, ptr %9, align 8
  %17 = load ptr, ptr %9, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %19, label %24

19:                                               ; preds = %2
  %20 = load ptr, ptr %9, align 8
  %21 = call i32 @freetree1(ptr noundef %20)
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.tree, ptr %22, i32 0, i32 2
  store ptr null, ptr %23, align 8
  br label %24

24:                                               ; preds = %19, %2
  %25 = load ptr, ptr %5, align 8
  %26 = load i32, ptr @nbody, align 4
  %27 = load ptr, ptr %3, align 8
  %28 = load i32, ptr %4, align 4
  %29 = call ptr @maketree(ptr noundef %25, i32 noundef %26, ptr noundef %27, i32 noundef %28, i32 noundef 0)
  store ptr %29, ptr %9, align 8
  %30 = load ptr, ptr %9, align 8
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds %struct.tree, ptr %31, i32 0, i32 2
  store ptr %30, ptr %32, align 8
  %33 = load ptr, ptr %3, align 8
  %34 = load i32, ptr %4, align 4
  %35 = call i32 @computegrav(ptr noundef %33, i32 noundef %34)
  %36 = load ptr, ptr %3, align 8
  %37 = getelementptr inbounds %struct.tree, ptr %36, i32 0, i32 4
  %38 = getelementptr inbounds [64 x ptr], ptr %37, i64 0, i64 0
  %39 = load ptr, ptr %38, align 8
  %40 = load i32, ptr %4, align 4
  %41 = call i32 @vp(ptr noundef %39, i32 noundef %40)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @freetree1(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = call i32 @freetree(ptr noundef %6)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @maketree(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca %struct.icstruct, align 4
  %15 = alloca i32, align 4
  %16 = alloca %struct.icstruct, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  store i32 %4, ptr %10, align 4
  %17 = load ptr, ptr %8, align 8
  %18 = getelementptr inbounds %struct.tree, ptr %17, i32 0, i32 2
  store ptr null, ptr %18, align 8
  %19 = load i32, ptr %7, align 4
  store i32 %19, ptr @nbody, align 4
  %20 = load i32, ptr @__NumNodes, align 4
  %21 = sub nsw i32 %20, 1
  store i32 %21, ptr %12, align 4
  br label %22

22:                                               ; preds = %74, %5
  %23 = load i32, ptr %12, align 4
  %24 = icmp sge i32 %23, 0
  br i1 %24, label %25, label %77

25:                                               ; preds = %22
  %26 = load ptr, ptr %8, align 8
  %27 = getelementptr inbounds %struct.tree, ptr %26, i32 0, i32 4
  %28 = load i32, ptr %12, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [64 x ptr], ptr %27, i64 0, i64 %29
  %31 = load ptr, ptr %30, align 8
  store ptr %31, ptr %6, align 8
  %32 = load ptr, ptr %6, align 8
  store ptr %32, ptr %11, align 8
  br label %33

33:                                               ; preds = %69, %25
  %34 = load ptr, ptr %11, align 8
  %35 = icmp ne ptr %34, null
  br i1 %35, label %36, label %73

36:                                               ; preds = %33
  %37 = load ptr, ptr %11, align 8
  %38 = getelementptr inbounds %struct.bnode, ptr %37, i32 0, i32 1
  %39 = load double, ptr %38, align 8
  %40 = fcmp une double %39, 0.000000e+00
  br i1 %40, label %41, label %68

41:                                               ; preds = %36
  %42 = load ptr, ptr %11, align 8
  %43 = load ptr, ptr %8, align 8
  %44 = load i32, ptr %9, align 4
  %45 = load i32, ptr %10, align 4
  %46 = call i32 @expandbox(ptr noundef %42, ptr noundef %43, i32 noundef %44, i32 noundef %45)
  %47 = load ptr, ptr %11, align 8
  %48 = load ptr, ptr %8, align 8
  %49 = call { i64, i64 } @intcoord(ptr noundef %47, ptr noundef %48)
  %50 = getelementptr inbounds { i64, i64 }, ptr %16, i32 0, i32 0
  %51 = extractvalue { i64, i64 } %49, 0
  store i64 %51, ptr %50, align 4
  %52 = getelementptr inbounds { i64, i64 }, ptr %16, i32 0, i32 1
  %53 = extractvalue { i64, i64 } %49, 1
  store i64 %53, ptr %52, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %14, ptr align 4 %16, i64 16, i1 false)
  %54 = load ptr, ptr %8, align 8
  %55 = getelementptr inbounds %struct.tree, ptr %54, i32 0, i32 2
  %56 = load ptr, ptr %55, align 8
  store ptr %56, ptr %13, align 8
  %57 = load ptr, ptr %11, align 8
  %58 = load ptr, ptr %13, align 8
  %59 = load ptr, ptr %8, align 8
  %60 = getelementptr inbounds { i64, i64 }, ptr %14, i32 0, i32 0
  %61 = load i64, ptr %60, align 4
  %62 = getelementptr inbounds { i64, i64 }, ptr %14, i32 0, i32 1
  %63 = load i64, ptr %62, align 4
  %64 = call ptr @loadtree(ptr noundef %57, i64 %61, i64 %63, ptr noundef %58, i32 noundef 536870912, ptr noundef %59)
  store ptr %64, ptr %13, align 8
  %65 = load ptr, ptr %13, align 8
  %66 = load ptr, ptr %8, align 8
  %67 = getelementptr inbounds %struct.tree, ptr %66, i32 0, i32 2
  store ptr %65, ptr %67, align 8
  br label %68

68:                                               ; preds = %41, %36
  br label %69

69:                                               ; preds = %68
  %70 = load ptr, ptr %11, align 8
  %71 = getelementptr inbounds %struct.bnode, ptr %70, i32 0, i32 10
  %72 = load ptr, ptr %71, align 8
  store ptr %72, ptr %11, align 8
  br label %33

73:                                               ; preds = %33
  br label %74

74:                                               ; preds = %73
  %75 = load i32, ptr %12, align 4
  %76 = add nsw i32 %75, -1
  store i32 %76, ptr %12, align 4
  br label %22

77:                                               ; preds = %22
  %78 = load ptr, ptr %8, align 8
  %79 = getelementptr inbounds %struct.tree, ptr %78, i32 0, i32 2
  %80 = load ptr, ptr %79, align 8
  store ptr %80, ptr %13, align 8
  %81 = load ptr, ptr %13, align 8
  %82 = call double @hackcofm(ptr noundef %81)
  %83 = load ptr, ptr %8, align 8
  %84 = getelementptr inbounds %struct.tree, ptr %83, i32 0, i32 2
  %85 = load ptr, ptr %84, align 8
  ret ptr %85
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @computegrav(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.tree, ptr %10, i32 0, i32 1
  %12 = load double, ptr %11, align 8
  store double %12, ptr %6, align 8
  store double 6.250000e-03, ptr %7, align 8
  %13 = load i32, ptr @__NumNodes, align 4
  %14 = sub nsw i32 %13, 1
  store i32 %14, ptr %5, align 4
  br label %15

15:                                               ; preds = %34, %2
  %16 = load i32, ptr %5, align 4
  %17 = icmp sge i32 %16, 0
  br i1 %17, label %18, label %37

18:                                               ; preds = %15
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds %struct.tree, ptr %19, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %8, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.tree, ptr %22, i32 0, i32 4
  %24 = load i32, ptr %5, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [64 x ptr], ptr %23, i64 0, i64 %25
  %27 = load ptr, ptr %26, align 8
  store ptr %27, ptr %9, align 8
  %28 = load double, ptr %6, align 8
  %29 = load ptr, ptr %8, align 8
  %30 = load ptr, ptr %9, align 8
  %31 = load i32, ptr %4, align 4
  %32 = load double, ptr %7, align 8
  %33 = call i32 @grav(double noundef %28, ptr noundef %29, ptr noundef %30, i32 noundef %31, double noundef %32)
  br label %34

34:                                               ; preds = %18
  %35 = load i32, ptr %5, align 4
  %36 = add nsw i32 %35, -1
  store i32 %36, ptr %5, align 4
  br label %15

37:                                               ; preds = %15
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @vp(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca double, align 8
  %6 = alloca [3 x double], align 16
  %7 = alloca [3 x double], align 16
  %8 = alloca [3 x double], align 16
  %9 = alloca [3 x double], align 16
  %10 = alloca [3 x double], align 16
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca double, align 8
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  %20 = alloca i32, align 4
  %21 = alloca double, align 8
  %22 = alloca double, align 8
  %23 = alloca double, align 8
  %24 = alloca i32, align 4
  %25 = alloca double, align 8
  %26 = alloca double, align 8
  %27 = alloca double, align 8
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca double, align 8
  %34 = alloca double, align 8
  %35 = alloca double, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store double 6.250000e-03, ptr %5, align 8
  %36 = load ptr, ptr %3, align 8
  %37 = icmp ne ptr %36, null
  br i1 %37, label %38, label %40

38:                                               ; preds = %2
  %39 = load ptr, ptr %3, align 8
  store ptr %39, ptr %11, align 8
  br label %40

40:                                               ; preds = %38, %2
  br label %41

41:                                               ; preds = %495, %40
  %42 = load ptr, ptr %3, align 8
  %43 = icmp ne ptr %42, null
  br i1 %43, label %44, label %499

44:                                               ; preds = %41
  store i32 0, ptr %12, align 4
  br label %45

45:                                               ; preds = %58, %44
  %46 = load i32, ptr %12, align 4
  %47 = icmp slt i32 %46, 3
  br i1 %47, label %48, label %61

48:                                               ; preds = %45
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds %struct.bnode, ptr %49, i32 0, i32 7
  %51 = load i32, ptr %12, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [3 x double], ptr %50, i64 0, i64 %52
  %54 = load double, ptr %53, align 8
  %55 = load i32, ptr %12, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %56
  store double %54, ptr %57, align 8
  br label %58

58:                                               ; preds = %48
  %59 = load i32, ptr %12, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %12, align 4
  br label %45

61:                                               ; preds = %45
  %62 = load i32, ptr %4, align 4
  %63 = icmp sgt i32 %62, 0
  br i1 %63, label %64, label %143

64:                                               ; preds = %61
  store i32 0, ptr %13, align 4
  br label %65

65:                                               ; preds = %83, %64
  %66 = load i32, ptr %13, align 4
  %67 = icmp slt i32 %66, 3
  br i1 %67, label %68, label %86

68:                                               ; preds = %65
  %69 = load i32, ptr %13, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %70
  %72 = load double, ptr %71, align 8
  %73 = load ptr, ptr %3, align 8
  %74 = getelementptr inbounds %struct.bnode, ptr %73, i32 0, i32 6
  %75 = load i32, ptr %13, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [3 x double], ptr %74, i64 0, i64 %76
  %78 = load double, ptr %77, align 8
  %79 = fsub double %72, %78
  %80 = load i32, ptr %13, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [3 x double], ptr %7, i64 0, i64 %81
  store double %79, ptr %82, align 8
  br label %83

83:                                               ; preds = %68
  %84 = load i32, ptr %13, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, ptr %13, align 4
  br label %65

86:                                               ; preds = %65
  store i32 0, ptr %14, align 4
  br label %87

87:                                               ; preds = %100, %86
  %88 = load i32, ptr %14, align 4
  %89 = icmp slt i32 %88, 3
  br i1 %89, label %90, label %103

90:                                               ; preds = %87
  %91 = load i32, ptr %14, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [3 x double], ptr %7, i64 0, i64 %92
  %94 = load double, ptr %93, align 8
  %95 = load double, ptr %5, align 8
  %96 = fmul double %94, %95
  %97 = load i32, ptr %14, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 %98
  store double %96, ptr %99, align 8
  br label %100

100:                                              ; preds = %90
  %101 = load i32, ptr %14, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, ptr %14, align 4
  br label %87

103:                                              ; preds = %87
  store i32 0, ptr %15, align 4
  br label %104

104:                                              ; preds = %122, %103
  %105 = load i32, ptr %15, align 4
  %106 = icmp slt i32 %105, 3
  br i1 %106, label %107, label %125

107:                                              ; preds = %104
  %108 = load ptr, ptr %3, align 8
  %109 = getelementptr inbounds %struct.bnode, ptr %108, i32 0, i32 5
  %110 = load i32, ptr %15, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [3 x double], ptr %109, i64 0, i64 %111
  %113 = load double, ptr %112, align 8
  %114 = load i32, ptr %15, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 %115
  %117 = load double, ptr %116, align 8
  %118 = fadd double %113, %117
  %119 = load i32, ptr %15, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 %120
  store double %118, ptr %121, align 8
  br label %122

122:                                              ; preds = %107
  %123 = load i32, ptr %15, align 4
  %124 = add nsw i32 %123, 1
  store i32 %124, ptr %15, align 4
  br label %104

125:                                              ; preds = %104
  store i32 0, ptr %16, align 4
  br label %126

126:                                              ; preds = %139, %125
  %127 = load i32, ptr %16, align 4
  %128 = icmp slt i32 %127, 3
  br i1 %128, label %129, label %142

129:                                              ; preds = %126
  %130 = load i32, ptr %16, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 %131
  %133 = load double, ptr %132, align 8
  %134 = load ptr, ptr %3, align 8
  %135 = getelementptr inbounds %struct.bnode, ptr %134, i32 0, i32 5
  %136 = load i32, ptr %16, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds [3 x double], ptr %135, i64 0, i64 %137
  store double %133, ptr %138, align 8
  br label %139

139:                                              ; preds = %129
  %140 = load i32, ptr %16, align 4
  %141 = add nsw i32 %140, 1
  store i32 %141, ptr %16, align 4
  br label %126

142:                                              ; preds = %126
  br label %143

143:                                              ; preds = %142, %61
  %144 = load ptr, ptr %3, align 8
  %145 = getelementptr inbounds %struct.bnode, ptr %144, i32 0, i32 2
  %146 = getelementptr inbounds [3 x double], ptr %145, i64 0, i64 0
  %147 = load double, ptr %146, align 8
  store double %147, ptr %17, align 8
  %148 = load ptr, ptr %3, align 8
  %149 = getelementptr inbounds %struct.bnode, ptr %148, i32 0, i32 2
  %150 = getelementptr inbounds [3 x double], ptr %149, i64 0, i64 1
  %151 = load double, ptr %150, align 8
  store double %151, ptr %18, align 8
  %152 = load ptr, ptr %3, align 8
  %153 = getelementptr inbounds %struct.bnode, ptr %152, i32 0, i32 2
  %154 = getelementptr inbounds [3 x double], ptr %153, i64 0, i64 2
  %155 = load double, ptr %154, align 8
  store double %155, ptr %19, align 8
  %156 = load double, ptr %17, align 8
  %157 = call i32 (double, ...) @isnan(double noundef %156)
  %158 = icmp ne i32 %157, 0
  br i1 %158, label %159, label %162

159:                                              ; preds = %143
  %160 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 99)
  %161 = call i32 @exit(i32 noundef 0) #10
  unreachable

162:                                              ; preds = %143
  %163 = load double, ptr %18, align 8
  %164 = call i32 (double, ...) @isnan(double noundef %163)
  %165 = icmp ne i32 %164, 0
  br i1 %165, label %166, label %169

166:                                              ; preds = %162
  %167 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 98)
  %168 = call i32 @exit(i32 noundef 0) #10
  unreachable

169:                                              ; preds = %162
  %170 = load double, ptr %19, align 8
  %171 = call i32 (double, ...) @isnan(double noundef %170)
  %172 = icmp ne i32 %171, 0
  br i1 %172, label %173, label %176

173:                                              ; preds = %169
  %174 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 97)
  %175 = call i32 @exit(i32 noundef 0) #10
  unreachable

176:                                              ; preds = %169
  %177 = load double, ptr %17, align 8
  %178 = call double @llvm.fabs.f64(double %177)
  %179 = fcmp olt double %178, 1.000000e+01
  br i1 %179, label %183, label %180

180:                                              ; preds = %176
  %181 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 96)
  %182 = call i32 @exit(i32 noundef 0) #10
  unreachable

183:                                              ; preds = %176
  %184 = load double, ptr %18, align 8
  %185 = call double @llvm.fabs.f64(double %184)
  %186 = fcmp olt double %185, 1.000000e+01
  br i1 %186, label %190, label %187

187:                                              ; preds = %183
  %188 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 95)
  %189 = call i32 @exit(i32 noundef 0) #10
  unreachable

190:                                              ; preds = %183
  %191 = load double, ptr %19, align 8
  %192 = call double @llvm.fabs.f64(double %191)
  %193 = fcmp olt double %192, 1.000000e+01
  br i1 %193, label %197, label %194

194:                                              ; preds = %190
  %195 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 94)
  %196 = call i32 @exit(i32 noundef 0) #10
  unreachable

197:                                              ; preds = %190
  store i32 0, ptr %20, align 4
  br label %198

198:                                              ; preds = %211, %197
  %199 = load i32, ptr %20, align 4
  %200 = icmp slt i32 %199, 3
  br i1 %200, label %201, label %214

201:                                              ; preds = %198
  %202 = load i32, ptr %20, align 4
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %203
  %205 = load double, ptr %204, align 8
  %206 = load ptr, ptr %3, align 8
  %207 = getelementptr inbounds %struct.bnode, ptr %206, i32 0, i32 6
  %208 = load i32, ptr %20, align 4
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [3 x double], ptr %207, i64 0, i64 %209
  store double %205, ptr %210, align 8
  br label %211

211:                                              ; preds = %201
  %212 = load i32, ptr %20, align 4
  %213 = add nsw i32 %212, 1
  store i32 %213, ptr %20, align 4
  br label %198

214:                                              ; preds = %198
  %215 = load ptr, ptr %3, align 8
  %216 = getelementptr inbounds %struct.bnode, ptr %215, i32 0, i32 6
  %217 = getelementptr inbounds [3 x double], ptr %216, i64 0, i64 0
  %218 = load double, ptr %217, align 8
  store double %218, ptr %21, align 8
  %219 = load ptr, ptr %3, align 8
  %220 = getelementptr inbounds %struct.bnode, ptr %219, i32 0, i32 6
  %221 = getelementptr inbounds [3 x double], ptr %220, i64 0, i64 1
  %222 = load double, ptr %221, align 8
  store double %222, ptr %22, align 8
  %223 = load ptr, ptr %3, align 8
  %224 = getelementptr inbounds %struct.bnode, ptr %223, i32 0, i32 6
  %225 = getelementptr inbounds [3 x double], ptr %224, i64 0, i64 2
  %226 = load double, ptr %225, align 8
  store double %226, ptr %23, align 8
  %227 = load double, ptr %21, align 8
  %228 = call i32 (double, ...) @isnan(double noundef %227)
  %229 = icmp ne i32 %228, 0
  br i1 %229, label %230, label %233

230:                                              ; preds = %214
  %231 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 89)
  %232 = call i32 @exit(i32 noundef 0) #10
  unreachable

233:                                              ; preds = %214
  %234 = load double, ptr %22, align 8
  %235 = call i32 (double, ...) @isnan(double noundef %234)
  %236 = icmp ne i32 %235, 0
  br i1 %236, label %237, label %240

237:                                              ; preds = %233
  %238 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 88)
  %239 = call i32 @exit(i32 noundef 0) #10
  unreachable

240:                                              ; preds = %233
  %241 = load double, ptr %23, align 8
  %242 = call i32 (double, ...) @isnan(double noundef %241)
  %243 = icmp ne i32 %242, 0
  br i1 %243, label %244, label %247

244:                                              ; preds = %240
  %245 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 87)
  %246 = call i32 @exit(i32 noundef 0) #10
  unreachable

247:                                              ; preds = %240
  %248 = load double, ptr %21, align 8
  %249 = call double @llvm.fabs.f64(double %248)
  %250 = fcmp olt double %249, 1.000000e+04
  br i1 %250, label %254, label %251

251:                                              ; preds = %247
  %252 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 86)
  %253 = call i32 @exit(i32 noundef 0) #10
  unreachable

254:                                              ; preds = %247
  %255 = load double, ptr %22, align 8
  %256 = call double @llvm.fabs.f64(double %255)
  %257 = fcmp olt double %256, 1.000000e+04
  br i1 %257, label %261, label %258

258:                                              ; preds = %254
  %259 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 85)
  %260 = call i32 @exit(i32 noundef 0) #10
  unreachable

261:                                              ; preds = %254
  %262 = load double, ptr %23, align 8
  %263 = call double @llvm.fabs.f64(double %262)
  %264 = fcmp olt double %263, 1.000000e+04
  br i1 %264, label %268, label %265

265:                                              ; preds = %261
  %266 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 84)
  %267 = call i32 @exit(i32 noundef 0) #10
  unreachable

268:                                              ; preds = %261
  store i32 0, ptr %24, align 4
  br label %269

269:                                              ; preds = %284, %268
  %270 = load i32, ptr %24, align 4
  %271 = icmp slt i32 %270, 3
  br i1 %271, label %272, label %287

272:                                              ; preds = %269
  %273 = load ptr, ptr %3, align 8
  %274 = getelementptr inbounds %struct.bnode, ptr %273, i32 0, i32 6
  %275 = load i32, ptr %24, align 4
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds [3 x double], ptr %274, i64 0, i64 %276
  %278 = load double, ptr %277, align 8
  %279 = load double, ptr %5, align 8
  %280 = fmul double %278, %279
  %281 = load i32, ptr %24, align 4
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 %282
  store double %280, ptr %283, align 8
  br label %284

284:                                              ; preds = %272
  %285 = load i32, ptr %24, align 4
  %286 = add nsw i32 %285, 1
  store i32 %286, ptr %24, align 4
  br label %269

287:                                              ; preds = %269
  %288 = load ptr, ptr %3, align 8
  %289 = getelementptr inbounds %struct.bnode, ptr %288, i32 0, i32 5
  %290 = getelementptr inbounds [3 x double], ptr %289, i64 0, i64 0
  %291 = load double, ptr %290, align 8
  store double %291, ptr %25, align 8
  %292 = load ptr, ptr %3, align 8
  %293 = getelementptr inbounds %struct.bnode, ptr %292, i32 0, i32 5
  %294 = getelementptr inbounds [3 x double], ptr %293, i64 0, i64 1
  %295 = load double, ptr %294, align 8
  store double %295, ptr %26, align 8
  %296 = load ptr, ptr %3, align 8
  %297 = getelementptr inbounds %struct.bnode, ptr %296, i32 0, i32 5
  %298 = getelementptr inbounds [3 x double], ptr %297, i64 0, i64 2
  %299 = load double, ptr %298, align 8
  store double %299, ptr %27, align 8
  %300 = load double, ptr %25, align 8
  %301 = call i32 (double, ...) @isnan(double noundef %300)
  %302 = icmp ne i32 %301, 0
  br i1 %302, label %303, label %306

303:                                              ; preds = %287
  %304 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 79)
  %305 = call i32 @exit(i32 noundef 0) #10
  unreachable

306:                                              ; preds = %287
  %307 = load double, ptr %26, align 8
  %308 = call i32 (double, ...) @isnan(double noundef %307)
  %309 = icmp ne i32 %308, 0
  br i1 %309, label %310, label %313

310:                                              ; preds = %306
  %311 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 78)
  %312 = call i32 @exit(i32 noundef 0) #10
  unreachable

313:                                              ; preds = %306
  %314 = load double, ptr %27, align 8
  %315 = call i32 (double, ...) @isnan(double noundef %314)
  %316 = icmp ne i32 %315, 0
  br i1 %316, label %317, label %320

317:                                              ; preds = %313
  %318 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 77)
  %319 = call i32 @exit(i32 noundef 0) #10
  unreachable

320:                                              ; preds = %313
  %321 = load double, ptr %25, align 8
  %322 = call double @llvm.fabs.f64(double %321)
  %323 = fcmp olt double %322, 1.000000e+04
  br i1 %323, label %327, label %324

324:                                              ; preds = %320
  %325 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 76)
  %326 = call i32 @exit(i32 noundef 0) #10
  unreachable

327:                                              ; preds = %320
  %328 = load double, ptr %26, align 8
  %329 = call double @llvm.fabs.f64(double %328)
  %330 = fcmp olt double %329, 1.000000e+04
  br i1 %330, label %334, label %331

331:                                              ; preds = %327
  %332 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 75)
  %333 = call i32 @exit(i32 noundef 0) #10
  unreachable

334:                                              ; preds = %327
  %335 = load double, ptr %27, align 8
  %336 = call double @llvm.fabs.f64(double %335)
  %337 = fcmp olt double %336, 1.000000e+04
  br i1 %337, label %341, label %338

338:                                              ; preds = %334
  %339 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 74)
  %340 = call i32 @exit(i32 noundef 0) #10
  unreachable

341:                                              ; preds = %334
  store i32 0, ptr %28, align 4
  br label %342

342:                                              ; preds = %360, %341
  %343 = load i32, ptr %28, align 4
  %344 = icmp slt i32 %343, 3
  br i1 %344, label %345, label %363

345:                                              ; preds = %342
  %346 = load ptr, ptr %3, align 8
  %347 = getelementptr inbounds %struct.bnode, ptr %346, i32 0, i32 5
  %348 = load i32, ptr %28, align 4
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds [3 x double], ptr %347, i64 0, i64 %349
  %351 = load double, ptr %350, align 8
  %352 = load i32, ptr %28, align 4
  %353 = sext i32 %352 to i64
  %354 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 %353
  %355 = load double, ptr %354, align 8
  %356 = fadd double %351, %355
  %357 = load i32, ptr %28, align 4
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds [3 x double], ptr %9, i64 0, i64 %358
  store double %356, ptr %359, align 8
  br label %360

360:                                              ; preds = %345
  %361 = load i32, ptr %28, align 4
  %362 = add nsw i32 %361, 1
  store i32 %362, ptr %28, align 4
  br label %342

363:                                              ; preds = %342
  store i32 0, ptr %29, align 4
  br label %364

364:                                              ; preds = %376, %363
  %365 = load i32, ptr %29, align 4
  %366 = icmp slt i32 %365, 3
  br i1 %366, label %367, label %379

367:                                              ; preds = %364
  %368 = load i32, ptr %29, align 4
  %369 = sext i32 %368 to i64
  %370 = getelementptr inbounds [3 x double], ptr %9, i64 0, i64 %369
  %371 = load double, ptr %370, align 8
  %372 = fmul double %371, 1.250000e-02
  %373 = load i32, ptr %29, align 4
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds [3 x double], ptr %10, i64 0, i64 %374
  store double %372, ptr %375, align 8
  br label %376

376:                                              ; preds = %367
  %377 = load i32, ptr %29, align 4
  %378 = add nsw i32 %377, 1
  store i32 %378, ptr %29, align 4
  br label %364

379:                                              ; preds = %364
  store i32 0, ptr %30, align 4
  br label %380

380:                                              ; preds = %398, %379
  %381 = load i32, ptr %30, align 4
  %382 = icmp slt i32 %381, 3
  br i1 %382, label %383, label %401

383:                                              ; preds = %380
  %384 = load ptr, ptr %3, align 8
  %385 = getelementptr inbounds %struct.bnode, ptr %384, i32 0, i32 2
  %386 = load i32, ptr %30, align 4
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds [3 x double], ptr %385, i64 0, i64 %387
  %389 = load double, ptr %388, align 8
  %390 = load i32, ptr %30, align 4
  %391 = sext i32 %390 to i64
  %392 = getelementptr inbounds [3 x double], ptr %10, i64 0, i64 %391
  %393 = load double, ptr %392, align 8
  %394 = fadd double %389, %393
  %395 = load i32, ptr %30, align 4
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds [3 x double], ptr %10, i64 0, i64 %396
  store double %394, ptr %397, align 8
  br label %398

398:                                              ; preds = %383
  %399 = load i32, ptr %30, align 4
  %400 = add nsw i32 %399, 1
  store i32 %400, ptr %30, align 4
  br label %380

401:                                              ; preds = %380
  store i32 0, ptr %31, align 4
  br label %402

402:                                              ; preds = %415, %401
  %403 = load i32, ptr %31, align 4
  %404 = icmp slt i32 %403, 3
  br i1 %404, label %405, label %418

405:                                              ; preds = %402
  %406 = load i32, ptr %31, align 4
  %407 = sext i32 %406 to i64
  %408 = getelementptr inbounds [3 x double], ptr %10, i64 0, i64 %407
  %409 = load double, ptr %408, align 8
  %410 = load ptr, ptr %3, align 8
  %411 = getelementptr inbounds %struct.bnode, ptr %410, i32 0, i32 2
  %412 = load i32, ptr %31, align 4
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds [3 x double], ptr %411, i64 0, i64 %413
  store double %409, ptr %414, align 8
  br label %415

415:                                              ; preds = %405
  %416 = load i32, ptr %31, align 4
  %417 = add nsw i32 %416, 1
  store i32 %417, ptr %31, align 4
  br label %402

418:                                              ; preds = %402
  store i32 0, ptr %32, align 4
  br label %419

419:                                              ; preds = %437, %418
  %420 = load i32, ptr %32, align 4
  %421 = icmp slt i32 %420, 3
  br i1 %421, label %422, label %440

422:                                              ; preds = %419
  %423 = load i32, ptr %32, align 4
  %424 = sext i32 %423 to i64
  %425 = getelementptr inbounds [3 x double], ptr %9, i64 0, i64 %424
  %426 = load double, ptr %425, align 8
  %427 = load i32, ptr %32, align 4
  %428 = sext i32 %427 to i64
  %429 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 %428
  %430 = load double, ptr %429, align 8
  %431 = fadd double %426, %430
  %432 = load ptr, ptr %3, align 8
  %433 = getelementptr inbounds %struct.bnode, ptr %432, i32 0, i32 5
  %434 = load i32, ptr %32, align 4
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds [3 x double], ptr %433, i64 0, i64 %435
  store double %431, ptr %436, align 8
  br label %437

437:                                              ; preds = %422
  %438 = load i32, ptr %32, align 4
  %439 = add nsw i32 %438, 1
  store i32 %439, ptr %32, align 4
  br label %419

440:                                              ; preds = %419
  %441 = load ptr, ptr %3, align 8
  %442 = getelementptr inbounds %struct.bnode, ptr %441, i32 0, i32 2
  %443 = getelementptr inbounds [3 x double], ptr %442, i64 0, i64 0
  %444 = load double, ptr %443, align 8
  store double %444, ptr %33, align 8
  %445 = load ptr, ptr %3, align 8
  %446 = getelementptr inbounds %struct.bnode, ptr %445, i32 0, i32 2
  %447 = getelementptr inbounds [3 x double], ptr %446, i64 0, i64 1
  %448 = load double, ptr %447, align 8
  store double %448, ptr %34, align 8
  %449 = load ptr, ptr %3, align 8
  %450 = getelementptr inbounds %struct.bnode, ptr %449, i32 0, i32 2
  %451 = getelementptr inbounds [3 x double], ptr %450, i64 0, i64 2
  %452 = load double, ptr %451, align 8
  store double %452, ptr %35, align 8
  %453 = load double, ptr %33, align 8
  %454 = call i32 (double, ...) @isnan(double noundef %453)
  %455 = icmp ne i32 %454, 0
  br i1 %455, label %456, label %459

456:                                              ; preds = %440
  %457 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 69)
  %458 = call i32 @exit(i32 noundef 0) #10
  unreachable

459:                                              ; preds = %440
  %460 = load double, ptr %34, align 8
  %461 = call i32 (double, ...) @isnan(double noundef %460)
  %462 = icmp ne i32 %461, 0
  br i1 %462, label %463, label %466

463:                                              ; preds = %459
  %464 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 68)
  %465 = call i32 @exit(i32 noundef 0) #10
  unreachable

466:                                              ; preds = %459
  %467 = load double, ptr %35, align 8
  %468 = call i32 (double, ...) @isnan(double noundef %467)
  %469 = icmp ne i32 %468, 0
  br i1 %469, label %470, label %473

470:                                              ; preds = %466
  %471 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 67)
  %472 = call i32 @exit(i32 noundef 0) #10
  unreachable

473:                                              ; preds = %466
  %474 = load double, ptr %33, align 8
  %475 = call double @llvm.fabs.f64(double %474)
  %476 = fcmp olt double %475, 1.000000e+04
  br i1 %476, label %480, label %477

477:                                              ; preds = %473
  %478 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 66)
  %479 = call i32 @exit(i32 noundef 0) #10
  unreachable

480:                                              ; preds = %473
  %481 = load double, ptr %34, align 8
  %482 = call double @llvm.fabs.f64(double %481)
  %483 = fcmp olt double %482, 1.000000e+04
  br i1 %483, label %487, label %484

484:                                              ; preds = %480
  %485 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 65)
  %486 = call i32 @exit(i32 noundef 0) #10
  unreachable

487:                                              ; preds = %480
  %488 = load double, ptr %35, align 8
  %489 = call double @llvm.fabs.f64(double %488)
  %490 = fcmp olt double %489, 1.000000e+04
  br i1 %490, label %494, label %491

491:                                              ; preds = %487
  %492 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 64)
  %493 = call i32 @exit(i32 noundef 0) #10
  unreachable

494:                                              ; preds = %487
  br label %495

495:                                              ; preds = %494
  %496 = load ptr, ptr %3, align 8
  %497 = getelementptr inbounds %struct.bnode, ptr %496, i32 0, i32 10
  %498 = load ptr, ptr %497, align 8
  store ptr %498, ptr %3, align 8
  br label %41

499:                                              ; preds = %41
  ret i32 0
}

declare i32 @isnan(...) #1

; Function Attrs: noreturn nounwind
declare i32 @exit(i32 noundef) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @grav(double noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3, double noundef %4) #0 {
  %6 = alloca double, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  store double %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  store double %4, ptr %10, align 8
  store i32 0, ptr %13, align 4
  %15 = load ptr, ptr %8, align 8
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %19

17:                                               ; preds = %5
  %18 = load ptr, ptr %8, align 8
  store ptr %18, ptr %14, align 8
  br label %19

19:                                               ; preds = %17, %5
  %20 = load ptr, ptr %8, align 8
  store ptr %20, ptr %12, align 8
  br label %21

21:                                               ; preds = %24, %19
  %22 = load ptr, ptr %12, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %24, label %36

24:                                               ; preds = %21
  %25 = load double, ptr %6, align 8
  %26 = load ptr, ptr %7, align 8
  %27 = load ptr, ptr %12, align 8
  %28 = load i32, ptr %9, align 4
  %29 = load double, ptr %10, align 8
  %30 = call i32 @gravstep(double noundef %25, ptr noundef %26, ptr noundef %27, i32 noundef %28, double noundef %29)
  %31 = load ptr, ptr %12, align 8
  %32 = getelementptr inbounds %struct.bnode, ptr %31, i32 0, i32 10
  %33 = load ptr, ptr %32, align 8
  store ptr %33, ptr %12, align 8
  %34 = load i32, ptr %13, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %13, align 4
  br label %21

36:                                               ; preds = %21
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @gravstep(double noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3, double noundef %4) #0 {
  %6 = alloca double, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  store double %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  store double %4, ptr %10, align 8
  %11 = load ptr, ptr %8, align 8
  %12 = load double, ptr %6, align 8
  %13 = load ptr, ptr %7, align 8
  %14 = call i32 @hackgrav(ptr noundef %11, double noundef %12, ptr noundef %13)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @hackgrav(ptr noundef %0, double noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.hgstruct, align 8
  %8 = alloca double, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.hgstruct, align 8
  %12 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store double %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.hgstruct, ptr %7, i32 0, i32 0
  store ptr %13, ptr %14, align 8
  store i32 0, ptr %9, align 4
  br label %15

15:                                               ; preds = %29, %3
  %16 = load i32, ptr %9, align 4
  %17 = icmp slt i32 %16, 3
  br i1 %17, label %18, label %32

18:                                               ; preds = %15
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.bnode, ptr %19, i32 0, i32 2
  %21 = load i32, ptr %9, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [3 x double], ptr %20, i64 0, i64 %22
  %24 = load double, ptr %23, align 8
  %25 = getelementptr inbounds %struct.hgstruct, ptr %7, i32 0, i32 1
  %26 = load i32, ptr %9, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [3 x double], ptr %25, i64 0, i64 %27
  store double %24, ptr %28, align 8
  br label %29

29:                                               ; preds = %18
  %30 = load i32, ptr %9, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %9, align 4
  br label %15

32:                                               ; preds = %15
  %33 = getelementptr inbounds %struct.hgstruct, ptr %7, i32 0, i32 2
  store double 0.000000e+00, ptr %33, align 8
  store i32 0, ptr %10, align 4
  br label %34

34:                                               ; preds = %42, %32
  %35 = load i32, ptr %10, align 4
  %36 = icmp slt i32 %35, 3
  br i1 %36, label %37, label %45

37:                                               ; preds = %34
  %38 = getelementptr inbounds %struct.hgstruct, ptr %7, i32 0, i32 3
  %39 = load i32, ptr %10, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [3 x double], ptr %38, i64 0, i64 %40
  store double 0.000000e+00, ptr %41, align 8
  br label %42

42:                                               ; preds = %37
  %43 = load i32, ptr %10, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %10, align 4
  br label %34

45:                                               ; preds = %34
  %46 = load double, ptr %5, align 8
  %47 = load double, ptr %5, align 8
  %48 = fmul double %46, %47
  store double %48, ptr %8, align 8
  %49 = load ptr, ptr %6, align 8
  %50 = load double, ptr %8, align 8
  call void @walksub(ptr sret(%struct.hgstruct) align 8 %11, ptr noundef %49, double noundef %50, double noundef 1.000000e+00, ptr noundef byval(%struct.hgstruct) align 8 %7, i32 noundef 0)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %11, i64 64, i1 false)
  %51 = getelementptr inbounds %struct.hgstruct, ptr %7, i32 0, i32 2
  %52 = load double, ptr %51, align 8
  %53 = load ptr, ptr %4, align 8
  %54 = getelementptr inbounds %struct.bnode, ptr %53, i32 0, i32 8
  store double %52, ptr %54, align 8
  store i32 0, ptr %12, align 4
  br label %55

55:                                               ; preds = %69, %45
  %56 = load i32, ptr %12, align 4
  %57 = icmp slt i32 %56, 3
  br i1 %57, label %58, label %72

58:                                               ; preds = %55
  %59 = getelementptr inbounds %struct.hgstruct, ptr %7, i32 0, i32 3
  %60 = load i32, ptr %12, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [3 x double], ptr %59, i64 0, i64 %61
  %63 = load double, ptr %62, align 8
  %64 = load ptr, ptr %4, align 8
  %65 = getelementptr inbounds %struct.bnode, ptr %64, i32 0, i32 7
  %66 = load i32, ptr %12, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [3 x double], ptr %65, i64 0, i64 %67
  store double %63, ptr %68, align 8
  br label %69

69:                                               ; preds = %58
  %70 = load i32, ptr %12, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr %12, align 4
  br label %55

72:                                               ; preds = %55
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @walksub(ptr noalias sret(%struct.hgstruct) align 8 %0, ptr noundef %1, double noundef %2, double noundef %3, ptr noundef byval(%struct.hgstruct) align 8 %4, i32 noundef %5) #0 {
  %7 = alloca ptr, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca [8 x ptr], align 16
  %15 = alloca %struct.hgstruct, align 8
  %16 = alloca %struct.hgstruct, align 8
  store ptr %1, ptr %7, align 8
  store double %2, ptr %8, align 8
  store double %3, ptr %9, align 8
  store i32 %5, ptr %10, align 4
  %17 = load ptr, ptr %7, align 8
  %18 = load double, ptr %8, align 8
  %19 = load double, ptr %9, align 8
  %20 = call signext i16 @subdivp(ptr noundef %17, double noundef %18, double noundef %19, ptr noundef byval(%struct.hgstruct) align 8 %4)
  %21 = icmp ne i16 %20, 0
  br i1 %21, label %22, label %47

22:                                               ; preds = %6
  store i32 0, ptr %11, align 4
  br label %23

23:                                               ; preds = %43, %22
  %24 = load i32, ptr %11, align 4
  %25 = icmp slt i32 %24, 8
  br i1 %25, label %26, label %46

26:                                               ; preds = %23
  %27 = load ptr, ptr %7, align 8
  %28 = getelementptr inbounds %struct.cnode, ptr %27, i32 0, i32 5
  %29 = load i32, ptr %11, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [8 x ptr], ptr %28, i64 0, i64 %30
  %32 = load ptr, ptr %31, align 8
  store ptr %32, ptr %13, align 8
  %33 = load ptr, ptr %13, align 8
  %34 = icmp ne ptr %33, null
  br i1 %34, label %35, label %42

35:                                               ; preds = %26
  %36 = load ptr, ptr %13, align 8
  %37 = load double, ptr %8, align 8
  %38 = fdiv double %37, 4.000000e+00
  %39 = load double, ptr %9, align 8
  %40 = load i32, ptr %10, align 4
  %41 = add nsw i32 %40, 1
  call void @walksub(ptr sret(%struct.hgstruct) align 8 %15, ptr noundef %36, double noundef %38, double noundef %39, ptr noundef byval(%struct.hgstruct) align 8 %4, i32 noundef %41)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %4, ptr align 8 %15, i64 64, i1 false)
  br label %42

42:                                               ; preds = %35, %26
  br label %43

43:                                               ; preds = %42
  %44 = load i32, ptr %11, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %11, align 4
  br label %23

46:                                               ; preds = %23
  br label %55

47:                                               ; preds = %6
  %48 = load ptr, ptr %7, align 8
  %49 = getelementptr inbounds %struct.hgstruct, ptr %4, i32 0, i32 0
  %50 = load ptr, ptr %49, align 8
  %51 = icmp ne ptr %48, %50
  br i1 %51, label %52, label %54

52:                                               ; preds = %47
  %53 = load ptr, ptr %7, align 8
  call void @gravsub(ptr sret(%struct.hgstruct) align 8 %16, ptr noundef %53, ptr noundef byval(%struct.hgstruct) align 8 %4)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %4, ptr align 8 %16, i64 64, i1 false)
  br label %54

54:                                               ; preds = %52, %47
  br label %55

55:                                               ; preds = %54, %46
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %0, ptr align 8 %4, i64 64, i1 false)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @subdivp(ptr noundef %0, double noundef %1, double noundef %2, ptr noundef byval(%struct.hgstruct) align 8 %3) #0 {
  %5 = alloca i16, align 2
  %6 = alloca ptr, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca ptr, align 8
  %10 = alloca [3 x double], align 16
  %11 = alloca [3 x double], align 16
  %12 = alloca double, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store double %1, ptr %7, align 8
  store double %2, ptr %8, align 8
  %15 = load ptr, ptr %6, align 8
  store ptr %15, ptr %9, align 8
  %16 = load ptr, ptr %9, align 8
  %17 = getelementptr inbounds %struct.node, ptr %16, i32 0, i32 0
  %18 = load i16, ptr %17, align 8
  %19 = sext i16 %18 to i32
  %20 = icmp eq i32 %19, 1
  br i1 %20, label %21, label %22

21:                                               ; preds = %4
  store i16 0, ptr %5, align 2
  br label %71

22:                                               ; preds = %4
  store i32 0, ptr %13, align 4
  br label %23

23:                                               ; preds = %42, %22
  %24 = load i32, ptr %13, align 4
  %25 = icmp slt i32 %24, 3
  br i1 %25, label %26, label %45

26:                                               ; preds = %23
  %27 = load ptr, ptr %9, align 8
  %28 = getelementptr inbounds %struct.node, ptr %27, i32 0, i32 2
  %29 = load i32, ptr %13, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [3 x double], ptr %28, i64 0, i64 %30
  %32 = load double, ptr %31, align 8
  %33 = getelementptr inbounds %struct.hgstruct, ptr %3, i32 0, i32 1
  %34 = load i32, ptr %13, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [3 x double], ptr %33, i64 0, i64 %35
  %37 = load double, ptr %36, align 8
  %38 = fsub double %32, %37
  %39 = load i32, ptr %13, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [3 x double], ptr %10, i64 0, i64 %40
  store double %38, ptr %41, align 8
  br label %42

42:                                               ; preds = %26
  %43 = load i32, ptr %13, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %13, align 4
  br label %23

45:                                               ; preds = %23
  store double 0.000000e+00, ptr %12, align 8
  store i32 0, ptr %14, align 4
  br label %46

46:                                               ; preds = %60, %45
  %47 = load i32, ptr %14, align 4
  %48 = icmp slt i32 %47, 3
  br i1 %48, label %49, label %63

49:                                               ; preds = %46
  %50 = load i32, ptr %14, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [3 x double], ptr %10, i64 0, i64 %51
  %53 = load double, ptr %52, align 8
  %54 = load i32, ptr %14, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [3 x double], ptr %10, i64 0, i64 %55
  %57 = load double, ptr %56, align 8
  %58 = load double, ptr %12, align 8
  %59 = call double @llvm.fmuladd.f64(double %53, double %57, double %58)
  store double %59, ptr %12, align 8
  br label %60

60:                                               ; preds = %49
  %61 = load i32, ptr %14, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %14, align 4
  br label %46

63:                                               ; preds = %46
  %64 = load double, ptr %8, align 8
  %65 = load double, ptr %12, align 8
  %66 = fmul double %64, %65
  %67 = load double, ptr %7, align 8
  %68 = fcmp olt double %66, %67
  %69 = zext i1 %68 to i32
  %70 = trunc i32 %69 to i16
  store i16 %70, ptr %5, align 2
  br label %71

71:                                               ; preds = %63, %21
  %72 = load i16, ptr %5, align 2
  ret i16 %72
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @gravsub(ptr noalias sret(%struct.hgstruct) align 8 %0, ptr noundef %1, ptr noundef byval(%struct.hgstruct) align 8 %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca [3 x double], align 16
  %9 = alloca [3 x double], align 16
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca [3 x double], align 16
  %14 = alloca double, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %15, align 4
  br label %19

19:                                               ; preds = %38, %3
  %20 = load i32, ptr %15, align 4
  %21 = icmp slt i32 %20, 3
  br i1 %21, label %22, label %41

22:                                               ; preds = %19
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.node, ptr %23, i32 0, i32 2
  %25 = load i32, ptr %15, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [3 x double], ptr %24, i64 0, i64 %26
  %28 = load double, ptr %27, align 8
  %29 = getelementptr inbounds %struct.hgstruct, ptr %2, i32 0, i32 1
  %30 = load i32, ptr %15, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 %31
  %33 = load double, ptr %32, align 8
  %34 = fsub double %28, %33
  %35 = load i32, ptr %15, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [3 x double], ptr %13, i64 0, i64 %36
  store double %34, ptr %37, align 8
  br label %38

38:                                               ; preds = %22
  %39 = load i32, ptr %15, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %15, align 4
  br label %19

41:                                               ; preds = %19
  store double 0.000000e+00, ptr %14, align 8
  store i32 0, ptr %16, align 4
  br label %42

42:                                               ; preds = %56, %41
  %43 = load i32, ptr %16, align 4
  %44 = icmp slt i32 %43, 3
  br i1 %44, label %45, label %59

45:                                               ; preds = %42
  %46 = load i32, ptr %16, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [3 x double], ptr %13, i64 0, i64 %47
  %49 = load double, ptr %48, align 8
  %50 = load i32, ptr %16, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [3 x double], ptr %13, i64 0, i64 %51
  %53 = load double, ptr %52, align 8
  %54 = load double, ptr %14, align 8
  %55 = call double @llvm.fmuladd.f64(double %49, double %53, double %54)
  store double %55, ptr %14, align 8
  br label %56

56:                                               ; preds = %45
  %57 = load i32, ptr %16, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %16, align 4
  br label %42

59:                                               ; preds = %42
  %60 = load double, ptr %14, align 8
  %61 = fadd double %60, 0x3F647AE147AE147C
  store double %61, ptr %14, align 8
  %62 = load double, ptr %14, align 8
  %63 = call double @sqrt(double noundef %62) #9
  store double %63, ptr %5, align 8
  %64 = load ptr, ptr %4, align 8
  %65 = getelementptr inbounds %struct.node, ptr %64, i32 0, i32 1
  %66 = load double, ptr %65, align 8
  %67 = load double, ptr %5, align 8
  %68 = fdiv double %66, %67
  store double %68, ptr %6, align 8
  %69 = load double, ptr %6, align 8
  %70 = getelementptr inbounds %struct.hgstruct, ptr %2, i32 0, i32 2
  %71 = load double, ptr %70, align 8
  %72 = fsub double %71, %69
  store double %72, ptr %70, align 8
  %73 = load double, ptr %6, align 8
  %74 = load double, ptr %14, align 8
  %75 = fdiv double %73, %74
  store double %75, ptr %7, align 8
  store i32 0, ptr %17, align 4
  br label %76

76:                                               ; preds = %89, %59
  %77 = load i32, ptr %17, align 4
  %78 = icmp slt i32 %77, 3
  br i1 %78, label %79, label %92

79:                                               ; preds = %76
  %80 = load i32, ptr %17, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [3 x double], ptr %13, i64 0, i64 %81
  %83 = load double, ptr %82, align 8
  %84 = load double, ptr %7, align 8
  %85 = fmul double %83, %84
  %86 = load i32, ptr %17, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 %87
  store double %85, ptr %88, align 8
  br label %89

89:                                               ; preds = %79
  %90 = load i32, ptr %17, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, ptr %17, align 4
  br label %76

92:                                               ; preds = %76
  store i32 0, ptr %18, align 4
  br label %93

93:                                               ; preds = %111, %92
  %94 = load i32, ptr %18, align 4
  %95 = icmp slt i32 %94, 3
  br i1 %95, label %96, label %114

96:                                               ; preds = %93
  %97 = getelementptr inbounds %struct.hgstruct, ptr %2, i32 0, i32 3
  %98 = load i32, ptr %18, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [3 x double], ptr %97, i64 0, i64 %99
  %101 = load double, ptr %100, align 8
  %102 = load i32, ptr %18, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 %103
  %105 = load double, ptr %104, align 8
  %106 = fadd double %101, %105
  %107 = getelementptr inbounds %struct.hgstruct, ptr %2, i32 0, i32 3
  %108 = load i32, ptr %18, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [3 x double], ptr %107, i64 0, i64 %109
  store double %106, ptr %110, align 8
  br label %111

111:                                              ; preds = %96
  %112 = load i32, ptr %18, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, ptr %18, align 4
  br label %93

114:                                              ; preds = %93
  %115 = load ptr, ptr %4, align 8
  %116 = getelementptr inbounds %struct.node, ptr %115, i32 0, i32 0
  %117 = load i16, ptr %116, align 8
  %118 = sext i16 %117 to i32
  %119 = icmp eq i32 %118, 2
  br i1 %119, label %120, label %121

120:                                              ; preds = %114
  br label %121

121:                                              ; preds = %120, %114
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %0, ptr align 8 %2, i64 64, i1 false)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #5

; Function Attrs: nounwind
declare double @sqrt(double noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @expandbox(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.icstruct, align 4
  %10 = alloca i32, align 4
  %11 = alloca [3 x double], align 16
  %12 = alloca ptr, align 8
  %13 = alloca %struct.tree, align 8
  %14 = alloca double, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca double, align 8
  %18 = alloca i32, align 4
  %19 = alloca %struct.icstruct, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %20 = load ptr, ptr %5, align 8
  %21 = load ptr, ptr %6, align 8
  %22 = call i32 @ic_test(ptr noundef %20, ptr noundef %21)
  store i32 %22, ptr %15, align 4
  br label %23

23:                                               ; preds = %142, %4
  %24 = load i32, ptr %15, align 4
  %25 = icmp ne i32 %24, 0
  %26 = xor i1 %25, true
  br i1 %26, label %27, label %143

27:                                               ; preds = %23
  %28 = load ptr, ptr %6, align 8
  %29 = getelementptr inbounds %struct.tree, ptr %28, i32 0, i32 1
  %30 = load double, ptr %29, align 8
  store double %30, ptr %14, align 8
  %31 = load double, ptr %14, align 8
  %32 = fcmp olt double %31, 1.000000e+03
  br i1 %32, label %36, label %33

33:                                               ; preds = %27
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 999)
  %35 = call i32 @exit(i32 noundef 0) #10
  unreachable

36:                                               ; preds = %27
  store i32 0, ptr %16, align 4
  br label %37

37:                                               ; preds = %52, %36
  %38 = load i32, ptr %16, align 4
  %39 = icmp slt i32 %38, 3
  br i1 %39, label %40, label %55

40:                                               ; preds = %37
  %41 = load ptr, ptr %6, align 8
  %42 = getelementptr inbounds %struct.tree, ptr %41, i32 0, i32 0
  %43 = load i32, ptr %16, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [3 x double], ptr %42, i64 0, i64 %44
  %46 = load double, ptr %45, align 8
  %47 = load double, ptr %14, align 8
  %48 = call double @llvm.fmuladd.f64(double 5.000000e-01, double %47, double %46)
  %49 = load i32, ptr %16, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [3 x double], ptr %11, i64 0, i64 %50
  store double %48, ptr %51, align 8
  br label %52

52:                                               ; preds = %40
  %53 = load i32, ptr %16, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %16, align 4
  br label %37

55:                                               ; preds = %37
  store i32 0, ptr %10, align 4
  br label %56

56:                                               ; preds = %87, %55
  %57 = load i32, ptr %10, align 4
  %58 = icmp slt i32 %57, 3
  br i1 %58, label %59, label %90

59:                                               ; preds = %56
  %60 = load ptr, ptr %5, align 8
  %61 = getelementptr inbounds %struct.bnode, ptr %60, i32 0, i32 2
  %62 = load i32, ptr %10, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [3 x double], ptr %61, i64 0, i64 %63
  %65 = load double, ptr %64, align 8
  %66 = load i32, ptr %10, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [3 x double], ptr %11, i64 0, i64 %67
  %69 = load double, ptr %68, align 8
  %70 = fcmp olt double %65, %69
  br i1 %70, label %71, label %86

71:                                               ; preds = %59
  %72 = load ptr, ptr %6, align 8
  %73 = getelementptr inbounds %struct.tree, ptr %72, i32 0, i32 0
  %74 = load i32, ptr %10, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [3 x double], ptr %73, i64 0, i64 %75
  %77 = load double, ptr %76, align 8
  store double %77, ptr %17, align 8
  %78 = load double, ptr %17, align 8
  %79 = load double, ptr %14, align 8
  %80 = fsub double %78, %79
  %81 = load ptr, ptr %6, align 8
  %82 = getelementptr inbounds %struct.tree, ptr %81, i32 0, i32 0
  %83 = load i32, ptr %10, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [3 x double], ptr %82, i64 0, i64 %84
  store double %80, ptr %85, align 8
  br label %86

86:                                               ; preds = %71, %59
  br label %87

87:                                               ; preds = %86
  %88 = load i32, ptr %10, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, ptr %10, align 4
  br label %56

90:                                               ; preds = %56
  %91 = load double, ptr %14, align 8
  %92 = fmul double 2.000000e+00, %91
  %93 = load ptr, ptr %6, align 8
  %94 = getelementptr inbounds %struct.tree, ptr %93, i32 0, i32 1
  store double %92, ptr %94, align 8
  %95 = load ptr, ptr %6, align 8
  %96 = getelementptr inbounds %struct.tree, ptr %95, i32 0, i32 1
  %97 = load double, ptr %96, align 8
  store double %97, ptr %14, align 8
  %98 = load ptr, ptr %6, align 8
  %99 = getelementptr inbounds %struct.tree, ptr %98, i32 0, i32 2
  %100 = load ptr, ptr %99, align 8
  %101 = icmp ne ptr %100, null
  br i1 %101, label %102, label %142

102:                                              ; preds = %90
  %103 = call ptr @cell_alloc(i32 noundef 0)
  store ptr %103, ptr %12, align 8
  %104 = getelementptr inbounds [3 x double], ptr %11, i64 0, i64 0
  %105 = load double, ptr %104, align 16
  %106 = getelementptr inbounds [3 x double], ptr %11, i64 0, i64 1
  %107 = load double, ptr %106, align 8
  %108 = getelementptr inbounds [3 x double], ptr %11, i64 0, i64 2
  %109 = load double, ptr %108, align 16
  %110 = load ptr, ptr %6, align 8
  %111 = call { i64, i64 } @intcoord1(double noundef %105, double noundef %107, double noundef %109, ptr noundef %110)
  %112 = getelementptr inbounds { i64, i64 }, ptr %19, i32 0, i32 0
  %113 = extractvalue { i64, i64 } %111, 0
  store i64 %113, ptr %112, align 4
  %114 = getelementptr inbounds { i64, i64 }, ptr %19, i32 0, i32 1
  %115 = extractvalue { i64, i64 } %111, 1
  store i64 %115, ptr %114, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %9, ptr align 4 %19, i64 16, i1 false)
  %116 = getelementptr inbounds %struct.icstruct, ptr %9, i32 0, i32 1
  %117 = load i16, ptr %116, align 4
  %118 = icmp ne i16 %117, 0
  br i1 %118, label %122, label %119

119:                                              ; preds = %102
  %120 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 1)
  %121 = call i32 @exit(i32 noundef 0) #10
  unreachable

122:                                              ; preds = %102
  %123 = getelementptr inbounds { i64, i64 }, ptr %9, i32 0, i32 0
  %124 = load i64, ptr %123, align 4
  %125 = getelementptr inbounds { i64, i64 }, ptr %9, i32 0, i32 1
  %126 = load i64, ptr %125, align 4
  %127 = call i32 @old_subindex(i64 %124, i64 %126, i32 noundef 536870912)
  store i32 %127, ptr %10, align 4
  %128 = load ptr, ptr %6, align 8
  %129 = getelementptr inbounds %struct.tree, ptr %128, i32 0, i32 2
  %130 = load ptr, ptr %129, align 8
  %131 = load ptr, ptr %12, align 8
  %132 = getelementptr inbounds %struct.cnode, ptr %131, i32 0, i32 5
  %133 = load i32, ptr %10, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [8 x ptr], ptr %132, i64 0, i64 %134
  store ptr %130, ptr %135, align 8
  %136 = load ptr, ptr %12, align 8
  %137 = load ptr, ptr %6, align 8
  %138 = getelementptr inbounds %struct.tree, ptr %137, i32 0, i32 2
  store ptr %136, ptr %138, align 8
  %139 = load ptr, ptr %5, align 8
  %140 = load ptr, ptr %6, align 8
  %141 = call i32 @ic_test(ptr noundef %139, ptr noundef %140)
  store i32 %141, ptr %15, align 4
  br label %142

142:                                              ; preds = %122, %90
  br label %23

143:                                              ; preds = %23
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @loadtree(ptr noundef %0, i64 %1, i64 %2, ptr noundef %3, i32 noundef %4, ptr noundef %5) #0 {
  %7 = alloca ptr, align 8
  %8 = alloca %struct.icstruct, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca %struct.icstruct, align 4
  %19 = alloca %struct.icstruct, align 4
  %20 = getelementptr inbounds { i64, i64 }, ptr %8, i32 0, i32 0
  store i64 %1, ptr %20, align 4
  %21 = getelementptr inbounds { i64, i64 }, ptr %8, i32 0, i32 1
  store i64 %2, ptr %21, align 4
  store ptr %0, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store i32 %4, ptr %11, align 4
  store ptr %5, ptr %12, align 8
  %22 = load ptr, ptr %10, align 8
  %23 = icmp eq ptr %22, null
  br i1 %23, label %24, label %26

24:                                               ; preds = %6
  %25 = load ptr, ptr %9, align 8
  store ptr %25, ptr %7, align 8
  br label %85

26:                                               ; preds = %6
  %27 = load i32, ptr %11, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %32, label %29

29:                                               ; preds = %26
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 2)
  %31 = call i32 @exit(i32 noundef 0) #10
  unreachable

32:                                               ; preds = %26
  %33 = load ptr, ptr %10, align 8
  %34 = getelementptr inbounds %struct.node, ptr %33, i32 0, i32 0
  %35 = load i16, ptr %34, align 8
  %36 = sext i16 %35 to i32
  %37 = icmp eq i32 %36, 1
  br i1 %37, label %38, label %55

38:                                               ; preds = %32
  %39 = load ptr, ptr %10, align 8
  %40 = ptrtoint ptr %39 to i32
  %41 = and i32 %40, 127
  store i32 %41, ptr %16, align 4
  %42 = load i32, ptr %16, align 4
  %43 = call ptr @cell_alloc(i32 noundef %42)
  store ptr %43, ptr %14, align 8
  %44 = load ptr, ptr %10, align 8
  %45 = load ptr, ptr %12, align 8
  %46 = load i32, ptr %11, align 4
  %47 = call i32 @subindex(ptr noundef %44, ptr noundef %45, i32 noundef %46)
  store i32 %47, ptr %13, align 4
  %48 = load ptr, ptr %10, align 8
  %49 = load ptr, ptr %14, align 8
  %50 = getelementptr inbounds %struct.cnode, ptr %49, i32 0, i32 5
  %51 = load i32, ptr %13, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [8 x ptr], ptr %50, i64 0, i64 %52
  store ptr %48, ptr %53, align 8
  %54 = load ptr, ptr %14, align 8
  store ptr %54, ptr %10, align 8
  br label %55

55:                                               ; preds = %38, %32
  %56 = load i32, ptr %11, align 4
  %57 = getelementptr inbounds { i64, i64 }, ptr %8, i32 0, i32 0
  %58 = load i64, ptr %57, align 4
  %59 = getelementptr inbounds { i64, i64 }, ptr %8, i32 0, i32 1
  %60 = load i64, ptr %59, align 4
  %61 = call i32 @old_subindex(i64 %58, i64 %60, i32 noundef %56)
  store i32 %61, ptr %13, align 4
  %62 = load ptr, ptr %10, align 8
  %63 = getelementptr inbounds %struct.cnode, ptr %62, i32 0, i32 5
  %64 = load i32, ptr %13, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [8 x ptr], ptr %63, i64 0, i64 %65
  %67 = load ptr, ptr %66, align 8
  store ptr %67, ptr %15, align 8
  %68 = load ptr, ptr %9, align 8
  %69 = load ptr, ptr %15, align 8
  %70 = load i32, ptr %11, align 4
  %71 = ashr i32 %70, 1
  %72 = load ptr, ptr %12, align 8
  %73 = getelementptr inbounds { i64, i64 }, ptr %8, i32 0, i32 0
  %74 = load i64, ptr %73, align 4
  %75 = getelementptr inbounds { i64, i64 }, ptr %8, i32 0, i32 1
  %76 = load i64, ptr %75, align 4
  %77 = call ptr @loadtree(ptr noundef %68, i64 %74, i64 %76, ptr noundef %69, i32 noundef %71, ptr noundef %72)
  %78 = load ptr, ptr %10, align 8
  %79 = getelementptr inbounds %struct.cnode, ptr %78, i32 0, i32 5
  %80 = load i32, ptr %13, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [8 x ptr], ptr %79, i64 0, i64 %81
  store ptr %77, ptr %82, align 8
  br label %83

83:                                               ; preds = %55
  %84 = load ptr, ptr %10, align 8
  store ptr %84, ptr %7, align 8
  br label %85

85:                                               ; preds = %83, %24
  %86 = load ptr, ptr %7, align 8
  ret ptr %86
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @hackcofm(ptr noundef %0) #0 {
  %2 = alloca double, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca [3 x double], align 16
  %7 = alloca [3 x double], align 16
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.node, ptr %14, i32 0, i32 0
  %16 = load i16, ptr %15, align 8
  %17 = sext i16 %16 to i32
  %18 = icmp eq i32 %17, 2
  br i1 %18, label %19, label %135

19:                                               ; preds = %1
  store double 0.000000e+00, ptr %8, align 8
  store i32 0, ptr %10, align 4
  br label %20

20:                                               ; preds = %27, %19
  %21 = load i32, ptr %10, align 4
  %22 = icmp slt i32 %21, 3
  br i1 %22, label %23, label %30

23:                                               ; preds = %20
  %24 = load i32, ptr %10, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [3 x double], ptr %7, i64 0, i64 %25
  store double 0.000000e+00, ptr %26, align 8
  br label %27

27:                                               ; preds = %23
  %28 = load i32, ptr %10, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %10, align 4
  br label %20

30:                                               ; preds = %20
  store i32 0, ptr %4, align 4
  br label %31

31:                                               ; preds = %89, %30
  %32 = load i32, ptr %4, align 4
  %33 = icmp slt i32 %32, 8
  br i1 %33, label %34, label %92

34:                                               ; preds = %31
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds %struct.cnode, ptr %35, i32 0, i32 5
  %37 = load i32, ptr %4, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [8 x ptr], ptr %36, i64 0, i64 %38
  %40 = load ptr, ptr %39, align 8
  store ptr %40, ptr %5, align 8
  %41 = load ptr, ptr %5, align 8
  %42 = icmp ne ptr %41, null
  br i1 %42, label %43, label %88

43:                                               ; preds = %34
  %44 = load ptr, ptr %5, align 8
  %45 = call double @hackcofm(ptr noundef %44)
  store double %45, ptr %9, align 8
  %46 = load double, ptr %9, align 8
  %47 = load double, ptr %8, align 8
  %48 = fadd double %46, %47
  store double %48, ptr %8, align 8
  store i32 0, ptr %11, align 4
  br label %49

49:                                               ; preds = %64, %43
  %50 = load i32, ptr %11, align 4
  %51 = icmp slt i32 %50, 3
  br i1 %51, label %52, label %67

52:                                               ; preds = %49
  %53 = load ptr, ptr %5, align 8
  %54 = getelementptr inbounds %struct.node, ptr %53, i32 0, i32 2
  %55 = load i32, ptr %11, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [3 x double], ptr %54, i64 0, i64 %56
  %58 = load double, ptr %57, align 8
  %59 = load double, ptr %9, align 8
  %60 = fmul double %58, %59
  %61 = load i32, ptr %11, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %62
  store double %60, ptr %63, align 8
  br label %64

64:                                               ; preds = %52
  %65 = load i32, ptr %11, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, ptr %11, align 4
  br label %49

67:                                               ; preds = %49
  store i32 0, ptr %12, align 4
  br label %68

68:                                               ; preds = %84, %67
  %69 = load i32, ptr %12, align 4
  %70 = icmp slt i32 %69, 3
  br i1 %70, label %71, label %87

71:                                               ; preds = %68
  %72 = load i32, ptr %12, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [3 x double], ptr %7, i64 0, i64 %73
  %75 = load double, ptr %74, align 8
  %76 = load i32, ptr %12, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %77
  %79 = load double, ptr %78, align 8
  %80 = fadd double %75, %79
  %81 = load i32, ptr %12, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [3 x double], ptr %7, i64 0, i64 %82
  store double %80, ptr %83, align 8
  br label %84

84:                                               ; preds = %71
  %85 = load i32, ptr %12, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr %12, align 4
  br label %68

87:                                               ; preds = %68
  br label %88

88:                                               ; preds = %87, %34
  br label %89

89:                                               ; preds = %88
  %90 = load i32, ptr %4, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, ptr %4, align 4
  br label %31

92:                                               ; preds = %31
  %93 = load double, ptr %8, align 8
  %94 = load ptr, ptr %3, align 8
  %95 = getelementptr inbounds %struct.node, ptr %94, i32 0, i32 1
  store double %93, ptr %95, align 8
  %96 = getelementptr inbounds [3 x double], ptr %7, i64 0, i64 0
  %97 = load double, ptr %96, align 16
  %98 = load ptr, ptr %3, align 8
  %99 = getelementptr inbounds %struct.node, ptr %98, i32 0, i32 2
  %100 = getelementptr inbounds [3 x double], ptr %99, i64 0, i64 0
  store double %97, ptr %100, align 8
  %101 = getelementptr inbounds [3 x double], ptr %7, i64 0, i64 1
  %102 = load double, ptr %101, align 8
  %103 = load ptr, ptr %3, align 8
  %104 = getelementptr inbounds %struct.node, ptr %103, i32 0, i32 2
  %105 = getelementptr inbounds [3 x double], ptr %104, i64 0, i64 1
  store double %102, ptr %105, align 8
  %106 = getelementptr inbounds [3 x double], ptr %7, i64 0, i64 2
  %107 = load double, ptr %106, align 16
  %108 = load ptr, ptr %3, align 8
  %109 = getelementptr inbounds %struct.node, ptr %108, i32 0, i32 2
  %110 = getelementptr inbounds [3 x double], ptr %109, i64 0, i64 2
  store double %107, ptr %110, align 8
  store i32 0, ptr %13, align 4
  br label %111

111:                                              ; preds = %130, %92
  %112 = load i32, ptr %13, align 4
  %113 = icmp slt i32 %112, 3
  br i1 %113, label %114, label %133

114:                                              ; preds = %111
  %115 = load ptr, ptr %3, align 8
  %116 = getelementptr inbounds %struct.node, ptr %115, i32 0, i32 2
  %117 = load i32, ptr %13, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [3 x double], ptr %116, i64 0, i64 %118
  %120 = load double, ptr %119, align 8
  %121 = load ptr, ptr %3, align 8
  %122 = getelementptr inbounds %struct.node, ptr %121, i32 0, i32 1
  %123 = load double, ptr %122, align 8
  %124 = fdiv double %120, %123
  %125 = load ptr, ptr %3, align 8
  %126 = getelementptr inbounds %struct.node, ptr %125, i32 0, i32 2
  %127 = load i32, ptr %13, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [3 x double], ptr %126, i64 0, i64 %128
  store double %124, ptr %129, align 8
  br label %130

130:                                              ; preds = %114
  %131 = load i32, ptr %13, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, ptr %13, align 4
  br label %111

133:                                              ; preds = %111
  %134 = load double, ptr %8, align 8
  store double %134, ptr %2, align 8
  br label %140

135:                                              ; preds = %1
  %136 = load ptr, ptr %3, align 8
  %137 = getelementptr inbounds %struct.node, ptr %136, i32 0, i32 1
  %138 = load double, ptr %137, align 8
  store double %138, ptr %8, align 8
  %139 = load double, ptr %8, align 8
  store double %139, ptr %2, align 8
  br label %140

140:                                              ; preds = %135, %133
  %141 = load double, ptr %2, align 8
  ret double %141
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @cell_alloc(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %5 = load ptr, ptr @cp_free_list, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %12

7:                                                ; preds = %1
  %8 = load ptr, ptr @cp_free_list, align 8
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr @cp_free_list, align 8
  %10 = getelementptr inbounds %struct.cnode, ptr %9, i32 0, i32 6
  %11 = load ptr, ptr %10, align 8
  store ptr %11, ptr @cp_free_list, align 8
  br label %14

12:                                               ; preds = %1
  %13 = call noalias ptr @malloc(i64 noundef 120) #9
  store ptr %13, ptr %3, align 8
  br label %14

14:                                               ; preds = %12, %7
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.cnode, ptr %15, i32 0, i32 0
  store i16 2, ptr %16, align 8
  %17 = load i32, ptr %2, align 4
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.cnode, ptr %18, i32 0, i32 3
  store i32 %17, ptr %19, align 8
  store i32 0, ptr %4, align 4
  br label %20

20:                                               ; preds = %29, %14
  %21 = load i32, ptr %4, align 4
  %22 = icmp slt i32 %21, 8
  br i1 %22, label %23, label %32

23:                                               ; preds = %20
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.cnode, ptr %24, i32 0, i32 5
  %26 = load i32, ptr %4, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [8 x ptr], ptr %25, i64 0, i64 %27
  store ptr null, ptr %28, align 8
  br label %29

29:                                               ; preds = %23
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %4, align 4
  br label %20

32:                                               ; preds = %20
  %33 = load ptr, ptr %3, align 8
  ret ptr %33
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @subindex(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca [3 x i32], align 4
  %12 = alloca [3 x double], align 16
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.bnode, ptr %13, i32 0, i32 2
  %15 = getelementptr inbounds [3 x double], ptr %14, i64 0, i64 0
  %16 = load double, ptr %15, align 8
  %17 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 0
  store double %16, ptr %17, align 16
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.bnode, ptr %18, i32 0, i32 2
  %20 = getelementptr inbounds [3 x double], ptr %19, i64 0, i64 1
  %21 = load double, ptr %20, align 8
  %22 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 1
  store double %21, ptr %22, align 8
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.bnode, ptr %23, i32 0, i32 2
  %25 = getelementptr inbounds [3 x double], ptr %24, i64 0, i64 2
  %26 = load double, ptr %25, align 8
  %27 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 2
  store double %26, ptr %27, align 16
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds %struct.tree, ptr %28, i32 0, i32 1
  %30 = load double, ptr %29, align 8
  store double %30, ptr %9, align 8
  %31 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 0
  %32 = load double, ptr %31, align 16
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds %struct.tree, ptr %33, i32 0, i32 0
  %35 = getelementptr inbounds [3 x double], ptr %34, i64 0, i64 0
  %36 = load double, ptr %35, align 8
  %37 = fsub double %32, %36
  %38 = load double, ptr %9, align 8
  %39 = fdiv double %37, %38
  store double %39, ptr %10, align 8
  %40 = load double, ptr %10, align 8
  %41 = fcmp ole double 0.000000e+00, %40
  br i1 %41, label %42, label %45

42:                                               ; preds = %3
  %43 = load double, ptr %10, align 8
  %44 = fcmp olt double %43, 1.000000e+00
  br i1 %44, label %48, label %45

45:                                               ; preds = %42, %3
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 5)
  %47 = call i32 @exit(i32 noundef 0) #10
  unreachable

48:                                               ; preds = %42
  %49 = load double, ptr %10, align 8
  %50 = fmul double 0x41D0000000000000, %49
  %51 = call double @llvm.floor.f64(double %50)
  %52 = fptosi double %51 to i32
  %53 = getelementptr inbounds [3 x i32], ptr %11, i64 0, i64 0
  store i32 %52, ptr %53, align 4
  %54 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 1
  %55 = load double, ptr %54, align 8
  %56 = load ptr, ptr %5, align 8
  %57 = getelementptr inbounds %struct.tree, ptr %56, i32 0, i32 0
  %58 = getelementptr inbounds [3 x double], ptr %57, i64 0, i64 1
  %59 = load double, ptr %58, align 8
  %60 = fsub double %55, %59
  %61 = load double, ptr %9, align 8
  %62 = fdiv double %60, %61
  store double %62, ptr %10, align 8
  %63 = load double, ptr %10, align 8
  %64 = fcmp ole double 0.000000e+00, %63
  br i1 %64, label %65, label %68

65:                                               ; preds = %48
  %66 = load double, ptr %10, align 8
  %67 = fcmp olt double %66, 1.000000e+00
  br i1 %67, label %71, label %68

68:                                               ; preds = %65, %48
  %69 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 6)
  %70 = call i32 @exit(i32 noundef 0) #10
  unreachable

71:                                               ; preds = %65
  %72 = load double, ptr %10, align 8
  %73 = fmul double 0x41D0000000000000, %72
  %74 = call double @llvm.floor.f64(double %73)
  %75 = fptosi double %74 to i32
  %76 = getelementptr inbounds [3 x i32], ptr %11, i64 0, i64 1
  store i32 %75, ptr %76, align 4
  %77 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 2
  %78 = load double, ptr %77, align 16
  %79 = load ptr, ptr %5, align 8
  %80 = getelementptr inbounds %struct.tree, ptr %79, i32 0, i32 0
  %81 = getelementptr inbounds [3 x double], ptr %80, i64 0, i64 2
  %82 = load double, ptr %81, align 8
  %83 = fsub double %78, %82
  %84 = load double, ptr %9, align 8
  %85 = fdiv double %83, %84
  store double %85, ptr %10, align 8
  %86 = load double, ptr %10, align 8
  %87 = fcmp ole double 0.000000e+00, %86
  br i1 %87, label %88, label %91

88:                                               ; preds = %71
  %89 = load double, ptr %10, align 8
  %90 = fcmp olt double %89, 1.000000e+00
  br i1 %90, label %94, label %91

91:                                               ; preds = %88, %71
  %92 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 7)
  %93 = call i32 @exit(i32 noundef 0) #10
  unreachable

94:                                               ; preds = %88
  %95 = load double, ptr %10, align 8
  %96 = fmul double 0x41D0000000000000, %95
  %97 = call double @llvm.floor.f64(double %96)
  %98 = fptosi double %97 to i32
  %99 = getelementptr inbounds [3 x i32], ptr %11, i64 0, i64 2
  store i32 %98, ptr %99, align 4
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  br label %100

100:                                              ; preds = %118, %94
  %101 = load i32, ptr %8, align 4
  %102 = icmp slt i32 %101, 3
  br i1 %102, label %103, label %121

103:                                              ; preds = %100
  %104 = load i32, ptr %8, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [3 x i32], ptr %11, i64 0, i64 %105
  %107 = load i32, ptr %106, align 4
  %108 = load i32, ptr %6, align 4
  %109 = and i32 %107, %108
  %110 = icmp ne i32 %109, 0
  br i1 %110, label %111, label %117

111:                                              ; preds = %103
  %112 = load i32, ptr %8, align 4
  %113 = add nsw i32 %112, 1
  %114 = ashr i32 8, %113
  %115 = load i32, ptr %7, align 4
  %116 = add nsw i32 %115, %114
  store i32 %116, ptr %7, align 4
  br label %117

117:                                              ; preds = %111, %103
  br label %118

118:                                              ; preds = %117
  %119 = load i32, ptr %8, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, ptr %8, align 4
  br label %100

121:                                              ; preds = %100
  %122 = load i32, ptr %7, align 4
  ret i32 %122
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.floor.f64(double) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ic_test(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca i32, align 4
  %8 = alloca [3 x double], align 16
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 1, ptr %7, align 4
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.bnode, ptr %9, i32 0, i32 2
  %11 = getelementptr inbounds [3 x double], ptr %10, i64 0, i64 0
  %12 = load double, ptr %11, align 8
  %13 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 0
  store double %12, ptr %13, align 16
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.bnode, ptr %14, i32 0, i32 2
  %16 = getelementptr inbounds [3 x double], ptr %15, i64 0, i64 1
  %17 = load double, ptr %16, align 8
  %18 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 1
  store double %17, ptr %18, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds %struct.bnode, ptr %19, i32 0, i32 2
  %21 = getelementptr inbounds [3 x double], ptr %20, i64 0, i64 2
  %22 = load double, ptr %21, align 8
  %23 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 2
  store double %22, ptr %23, align 16
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds %struct.tree, ptr %24, i32 0, i32 1
  %26 = load double, ptr %25, align 8
  store double %26, ptr %6, align 8
  %27 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 0
  %28 = load double, ptr %27, align 16
  %29 = load ptr, ptr %4, align 8
  %30 = getelementptr inbounds %struct.tree, ptr %29, i32 0, i32 0
  %31 = getelementptr inbounds [3 x double], ptr %30, i64 0, i64 0
  %32 = load double, ptr %31, align 8
  %33 = fsub double %28, %32
  %34 = load double, ptr %6, align 8
  %35 = fdiv double %33, %34
  store double %35, ptr %5, align 8
  %36 = load double, ptr %5, align 8
  %37 = fcmp ole double 0.000000e+00, %36
  br i1 %37, label %38, label %41

38:                                               ; preds = %2
  %39 = load double, ptr %5, align 8
  %40 = fcmp olt double %39, 1.000000e+00
  br i1 %40, label %42, label %41

41:                                               ; preds = %38, %2
  store i32 0, ptr %7, align 4
  br label %42

42:                                               ; preds = %41, %38
  %43 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 1
  %44 = load double, ptr %43, align 8
  %45 = load ptr, ptr %4, align 8
  %46 = getelementptr inbounds %struct.tree, ptr %45, i32 0, i32 0
  %47 = getelementptr inbounds [3 x double], ptr %46, i64 0, i64 1
  %48 = load double, ptr %47, align 8
  %49 = fsub double %44, %48
  %50 = load double, ptr %6, align 8
  %51 = fdiv double %49, %50
  store double %51, ptr %5, align 8
  %52 = load double, ptr %5, align 8
  %53 = fcmp ole double 0.000000e+00, %52
  br i1 %53, label %54, label %57

54:                                               ; preds = %42
  %55 = load double, ptr %5, align 8
  %56 = fcmp olt double %55, 1.000000e+00
  br i1 %56, label %58, label %57

57:                                               ; preds = %54, %42
  store i32 0, ptr %7, align 4
  br label %58

58:                                               ; preds = %57, %54
  %59 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 2
  %60 = load double, ptr %59, align 16
  %61 = load ptr, ptr %4, align 8
  %62 = getelementptr inbounds %struct.tree, ptr %61, i32 0, i32 0
  %63 = getelementptr inbounds [3 x double], ptr %62, i64 0, i64 2
  %64 = load double, ptr %63, align 8
  %65 = fsub double %60, %64
  %66 = load double, ptr %6, align 8
  %67 = fdiv double %65, %66
  store double %67, ptr %5, align 8
  %68 = load double, ptr %5, align 8
  %69 = fcmp ole double 0.000000e+00, %68
  br i1 %69, label %70, label %73

70:                                               ; preds = %58
  %71 = load double, ptr %5, align 8
  %72 = fcmp olt double %71, 1.000000e+00
  br i1 %72, label %74, label %73

73:                                               ; preds = %70, %58
  store i32 0, ptr %7, align 4
  br label %74

74:                                               ; preds = %73, %70
  %75 = load i32, ptr %7, align 4
  ret i32 %75
}

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i64 } @intcoord1(double noundef %0, double noundef %1, double noundef %2, ptr noundef %3) #0 {
  %5 = alloca %struct.icstruct, align 4
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca ptr, align 8
  %10 = alloca double, align 8
  store double %0, ptr %6, align 8
  store double %1, ptr %7, align 8
  store double %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  %11 = getelementptr inbounds %struct.icstruct, ptr %5, i32 0, i32 1
  store i16 1, ptr %11, align 4
  %12 = load double, ptr %6, align 8
  %13 = load ptr, ptr %9, align 8
  %14 = getelementptr inbounds %struct.tree, ptr %13, i32 0, i32 0
  %15 = getelementptr inbounds [3 x double], ptr %14, i64 0, i64 0
  %16 = load double, ptr %15, align 8
  %17 = fsub double %12, %16
  %18 = load ptr, ptr %9, align 8
  %19 = getelementptr inbounds %struct.tree, ptr %18, i32 0, i32 1
  %20 = load double, ptr %19, align 8
  %21 = fdiv double %17, %20
  store double %21, ptr %10, align 8
  %22 = load double, ptr %10, align 8
  %23 = fcmp ole double 0.000000e+00, %22
  br i1 %23, label %24, label %34

24:                                               ; preds = %4
  %25 = load double, ptr %10, align 8
  %26 = fcmp olt double %25, 1.000000e+00
  br i1 %26, label %27, label %34

27:                                               ; preds = %24
  %28 = load double, ptr %10, align 8
  %29 = fmul double 0x41D0000000000000, %28
  %30 = call double @llvm.floor.f64(double %29)
  %31 = fptosi double %30 to i32
  %32 = getelementptr inbounds %struct.icstruct, ptr %5, i32 0, i32 0
  %33 = getelementptr inbounds [3 x i32], ptr %32, i64 0, i64 0
  store i32 %31, ptr %33, align 4
  br label %36

34:                                               ; preds = %24, %4
  %35 = getelementptr inbounds %struct.icstruct, ptr %5, i32 0, i32 1
  store i16 0, ptr %35, align 4
  br label %36

36:                                               ; preds = %34, %27
  %37 = load double, ptr %7, align 8
  %38 = load ptr, ptr %9, align 8
  %39 = getelementptr inbounds %struct.tree, ptr %38, i32 0, i32 0
  %40 = getelementptr inbounds [3 x double], ptr %39, i64 0, i64 1
  %41 = load double, ptr %40, align 8
  %42 = fsub double %37, %41
  %43 = load ptr, ptr %9, align 8
  %44 = getelementptr inbounds %struct.tree, ptr %43, i32 0, i32 1
  %45 = load double, ptr %44, align 8
  %46 = fdiv double %42, %45
  store double %46, ptr %10, align 8
  %47 = load double, ptr %10, align 8
  %48 = fcmp ole double 0.000000e+00, %47
  br i1 %48, label %49, label %59

49:                                               ; preds = %36
  %50 = load double, ptr %10, align 8
  %51 = fcmp olt double %50, 1.000000e+00
  br i1 %51, label %52, label %59

52:                                               ; preds = %49
  %53 = load double, ptr %10, align 8
  %54 = fmul double 0x41D0000000000000, %53
  %55 = call double @llvm.floor.f64(double %54)
  %56 = fptosi double %55 to i32
  %57 = getelementptr inbounds %struct.icstruct, ptr %5, i32 0, i32 0
  %58 = getelementptr inbounds [3 x i32], ptr %57, i64 0, i64 1
  store i32 %56, ptr %58, align 4
  br label %61

59:                                               ; preds = %49, %36
  %60 = getelementptr inbounds %struct.icstruct, ptr %5, i32 0, i32 1
  store i16 0, ptr %60, align 4
  br label %61

61:                                               ; preds = %59, %52
  %62 = load double, ptr %8, align 8
  %63 = load ptr, ptr %9, align 8
  %64 = getelementptr inbounds %struct.tree, ptr %63, i32 0, i32 0
  %65 = getelementptr inbounds [3 x double], ptr %64, i64 0, i64 2
  %66 = load double, ptr %65, align 8
  %67 = fsub double %62, %66
  %68 = load ptr, ptr %9, align 8
  %69 = getelementptr inbounds %struct.tree, ptr %68, i32 0, i32 1
  %70 = load double, ptr %69, align 8
  %71 = fdiv double %67, %70
  store double %71, ptr %10, align 8
  %72 = load double, ptr %10, align 8
  %73 = fcmp ole double 0.000000e+00, %72
  br i1 %73, label %74, label %84

74:                                               ; preds = %61
  %75 = load double, ptr %10, align 8
  %76 = fcmp olt double %75, 1.000000e+00
  br i1 %76, label %77, label %84

77:                                               ; preds = %74
  %78 = load double, ptr %10, align 8
  %79 = fmul double 0x41D0000000000000, %78
  %80 = call double @llvm.floor.f64(double %79)
  %81 = fptosi double %80 to i32
  %82 = getelementptr inbounds %struct.icstruct, ptr %5, i32 0, i32 0
  %83 = getelementptr inbounds [3 x i32], ptr %82, i64 0, i64 2
  store i32 %81, ptr %83, align 4
  br label %86

84:                                               ; preds = %74, %61
  %85 = getelementptr inbounds %struct.icstruct, ptr %5, i32 0, i32 1
  store i16 0, ptr %85, align 4
  br label %86

86:                                               ; preds = %84, %77
  %87 = load { i64, i64 }, ptr %5, align 4
  ret { i64, i64 } %87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @freetree(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %14, label %8

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.node, ptr %9, i32 0, i32 0
  %11 = load i16, ptr %10, align 8
  %12 = sext i16 %11 to i32
  %13 = icmp eq i32 %12, 1
  br i1 %13, label %14, label %15

14:                                               ; preds = %8, %1
  store i32 0, ptr %2, align 4
  br label %38

15:                                               ; preds = %8
  store i32 7, ptr %5, align 4
  br label %16

16:                                               ; preds = %32, %15
  %17 = load i32, ptr %5, align 4
  %18 = icmp sge i32 %17, 0
  br i1 %18, label %19, label %35

19:                                               ; preds = %16
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.cnode, ptr %20, i32 0, i32 5
  %22 = load i32, ptr %5, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [8 x ptr], ptr %21, i64 0, i64 %23
  %25 = load ptr, ptr %24, align 8
  store ptr %25, ptr %4, align 8
  %26 = load ptr, ptr %4, align 8
  %27 = icmp ne ptr %26, null
  br i1 %27, label %28, label %31

28:                                               ; preds = %19
  %29 = load ptr, ptr %4, align 8
  %30 = call i32 @freetree(ptr noundef %29)
  br label %31

31:                                               ; preds = %28, %19
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %5, align 4
  %34 = add nsw i32 %33, -1
  store i32 %34, ptr %5, align 4
  br label %16

35:                                               ; preds = %16
  %36 = load ptr, ptr %3, align 8
  %37 = call i32 @my_free(ptr noundef %36)
  store i32 0, ptr %2, align 4
  br label %38

38:                                               ; preds = %35, %14
  %39 = load i32, ptr %2, align 4
  ret i32 %39
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @my_free(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 0
  %5 = load i16, ptr %4, align 8
  %6 = sext i16 %5 to i32
  %7 = icmp eq i32 %6, 1
  br i1 %7, label %8, label %13

8:                                                ; preds = %1
  %9 = load ptr, ptr @bp_free_list, align 8
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.bnode, ptr %10, i32 0, i32 9
  store ptr %9, ptr %11, align 8
  %12 = load ptr, ptr %2, align 8
  store ptr %12, ptr @bp_free_list, align 8
  br label %18

13:                                               ; preds = %1
  %14 = load ptr, ptr @cp_free_list, align 8
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.cnode, ptr %15, i32 0, i32 6
  store ptr %14, ptr %16, align 8
  %17 = load ptr, ptr %2, align 8
  store ptr %17, ptr @cp_free_list, align 8
  br label %18

18:                                               ; preds = %13, %8
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @ubody_alloc(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  %4 = call noalias ptr @malloc(i64 noundef 144) #9
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.bnode, ptr %5, i32 0, i32 0
  store i16 1, ptr %6, align 8
  %7 = load i32, ptr %2, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.bnode, ptr %8, i32 0, i32 3
  store i32 %7, ptr %9, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.bnode, ptr %10, i32 0, i32 10
  store ptr null, ptr %11, align 8
  %12 = load i32, ptr %2, align 4
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.bnode, ptr %13, i32 0, i32 4
  store i32 %12, ptr %14, align 4
  %15 = load ptr, ptr %3, align 8
  ret ptr %15
}

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @testdata() #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca [3 x double], align 16
  %8 = alloca [3 x double], align 16
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca i32, align 4
  %17 = alloca double, align 8
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  store double 1.230000e+02, ptr %15, align 8
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 99)
  %25 = call i32 @exit(i32 noundef 0) #10
  unreachable
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @body_alloc(i32 noundef %0, double noundef %1, double noundef %2, double noundef %3, double noundef %4, double noundef %5, double noundef %6, double noundef %7, double noundef %8, double noundef %9, double noundef %10, ptr noundef %11) #0 {
  %13 = alloca i32, align 4
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca double, align 8
  %17 = alloca double, align 8
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  %20 = alloca double, align 8
  %21 = alloca double, align 8
  %22 = alloca double, align 8
  %23 = alloca double, align 8
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  store i32 %0, ptr %13, align 4
  store double %1, ptr %14, align 8
  store double %2, ptr %15, align 8
  store double %3, ptr %16, align 8
  store double %4, ptr %17, align 8
  store double %5, ptr %18, align 8
  store double %6, ptr %19, align 8
  store double %7, ptr %20, align 8
  store double %8, ptr %21, align 8
  store double %9, ptr %22, align 8
  store double %10, ptr %23, align 8
  store ptr %11, ptr %24, align 8
  %26 = load ptr, ptr @bp_free_list, align 8
  %27 = icmp ne ptr %26, null
  br i1 %27, label %28, label %33

28:                                               ; preds = %12
  %29 = load ptr, ptr @bp_free_list, align 8
  store ptr %29, ptr %25, align 8
  %30 = load ptr, ptr @bp_free_list, align 8
  %31 = getelementptr inbounds %struct.bnode, ptr %30, i32 0, i32 9
  %32 = load ptr, ptr %31, align 8
  store ptr %32, ptr @bp_free_list, align 8
  br label %35

33:                                               ; preds = %12
  %34 = call noalias ptr @malloc(i64 noundef 144) #9
  store ptr %34, ptr %25, align 8
  br label %35

35:                                               ; preds = %33, %28
  %36 = load ptr, ptr %25, align 8
  %37 = getelementptr inbounds %struct.bnode, ptr %36, i32 0, i32 0
  store i16 1, ptr %37, align 8
  %38 = load i32, ptr %13, align 4
  %39 = load ptr, ptr %25, align 8
  %40 = getelementptr inbounds %struct.bnode, ptr %39, i32 0, i32 3
  store i32 %38, ptr %40, align 8
  %41 = load double, ptr %14, align 8
  %42 = load ptr, ptr %25, align 8
  %43 = getelementptr inbounds %struct.bnode, ptr %42, i32 0, i32 2
  %44 = getelementptr inbounds [3 x double], ptr %43, i64 0, i64 0
  store double %41, ptr %44, align 8
  %45 = load double, ptr %15, align 8
  %46 = load ptr, ptr %25, align 8
  %47 = getelementptr inbounds %struct.bnode, ptr %46, i32 0, i32 2
  %48 = getelementptr inbounds [3 x double], ptr %47, i64 0, i64 1
  store double %45, ptr %48, align 8
  %49 = load double, ptr %16, align 8
  %50 = load ptr, ptr %25, align 8
  %51 = getelementptr inbounds %struct.bnode, ptr %50, i32 0, i32 2
  %52 = getelementptr inbounds [3 x double], ptr %51, i64 0, i64 2
  store double %49, ptr %52, align 8
  %53 = load double, ptr %17, align 8
  %54 = load ptr, ptr %25, align 8
  %55 = getelementptr inbounds %struct.bnode, ptr %54, i32 0, i32 5
  %56 = getelementptr inbounds [3 x double], ptr %55, i64 0, i64 0
  store double %53, ptr %56, align 8
  %57 = load double, ptr %18, align 8
  %58 = load ptr, ptr %25, align 8
  %59 = getelementptr inbounds %struct.bnode, ptr %58, i32 0, i32 5
  %60 = getelementptr inbounds [3 x double], ptr %59, i64 0, i64 1
  store double %57, ptr %60, align 8
  %61 = load double, ptr %19, align 8
  %62 = load ptr, ptr %25, align 8
  %63 = getelementptr inbounds %struct.bnode, ptr %62, i32 0, i32 5
  %64 = getelementptr inbounds [3 x double], ptr %63, i64 0, i64 2
  store double %61, ptr %64, align 8
  %65 = load double, ptr %20, align 8
  %66 = load ptr, ptr %25, align 8
  %67 = getelementptr inbounds %struct.bnode, ptr %66, i32 0, i32 6
  %68 = getelementptr inbounds [3 x double], ptr %67, i64 0, i64 0
  store double %65, ptr %68, align 8
  %69 = load double, ptr %21, align 8
  %70 = load ptr, ptr %25, align 8
  %71 = getelementptr inbounds %struct.bnode, ptr %70, i32 0, i32 6
  %72 = getelementptr inbounds [3 x double], ptr %71, i64 0, i64 1
  store double %69, ptr %72, align 8
  %73 = load double, ptr %22, align 8
  %74 = load ptr, ptr %25, align 8
  %75 = getelementptr inbounds %struct.bnode, ptr %74, i32 0, i32 6
  %76 = getelementptr inbounds [3 x double], ptr %75, i64 0, i64 2
  store double %73, ptr %76, align 8
  %77 = load double, ptr %23, align 8
  %78 = load ptr, ptr %25, align 8
  %79 = getelementptr inbounds %struct.bnode, ptr %78, i32 0, i32 1
  store double %77, ptr %79, align 8
  %80 = load ptr, ptr %25, align 8
  ret ptr %80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dis_number(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load i32, ptr @nbody, align 4
  %5 = sitofp i32 %4 to double
  %6 = load i32, ptr @__NumNodes, align 4
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %5, %7
  %9 = call double @llvm.ceil.f64(double %8)
  %10 = fptosi double %9 to i32
  store i32 %10, ptr %3, align 4
  %11 = load ptr, ptr %2, align 8
  %12 = load i32, ptr %3, align 4
  %13 = call i32 @dis2_number(ptr noundef %11, i32 noundef -1, i32 noundef %12)
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.ceil.f64(double) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dis2_number(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %10 = load ptr, ptr %5, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %3
  %13 = load i32, ptr %6, align 4
  store i32 %13, ptr %4, align 4
  br label %49

14:                                               ; preds = %3
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds %struct.node, ptr %15, i32 0, i32 0
  %17 = load i16, ptr %16, align 8
  %18 = sext i16 %17 to i32
  %19 = icmp eq i32 %18, 1
  br i1 %19, label %20, label %29

20:                                               ; preds = %14
  %21 = load i32, ptr %6, align 4
  %22 = add nsw i32 %21, 1
  %23 = load i32, ptr %7, align 4
  %24 = sdiv i32 %22, %23
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds %struct.node, ptr %25, i32 0, i32 4
  store i32 %24, ptr %26, align 4
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %4, align 4
  br label %49

29:                                               ; preds = %14
  store i32 0, ptr %8, align 4
  br label %30

30:                                               ; preds = %44, %29
  %31 = load i32, ptr %8, align 4
  %32 = icmp slt i32 %31, 8
  br i1 %32, label %33, label %47

33:                                               ; preds = %30
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds %struct.cnode, ptr %34, i32 0, i32 5
  %36 = load i32, ptr %8, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [8 x ptr], ptr %35, i64 0, i64 %37
  %39 = load ptr, ptr %38, align 8
  store ptr %39, ptr %9, align 8
  %40 = load ptr, ptr %9, align 8
  %41 = load i32, ptr %6, align 4
  %42 = load i32, ptr %7, align 4
  %43 = call i32 @dis2_number(ptr noundef %40, i32 noundef %41, i32 noundef %42)
  store i32 %43, ptr %6, align 4
  br label %44

44:                                               ; preds = %33
  %45 = load i32, ptr %8, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %8, align 4
  br label %30

47:                                               ; preds = %30
  %48 = load i32, ptr %6, align 4
  store i32 %48, ptr %4, align 4
  br label %49

49:                                               ; preds = %47, %20, %12
  %50 = load i32, ptr %4, align 4
  ret i32 %50
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @my_rand(double noundef %0) #0 {
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  store double %0, ptr %2, align 8
  %4 = load double, ptr %2, align 8
  %5 = call double @llvm.fmuladd.f64(double 1.680700e+04, double %4, double 1.000000e+00)
  store double %5, ptr %3, align 8
  %6 = load double, ptr %3, align 8
  %7 = load double, ptr %3, align 8
  %8 = fdiv double %7, 0x41DFFFFFFFC00000
  %9 = call double @llvm.floor.f64(double %8)
  %10 = call double @llvm.fmuladd.f64(double 0xC1DFFFFFFFC00000, double %9, double %6)
  store double %10, ptr %2, align 8
  %11 = load double, ptr %2, align 8
  ret double %11
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @xrand(double noundef %0, double noundef %1, double noundef %2) #0 {
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  store double %0, ptr %4, align 8
  store double %1, ptr %5, align 8
  store double %2, ptr %6, align 8
  %8 = load double, ptr %4, align 8
  %9 = load double, ptr %5, align 8
  %10 = load double, ptr %4, align 8
  %11 = fsub double %9, %10
  %12 = load double, ptr %6, align 8
  %13 = fmul double %11, %12
  %14 = fdiv double %13, 0x41DFFFFFFFC00000
  %15 = fadd double %8, %14
  store double %15, ptr %7, align 8
  %16 = load double, ptr %7, align 8
  ret double %16
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @cputime() #0 {
  %1 = alloca %struct.tms, align 8
  %2 = call i64 @times(ptr noundef %1) #9
  %3 = icmp eq i64 %2, -1
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = call i32 @error(ptr noundef @.str.5, ptr noundef null, ptr noundef null, ptr noundef null, ptr noundef null)
  br label %6

6:                                                ; preds = %4, %0
  %7 = getelementptr inbounds %struct.tms, ptr %1, i32 0, i32 0
  %8 = load i64, ptr %7, align 8
  %9 = sitofp i64 %8 to double
  %10 = fdiv double %9, 3.600000e+03
  ret double %10
}

; Function Attrs: nounwind
declare i64 @times(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @error(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  %11 = load ptr, ptr @stderr, align 8
  %12 = load ptr, ptr %6, align 8
  %13 = load ptr, ptr %7, align 8
  %14 = load ptr, ptr %8, align 8
  %15 = load ptr, ptr %9, align 8
  %16 = load ptr, ptr %10, align 8
  %17 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef %12, ptr noundef %13, ptr noundef %14, ptr noundef %15, ptr noundef %16)
  %18 = call ptr @__errno_location() #11
  %19 = load i32, ptr %18, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %5
  call void @perror(ptr noundef @.str.1.8) #12
  br label %22

22:                                               ; preds = %21, %5
  call void @exit(i32 noundef 0) #10
  unreachable
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__errno_location() #6

; Function Attrs: cold
declare void @perror(ptr noundef) #7

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dealwithargs(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  %6 = load i32, ptr %3, align 4
  %7 = icmp sgt i32 %6, 1
  br i1 %7, label %8, label %13

8:                                                ; preds = %2
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds ptr, ptr %9, i64 1
  %11 = load ptr, ptr %10, align 8
  %12 = call i32 @atoi(ptr noundef %11) #13
  store i32 %12, ptr @nbody, align 4
  br label %14

13:                                               ; preds = %2
  store i32 2048, ptr @nbody, align 4
  br label %14

14:                                               ; preds = %13, %8
  %15 = load i32, ptr %5, align 4
  ret i32 %15
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #8

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind willreturn memory(none) }
attributes #12 = { cold }
attributes #13 = { nounwind willreturn memory(read) }

!llvm.ident = !{!0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
