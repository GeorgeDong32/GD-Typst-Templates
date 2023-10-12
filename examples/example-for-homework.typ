#import "./templates/homework.typ": *

#show: homework.with(
    title: "作业一",
    subject: "Typst作业编写课程",
    name: "张三三",
    stdid: "11223344",
)

= 作业第一部分

#lorem(50)

== 第一题

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

== 第二题

=== 第一小问

$ sum_(k=0)^n k
    &= 1 + ... + n \
    &= (n(n+1)) / 2 $

=== 第二小问

```python
import plotly.express as px 
import pandas as pd

df_seeds = pd.read_csv('./seeds.csv')
df_flights = pd.read_csv('./flights.csv')

df_seeds.head()

df_flights.head()

px.line(df_seeds, x='kernel_length', y='groove_length' )

px.scatter(df_seeds, x='kernel_length', y='asymmetry_coefficient', color='species', title='seed data', marginal_x='violin', marginal_y='histogram')

px.histogram(df_seeds, x='kernel_length', color='species', title='seed data')

px.box(df_seeds, x='species', y='kernel_length', color='species', title='seed data')

px.scatter_3d(df_seeds, x='kernel_length', y='kernel_width', z='groove_length', color='species', title='seed data')
```

= 作业第二部分

3.1 设 $cal(V)$ 和 $cal(W)$ 是两 Hilbert 空间，${ket(v_j)}$ 和 ${ket(w_j)}$ 分别为 $cal(V)$ 和 $cal(W)$ 的一组正交模基。设 $display(T_A: sum_(j = 1)^n c_j ket(v_j) arrow.r sum_(j=1)^n c_j sum_(i=1)^m a_(i j) ket(w_j))$，证明 $T_A$ 是线性算子。

证明：对于 $forall k in NN, 0 < k <= n$，可以取一组 $display(c_j = cases(
    1 "," j = k,
    0 "," j != k
))$，由上述定义，可得到：

$ T_A (sum_(j = 1)^n c_j ket(v_j)) &= T_A (c_k ket(v_j)) = T_A (ket(v_j)) \
&= sum_(j=1)^n c_j sum_(i=1)^m a_(i j) ket(w_j) = c_k sum_(i=1)^m a_(i j) ket(w_j) = sum_(i=1)^m a_(i j) ket(w_j) $

则对于任意的一组 $c_j$，可以得到：

$ T_A (sum_(j = 1)^n c_j ket(v_j)) = sum_(j=1)^n c_j sum_(i=1)^m a_(i j) ket(w_j) = sum_(j=1)^n c_j T_A (ket(v_j)) $

即 $T_A$ 是线性算子。