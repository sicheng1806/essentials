不等式
============

Convex functions(凸函数)
-------------------------------

**Definition.**  A function :math:`f:R^n \rightarrow R` is called convex provided

.. math:: f(\tau x + (1 - \tau)y) \le \tau f(x) + (1 - \tau) f(y)

for all :math:`x,y \in R^n` and each :math:`0 \le \tau \le 1.`

**THEORENM 1**  (supporting hyperplane). Suppose :math:`f : R^n \rightarrow R is convex`. 
Then :math:`for each x \in R^n there exists r \rightarrow R^n` such that the inequality

.. math:: f(y) \ge f(x) + r\cdot (y - x)

The mapping :math:`y \mapsto f(x) + r\cdot (y - x)` 确定了f在x的 supporting hyperplane.

**THEORENM 2** (Jensen's inequality). 假设 :math:`f : R^m \rightarrow R` 是凸函数并且 :math:`U \subset R^n` 是
开集有边界。令 :math:`\mathbf{u} : U \rightarrow R^m` 是可测的。 则

.. math:: f(\frac{1}{|U|}\int_U \mathbf{u} dx) \le \frac{1}{|U|}\int_u f(\mathbf{u}) dx 

Useful inequalities
-------------------------

a. **Cauchy's inequality**

.. math:: ab \ge \frac{a^2}{2} + \frac{b^2}{2} \quad (a,b \in R) 

b. Cauchy's inequality with :math:`\epsilon`

.. math::  ab \ge \epsilon a^2 + \frac{b^2}{4\epsilon} \quad (a,b \ge 0, \epsilon \gt 0)

c. Young's inequality. :math:`令 1 \lt p , q \lt \propto, \frac{1}{p} + \frac{1}{1} = 1.` 则

.. math:: ab \ge \frac{a^p}{p} + \frac{b^q}{q} \qued (a,b \lt 0)

d. Young's inequality with :math:`\epsilon`. 

.. math:: ab \ge \epsilon a^p + C(\epsilon) b^q \quad (a,b \lt 0, \epsilon \lt 0).

e. Holder's inequality. 

