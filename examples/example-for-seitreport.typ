#import "../templates/seitreport.typ": *

#show: report.with(
    reporttype: "课程实验报告",
    title: "Typst 模板设计",
    name: "张三三",
    stdid: "11223344",
    coursename: "Typst 模板设计",
    courseid: "20230000",
    coursecode: "EIT000",
    semester: "2023 学年第 1 学期",
    time: "2023 年 10 月 15 日",
)

// write your report here

#title(content: "实验一 使用 Typst 制作通用实验报告模板")

= 实验目的

#lorem(50)

= 实验内容

#lorem(10)

== 什么是实验报告

#lorem(88)

#booktab(
  width: 100%,
  aligns: (left + horizon, center, right + bottom),
  columns: (1fr, 1fr, 1fr),
  caption: [`booktab` 示例],
  [左对齐], [居中], [右对齐],
  [4], [5], [6],
  [7], [8], [9],
  [10], [$ (n(n+1)) / 2 $], [11],
)

$ sum_(k=0)^n k
    &= 1 + ... + n \
    &= (n(n+1)) / 2 $

== 什么是 Typst

```c
int main() {
  printf("Hello, world!");
  return 0;
}
```

=== 三级标题


#figure(
    image("../images/sysu.png",width: 70%),
    caption: "中山大学校徽",
)

= 实验总结

== 理论证明



设 $cal(V)$ 和 $cal(W)$ 是两 Hilbert 空间，${ket(v_j)}$ 和 ${ket(w_j)}$ 分别为 $cal(V)$ 和 $cal(W)$ 的一组正交模基。设 $display(T_A: sum_(j = 1)^n c_j ket(v_j) arrow.r sum_(j=1)^n c_j sum_(i=1)^m a_(i j) ket(w_j))$，证明 $T_A$ 是线性算子。

证明：对于 $forall k in NN, 0 < k <= n$，可以取一组 $display(c_j = cases(
    1 "," j = k,
    0 "," j != k
))$，由上述定义，可得到：

$ T_A (sum_(j = 1)^n c_j ket(v_j)) &= T_A (c_k ket(v_j)) = T_A (ket(v_j)) \
&= sum_(j=1)^n c_j sum_(i=1)^m a_(i j) ket(w_j) = c_k sum_(i=1)^m a_(i j) ket(w_j) = sum_(i=1)^m a_(i j) ket(w_j) $

则对于任意的一组 $c_j$，可以得到：

$ T_A (sum_(j = 1)^n c_j ket(v_j)) = sum_(j=1)^n c_j sum_(i=1)^m a_(i j) ket(w_j) = sum_(j=1)^n c_j T_A (ket(v_j)) $

即 $T_A$ 是线性算子。
