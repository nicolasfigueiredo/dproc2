# µML — Learn Compilers with ML

Micro-ML (µML) is a simplified version of the [Standard ML Grammar](http://www.mpi-sws.org/~rossberg/sml.html).

Deltas from ML are:

* No module system, signatures, or functor related features
* No pattern matching
* No abstract data types
* No records, and associated bells and whistles
* Simplified constants (integers and strings only)

Or said another way, it's a small functional language expressed with ML syntax.

## Grammar

### Core Language

#### Constants

<table>
  <tbody><tr>
    <td> <i>con</i> </td>
    <td>::=&nbsp;&nbsp;</td>
    <td> <i>int</i> </td>
    <td> integer </td>
  </tr>
  <tr><td></td></tr>
  <tr>
    <td></td> <td></td>
    <td> <i>string</i> </td>
    <td> string </td>
  </tr>
  <tr><td></td></tr>
  <tr>
    <td> <i>int</i> </td>
    <td>::=</td>
    <td> ⟨<tt>~</tt>⟩<i>num</i> </td>
    <td> decimal </td>
  </tr>
  <tr><td></td></tr>
  <tr>
    <td> <i>string</i>&nbsp;&nbsp; </td>
    <td>::=</td>
    <td> <tt>"</tt>⟨<i>ascii</i>⟩*<tt>"</tt> </td>
    <td> string </td>
  </tr>
  <tr><td></td></tr>
  <tr>
    <td> <i>ascii</i> </td>
    <td>::=</td>
    <td> ... </td>
    <td> single non-<tt>"</tt> ASCII character or <tt>\</tt>-headed escape sequence </td>
  </tr>
</tbody></table>

#### Identifiers

<table>
  <tbody><tr>
    <td> <i>id</i> </td>
    <td>::=&nbsp;&nbsp;</td>
    <td> <i>letter</i>⟨<i>letter</i> | <i>digit</i> | <tt>'</tt> | <tt>_</tt>⟩* </td>
    <td> alphanumeric </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> ⟨<tt>!</tt> | <tt>%</tt> | <tt>&amp;</tt> | <tt>$</tt> | <tt>#</tt> | <tt>+</tt> | <tt>-</tt> | <tt>/</tt> | <tt>:</tt> | <tt>&lt;</tt> | <tt>=</tt> | <tt>&gt;</tt> | <tt>?</tt> | <tt>@</tt> | <tt>\</tt> | <tt>~</tt> | <tt>`</tt> | <tt>^</tt> | <tt>|</tt> | <tt>*</tt>⟩<sup>+</sup> &nbsp;&nbsp;</td>
    <td> symbolic (not allowed for type variables) </td>
  </tr>
  <tr><td></td></tr>
  <tr>
    <td> <i>var</i> </td>
    <td>::=</td>
    <td> <tt>'</tt>⟨<i>letter</i> | <i>digit</i> | <tt>'</tt> | <tt>_</tt>⟩* </td>
    <td> unconstrained </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <tt>''</tt>⟨<i>letter</i> | <i>digit</i> | <tt>'</tt> | <tt>_</tt>⟩* </td>
    <td> equality </td>
  </tr>
  <tr><td></td></tr>
  <tr>
    <td> <i>longid</i> &nbsp;&nbsp; </td>
    <td>::=</td>
    <td> <i>id</i><sub>1</sub><tt>.</tt>···<tt>.</tt><i>id</i><sub><i>n</i></sub> </td>
    <td> qualified (<i>n</i> ≥ 1) </td>
  </tr>
</tbody></table>

#### Expressions

<table>
  <tbody>
  <tr>
    <td> <i>exp</i> </td>
    <td>::=&nbsp;&nbsp;</td>
    <td> <i>con</i> </td>
    <td> constant </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <i>exp</i><sub>1</sub> <i>exp</i><sub>2</sub> </td>
    <td> application </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <i>exp</i><sub>1</sub> <i>id</i> <i>exp</i><sub>2</sub> </td>
    <td> infix application </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <tt>(</tt> <i>exp</i> <tt>)</tt> </td>
    <td> parentheses </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <tt>(</tt> <i>exp</i><sub>1</sub> <tt>,</tt> ... <tt>,</tt>
                    <i>exp</i><sub><i>n</i></sub> <tt>)</tt> </td>
    <td> tuple (<i>n</i> ≠ 1) </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <tt>[</tt> <i>exp</i><sub>1</sub> <tt>,</tt> ... <tt>,</tt>
                    <i>exp</i><sub><i>n</i></sub> <tt>]</tt> </td>
    <td> list (<i>n</i> ≥ 0) </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <tt>(</tt> <i>exp</i><sub>1</sub> <tt>;</tt> ... <tt>;</tt>
                    <i>exp</i><sub><i>n</i></sub> <tt>)</tt> </td>
    <td> sequence (<i>n</i> ≥ 2) </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <tt>let</tt> <i>dec</i>
         <tt>in</tt> <i>exp</i><sub>1</sub> <tt>;</tt> ... <tt>;</tt>
                     <i>exp</i><sub><i>n</i></sub> <tt>end</tt> &nbsp;&nbsp; </td>
    <td> local declaration (<i>n</i> ≥ 1) </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <i>exp</i> <tt>:</tt> <i>typ</i> </td>
    <td> type annotation </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <i>exp</i><sub>1</sub> <tt>andalso</tt> <i>exp</i><sub>2</sub> </td>
    <td> conjunction </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <i>exp</i><sub>1</sub> <tt>orelse</tt> <i>exp</i><sub>2</sub> </td>
    <td> disjunction </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <tt>if</tt> <i>exp</i><sub>1</sub>
         <tt>then</tt> <i>exp</i><sub>2</sub>
         <tt>else</tt> <i>exp</i><sub>3</sub> </td>
    <td> conditional </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <tt>fn</tt> <tt>()</tt> <tt>=&gt;</tt> <i>exp</i> </td>
    <td> function (simple)</td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <tt>fn</tt> ⟨<i>funarg</i>⟩<sup>(,)</sup> <tt>=&gt;</tt> <i>exp</i> </td>
    <td> function (simple)</td>
  </tr>
  <tr><td></td></tr>
  <tr>
    <td> <i>funarg</i> &nbsp;&nbsp;</td>
    <td>::=&nbsp;&nbsp;</td>
    <td> <i>id</i> </td>
    <td> variable </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <i>id</i> <tt>:</tt> <i>type</i> </td>
    <td> type annotation </td>
  </tr>
</tbody></table>

#### Patterns

_No patterns._

#### Types

<table>
  <tbody><tr>
    <td> <i>typ</i> &nbsp;&nbsp;</td>
    <td>::=&nbsp;&nbsp;</td>
    <td> <i>var</i> </td>
    <td> variable </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> ⟨<i>typ</i>⟩<sup>(,)</sup> <i>longid</i> </td>
    <td> constructor, e.g. <tt>int list</tt></td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <tt>(</tt> <i>typ</i> <tt>)</tt> </td>
    <td> parentheses </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <i>typ</i><sub>1</sub> <tt>-&gt;</tt> <i>typ</i><sub>2</sub> </td>
    <td> function </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <i>typ</i><sub>1</sub> <tt>*</tt> ... <tt>*</tt>
         <i>typ</i><sub><i>n</i></sub> </td>
    <td> tuple (<i>n</i> ≥ 2) </td>
  </tr>
</tbody></table>

#### Declarations

_TBD, further simplifications needed._

<table>
  <tbody><tr>
    <td> <i>dec</i> </td>
    <td>::=&nbsp;&nbsp;</td>
    <td> <tt>val</tt> ⟨<i>var</i>⟩<sup>(,)</sup> <i>valbind</i> </td>
    <td> value </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <tt>fun</tt> ⟨<i>var</i>⟩<sup>(,)</sup> <i>funbind</i> </td>
    <td> function </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <i>dec</i><sub>1</sub> ⟨<tt>;</tt>⟩ <i>dec</i><sub>2</sub> </td>
    <td> sequence </td>
  </tr>
  <tr>
    <td> <i>valbind</i> </td>
    <td>::=</td>
    <td> <i>pat</i> <tt>=</tt> <i>exp</i> ⟨<tt>and</tt> <i>valbind</i>⟩ </td>
    <td> destructuring </td>
  </tr>
  <tr><td></td></tr>
  <tr>
    <td> <i>funmatch</i> </td>
    <td>::=</td>
    <td> ⟨<tt>op</tt>⟩ <i>id</i> <i>pat</i><sub>1</sub> ... <i>pat</i><sub><i>n</i></sub> ⟨<tt>:</tt> <i>typ</i>⟩ <tt>=</tt> <i>exp</i> ⟨<tt>|</tt> <i>funmatch</i>⟩ &nbsp;&nbsp;</td>
    <td> nonfix (<i>n</i> ≥ 1) </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <i>pat</i><sub>1</sub> <i>id</i> <i>pat</i><sub>2</sub>  ⟨<tt>:</tt> <i>typ</i>⟩ <tt>=</tt> <i>exp</i> ⟨<tt>|</tt> <i>funmatch</i>⟩ </td>
    <td> infix </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <tt>(</tt> <i>pat</i><sub>1</sub> <i>id</i> <i>pat</i><sub>2</sub>  <tt>)</tt> <i>pat'</i><sub>1</sub> ... <i>pat'</i><sub><i>n</i></sub> ⟨<tt>:</tt> <i>typ</i>⟩ <tt>=</tt> <i>exp</i> ⟨<tt>|</tt> <i>funmatch</i>⟩ &nbsp;&nbsp; </td>
    <td> infix (<i>n</i> ≥ 0) </td>
  </tr>
  <tr><td></td></tr>
  <tr>
    <td> <i>typbind</i> </td>
    <td>::=</td>
    <td> ⟨<i>var</i>⟩<sup>(,)</sup> <i>id</i> <tt>=</tt> <i>typ</i> ⟨<tt>and</tt> <i>typbind</i>⟩ </td>
    <td> abbreviation </td>
  </tr>
  <tr><td></td></tr>
  <tr>
    <td> <i>datbind</i> </td>
    <td>::=</td>
    <td> ⟨<i>var</i>⟩<sup>(,)</sup> <i>id</i> <tt>=</tt> 
           <i>conbind</i> ⟨<tt>and</tt> <i>datbind</i>⟩ &nbsp;&nbsp; </td>
    <td> data type </td>
  </tr>

  <tr><td></td></tr>
  <tr>
    <td> <i>conbind</i> </td>
    <td>::=</td>
    <td> <i>id</i> ⟨<tt>of</tt> <i>typ</i>⟩ ⟨<tt>|</tt> <i>conbind</i>⟩ &nbsp;&nbsp; </td>
    <td> data constructor </td>
  </tr>

  <tr><td></td></tr>
  <tr>
    <td> <i>exnbind</i>&nbsp;&nbsp; </td>
    <td>::=</td>
    <td> <i>id</i> ⟨<tt>of</tt> <i>typ</i>⟩ ⟨<tt>and</tt> <i>exnbind</i>⟩ </td>
    <td> generative </td>
  </tr>
  <tr>
    <td></td> <td></td>
    <td> <i>id</i> <tt>=</tt> <i>longid</i> ⟨<tt>and</tt> <i>exnbind</i>⟩ </td>
    <td> renaming </td>
  </tr>
</tbody></table>

### Module Language

_No modules._

### Notation

We liberally use the following notation in the grammar:

<ul>
<!--
<li> <tt>typewriter</tt> font for terminal symbols</li>
-->
<li> ⟨<i>foo</i>⟩ for 0 or 1 occurrences of <i>foo</i></li>
<li> ⟨<i>foo</i>⟩* for 0 to many occurrences of <i>foo</i></li>
<li> ⟨<i>foo</i>⟩<sup>+</sup> for 1 to many occurrences of <i>foo</i></li>
<li> ⟨<i>foo</i> | <i>bar</i>⟩ for one of <i>foo</i> or <i>bar</i> (also with more alternatives<!--, or iterated with * or <sup>+</sup>-->)</li>
<!--
<li> <i>foo</i><sub>1</sub> <tt>@</tt> ... <tt>@</tt> <i>foo</i><sub><i>n</i></sub> for <i>n</i> occurrences of <i>foo</i>, separated by <tt>@</tt></li>
-->
<li> ⟨<i>foo</i>⟩<sup>(,)</sup> for 0 or 1 occurrences of <i>foo</i>, or 1 to many comma-separated occurrences enclosed in parentheses (i.e., either empty, <i>foo</i>, or <tt>(</tt><i>foo</i><sub>1</sub><tt>,</tt>...<tt>,</tt><i>foo</i><sub><i>n</i></sub><tt>)</tt> for <i>n</i> ≥ 1)</li>
</ul>