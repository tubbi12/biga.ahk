divide(param_dividend,param_divisor) {
	if (IsObject(param_dividend) || IsObject(param_divisor)) {
		this._internal_ThrowException()
	}

	; create
	vValue := param_dividend / param_divisor
	return vValue
}


; tests
assert.test(A.divide(6, 4), 1.5)


; omit
assert.test(A.divide(10, -1), -10)
assert.test(A.divide(-10, -10), 1)
