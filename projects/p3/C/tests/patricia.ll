; ModuleID = 'patricia.prof.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ptree = type { i64, ptr, i8, i8, ptr, ptr }
%struct.ptree_mask = type { i64, ptr }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [24 x i8] c"Usage: %s <TCP stream>\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"File %s doesn't seem to exist\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"Allocating p-trie node\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"Allocating p-trie mask data\00", align 1
@.str.5 = private unnamed_addr constant [35 x i8] c"Allocating p-trie mask's node data\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"%f %d\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"%f %08x: \00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"Found.\0A\00", align 1
@stderr = external global ptr, align 8
@.str.9 = private unnamed_addr constant [22 x i8] c"Failed on pat_insert\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @pat_insert(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %21

13:                                               ; preds = %2
  %14 = load ptr, ptr %4, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %21

16:                                               ; preds = %13
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.ptree, ptr %17, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %22, label %21

21:                                               ; preds = %16, %13, %2
  store ptr null, ptr %3, align 8
  br label %253

22:                                               ; preds = %16
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.ptree, ptr %23, i32 0, i32 1
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds %struct.ptree_mask, ptr %25, i32 0, i32 0
  %27 = load i64, ptr %26, align 8
  %28 = load ptr, ptr %4, align 8
  %29 = getelementptr inbounds %struct.ptree, ptr %28, i32 0, i32 0
  %30 = load i64, ptr %29, align 8
  %31 = and i64 %30, %27
  store i64 %31, ptr %29, align 8
  %32 = load ptr, ptr %5, align 8
  store ptr %32, ptr %6, align 8
  br label %33

33:                                               ; preds = %57, %22
  %34 = load ptr, ptr %6, align 8
  %35 = getelementptr inbounds %struct.ptree, ptr %34, i32 0, i32 3
  %36 = load i8, ptr %35, align 1
  %37 = sext i8 %36 to i32
  store i32 %37, ptr %9, align 4
  %38 = load ptr, ptr %6, align 8
  %39 = getelementptr inbounds %struct.ptree, ptr %38, i32 0, i32 3
  %40 = load i8, ptr %39, align 1
  %41 = sext i8 %40 to i32
  %42 = load ptr, ptr %4, align 8
  %43 = getelementptr inbounds %struct.ptree, ptr %42, i32 0, i32 0
  %44 = load i64, ptr %43, align 8
  %45 = call i64 @bit(i32 noundef %41, i64 noundef %44)
  %46 = icmp ne i64 %45, 0
  br i1 %46, label %47, label %51

47:                                               ; preds = %33
  %48 = load ptr, ptr %6, align 8
  %49 = getelementptr inbounds %struct.ptree, ptr %48, i32 0, i32 5
  %50 = load ptr, ptr %49, align 8
  br label %55

51:                                               ; preds = %33
  %52 = load ptr, ptr %6, align 8
  %53 = getelementptr inbounds %struct.ptree, ptr %52, i32 0, i32 4
  %54 = load ptr, ptr %53, align 8
  br label %55

55:                                               ; preds = %51, %47
  %56 = phi ptr [ %50, %47 ], [ %54, %51 ]
  store ptr %56, ptr %6, align 8
  br label %57

57:                                               ; preds = %55
  %58 = load i32, ptr %9, align 4
  %59 = load ptr, ptr %6, align 8
  %60 = getelementptr inbounds %struct.ptree, ptr %59, i32 0, i32 3
  %61 = load i8, ptr %60, align 1
  %62 = sext i8 %61 to i32
  %63 = icmp slt i32 %58, %62
  br i1 %63, label %33, label %64

64:                                               ; preds = %57
  %65 = load ptr, ptr %4, align 8
  %66 = getelementptr inbounds %struct.ptree, ptr %65, i32 0, i32 0
  %67 = load i64, ptr %66, align 8
  %68 = load ptr, ptr %6, align 8
  %69 = getelementptr inbounds %struct.ptree, ptr %68, i32 0, i32 0
  %70 = load i64, ptr %69, align 8
  %71 = icmp eq i64 %67, %70
  br i1 %71, label %72, label %199

72:                                               ; preds = %64
  store i32 0, ptr %9, align 4
  br label %73

73:                                               ; preds = %114, %72
  %74 = load i32, ptr %9, align 4
  %75 = load ptr, ptr %6, align 8
  %76 = getelementptr inbounds %struct.ptree, ptr %75, i32 0, i32 2
  %77 = load i8, ptr %76, align 8
  %78 = zext i8 %77 to i32
  %79 = icmp slt i32 %74, %78
  br i1 %79, label %80, label %117

80:                                               ; preds = %73
  %81 = load ptr, ptr %4, align 8
  %82 = getelementptr inbounds %struct.ptree, ptr %81, i32 0, i32 1
  %83 = load ptr, ptr %82, align 8
  %84 = getelementptr inbounds %struct.ptree_mask, ptr %83, i32 0, i32 0
  %85 = load i64, ptr %84, align 8
  %86 = load ptr, ptr %6, align 8
  %87 = getelementptr inbounds %struct.ptree, ptr %86, i32 0, i32 1
  %88 = load ptr, ptr %87, align 8
  %89 = load i32, ptr %9, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds %struct.ptree_mask, ptr %88, i64 %90
  %92 = getelementptr inbounds %struct.ptree_mask, ptr %91, i32 0, i32 0
  %93 = load i64, ptr %92, align 8
  %94 = icmp eq i64 %85, %93
  br i1 %94, label %95, label %113

95:                                               ; preds = %80
  %96 = load ptr, ptr %4, align 8
  %97 = getelementptr inbounds %struct.ptree, ptr %96, i32 0, i32 1
  %98 = load ptr, ptr %97, align 8
  %99 = getelementptr inbounds %struct.ptree_mask, ptr %98, i32 0, i32 1
  %100 = load ptr, ptr %99, align 8
  %101 = load ptr, ptr %6, align 8
  %102 = getelementptr inbounds %struct.ptree, ptr %101, i32 0, i32 1
  %103 = load ptr, ptr %102, align 8
  %104 = load i32, ptr %9, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds %struct.ptree_mask, ptr %103, i64 %105
  %107 = getelementptr inbounds %struct.ptree_mask, ptr %106, i32 0, i32 1
  store ptr %100, ptr %107, align 8
  %108 = load ptr, ptr %4, align 8
  %109 = getelementptr inbounds %struct.ptree, ptr %108, i32 0, i32 1
  %110 = load ptr, ptr %109, align 8
  call void @free(ptr noundef %110) #7
  %111 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %111) #7
  store ptr null, ptr %4, align 8
  %112 = load ptr, ptr %6, align 8
  store ptr %112, ptr %3, align 8
  br label %253

113:                                              ; preds = %80
  br label %114

114:                                              ; preds = %113
  %115 = load i32, ptr %9, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, ptr %9, align 4
  br label %73

117:                                              ; preds = %73
  %118 = load ptr, ptr %6, align 8
  %119 = getelementptr inbounds %struct.ptree, ptr %118, i32 0, i32 2
  %120 = load i8, ptr %119, align 8
  %121 = zext i8 %120 to i32
  %122 = add nsw i32 %121, 1
  %123 = sext i32 %122 to i64
  %124 = mul i64 16, %123
  %125 = call noalias ptr @malloc(i64 noundef %124) #8
  store ptr %125, ptr %7, align 8
  store i32 0, ptr %10, align 4
  store i32 0, ptr %9, align 4
  %126 = load ptr, ptr %7, align 8
  store ptr %126, ptr %8, align 8
  br label %127

127:                                              ; preds = %171, %117
  %128 = load i32, ptr %9, align 4
  %129 = load ptr, ptr %6, align 8
  %130 = getelementptr inbounds %struct.ptree, ptr %129, i32 0, i32 2
  %131 = load i8, ptr %130, align 8
  %132 = zext i8 %131 to i32
  %133 = icmp slt i32 %128, %132
  br i1 %133, label %134, label %174

134:                                              ; preds = %127
  %135 = load ptr, ptr %4, align 8
  %136 = getelementptr inbounds %struct.ptree, ptr %135, i32 0, i32 1
  %137 = load ptr, ptr %136, align 8
  %138 = getelementptr inbounds %struct.ptree_mask, ptr %137, i32 0, i32 0
  %139 = load i64, ptr %138, align 8
  %140 = load ptr, ptr %6, align 8
  %141 = getelementptr inbounds %struct.ptree, ptr %140, i32 0, i32 1
  %142 = load ptr, ptr %141, align 8
  %143 = load i32, ptr %9, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds %struct.ptree_mask, ptr %142, i64 %144
  %146 = getelementptr inbounds %struct.ptree_mask, ptr %145, i32 0, i32 0
  %147 = load i64, ptr %146, align 8
  %148 = icmp ugt i64 %139, %147
  br i1 %148, label %149, label %160

149:                                              ; preds = %134
  %150 = load ptr, ptr %6, align 8
  %151 = getelementptr inbounds %struct.ptree, ptr %150, i32 0, i32 1
  %152 = load ptr, ptr %151, align 8
  %153 = load i32, ptr %9, align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds %struct.ptree_mask, ptr %152, i64 %154
  %156 = load ptr, ptr %8, align 8
  %157 = call i32 (ptr, ptr, i64, ...) @bcopy(ptr noundef %155, ptr noundef %156, i64 noundef 16)
  %158 = load i32, ptr %9, align 4
  %159 = add nsw i32 %158, 1
  store i32 %159, ptr %9, align 4
  br label %170

160:                                              ; preds = %134
  %161 = load ptr, ptr %4, align 8
  %162 = getelementptr inbounds %struct.ptree, ptr %161, i32 0, i32 1
  %163 = load ptr, ptr %162, align 8
  %164 = load ptr, ptr %8, align 8
  %165 = call i32 (ptr, ptr, i64, ...) @bcopy(ptr noundef %163, ptr noundef %164, i64 noundef 16)
  %166 = load ptr, ptr %4, align 8
  %167 = getelementptr inbounds %struct.ptree, ptr %166, i32 0, i32 1
  %168 = load ptr, ptr %167, align 8
  %169 = getelementptr inbounds %struct.ptree_mask, ptr %168, i32 0, i32 0
  store i64 4294967295, ptr %169, align 8
  store i32 1, ptr %10, align 4
  br label %170

170:                                              ; preds = %160, %149
  br label %171

171:                                              ; preds = %170
  %172 = load ptr, ptr %8, align 8
  %173 = getelementptr inbounds %struct.ptree_mask, ptr %172, i32 1
  store ptr %173, ptr %8, align 8
  br label %127

174:                                              ; preds = %127
  %175 = load i32, ptr %10, align 4
  %176 = icmp ne i32 %175, 0
  br i1 %176, label %183, label %177

177:                                              ; preds = %174
  %178 = load ptr, ptr %4, align 8
  %179 = getelementptr inbounds %struct.ptree, ptr %178, i32 0, i32 1
  %180 = load ptr, ptr %179, align 8
  %181 = load ptr, ptr %8, align 8
  %182 = call i32 (ptr, ptr, i64, ...) @bcopy(ptr noundef %180, ptr noundef %181, i64 noundef 16)
  br label %183

183:                                              ; preds = %177, %174
  %184 = load ptr, ptr %4, align 8
  %185 = getelementptr inbounds %struct.ptree, ptr %184, i32 0, i32 1
  %186 = load ptr, ptr %185, align 8
  call void @free(ptr noundef %186) #7
  %187 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %187) #7
  store ptr null, ptr %4, align 8
  %188 = load ptr, ptr %6, align 8
  %189 = getelementptr inbounds %struct.ptree, ptr %188, i32 0, i32 2
  %190 = load i8, ptr %189, align 8
  %191 = add i8 %190, 1
  store i8 %191, ptr %189, align 8
  %192 = load ptr, ptr %6, align 8
  %193 = getelementptr inbounds %struct.ptree, ptr %192, i32 0, i32 1
  %194 = load ptr, ptr %193, align 8
  call void @free(ptr noundef %194) #7
  %195 = load ptr, ptr %7, align 8
  %196 = load ptr, ptr %6, align 8
  %197 = getelementptr inbounds %struct.ptree, ptr %196, i32 0, i32 1
  store ptr %195, ptr %197, align 8
  %198 = load ptr, ptr %6, align 8
  store ptr %198, ptr %3, align 8
  br label %253

199:                                              ; preds = %64
  store i32 1, ptr %9, align 4
  br label %200

200:                                              ; preds = %218, %199
  %201 = load i32, ptr %9, align 4
  %202 = icmp slt i32 %201, 32
  br i1 %202, label %203, label %215

203:                                              ; preds = %200
  %204 = load i32, ptr %9, align 4
  %205 = load ptr, ptr %4, align 8
  %206 = getelementptr inbounds %struct.ptree, ptr %205, i32 0, i32 0
  %207 = load i64, ptr %206, align 8
  %208 = call i64 @bit(i32 noundef %204, i64 noundef %207)
  %209 = load i32, ptr %9, align 4
  %210 = load ptr, ptr %6, align 8
  %211 = getelementptr inbounds %struct.ptree, ptr %210, i32 0, i32 0
  %212 = load i64, ptr %211, align 8
  %213 = call i64 @bit(i32 noundef %209, i64 noundef %212)
  %214 = icmp eq i64 %208, %213
  br label %215

215:                                              ; preds = %203, %200
  %216 = phi i1 [ false, %200 ], [ %214, %203 ]
  br i1 %216, label %217, label %221

217:                                              ; preds = %215
  br label %218

218:                                              ; preds = %217
  %219 = load i32, ptr %9, align 4
  %220 = add nsw i32 %219, 1
  store i32 %220, ptr %9, align 4
  br label %200

221:                                              ; preds = %215
  %222 = load ptr, ptr %5, align 8
  %223 = getelementptr inbounds %struct.ptree, ptr %222, i32 0, i32 3
  %224 = load i8, ptr %223, align 1
  %225 = sext i8 %224 to i32
  %226 = load ptr, ptr %4, align 8
  %227 = getelementptr inbounds %struct.ptree, ptr %226, i32 0, i32 0
  %228 = load i64, ptr %227, align 8
  %229 = call i64 @bit(i32 noundef %225, i64 noundef %228)
  %230 = icmp ne i64 %229, 0
  br i1 %230, label %231, label %241

231:                                              ; preds = %221
  %232 = load ptr, ptr %5, align 8
  %233 = getelementptr inbounds %struct.ptree, ptr %232, i32 0, i32 5
  %234 = load ptr, ptr %233, align 8
  %235 = load ptr, ptr %4, align 8
  %236 = load i32, ptr %9, align 4
  %237 = load ptr, ptr %5, align 8
  %238 = call ptr @insertR(ptr noundef %234, ptr noundef %235, i32 noundef %236, ptr noundef %237)
  %239 = load ptr, ptr %5, align 8
  %240 = getelementptr inbounds %struct.ptree, ptr %239, i32 0, i32 5
  store ptr %238, ptr %240, align 8
  br label %251

241:                                              ; preds = %221
  %242 = load ptr, ptr %5, align 8
  %243 = getelementptr inbounds %struct.ptree, ptr %242, i32 0, i32 4
  %244 = load ptr, ptr %243, align 8
  %245 = load ptr, ptr %4, align 8
  %246 = load i32, ptr %9, align 4
  %247 = load ptr, ptr %5, align 8
  %248 = call ptr @insertR(ptr noundef %244, ptr noundef %245, i32 noundef %246, ptr noundef %247)
  %249 = load ptr, ptr %5, align 8
  %250 = getelementptr inbounds %struct.ptree, ptr %249, i32 0, i32 4
  store ptr %248, ptr %250, align 8
  br label %251

251:                                              ; preds = %241, %231
  %252 = load ptr, ptr %4, align 8
  store ptr %252, ptr %3, align 8
  br label %253

253:                                              ; preds = %251, %183, %95, %21
  %254 = load ptr, ptr %3, align 8
  ret ptr %254
}

; Function Attrs: noinline nounwind uwtable
define internal i64 @bit(i32 noundef %0, i64 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  store i32 %0, ptr %3, align 4
  store i64 %1, ptr %4, align 8
  %5 = load i64, ptr %4, align 8
  %6 = load i32, ptr %3, align 4
  %7 = sub nsw i32 31, %6
  %8 = shl i32 1, %7
  %9 = sext i32 %8 to i64
  %10 = and i64 %5, %9
  ret i64 %10
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

declare i32 @bcopy(...) #3

; Function Attrs: noinline nounwind uwtable
define internal ptr @insertR(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store i32 %2, ptr %8, align 4
  store ptr %3, ptr %9, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = getelementptr inbounds %struct.ptree, ptr %10, i32 0, i32 3
  %12 = load i8, ptr %11, align 1
  %13 = sext i8 %12 to i32
  %14 = load i32, ptr %8, align 4
  %15 = icmp sge i32 %13, %14
  br i1 %15, label %26, label %16

16:                                               ; preds = %4
  %17 = load ptr, ptr %6, align 8
  %18 = getelementptr inbounds %struct.ptree, ptr %17, i32 0, i32 3
  %19 = load i8, ptr %18, align 1
  %20 = sext i8 %19 to i32
  %21 = load ptr, ptr %9, align 8
  %22 = getelementptr inbounds %struct.ptree, ptr %21, i32 0, i32 3
  %23 = load i8, ptr %22, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp sle i32 %20, %24
  br i1 %25, label %26, label %60

26:                                               ; preds = %16, %4
  %27 = load i32, ptr %8, align 4
  %28 = trunc i32 %27 to i8
  %29 = load ptr, ptr %7, align 8
  %30 = getelementptr inbounds %struct.ptree, ptr %29, i32 0, i32 3
  store i8 %28, ptr %30, align 1
  %31 = load i32, ptr %8, align 4
  %32 = load ptr, ptr %7, align 8
  %33 = getelementptr inbounds %struct.ptree, ptr %32, i32 0, i32 0
  %34 = load i64, ptr %33, align 8
  %35 = call i64 @bit(i32 noundef %31, i64 noundef %34)
  %36 = icmp ne i64 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %26
  %38 = load ptr, ptr %6, align 8
  br label %41

39:                                               ; preds = %26
  %40 = load ptr, ptr %7, align 8
  br label %41

41:                                               ; preds = %39, %37
  %42 = phi ptr [ %38, %37 ], [ %40, %39 ]
  %43 = load ptr, ptr %7, align 8
  %44 = getelementptr inbounds %struct.ptree, ptr %43, i32 0, i32 4
  store ptr %42, ptr %44, align 8
  %45 = load i32, ptr %8, align 4
  %46 = load ptr, ptr %7, align 8
  %47 = getelementptr inbounds %struct.ptree, ptr %46, i32 0, i32 0
  %48 = load i64, ptr %47, align 8
  %49 = call i64 @bit(i32 noundef %45, i64 noundef %48)
  %50 = icmp ne i64 %49, 0
  br i1 %50, label %51, label %53

51:                                               ; preds = %41
  %52 = load ptr, ptr %7, align 8
  br label %55

53:                                               ; preds = %41
  %54 = load ptr, ptr %6, align 8
  br label %55

55:                                               ; preds = %53, %51
  %56 = phi ptr [ %52, %51 ], [ %54, %53 ]
  %57 = load ptr, ptr %7, align 8
  %58 = getelementptr inbounds %struct.ptree, ptr %57, i32 0, i32 5
  store ptr %56, ptr %58, align 8
  %59 = load ptr, ptr %7, align 8
  store ptr %59, ptr %5, align 8
  br label %92

60:                                               ; preds = %16
  %61 = load ptr, ptr %6, align 8
  %62 = getelementptr inbounds %struct.ptree, ptr %61, i32 0, i32 3
  %63 = load i8, ptr %62, align 1
  %64 = sext i8 %63 to i32
  %65 = load ptr, ptr %7, align 8
  %66 = getelementptr inbounds %struct.ptree, ptr %65, i32 0, i32 0
  %67 = load i64, ptr %66, align 8
  %68 = call i64 @bit(i32 noundef %64, i64 noundef %67)
  %69 = icmp ne i64 %68, 0
  br i1 %69, label %70, label %80

70:                                               ; preds = %60
  %71 = load ptr, ptr %6, align 8
  %72 = getelementptr inbounds %struct.ptree, ptr %71, i32 0, i32 5
  %73 = load ptr, ptr %72, align 8
  %74 = load ptr, ptr %7, align 8
  %75 = load i32, ptr %8, align 4
  %76 = load ptr, ptr %6, align 8
  %77 = call ptr @insertR(ptr noundef %73, ptr noundef %74, i32 noundef %75, ptr noundef %76)
  %78 = load ptr, ptr %6, align 8
  %79 = getelementptr inbounds %struct.ptree, ptr %78, i32 0, i32 5
  store ptr %77, ptr %79, align 8
  br label %90

80:                                               ; preds = %60
  %81 = load ptr, ptr %6, align 8
  %82 = getelementptr inbounds %struct.ptree, ptr %81, i32 0, i32 4
  %83 = load ptr, ptr %82, align 8
  %84 = load ptr, ptr %7, align 8
  %85 = load i32, ptr %8, align 4
  %86 = load ptr, ptr %6, align 8
  %87 = call ptr @insertR(ptr noundef %83, ptr noundef %84, i32 noundef %85, ptr noundef %86)
  %88 = load ptr, ptr %6, align 8
  %89 = getelementptr inbounds %struct.ptree, ptr %88, i32 0, i32 4
  store ptr %87, ptr %89, align 8
  br label %90

90:                                               ; preds = %80, %70
  %91 = load ptr, ptr %6, align 8
  store ptr %91, ptr %5, align 8
  br label %92

92:                                               ; preds = %90, %55
  %93 = load ptr, ptr %5, align 8
  ret ptr %93
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @pat_remove(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %24

16:                                               ; preds = %2
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.ptree, ptr %17, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %24

21:                                               ; preds = %16
  %22 = load ptr, ptr %10, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %25, label %24

24:                                               ; preds = %21, %16, %2
  store i32 0, ptr %3, align 4
  br label %332

25:                                               ; preds = %21
  %26 = load ptr, ptr %5, align 8
  store ptr %26, ptr %10, align 8
  store ptr %26, ptr %6, align 8
  store ptr %26, ptr %7, align 8
  br label %27

27:                                               ; preds = %53, %25
  %28 = load ptr, ptr %10, align 8
  %29 = getelementptr inbounds %struct.ptree, ptr %28, i32 0, i32 3
  %30 = load i8, ptr %29, align 1
  %31 = sext i8 %30 to i32
  store i32 %31, ptr %13, align 4
  %32 = load ptr, ptr %6, align 8
  store ptr %32, ptr %7, align 8
  %33 = load ptr, ptr %10, align 8
  store ptr %33, ptr %6, align 8
  %34 = load ptr, ptr %10, align 8
  %35 = getelementptr inbounds %struct.ptree, ptr %34, i32 0, i32 3
  %36 = load i8, ptr %35, align 1
  %37 = sext i8 %36 to i32
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds %struct.ptree, ptr %38, i32 0, i32 0
  %40 = load i64, ptr %39, align 8
  %41 = call i64 @bit(i32 noundef %37, i64 noundef %40)
  %42 = icmp ne i64 %41, 0
  br i1 %42, label %43, label %47

43:                                               ; preds = %27
  %44 = load ptr, ptr %10, align 8
  %45 = getelementptr inbounds %struct.ptree, ptr %44, i32 0, i32 5
  %46 = load ptr, ptr %45, align 8
  br label %51

47:                                               ; preds = %27
  %48 = load ptr, ptr %10, align 8
  %49 = getelementptr inbounds %struct.ptree, ptr %48, i32 0, i32 4
  %50 = load ptr, ptr %49, align 8
  br label %51

51:                                               ; preds = %47, %43
  %52 = phi ptr [ %46, %43 ], [ %50, %47 ]
  store ptr %52, ptr %10, align 8
  br label %53

53:                                               ; preds = %51
  %54 = load i32, ptr %13, align 4
  %55 = load ptr, ptr %10, align 8
  %56 = getelementptr inbounds %struct.ptree, ptr %55, i32 0, i32 3
  %57 = load i8, ptr %56, align 1
  %58 = sext i8 %57 to i32
  %59 = icmp slt i32 %54, %58
  br i1 %59, label %27, label %60

60:                                               ; preds = %53
  %61 = load ptr, ptr %10, align 8
  %62 = getelementptr inbounds %struct.ptree, ptr %61, i32 0, i32 0
  %63 = load i64, ptr %62, align 8
  %64 = load ptr, ptr %4, align 8
  %65 = getelementptr inbounds %struct.ptree, ptr %64, i32 0, i32 0
  %66 = load i64, ptr %65, align 8
  %67 = icmp ne i64 %63, %66
  br i1 %67, label %68, label %69

68:                                               ; preds = %60
  store i32 0, ptr %3, align 4
  br label %332

69:                                               ; preds = %60
  %70 = load ptr, ptr %10, align 8
  %71 = getelementptr inbounds %struct.ptree, ptr %70, i32 0, i32 2
  %72 = load i8, ptr %71, align 8
  %73 = zext i8 %72 to i32
  %74 = icmp eq i32 %73, 1
  br i1 %74, label %75, label %239

75:                                               ; preds = %69
  %76 = load ptr, ptr %10, align 8
  %77 = getelementptr inbounds %struct.ptree, ptr %76, i32 0, i32 3
  %78 = load i8, ptr %77, align 1
  %79 = sext i8 %78 to i32
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %82

81:                                               ; preds = %75
  store i32 0, ptr %3, align 4
  br label %332

82:                                               ; preds = %75
  %83 = load ptr, ptr %10, align 8
  %84 = getelementptr inbounds %struct.ptree, ptr %83, i32 0, i32 1
  %85 = load ptr, ptr %84, align 8
  %86 = getelementptr inbounds %struct.ptree_mask, ptr %85, i32 0, i32 0
  %87 = load i64, ptr %86, align 8
  %88 = load ptr, ptr %4, align 8
  %89 = getelementptr inbounds %struct.ptree, ptr %88, i32 0, i32 1
  %90 = load ptr, ptr %89, align 8
  %91 = getelementptr inbounds %struct.ptree_mask, ptr %90, i32 0, i32 0
  %92 = load i64, ptr %91, align 8
  %93 = icmp ne i64 %87, %92
  br i1 %93, label %94, label %95

94:                                               ; preds = %82
  store i32 0, ptr %3, align 4
  br label %332

95:                                               ; preds = %82
  %96 = load ptr, ptr %6, align 8
  store ptr %96, ptr %8, align 8
  store ptr %96, ptr %9, align 8
  br label %97

97:                                               ; preds = %122, %95
  %98 = load ptr, ptr %8, align 8
  %99 = getelementptr inbounds %struct.ptree, ptr %98, i32 0, i32 3
  %100 = load i8, ptr %99, align 1
  %101 = sext i8 %100 to i32
  store i32 %101, ptr %13, align 4
  %102 = load ptr, ptr %8, align 8
  store ptr %102, ptr %9, align 8
  %103 = load ptr, ptr %8, align 8
  %104 = getelementptr inbounds %struct.ptree, ptr %103, i32 0, i32 3
  %105 = load i8, ptr %104, align 1
  %106 = sext i8 %105 to i32
  %107 = load ptr, ptr %6, align 8
  %108 = getelementptr inbounds %struct.ptree, ptr %107, i32 0, i32 0
  %109 = load i64, ptr %108, align 8
  %110 = call i64 @bit(i32 noundef %106, i64 noundef %109)
  %111 = icmp ne i64 %110, 0
  br i1 %111, label %112, label %116

112:                                              ; preds = %97
  %113 = load ptr, ptr %8, align 8
  %114 = getelementptr inbounds %struct.ptree, ptr %113, i32 0, i32 5
  %115 = load ptr, ptr %114, align 8
  br label %120

116:                                              ; preds = %97
  %117 = load ptr, ptr %8, align 8
  %118 = getelementptr inbounds %struct.ptree, ptr %117, i32 0, i32 4
  %119 = load ptr, ptr %118, align 8
  br label %120

120:                                              ; preds = %116, %112
  %121 = phi ptr [ %115, %112 ], [ %119, %116 ]
  store ptr %121, ptr %8, align 8
  br label %122

122:                                              ; preds = %120
  %123 = load i32, ptr %13, align 4
  %124 = load ptr, ptr %8, align 8
  %125 = getelementptr inbounds %struct.ptree, ptr %124, i32 0, i32 3
  %126 = load i8, ptr %125, align 1
  %127 = sext i8 %126 to i32
  %128 = icmp slt i32 %123, %127
  br i1 %128, label %97, label %129

129:                                              ; preds = %122
  %130 = load ptr, ptr %9, align 8
  %131 = getelementptr inbounds %struct.ptree, ptr %130, i32 0, i32 3
  %132 = load i8, ptr %131, align 1
  %133 = sext i8 %132 to i32
  %134 = load ptr, ptr %6, align 8
  %135 = getelementptr inbounds %struct.ptree, ptr %134, i32 0, i32 0
  %136 = load i64, ptr %135, align 8
  %137 = call i64 @bit(i32 noundef %133, i64 noundef %136)
  %138 = icmp ne i64 %137, 0
  br i1 %138, label %139, label %143

139:                                              ; preds = %129
  %140 = load ptr, ptr %10, align 8
  %141 = load ptr, ptr %9, align 8
  %142 = getelementptr inbounds %struct.ptree, ptr %141, i32 0, i32 5
  store ptr %140, ptr %142, align 8
  br label %147

143:                                              ; preds = %129
  %144 = load ptr, ptr %10, align 8
  %145 = load ptr, ptr %9, align 8
  %146 = getelementptr inbounds %struct.ptree, ptr %145, i32 0, i32 4
  store ptr %144, ptr %146, align 8
  br label %147

147:                                              ; preds = %143, %139
  %148 = load ptr, ptr %7, align 8
  %149 = getelementptr inbounds %struct.ptree, ptr %148, i32 0, i32 3
  %150 = load i8, ptr %149, align 1
  %151 = sext i8 %150 to i32
  %152 = load ptr, ptr %4, align 8
  %153 = getelementptr inbounds %struct.ptree, ptr %152, i32 0, i32 0
  %154 = load i64, ptr %153, align 8
  %155 = call i64 @bit(i32 noundef %151, i64 noundef %154)
  %156 = icmp ne i64 %155, 0
  br i1 %156, label %157, label %179

157:                                              ; preds = %147
  %158 = load ptr, ptr %6, align 8
  %159 = getelementptr inbounds %struct.ptree, ptr %158, i32 0, i32 3
  %160 = load i8, ptr %159, align 1
  %161 = sext i8 %160 to i32
  %162 = load ptr, ptr %4, align 8
  %163 = getelementptr inbounds %struct.ptree, ptr %162, i32 0, i32 0
  %164 = load i64, ptr %163, align 8
  %165 = call i64 @bit(i32 noundef %161, i64 noundef %164)
  %166 = icmp ne i64 %165, 0
  br i1 %166, label %167, label %171

167:                                              ; preds = %157
  %168 = load ptr, ptr %6, align 8
  %169 = getelementptr inbounds %struct.ptree, ptr %168, i32 0, i32 4
  %170 = load ptr, ptr %169, align 8
  br label %175

171:                                              ; preds = %157
  %172 = load ptr, ptr %6, align 8
  %173 = getelementptr inbounds %struct.ptree, ptr %172, i32 0, i32 5
  %174 = load ptr, ptr %173, align 8
  br label %175

175:                                              ; preds = %171, %167
  %176 = phi ptr [ %170, %167 ], [ %174, %171 ]
  %177 = load ptr, ptr %7, align 8
  %178 = getelementptr inbounds %struct.ptree, ptr %177, i32 0, i32 5
  store ptr %176, ptr %178, align 8
  br label %201

179:                                              ; preds = %147
  %180 = load ptr, ptr %6, align 8
  %181 = getelementptr inbounds %struct.ptree, ptr %180, i32 0, i32 3
  %182 = load i8, ptr %181, align 1
  %183 = sext i8 %182 to i32
  %184 = load ptr, ptr %4, align 8
  %185 = getelementptr inbounds %struct.ptree, ptr %184, i32 0, i32 0
  %186 = load i64, ptr %185, align 8
  %187 = call i64 @bit(i32 noundef %183, i64 noundef %186)
  %188 = icmp ne i64 %187, 0
  br i1 %188, label %189, label %193

189:                                              ; preds = %179
  %190 = load ptr, ptr %6, align 8
  %191 = getelementptr inbounds %struct.ptree, ptr %190, i32 0, i32 4
  %192 = load ptr, ptr %191, align 8
  br label %197

193:                                              ; preds = %179
  %194 = load ptr, ptr %6, align 8
  %195 = getelementptr inbounds %struct.ptree, ptr %194, i32 0, i32 5
  %196 = load ptr, ptr %195, align 8
  br label %197

197:                                              ; preds = %193, %189
  %198 = phi ptr [ %192, %189 ], [ %196, %193 ]
  %199 = load ptr, ptr %7, align 8
  %200 = getelementptr inbounds %struct.ptree, ptr %199, i32 0, i32 4
  store ptr %198, ptr %200, align 8
  br label %201

201:                                              ; preds = %197, %175
  %202 = load ptr, ptr %10, align 8
  %203 = getelementptr inbounds %struct.ptree, ptr %202, i32 0, i32 1
  %204 = load ptr, ptr %203, align 8
  %205 = getelementptr inbounds %struct.ptree_mask, ptr %204, i32 0, i32 1
  %206 = load ptr, ptr %205, align 8
  %207 = icmp ne ptr %206, null
  br i1 %207, label %208, label %214

208:                                              ; preds = %201
  %209 = load ptr, ptr %10, align 8
  %210 = getelementptr inbounds %struct.ptree, ptr %209, i32 0, i32 1
  %211 = load ptr, ptr %210, align 8
  %212 = getelementptr inbounds %struct.ptree_mask, ptr %211, i32 0, i32 1
  %213 = load ptr, ptr %212, align 8
  call void @free(ptr noundef %213) #7
  br label %214

214:                                              ; preds = %208, %201
  %215 = load ptr, ptr %10, align 8
  %216 = getelementptr inbounds %struct.ptree, ptr %215, i32 0, i32 1
  %217 = load ptr, ptr %216, align 8
  call void @free(ptr noundef %217) #7
  %218 = load ptr, ptr %10, align 8
  %219 = load ptr, ptr %6, align 8
  %220 = icmp ne ptr %218, %219
  br i1 %220, label %221, label %237

221:                                              ; preds = %214
  %222 = load ptr, ptr %6, align 8
  %223 = getelementptr inbounds %struct.ptree, ptr %222, i32 0, i32 0
  %224 = load i64, ptr %223, align 8
  %225 = load ptr, ptr %10, align 8
  %226 = getelementptr inbounds %struct.ptree, ptr %225, i32 0, i32 0
  store i64 %224, ptr %226, align 8
  %227 = load ptr, ptr %6, align 8
  %228 = getelementptr inbounds %struct.ptree, ptr %227, i32 0, i32 1
  %229 = load ptr, ptr %228, align 8
  %230 = load ptr, ptr %10, align 8
  %231 = getelementptr inbounds %struct.ptree, ptr %230, i32 0, i32 1
  store ptr %229, ptr %231, align 8
  %232 = load ptr, ptr %6, align 8
  %233 = getelementptr inbounds %struct.ptree, ptr %232, i32 0, i32 2
  %234 = load i8, ptr %233, align 8
  %235 = load ptr, ptr %10, align 8
  %236 = getelementptr inbounds %struct.ptree, ptr %235, i32 0, i32 2
  store i8 %234, ptr %236, align 8
  br label %237

237:                                              ; preds = %221, %214
  %238 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %238) #7
  store i32 1, ptr %3, align 4
  br label %332

239:                                              ; preds = %69
  store i32 0, ptr %13, align 4
  br label %240

240:                                              ; preds = %264, %239
  %241 = load i32, ptr %13, align 4
  %242 = load ptr, ptr %10, align 8
  %243 = getelementptr inbounds %struct.ptree, ptr %242, i32 0, i32 2
  %244 = load i8, ptr %243, align 8
  %245 = zext i8 %244 to i32
  %246 = icmp slt i32 %241, %245
  br i1 %246, label %247, label %267

247:                                              ; preds = %240
  %248 = load ptr, ptr %4, align 8
  %249 = getelementptr inbounds %struct.ptree, ptr %248, i32 0, i32 1
  %250 = load ptr, ptr %249, align 8
  %251 = getelementptr inbounds %struct.ptree_mask, ptr %250, i32 0, i32 0
  %252 = load i64, ptr %251, align 8
  %253 = load ptr, ptr %10, align 8
  %254 = getelementptr inbounds %struct.ptree, ptr %253, i32 0, i32 1
  %255 = load ptr, ptr %254, align 8
  %256 = load i32, ptr %13, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds %struct.ptree_mask, ptr %255, i64 %257
  %259 = getelementptr inbounds %struct.ptree_mask, ptr %258, i32 0, i32 0
  %260 = load i64, ptr %259, align 8
  %261 = icmp eq i64 %252, %260
  br i1 %261, label %262, label %263

262:                                              ; preds = %247
  br label %267

263:                                              ; preds = %247
  br label %264

264:                                              ; preds = %263
  %265 = load i32, ptr %13, align 4
  %266 = add nsw i32 %265, 1
  store i32 %266, ptr %13, align 4
  br label %240

267:                                              ; preds = %262, %240
  %268 = load i32, ptr %13, align 4
  %269 = load ptr, ptr %10, align 8
  %270 = getelementptr inbounds %struct.ptree, ptr %269, i32 0, i32 2
  %271 = load i8, ptr %270, align 8
  %272 = zext i8 %271 to i32
  %273 = icmp sge i32 %268, %272
  br i1 %273, label %274, label %275

274:                                              ; preds = %267
  store i32 0, ptr %3, align 4
  br label %332

275:                                              ; preds = %267
  %276 = load ptr, ptr %10, align 8
  %277 = getelementptr inbounds %struct.ptree, ptr %276, i32 0, i32 2
  %278 = load i8, ptr %277, align 8
  %279 = zext i8 %278 to i32
  %280 = sub nsw i32 %279, 1
  %281 = sext i32 %280 to i64
  %282 = mul i64 16, %281
  %283 = call noalias ptr @malloc(i64 noundef %282) #8
  store ptr %283, ptr %11, align 8
  store i32 0, ptr %13, align 4
  %284 = load ptr, ptr %11, align 8
  store ptr %284, ptr %12, align 8
  br label %285

285:                                              ; preds = %318, %275
  %286 = load i32, ptr %13, align 4
  %287 = load ptr, ptr %10, align 8
  %288 = getelementptr inbounds %struct.ptree, ptr %287, i32 0, i32 2
  %289 = load i8, ptr %288, align 8
  %290 = zext i8 %289 to i32
  %291 = icmp slt i32 %286, %290
  br i1 %291, label %292, label %321

292:                                              ; preds = %285
  %293 = load ptr, ptr %4, align 8
  %294 = getelementptr inbounds %struct.ptree, ptr %293, i32 0, i32 1
  %295 = load ptr, ptr %294, align 8
  %296 = getelementptr inbounds %struct.ptree_mask, ptr %295, i32 0, i32 0
  %297 = load i64, ptr %296, align 8
  %298 = load ptr, ptr %10, align 8
  %299 = getelementptr inbounds %struct.ptree, ptr %298, i32 0, i32 1
  %300 = load ptr, ptr %299, align 8
  %301 = load i32, ptr %13, align 4
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds %struct.ptree_mask, ptr %300, i64 %302
  %304 = getelementptr inbounds %struct.ptree_mask, ptr %303, i32 0, i32 0
  %305 = load i64, ptr %304, align 8
  %306 = icmp ne i64 %297, %305
  br i1 %306, label %307, label %317

307:                                              ; preds = %292
  %308 = load ptr, ptr %10, align 8
  %309 = getelementptr inbounds %struct.ptree, ptr %308, i32 0, i32 1
  %310 = load ptr, ptr %309, align 8
  %311 = load i32, ptr %13, align 4
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds %struct.ptree_mask, ptr %310, i64 %312
  %314 = load ptr, ptr %12, align 8
  %315 = getelementptr inbounds %struct.ptree_mask, ptr %314, i32 1
  store ptr %315, ptr %12, align 8
  %316 = call i32 (ptr, ptr, i64, ...) @bcopy(ptr noundef %313, ptr noundef %314, i64 noundef 16)
  br label %317

317:                                              ; preds = %307, %292
  br label %318

318:                                              ; preds = %317
  %319 = load i32, ptr %13, align 4
  %320 = add nsw i32 %319, 1
  store i32 %320, ptr %13, align 4
  br label %285

321:                                              ; preds = %285
  %322 = load ptr, ptr %10, align 8
  %323 = getelementptr inbounds %struct.ptree, ptr %322, i32 0, i32 2
  %324 = load i8, ptr %323, align 8
  %325 = add i8 %324, -1
  store i8 %325, ptr %323, align 8
  %326 = load ptr, ptr %10, align 8
  %327 = getelementptr inbounds %struct.ptree, ptr %326, i32 0, i32 1
  %328 = load ptr, ptr %327, align 8
  call void @free(ptr noundef %328) #7
  %329 = load ptr, ptr %11, align 8
  %330 = load ptr, ptr %10, align 8
  %331 = getelementptr inbounds %struct.ptree, ptr %330, i32 0, i32 1
  store ptr %329, ptr %331, align 8
  store i32 1, ptr %3, align 4
  br label %332

332:                                              ; preds = %321, %274, %237, %94, %81, %68, %24
  %333 = load i32, ptr %3, align 4
  ret i32 %333
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @pat_search(i64 noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store i64 %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr null, ptr %6, align 8
  %9 = load ptr, ptr %5, align 8
  store ptr %9, ptr %7, align 8
  %10 = load ptr, ptr %7, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %13, label %12

12:                                               ; preds = %2
  store ptr null, ptr %3, align 8
  br label %75

13:                                               ; preds = %2
  br label %14

14:                                               ; preds = %50, %13
  %15 = load ptr, ptr %7, align 8
  %16 = getelementptr inbounds %struct.ptree, ptr %15, i32 0, i32 0
  %17 = load i64, ptr %16, align 8
  %18 = load i64, ptr %4, align 8
  %19 = load ptr, ptr %7, align 8
  %20 = getelementptr inbounds %struct.ptree, ptr %19, i32 0, i32 1
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds %struct.ptree_mask, ptr %21, i32 0, i32 0
  %23 = load i64, ptr %22, align 8
  %24 = and i64 %18, %23
  %25 = icmp eq i64 %17, %24
  br i1 %25, label %26, label %28

26:                                               ; preds = %14
  %27 = load ptr, ptr %7, align 8
  store ptr %27, ptr %6, align 8
  br label %28

28:                                               ; preds = %26, %14
  %29 = load ptr, ptr %7, align 8
  %30 = getelementptr inbounds %struct.ptree, ptr %29, i32 0, i32 3
  %31 = load i8, ptr %30, align 1
  %32 = sext i8 %31 to i32
  store i32 %32, ptr %8, align 4
  %33 = load ptr, ptr %7, align 8
  %34 = getelementptr inbounds %struct.ptree, ptr %33, i32 0, i32 3
  %35 = load i8, ptr %34, align 1
  %36 = sext i8 %35 to i32
  %37 = load i64, ptr %4, align 8
  %38 = call i64 @bit(i32 noundef %36, i64 noundef %37)
  %39 = icmp ne i64 %38, 0
  br i1 %39, label %40, label %44

40:                                               ; preds = %28
  %41 = load ptr, ptr %7, align 8
  %42 = getelementptr inbounds %struct.ptree, ptr %41, i32 0, i32 5
  %43 = load ptr, ptr %42, align 8
  br label %48

44:                                               ; preds = %28
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr inbounds %struct.ptree, ptr %45, i32 0, i32 4
  %47 = load ptr, ptr %46, align 8
  br label %48

48:                                               ; preds = %44, %40
  %49 = phi ptr [ %43, %40 ], [ %47, %44 ]
  store ptr %49, ptr %7, align 8
  br label %50

50:                                               ; preds = %48
  %51 = load i32, ptr %8, align 4
  %52 = load ptr, ptr %7, align 8
  %53 = getelementptr inbounds %struct.ptree, ptr %52, i32 0, i32 3
  %54 = load i8, ptr %53, align 1
  %55 = sext i8 %54 to i32
  %56 = icmp slt i32 %51, %55
  br i1 %56, label %14, label %57

57:                                               ; preds = %50
  %58 = load ptr, ptr %7, align 8
  %59 = getelementptr inbounds %struct.ptree, ptr %58, i32 0, i32 0
  %60 = load i64, ptr %59, align 8
  %61 = load i64, ptr %4, align 8
  %62 = load ptr, ptr %7, align 8
  %63 = getelementptr inbounds %struct.ptree, ptr %62, i32 0, i32 1
  %64 = load ptr, ptr %63, align 8
  %65 = getelementptr inbounds %struct.ptree_mask, ptr %64, i32 0, i32 0
  %66 = load i64, ptr %65, align 8
  %67 = and i64 %61, %66
  %68 = icmp eq i64 %60, %67
  br i1 %68, label %69, label %71

69:                                               ; preds = %57
  %70 = load ptr, ptr %7, align 8
  br label %73

71:                                               ; preds = %57
  %72 = load ptr, ptr %6, align 8
  br label %73

73:                                               ; preds = %71, %69
  %74 = phi ptr [ %70, %69 ], [ %72, %71 ]
  store ptr %74, ptr %3, align 8
  br label %75

75:                                               ; preds = %73, %12
  %76 = load ptr, ptr %3, align 8
  ret ptr %76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca [128 x i8], align 16
  %12 = alloca [16 x i8], align 16
  %13 = alloca %struct.in_addr, align 4
  %14 = alloca i64, align 8
  %15 = alloca float, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i64 4294967295, ptr %14, align 8
  %16 = load i32, ptr %4, align 4
  %17 = icmp slt i32 %16, 2
  br i1 %17, label %18, label %23

18:                                               ; preds = %2
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds ptr, ptr %19, i64 0
  %21 = load ptr, ptr %20, align 8
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %21)
  call void @exit(i32 noundef -1) #9
  unreachable

23:                                               ; preds = %2
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds ptr, ptr %24, i64 1
  %26 = load ptr, ptr %25, align 8
  %27 = call noalias ptr @fopen(ptr noundef %26, ptr noundef @.str.1)
  store ptr %27, ptr %10, align 8
  %28 = icmp eq ptr %27, null
  br i1 %28, label %29, label %34

29:                                               ; preds = %23
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds ptr, ptr %30, i64 1
  %32 = load ptr, ptr %31, align 8
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %32)
  call void @exit(i32 noundef 1) #9
  unreachable

34:                                               ; preds = %23
  %35 = call noalias ptr @malloc(i64 noundef 40) #8
  store ptr %35, ptr %6, align 8
  %36 = load ptr, ptr %6, align 8
  %37 = icmp ne ptr %36, null
  br i1 %37, label %39, label %38

38:                                               ; preds = %34
  call void @perror(ptr noundef @.str.3) #10
  call void @exit(i32 noundef 1) #9
  unreachable

39:                                               ; preds = %34
  %40 = load ptr, ptr %6, align 8
  call void @bzero(ptr noundef %40, i64 noundef 40) #7
  %41 = call noalias ptr @malloc(i64 noundef 16) #8
  %42 = load ptr, ptr %6, align 8
  %43 = getelementptr inbounds %struct.ptree, ptr %42, i32 0, i32 1
  store ptr %41, ptr %43, align 8
  %44 = load ptr, ptr %6, align 8
  %45 = getelementptr inbounds %struct.ptree, ptr %44, i32 0, i32 1
  %46 = load ptr, ptr %45, align 8
  %47 = icmp ne ptr %46, null
  br i1 %47, label %49, label %48

48:                                               ; preds = %39
  call void @perror(ptr noundef @.str.4) #10
  call void @exit(i32 noundef 1) #9
  unreachable

49:                                               ; preds = %39
  %50 = load ptr, ptr %6, align 8
  %51 = getelementptr inbounds %struct.ptree, ptr %50, i32 0, i32 1
  %52 = load ptr, ptr %51, align 8
  call void @bzero(ptr noundef %52, i64 noundef 16) #7
  %53 = load ptr, ptr %6, align 8
  %54 = getelementptr inbounds %struct.ptree, ptr %53, i32 0, i32 1
  %55 = load ptr, ptr %54, align 8
  store ptr %55, ptr %9, align 8
  %56 = call noalias ptr @malloc(i64 noundef 16) #8
  %57 = load ptr, ptr %9, align 8
  %58 = getelementptr inbounds %struct.ptree_mask, ptr %57, i32 0, i32 1
  store ptr %56, ptr %58, align 8
  %59 = load ptr, ptr %9, align 8
  %60 = getelementptr inbounds %struct.ptree_mask, ptr %59, i32 0, i32 1
  %61 = load ptr, ptr %60, align 8
  %62 = icmp ne ptr %61, null
  br i1 %62, label %64, label %63

63:                                               ; preds = %49
  call void @perror(ptr noundef @.str.5) #10
  call void @exit(i32 noundef 1) #9
  unreachable

64:                                               ; preds = %49
  %65 = load ptr, ptr %9, align 8
  %66 = getelementptr inbounds %struct.ptree_mask, ptr %65, i32 0, i32 1
  %67 = load ptr, ptr %66, align 8
  call void @bzero(ptr noundef %67, i64 noundef 1) #7
  %68 = load ptr, ptr %6, align 8
  %69 = getelementptr inbounds %struct.ptree, ptr %68, i32 0, i32 2
  store i8 1, ptr %69, align 8
  %70 = load ptr, ptr %6, align 8
  %71 = load ptr, ptr %6, align 8
  %72 = getelementptr inbounds %struct.ptree, ptr %71, i32 0, i32 5
  store ptr %70, ptr %72, align 8
  %73 = load ptr, ptr %6, align 8
  %74 = getelementptr inbounds %struct.ptree, ptr %73, i32 0, i32 4
  store ptr %70, ptr %74, align 8
  br label %75

75:                                               ; preds = %158, %64
  %76 = getelementptr inbounds [128 x i8], ptr %11, i64 0, i64 0
  %77 = load ptr, ptr %10, align 8
  %78 = call ptr @fgets(ptr noundef %76, i32 noundef 128, ptr noundef %77)
  %79 = icmp ne ptr %78, null
  br i1 %79, label %80, label %159

80:                                               ; preds = %75
  %81 = getelementptr inbounds [128 x i8], ptr %11, i64 0, i64 0
  %82 = call i32 (ptr, ptr, ...) @__isoc99_sscanf(ptr noundef %81, ptr noundef @.str.6, ptr noundef %15, ptr noundef %13) #7
  %83 = call noalias ptr @malloc(i64 noundef 40) #8
  store ptr %83, ptr %7, align 8
  %84 = load ptr, ptr %7, align 8
  %85 = icmp ne ptr %84, null
  br i1 %85, label %87, label %86

86:                                               ; preds = %80
  call void @perror(ptr noundef @.str.3) #10
  call void @exit(i32 noundef 1) #9
  unreachable

87:                                               ; preds = %80
  %88 = load ptr, ptr %7, align 8
  call void @bzero(ptr noundef %88, i64 noundef 40) #7
  %89 = call noalias ptr @malloc(i64 noundef 16) #8
  %90 = load ptr, ptr %7, align 8
  %91 = getelementptr inbounds %struct.ptree, ptr %90, i32 0, i32 1
  store ptr %89, ptr %91, align 8
  %92 = load ptr, ptr %7, align 8
  %93 = getelementptr inbounds %struct.ptree, ptr %92, i32 0, i32 1
  %94 = load ptr, ptr %93, align 8
  %95 = icmp ne ptr %94, null
  br i1 %95, label %97, label %96

96:                                               ; preds = %87
  call void @perror(ptr noundef @.str.4) #10
  call void @exit(i32 noundef 1) #9
  unreachable

97:                                               ; preds = %87
  %98 = load ptr, ptr %7, align 8
  %99 = getelementptr inbounds %struct.ptree, ptr %98, i32 0, i32 1
  %100 = load ptr, ptr %99, align 8
  call void @bzero(ptr noundef %100, i64 noundef 16) #7
  %101 = load ptr, ptr %7, align 8
  %102 = getelementptr inbounds %struct.ptree, ptr %101, i32 0, i32 1
  %103 = load ptr, ptr %102, align 8
  store ptr %103, ptr %9, align 8
  %104 = call noalias ptr @malloc(i64 noundef 16) #8
  %105 = load ptr, ptr %9, align 8
  %106 = getelementptr inbounds %struct.ptree_mask, ptr %105, i32 0, i32 1
  store ptr %104, ptr %106, align 8
  %107 = load ptr, ptr %9, align 8
  %108 = getelementptr inbounds %struct.ptree_mask, ptr %107, i32 0, i32 1
  %109 = load ptr, ptr %108, align 8
  %110 = icmp ne ptr %109, null
  br i1 %110, label %112, label %111

111:                                              ; preds = %97
  call void @perror(ptr noundef @.str.5) #10
  call void @exit(i32 noundef 1) #9
  unreachable

112:                                              ; preds = %97
  %113 = load ptr, ptr %9, align 8
  %114 = getelementptr inbounds %struct.ptree_mask, ptr %113, i32 0, i32 1
  %115 = load ptr, ptr %114, align 8
  call void @bzero(ptr noundef %115, i64 noundef 1) #7
  %116 = getelementptr inbounds %struct.in_addr, ptr %13, i32 0, i32 0
  %117 = load i32, ptr %116, align 4
  %118 = zext i32 %117 to i64
  %119 = load ptr, ptr %7, align 8
  %120 = getelementptr inbounds %struct.ptree, ptr %119, i32 0, i32 0
  store i64 %118, ptr %120, align 8
  %121 = load i64, ptr %14, align 8
  %122 = trunc i64 %121 to i32
  %123 = call i32 @htonl(i32 noundef %122) #11
  %124 = zext i32 %123 to i64
  %125 = load ptr, ptr %7, align 8
  %126 = getelementptr inbounds %struct.ptree, ptr %125, i32 0, i32 1
  %127 = load ptr, ptr %126, align 8
  %128 = getelementptr inbounds %struct.ptree_mask, ptr %127, i32 0, i32 0
  store i64 %124, ptr %128, align 8
  %129 = getelementptr inbounds %struct.in_addr, ptr %13, i32 0, i32 0
  %130 = load i32, ptr %129, align 4
  %131 = zext i32 %130 to i64
  %132 = load ptr, ptr %6, align 8
  %133 = call ptr @pat_search(i64 noundef %131, ptr noundef %132)
  store ptr %133, ptr %8, align 8
  %134 = load ptr, ptr %8, align 8
  %135 = getelementptr inbounds %struct.ptree, ptr %134, i32 0, i32 0
  %136 = load i64, ptr %135, align 8
  %137 = getelementptr inbounds %struct.in_addr, ptr %13, i32 0, i32 0
  %138 = load i32, ptr %137, align 4
  %139 = zext i32 %138 to i64
  %140 = icmp eq i64 %136, %139
  br i1 %140, label %141, label %148

141:                                              ; preds = %112
  %142 = load float, ptr %15, align 4
  %143 = fpext float %142 to double
  %144 = getelementptr inbounds %struct.in_addr, ptr %13, i32 0, i32 0
  %145 = load i32, ptr %144, align 4
  %146 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, double noundef %143, i32 noundef %145)
  %147 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %152

148:                                              ; preds = %112
  %149 = load ptr, ptr %7, align 8
  %150 = load ptr, ptr %6, align 8
  %151 = call ptr @pat_insert(ptr noundef %149, ptr noundef %150)
  store ptr %151, ptr %7, align 8
  br label %152

152:                                              ; preds = %148, %141
  %153 = load ptr, ptr %7, align 8
  %154 = icmp ne ptr %153, null
  br i1 %154, label %158, label %155

155:                                              ; preds = %152
  %156 = load ptr, ptr @stderr, align 8
  %157 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %156, ptr noundef @.str.9)
  call void @exit(i32 noundef 1) #9
  unreachable

158:                                              ; preds = %152
  br label %75

159:                                              ; preds = %75
  call void @exit(i32 noundef 0) #9
  unreachable
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare noalias ptr @fopen(ptr noundef, ptr noundef) #3

; Function Attrs: cold
declare void @perror(ptr noundef) #5

; Function Attrs: nounwind
declare void @bzero(ptr noundef, i64 noundef) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(none)
declare i32 @htonl(i32 noundef) #6

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind allocsize(0) }
attributes #9 = { noreturn nounwind }
attributes #10 = { cold }
attributes #11 = { nounwind willreturn memory(none) }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
