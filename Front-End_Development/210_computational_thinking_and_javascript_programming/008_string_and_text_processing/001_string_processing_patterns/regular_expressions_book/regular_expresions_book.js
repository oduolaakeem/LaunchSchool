// Regular Expressions Book

// Basic regex

var str = 'cast';
if (str.match(/s/)) {
  console.log("matched 's'");
}

if (str.match(/x/)) {
  console.log("matched 'x'");
}

// Special characters

// $ ^ * + ? . ( ) [ ] { } | \

// Regular character - no metacharacters

// : " " (space)

// Concatenation

// Alternation

// Only these are methacharacters inside a class

// ^ \ - [ ]

// Shortcuts

// all characters .
// digit \d
// not digit \D
// word \w
// not word \W
// hex (only ruby) \h
// not hex (only ruby) \H
// whitespace \s
// not whitespace \S

// Currently at anchors in regex book...

// ^ anchor for beginning of the line
// $ anchor for end of line

// Word Boundaries

// \b

// \b inside a class bracker matches a backslash character

// Quantifiers

// Zero or more

// * is the quantifier zero or more
// use * as quantifier, it matches 0 or more ocurrences of the pattern just to its left

// One or more

// + is the one or more quantifier
// this quantifier is always applied to the pattern to the left

// Zero or one

// ? is the zero or one quantifier
// this quantifier is always applied to the pattern to the left

// Ranges

// {} is the range quantifier
// {m} matches exactly m occurences of the pattern to the left
// {m,} matches m or more ocurrences of the pattern to the left
// {m, n} matches m or more ocurrences but not more than n

// Greedines

// Currently at Using Regular Expressions in Ruby and JavaScript

// Using regex in Ruby and JavaScript

// Matching strings

// text.match

// =~ in ruby, =~ does soemthing similar to match, but it gives the index where the match was found.
// it is more efficient than match.

// scan returns an array of all matching strings

// Splitting strings

// split method is the most used for this task

// ruby

// record = "xyzzy\t3456\t334\tabc"
// fields = record.split("\t")
// # -> ['xyzzy', '3456', '334', 'abc']

// javascript

// var record = "xyzzy\t3456\t334\tabc";
// var fields = record.split("\t");
// -> ['xyzzy', '3456', '334', 'abc']

// when data is not delimited in a nice way, the regex split form can be used, see the example below

// ruby

// record = "xyzzy  3456  \t  334\t\t\tabc"
// fields = record.split(/\s+/)
// # -> ['xyzzy', '3456', '334', 'abc']

// javascript

// var record = "xyzzy  3456  \t  334\t\t\tabc";
// var fields = record.split(/\s+/);
// -> ['xyzzy', '3456', '334', 'abc']

// Capturing groups

// /(['"]).+?\1/

// \1 is a backreference that will match the same group as the first one

// You can have multiplegroups, from left to right up to 9 groups.

// Transformations in ruby

// ruby

// the transformation is made by the sub and gsub methods

// example

// text = 'Four score and seven'
// vowelless = text.gsub(/[aeiou]/, '')
// # -> 'Fr scr nd svn'

// another example

// text = %(We read "War of the Worlds".)
// puts text.sub(/(['"]).+\1/, '\1The Time Machine\1')
// # prints: We read "The Time Machine".

// Transformations in JavaScript

