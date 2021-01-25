#!/bin/bash -x
assert(){
	expected="$1"
	input="$2"
	./9cc "$input" > tmp.s
	cc -o tmp tmp.s
	./tmp
	actual="$?"

	if [ "$actual" = "$expected" ]; then
		echo "$input => $actual"
	else
		echo "$input => $expected expected, but got $actual"
		exit 1
	fi
}

assert 0 0
assert 42 42
assert 21 "5+20-4"
assert 2 "5 - 3"
#assert 8 " 4 + 4 + +"
assert 7 " 1 + 2 * 3 "
assert 7 " + 10 - 3 "
echo OK
