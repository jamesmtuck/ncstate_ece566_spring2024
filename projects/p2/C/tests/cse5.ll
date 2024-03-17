; ModuleID = 'cse5'
; CHECK-LABEL: source_filename = "cse5"
source_filename = "cse5"

; CHECK-LABEL: void @cse5(ptr %0, ptr %1, ptr %2, i32 %3, i64 %4, i8 %5)
define void @cse5(ptr %0, ptr %1, ptr %2, i32 %3, i64 %4, i8 %5) {
; CHECK-NEXT: BB
; CHECK-NEXT: alloca
; CHECK-NEXT: alloca
; CHECK-NEXT: store
; CHECK-NEXT: ret void

BB:
  %A = alloca i32, align 4
  %A1 = alloca i32, align 4
  store i32 -1, ptr %A, align 4
  store i32 0, ptr %A, align 4
  ret void
}
