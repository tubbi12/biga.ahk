drop(param_array,param_n:=1) {
	if param_n is not number
	{
		this._internal_ThrowException()
	}

	if (IsObject(param_array)) {
		l_array := this.clone(param_array)
	}
	if (param_array is alnum) {
		l_array := StrSplit(param_array)
	}

	; create
	loop, % param_n
	{
		l_array.RemoveAt(1)
	}
	; return empty array if empty
	if (l_array.Count() == 0) {
		return []
	}
	return l_array
}


; tests
assert.test(A.drop([1, 2, 3]), [2, 3])
assert.test(A.drop([1, 2, 3], 2), [3])
assert.test(A.drop([1, 2, 3], 5), [])
assert.test(A.drop([1, 2, 3], 0), [1, 2, 3])
assert.test(A.drop("fred"), ["r", "e", "d"])
assert.test(A.drop(100), ["0", "0"])


; omit
assert.test(A.drop([]), [])
