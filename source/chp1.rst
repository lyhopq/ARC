.. chp1index:

======================
代码因该容易被理解
======================

.. figure:: _static/1.*
   :align: center
   
在过去的五年里，我们收集了数以百计的“糟糕的代码”（其中许多是我们自己的），并且分析了是什么使它变得糟糕，我们又使用什么样的原则/技术使它变得较好。我们注意到的是，所有的原则都源于一个单一的主题。

    .. ttip:: 
       
       **KEY IDEA**

       **代码因该容易被理解。**

我们认为，当你在决定如何编写你的代码的时候，这是你可以使用的最重要的指导原则。在整本书中，我们将会展现在你每天编码的不同方面如何运用这一原则。但是在开始之前，我们将会阐述这一原则并证明为什么它如此重要。


什么使代码“更好”
========================

大多数程序员（包括作者）都是基于直觉来作编程决断的。我们都知道，像这样的代码：

  .. code-block:: c++
  
      for (Node* node = list->head; node != NULL; node = node->next)
          Print(node->data);
  
.. literalinclude:: codes/1.c
    :linenos:
    :language: c++
    :lines: 1, 3-5

比这样的代码更好：

  .. code-block:: c++

    Node* node = list->head;
    if (node == NULL) return;
    
    while (node->next != NULL) {
        Print(node->data);
        node = node->next;
    }
    if (node != NULL) Print(node->data);    
    
（甚至两个例子的行为完全相同）。

但很多时候，这是一个艰难的选择。例如，这段代码： 
  
  ::

    return exponent >= 0 ? mantissa * (1 << exponent) : mantissa / (1 << -exponent);

好于或坏于： 

  ::

    if (exponent >= 0) {
        return mantissa * (1 << exponent);
    } else {
        return mantissa / (1 << -exponent);
    }
    
第一个版本更紧凑，但第二个版本不太吓人。哪一个规范更重要？在一般情况下，你如何决定使用哪一中方式来编码？

可读性的基本定理
===================
