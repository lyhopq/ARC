.. part1index:

**表面层次的改进**

我们可读性游览的开始，是我们认为的那些“表面层次”的改进：挑选好的名字，编写好的注释，和代码格式整洁。这些类型的改变易于应用。你可以“就地”完成它们，而不需要重构你的代码或改变你的程序的运行。你可以增量的完成它们，而不需要大块的时间投入。

这些主题非常重要， **因为它们影响你的代码库中的每一行代码。** 虽然每一个改变看起来很小，但聚集起来，它们会对一个代码库作出巨大的改进。如果你的代码有很好的名字，好的注释，和干净的使用空白，你的代码就会更容易阅读。

当然，表面层次变得易读（在本书的后续章节中，我们将讨论到）会带来很多好处。但在这部分的材料是如此广泛适用的，因此付出一点努力，首先讨论它是值得的。

.. chp2index:

包装信息到名字
=================

.. figure:: _static/2.*
   :align: center

无论你命名一个变量，函数，或类，有很多原则可以使用。我们喜欢把名字认为是一个微笑的注释。即使没有太多的空间(room)，选择一个好的名字，可以传达大量的信息。

.. ttip::

   **KEY IDEA**

   **包装信息到你的名字**

我们在程序里看见了大量的名字都是含糊的，例如 `tmp` 。即使单词看起来可能是合理的，例如 `size` 或 `get` ，并没有包装许多信息。本章将告诉你如何选择名字。

本章安排了六个特定的主题： 

 * 选择特定的词
 * 避免使用通用的名字（或知道什么时候使用它们）
 * 使用具体的名字代替抽象的名字
 * 决定名字有多长
 * 使用名字格式化来包装额外的信息

选择特定的词
------------------

“包装信息到名字”的要素是选择一个特定的词，并避免“空的”词。

例如，"get"这个词不是非常特定，在这个例子中： 

  .. code-block:: python

    def GetPage(url):
        ...

"get"这个词确实没有说什么。这个方法是从本地缓存，从一个数据库，或从网络得到一页吗？如果它从网络，一个更特定的名字，应该是 `FetchPage()` 或 `DownloadPage()` 。

这里是一个关于 `BinaryTree` 类的例子： 

  ::

    class BinaryTree {
        int Size();
        ...
    };

你期望的 `Size()` 方法的返回值是什么？树的高度，节点的数目，还是树的足迹内存？

问题是 `Size()` 方法并没有传达太多的信息。一个更特定的名字应该是 `Hight()` ,`NumNodes()` 或 `MemoryBytes()` 。

另外一个例子，假如你有某种形式的 `Thread` 类： 

  ::

   class Thread {
       void Stop();
       ...
   };

这个 `Stop()` 的名字是可以的，但这取决于它确切的干了什么，这应该有一个更特定的名字。例如，你可以叫它 `Kill()` ，如果它是一个重量级的不可以被撤销的操作。或你应该叫它 `Pause()` ，如果有一个方法来 `Resume()` 它。

找到更“富有色彩”词
+++++++++++++++++++++

\

.. figure:: _static/2-1.*
   :align: center

不要害怕使用专业词典或向朋友询问一个更好名字的的建议。英语是一个丰富的语言，并有很多词从中选择。

这里有一些关于一个词，以及它的一些“富有色彩”的版本，可能会使用你的情形：

.. list-table::
   :widths: 10, 30
   :header-rows: 1

   * - Word
     - Alternatives
   * - send
     - deliver, dispatch, announce, distribute, route
   * - find
     - search, extract, locate, recover
   * - start
     - launch, create, begin, open
   * - make
     - create, set up, build, generate, compose, add, new

但是，不要得意忘形。在PHP中，有一个函数 `explode()` 一个字符窜。这是一个富有色彩的名字，它描绘了一个把一些东西打成碎片的好的图案，但是，它和 `split()` 有多大的区别呢？（这两个函数不不同的，但是，基于它们的名字很难猜测出它们的不同。）

.. ttip::

   **KEY IDEA**

   **是明确的和精确的比是可爱的更好。**


避免像 `tmp` 和 `retval` 这样通用的名字
------------------------------------------

像 `tmp` ，`retval` 和 `foo` 这样的名字，通常是为了逃避，意思是“我想不出一个名字” **选择一个名字描述实体的价值和目的** ，而不是使用像这样的一个空名字。

例如，这是一个 `JavaScript` 函数，使用了 `retval` ：

  .. code-block:: javascript

    var euclidean_norm = function (v) {
        var retval = 0.0;
        for (var i = 0; i < v.length; i += 1)
            retval += v[i] * v[i];
        return Math.sqrt(retval);
    };

当你想不出一个更好的名字给你的返回值，使用 `retval` 是很有吸引力的。但 `retval` 除了表示“我是一个返回值”（这总是明显的）之外，并不能包含更多的信息

一个更好的名字应该可以描述变量或它所含的值的目的。在这种情况，变量是序列v的累加值。因此，一个更好的名字是 `sum_squares` 。这可以显示变量的目的，并且可能会抓到一个bug。

例如，假想如果循环的内部发生意外：

  .. code-block:: javascript

    retval += v[i];

这一bug可以很明显，如果名字是 `sun_squares` ：

  .. code-block:: javascript

    sum_squares += v[i]; // 我们在哪个序列求和？Bug！

.. twarning::

   **ADVICE**

   **retval这个名字并不能包装更多信息。代之，使用一个可以描述变量的值的名字**

然而，在一些情况下，通用的名字确实可以承载含义。让我们来看看，什么时候使用它们是有意义的。

tmp
+++++

考虑一个典型的例子，交换两个变量：

  ::

    if (right < left) {
        tmp = right;
        right = left;
        left = tmp;
    }

在这种情况下，`tmp` 是一个很好的名字。这个变量唯一的目的是临时存储，只有很少几行的生命周期。 `tmp` 这个名字给读者传达了一个特定的意思——这一变量没有其它任何职责。它不会被传递到其它函数或被赋值或被多次使用。

但在下面的情况里， `tmp` 被使用只是处于懒惰：

  ::

    String tmp = user.name();
    tmp += " " + user.phone_number();
    tmp += " " + user.email();
    ...
    template.set("user_info", tmp);

即使这一变量有一个短暂的生命期，但作为临时存储并不是这一变量最重要的事情。相反，一个向 `user_info` 的名字，可能会更具描述性。

在下面的情况中， `tmp` 应该在名字里，但仅仅作为名字的一部分：

  ::

    tmp_file = tempfile.NamedTemporaryFile()
    ...
    SaveData(tmp_file, ...)

注意到，我们命名变量是 `tmp_file` ，而不仅仅是 `tmp` ，因为它是一个文件对象。想象一下，如果我们仅仅叫它 `tmp` ：

  ::

    SaveData(tmp, ...)

只看代码的这一行，并不明确， `tmp` 是一个文件，文件名，或甚至是被写入的数据。

.. twarning::

   **ADVICE**

   **名字 `tmp` 应该只被用于短生命期和临时的情况，是这一变量最重要的事实。**

循环迭代器
++++++++++++

向i,j,iter和it这样的名字，经常被用作索引和循环迭代器。即使这些名字是通用的，
它们被理解为“我是一个迭代器。”（事实上，你如果把这些名字用于 *其它* 目的，有可能会引起混乱——因此，不要这样做！）

但是，在有些时候，有比i,j和k更好的迭代器名字。例如，下面的循环找出哪一个用户属于哪一个俱乐部： 

  ::

  for (int i = 0; i < clubs.size(); i++)
    for (int j = 0; j < clubs[i].members.size(); j++)
        for (int k = 0; k < users.size(); k++)
            if (clubs[i].members[k] == users[j])
                cout << "user[" << j << "] is in club[" << i << "]" << endl;

在 `if` 语句中， `menbers[]` 和 `users[]` 被使用了错误的索引。像这样的bug难以定位，因为，隔开来看，这行代码似乎是好的：

  ::

    if (clubs[i].members[k] == users[j])

在这种情况下，使用更明确的名字，会是有帮助的。替代(i,j,k)循环索引命名的另一个选择可能是(clud_i, member_i, users_i)或更紧凑的(ci,mi,ui)。这种方法有助于更加突出bug： 

  ::

    if (clubs[ci].members[ui] == users[mi]) # Bug!第一个字母不匹配。

当使用正确，索引的第一个字母因该与数组的地一个字母匹配：

  ::

    if (clubs[ci].members[mi] == users[ui]) # 好的。第一个字母匹配。

通用名字的判定
++++++++++++++++++




