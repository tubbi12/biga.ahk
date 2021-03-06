startCase(param_string:="") {
	if (IsObject(param_string)) {
		this._internal_ThrowException()
	}

	l_string := this.replace(param_string, "/(\W)/", " ")
	l_string := this.replace(l_string, "/([\_])/", " ")

	; create
	; add space before each capitalized character
	RegExMatch(l_string, "O)([A-Z])", RE_Match)
	if (RE_Match.Count()) {
		loop, % RE_Match.Count() {
			l_string := % SubStr(l_string, 1, RE_Match.Pos(A_Index) - 1) " " SubStr(l_string, RE_Match.Pos(A_Index))
		}
	}
	; Split the string into array and Titlecase each element in the array
	l_array := StrSplit(l_string, " ")
	loop, % l_array.Count() {
		x_string := l_array[A_Index]
		StringUpper, x_string, x_string, T
		l_array[A_Index] := x_string
	}
	; join the string back together from Titlecased array elements
	l_string := this.join(l_array, " ")
	l_string := this.trim(l_string)
	return l_string
}


; tests
assert.test(A.startCase("--foo-bar--"), "Foo Bar")
assert.test(A.startCase("fooBar"), "Foo Bar")
assert.test(A.startCase("__FOO_BAR__"), "Foo Bar")
