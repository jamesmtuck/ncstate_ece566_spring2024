; ModuleID = 'adpcm.prof.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.adpcm_state = type { i16, i8 }

@stepsizeTable = internal global [89 x i32] [i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 16, i32 17, i32 19, i32 21, i32 23, i32 25, i32 28, i32 31, i32 34, i32 37, i32 41, i32 45, i32 50, i32 55, i32 60, i32 66, i32 73, i32 80, i32 88, i32 97, i32 107, i32 118, i32 130, i32 143, i32 157, i32 173, i32 190, i32 209, i32 230, i32 253, i32 279, i32 307, i32 337, i32 371, i32 408, i32 449, i32 494, i32 544, i32 598, i32 658, i32 724, i32 796, i32 876, i32 963, i32 1060, i32 1166, i32 1282, i32 1411, i32 1552, i32 1707, i32 1878, i32 2066, i32 2272, i32 2499, i32 2749, i32 3024, i32 3327, i32 3660, i32 4026, i32 4428, i32 4871, i32 5358, i32 5894, i32 6484, i32 7132, i32 7845, i32 8630, i32 9493, i32 10442, i32 11487, i32 12635, i32 13899, i32 15289, i32 16818, i32 18500, i32 20350, i32 22385, i32 24623, i32 27086, i32 29794, i32 32767], align 16
@indexTable = internal global [16 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8, i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8], align 16
@abuf = dso_local global [500 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [11 x i8] c"input file\00", align 1
@sbuf = dso_local global [1000 x i16] zeroinitializer, align 16
@state = dso_local global %struct.adpcm_state zeroinitializer, align 2
@stderr = external global ptr, align 8
@.str.1 = private unnamed_addr constant [28 x i8] c"Final valprev=%d, index=%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @adpcm_coder(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store ptr %3, ptr %8, align 8
  %21 = load ptr, ptr %6, align 8
  store ptr %21, ptr %10, align 8
  %22 = load ptr, ptr %5, align 8
  store ptr %22, ptr %9, align 8
  %23 = load ptr, ptr %8, align 8
  %24 = getelementptr inbounds %struct.adpcm_state, ptr %23, i32 0, i32 0
  %25 = load i16, ptr %24, align 2
  %26 = sext i16 %25 to i32
  store i32 %26, ptr %16, align 4
  %27 = load ptr, ptr %8, align 8
  %28 = getelementptr inbounds %struct.adpcm_state, ptr %27, i32 0, i32 1
  %29 = load i8, ptr %28, align 2
  %30 = sext i8 %29 to i32
  store i32 %30, ptr %18, align 4
  %31 = load i32, ptr %18, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [89 x i32], ptr @stepsizeTable, i64 0, i64 %32
  %34 = load i32, ptr %33, align 4
  store i32 %34, ptr %15, align 4
  store i32 1, ptr %20, align 4
  br label %35

35:                                               ; preds = %156, %4
  %36 = load i32, ptr %7, align 4
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %38, label %159

38:                                               ; preds = %35
  %39 = load ptr, ptr %9, align 8
  %40 = getelementptr inbounds i16, ptr %39, i32 1
  store ptr %40, ptr %9, align 8
  %41 = load i16, ptr %39, align 2
  %42 = sext i16 %41 to i32
  store i32 %42, ptr %11, align 4
  %43 = load i32, ptr %11, align 4
  %44 = load i32, ptr %16, align 4
  %45 = sub nsw i32 %43, %44
  store i32 %45, ptr %14, align 4
  %46 = load i32, ptr %14, align 4
  %47 = icmp slt i32 %46, 0
  %48 = zext i1 %47 to i64
  %49 = select i1 %47, i32 8, i32 0
  store i32 %49, ptr %12, align 4
  %50 = load i32, ptr %12, align 4
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %55

52:                                               ; preds = %38
  %53 = load i32, ptr %14, align 4
  %54 = sub nsw i32 0, %53
  store i32 %54, ptr %14, align 4
  br label %55

55:                                               ; preds = %52, %38
  store i32 0, ptr %13, align 4
  %56 = load i32, ptr %15, align 4
  %57 = ashr i32 %56, 3
  store i32 %57, ptr %17, align 4
  %58 = load i32, ptr %14, align 4
  %59 = load i32, ptr %15, align 4
  %60 = icmp sge i32 %58, %59
  br i1 %60, label %61, label %68

61:                                               ; preds = %55
  store i32 4, ptr %13, align 4
  %62 = load i32, ptr %15, align 4
  %63 = load i32, ptr %14, align 4
  %64 = sub nsw i32 %63, %62
  store i32 %64, ptr %14, align 4
  %65 = load i32, ptr %15, align 4
  %66 = load i32, ptr %17, align 4
  %67 = add nsw i32 %66, %65
  store i32 %67, ptr %17, align 4
  br label %68

68:                                               ; preds = %61, %55
  %69 = load i32, ptr %15, align 4
  %70 = ashr i32 %69, 1
  store i32 %70, ptr %15, align 4
  %71 = load i32, ptr %14, align 4
  %72 = load i32, ptr %15, align 4
  %73 = icmp sge i32 %71, %72
  br i1 %73, label %74, label %83

74:                                               ; preds = %68
  %75 = load i32, ptr %13, align 4
  %76 = or i32 %75, 2
  store i32 %76, ptr %13, align 4
  %77 = load i32, ptr %15, align 4
  %78 = load i32, ptr %14, align 4
  %79 = sub nsw i32 %78, %77
  store i32 %79, ptr %14, align 4
  %80 = load i32, ptr %15, align 4
  %81 = load i32, ptr %17, align 4
  %82 = add nsw i32 %81, %80
  store i32 %82, ptr %17, align 4
  br label %83

83:                                               ; preds = %74, %68
  %84 = load i32, ptr %15, align 4
  %85 = ashr i32 %84, 1
  store i32 %85, ptr %15, align 4
  %86 = load i32, ptr %14, align 4
  %87 = load i32, ptr %15, align 4
  %88 = icmp sge i32 %86, %87
  br i1 %88, label %89, label %95

89:                                               ; preds = %83
  %90 = load i32, ptr %13, align 4
  %91 = or i32 %90, 1
  store i32 %91, ptr %13, align 4
  %92 = load i32, ptr %15, align 4
  %93 = load i32, ptr %17, align 4
  %94 = add nsw i32 %93, %92
  store i32 %94, ptr %17, align 4
  br label %95

95:                                               ; preds = %89, %83
  %96 = load i32, ptr %12, align 4
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %98, label %102

98:                                               ; preds = %95
  %99 = load i32, ptr %17, align 4
  %100 = load i32, ptr %16, align 4
  %101 = sub nsw i32 %100, %99
  store i32 %101, ptr %16, align 4
  br label %106

102:                                              ; preds = %95
  %103 = load i32, ptr %17, align 4
  %104 = load i32, ptr %16, align 4
  %105 = add nsw i32 %104, %103
  store i32 %105, ptr %16, align 4
  br label %106

106:                                              ; preds = %102, %98
  %107 = load i32, ptr %16, align 4
  %108 = icmp sgt i32 %107, 32767
  br i1 %108, label %109, label %110

109:                                              ; preds = %106
  store i32 32767, ptr %16, align 4
  br label %115

110:                                              ; preds = %106
  %111 = load i32, ptr %16, align 4
  %112 = icmp slt i32 %111, -32768
  br i1 %112, label %113, label %114

113:                                              ; preds = %110
  store i32 -32768, ptr %16, align 4
  br label %114

114:                                              ; preds = %113, %110
  br label %115

115:                                              ; preds = %114, %109
  %116 = load i32, ptr %12, align 4
  %117 = load i32, ptr %13, align 4
  %118 = or i32 %117, %116
  store i32 %118, ptr %13, align 4
  %119 = load i32, ptr %13, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [16 x i32], ptr @indexTable, i64 0, i64 %120
  %122 = load i32, ptr %121, align 4
  %123 = load i32, ptr %18, align 4
  %124 = add nsw i32 %123, %122
  store i32 %124, ptr %18, align 4
  %125 = load i32, ptr %18, align 4
  %126 = icmp slt i32 %125, 0
  br i1 %126, label %127, label %128

127:                                              ; preds = %115
  store i32 0, ptr %18, align 4
  br label %128

128:                                              ; preds = %127, %115
  %129 = load i32, ptr %18, align 4
  %130 = icmp sgt i32 %129, 88
  br i1 %130, label %131, label %132

131:                                              ; preds = %128
  store i32 88, ptr %18, align 4
  br label %132

132:                                              ; preds = %131, %128
  %133 = load i32, ptr %18, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [89 x i32], ptr @stepsizeTable, i64 0, i64 %134
  %136 = load i32, ptr %135, align 4
  store i32 %136, ptr %15, align 4
  %137 = load i32, ptr %20, align 4
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %139, label %143

139:                                              ; preds = %132
  %140 = load i32, ptr %13, align 4
  %141 = shl i32 %140, 4
  %142 = and i32 %141, 240
  store i32 %142, ptr %19, align 4
  br label %151

143:                                              ; preds = %132
  %144 = load i32, ptr %13, align 4
  %145 = and i32 %144, 15
  %146 = load i32, ptr %19, align 4
  %147 = or i32 %145, %146
  %148 = trunc i32 %147 to i8
  %149 = load ptr, ptr %10, align 8
  %150 = getelementptr inbounds i8, ptr %149, i32 1
  store ptr %150, ptr %10, align 8
  store i8 %148, ptr %149, align 1
  br label %151

151:                                              ; preds = %143, %139
  %152 = load i32, ptr %20, align 4
  %153 = icmp ne i32 %152, 0
  %154 = xor i1 %153, true
  %155 = zext i1 %154 to i32
  store i32 %155, ptr %20, align 4
  br label %156

156:                                              ; preds = %151
  %157 = load i32, ptr %7, align 4
  %158 = add nsw i32 %157, -1
  store i32 %158, ptr %7, align 4
  br label %35

159:                                              ; preds = %35
  %160 = load i32, ptr %20, align 4
  %161 = icmp ne i32 %160, 0
  br i1 %161, label %167, label %162

162:                                              ; preds = %159
  %163 = load i32, ptr %19, align 4
  %164 = trunc i32 %163 to i8
  %165 = load ptr, ptr %10, align 8
  %166 = getelementptr inbounds i8, ptr %165, i32 1
  store ptr %166, ptr %10, align 8
  store i8 %164, ptr %165, align 1
  br label %167

167:                                              ; preds = %162, %159
  %168 = load i32, ptr %16, align 4
  %169 = trunc i32 %168 to i16
  %170 = load ptr, ptr %8, align 8
  %171 = getelementptr inbounds %struct.adpcm_state, ptr %170, i32 0, i32 0
  store i16 %169, ptr %171, align 2
  %172 = load i32, ptr %18, align 4
  %173 = trunc i32 %172 to i8
  %174 = load ptr, ptr %8, align 8
  %175 = getelementptr inbounds %struct.adpcm_state, ptr %174, i32 0, i32 1
  store i8 %173, ptr %175, align 2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @adpcm_decoder(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store ptr %3, ptr %8, align 8
  %19 = load ptr, ptr %6, align 8
  store ptr %19, ptr %10, align 8
  %20 = load ptr, ptr %5, align 8
  store ptr %20, ptr %9, align 8
  %21 = load ptr, ptr %8, align 8
  %22 = getelementptr inbounds %struct.adpcm_state, ptr %21, i32 0, i32 0
  %23 = load i16, ptr %22, align 2
  %24 = sext i16 %23 to i32
  store i32 %24, ptr %14, align 4
  %25 = load ptr, ptr %8, align 8
  %26 = getelementptr inbounds %struct.adpcm_state, ptr %25, i32 0, i32 1
  %27 = load i8, ptr %26, align 2
  %28 = sext i8 %27 to i32
  store i32 %28, ptr %16, align 4
  %29 = load i32, ptr %16, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [89 x i32], ptr @stepsizeTable, i64 0, i64 %30
  %32 = load i32, ptr %31, align 4
  store i32 %32, ptr %13, align 4
  store i32 0, ptr %18, align 4
  br label %33

33:                                               ; preds = %129, %4
  %34 = load i32, ptr %7, align 4
  %35 = icmp sgt i32 %34, 0
  br i1 %35, label %36, label %132

36:                                               ; preds = %33
  %37 = load i32, ptr %18, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %42

39:                                               ; preds = %36
  %40 = load i32, ptr %17, align 4
  %41 = and i32 %40, 15
  store i32 %41, ptr %12, align 4
  br label %50

42:                                               ; preds = %36
  %43 = load ptr, ptr %9, align 8
  %44 = getelementptr inbounds i8, ptr %43, i32 1
  store ptr %44, ptr %9, align 8
  %45 = load i8, ptr %43, align 1
  %46 = sext i8 %45 to i32
  store i32 %46, ptr %17, align 4
  %47 = load i32, ptr %17, align 4
  %48 = ashr i32 %47, 4
  %49 = and i32 %48, 15
  store i32 %49, ptr %12, align 4
  br label %50

50:                                               ; preds = %42, %39
  %51 = load i32, ptr %18, align 4
  %52 = icmp ne i32 %51, 0
  %53 = xor i1 %52, true
  %54 = zext i1 %53 to i32
  store i32 %54, ptr %18, align 4
  %55 = load i32, ptr %12, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [16 x i32], ptr @indexTable, i64 0, i64 %56
  %58 = load i32, ptr %57, align 4
  %59 = load i32, ptr %16, align 4
  %60 = add nsw i32 %59, %58
  store i32 %60, ptr %16, align 4
  %61 = load i32, ptr %16, align 4
  %62 = icmp slt i32 %61, 0
  br i1 %62, label %63, label %64

63:                                               ; preds = %50
  store i32 0, ptr %16, align 4
  br label %64

64:                                               ; preds = %63, %50
  %65 = load i32, ptr %16, align 4
  %66 = icmp sgt i32 %65, 88
  br i1 %66, label %67, label %68

67:                                               ; preds = %64
  store i32 88, ptr %16, align 4
  br label %68

68:                                               ; preds = %67, %64
  %69 = load i32, ptr %12, align 4
  %70 = and i32 %69, 8
  store i32 %70, ptr %11, align 4
  %71 = load i32, ptr %12, align 4
  %72 = and i32 %71, 7
  store i32 %72, ptr %12, align 4
  %73 = load i32, ptr %13, align 4
  %74 = ashr i32 %73, 3
  store i32 %74, ptr %15, align 4
  %75 = load i32, ptr %12, align 4
  %76 = and i32 %75, 4
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %78, label %82

78:                                               ; preds = %68
  %79 = load i32, ptr %13, align 4
  %80 = load i32, ptr %15, align 4
  %81 = add nsw i32 %80, %79
  store i32 %81, ptr %15, align 4
  br label %82

82:                                               ; preds = %78, %68
  %83 = load i32, ptr %12, align 4
  %84 = and i32 %83, 2
  %85 = icmp ne i32 %84, 0
  br i1 %85, label %86, label %91

86:                                               ; preds = %82
  %87 = load i32, ptr %13, align 4
  %88 = ashr i32 %87, 1
  %89 = load i32, ptr %15, align 4
  %90 = add nsw i32 %89, %88
  store i32 %90, ptr %15, align 4
  br label %91

91:                                               ; preds = %86, %82
  %92 = load i32, ptr %12, align 4
  %93 = and i32 %92, 1
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %95, label %100

95:                                               ; preds = %91
  %96 = load i32, ptr %13, align 4
  %97 = ashr i32 %96, 2
  %98 = load i32, ptr %15, align 4
  %99 = add nsw i32 %98, %97
  store i32 %99, ptr %15, align 4
  br label %100

100:                                              ; preds = %95, %91
  %101 = load i32, ptr %11, align 4
  %102 = icmp ne i32 %101, 0
  br i1 %102, label %103, label %107

103:                                              ; preds = %100
  %104 = load i32, ptr %15, align 4
  %105 = load i32, ptr %14, align 4
  %106 = sub nsw i32 %105, %104
  store i32 %106, ptr %14, align 4
  br label %111

107:                                              ; preds = %100
  %108 = load i32, ptr %15, align 4
  %109 = load i32, ptr %14, align 4
  %110 = add nsw i32 %109, %108
  store i32 %110, ptr %14, align 4
  br label %111

111:                                              ; preds = %107, %103
  %112 = load i32, ptr %14, align 4
  %113 = icmp sgt i32 %112, 32767
  br i1 %113, label %114, label %115

114:                                              ; preds = %111
  store i32 32767, ptr %14, align 4
  br label %120

115:                                              ; preds = %111
  %116 = load i32, ptr %14, align 4
  %117 = icmp slt i32 %116, -32768
  br i1 %117, label %118, label %119

118:                                              ; preds = %115
  store i32 -32768, ptr %14, align 4
  br label %119

119:                                              ; preds = %118, %115
  br label %120

120:                                              ; preds = %119, %114
  %121 = load i32, ptr %16, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [89 x i32], ptr @stepsizeTable, i64 0, i64 %122
  %124 = load i32, ptr %123, align 4
  store i32 %124, ptr %13, align 4
  %125 = load i32, ptr %14, align 4
  %126 = trunc i32 %125 to i16
  %127 = load ptr, ptr %10, align 8
  %128 = getelementptr inbounds i16, ptr %127, i32 1
  store ptr %128, ptr %10, align 8
  store i16 %126, ptr %127, align 2
  br label %129

129:                                              ; preds = %120
  %130 = load i32, ptr %7, align 4
  %131 = add nsw i32 %130, -1
  store i32 %131, ptr %7, align 4
  br label %33

132:                                              ; preds = %33
  %133 = load i32, ptr %14, align 4
  %134 = trunc i32 %133 to i16
  %135 = load ptr, ptr %8, align 8
  %136 = getelementptr inbounds %struct.adpcm_state, ptr %135, i32 0, i32 0
  store i16 %134, ptr %136, align 2
  %137 = load i32, ptr %16, align 4
  %138 = trunc i32 %137 to i8
  %139 = load ptr, ptr %8, align 8
  %140 = getelementptr inbounds %struct.adpcm_state, ptr %139, i32 0, i32 1
  store i8 %138, ptr %140, align 2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %0, %12
  %4 = call i32 (i32, ptr, i32, ...) @read(i32 noundef 0, ptr noundef @abuf, i32 noundef 500)
  store i32 %4, ptr %2, align 4
  %5 = load i32, ptr %2, align 4
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %3
  call void @perror(ptr noundef @.str) #4
  call void @exit(i32 noundef 1) #5
  unreachable

8:                                                ; preds = %3
  %9 = load i32, ptr %2, align 4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  br label %18

12:                                               ; preds = %8
  %13 = load i32, ptr %2, align 4
  %14 = mul nsw i32 %13, 2
  call void @adpcm_decoder(ptr noundef @abuf, ptr noundef @sbuf, i32 noundef %14, ptr noundef @state)
  %15 = load i32, ptr %2, align 4
  %16 = mul nsw i32 %15, 4
  %17 = call i32 (i32, ptr, i32, ...) @write(i32 noundef 1, ptr noundef @sbuf, i32 noundef %16)
  br label %3

18:                                               ; preds = %11
  %19 = load ptr, ptr @stderr, align 8
  %20 = load i16, ptr @state, align 2
  %21 = sext i16 %20 to i32
  %22 = load i8, ptr getelementptr inbounds (%struct.adpcm_state, ptr @state, i32 0, i32 1), align 2
  %23 = sext i8 %22 to i32
  %24 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %19, ptr noundef @.str.1, i32 noundef %21, i32 noundef %23)
  call void @exit(i32 noundef 0) #5
  unreachable
}

declare i32 @read(...) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

declare i32 @write(...) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { cold }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
