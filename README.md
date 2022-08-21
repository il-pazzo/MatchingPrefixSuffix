# MatchingPrefixSuffix
Find the longest non-overlapping matching prefix/suffix for a string, using Objective-C.

Examples:

```
"a"    => "" (no matching prefix/suffix)
"aa"   => "a" (non-overlapping)
"ab"   => "" (no matching prefix/suffix)
"aaa"  => "a" (non-overlapping)
"aba"  => "a"
"abba" => "a"
"abaabXabaab" => "abaab" ("ab" would have been a solution, but it's not the longest)
```
