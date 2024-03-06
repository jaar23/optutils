module optutils

struct TestStruct {
	a int
	b f64
	c string
	d bool
}

fn test_filter() {
	some_val := [0, 1, 3]
	filter_val := filter(some_val, fn (x int) bool {
		return x > 0
	})
	none_val := ?[]int(none)
	filter_val2 := filter(none_val, fn (x int) bool {
		return x > 0
	})
	if x := filter_val {
		assert x == [1, 3]
	}
	assert filter_val2 == none
}

fn test_unwrap_filter() {
	some_val := [0, 1, 3]
	filter_val := unwrap_filter(some_val, fn (x int) bool {
		return x > 0
	})
	none_val := ?[]int(none)
	filter_val2 := unwrap_filter(none_val, fn (x int) bool {
		return x > 0
	})
	assert filter_val == [1, 3]
	assert filter_val2 == []
}

fn test_equal() {
	some_a := ?string('hello')
	some_b := ?string('hello,')
	some_c := ?string('hello')

	some_d := ?int(2)
	some_e := ?int(1)
	some_f := ?int(1)

	some_fl1 := ?f64(0.2)
	some_fl2 := ?f64(0.2)

	some_x := ?TestStruct{
		a: 1
		b: 0.5
		c: 'hey there'
		d: true
	}
	some_y := ?TestStruct{
		a: 1
		b: 0.5
		c: 'hey there'
		d: true
	}

	assert is_equal(some_a, some_b) == false
	assert is_equal(some_b, some_c) == false
	assert is_equal(some_a, some_c) == true

	assert is_equal(some_d, some_e) == false
	assert is_equal(some_e, some_f) == true
	assert is_equal(some_f, some_e) == true

	assert is_equal(some_fl1, some_fl2) == true
	assert typeof(some_fl1).name == '?f64'

	assert is_equal(some_x, some_y) == true
}

fn test_is_some() {
	some_a := ?string('hello')
	some_b := ?string(none)

	assert is_some(some_a) == true
	assert is_some(some_b) == false
	assert typeof(some_a).name == '?string'
}

fn test_is_none() {
	some_a := ?string('hello')
	some_b := ?string(none)

	assert is_none(some_a) == false
	assert is_none(some_b) == true
	assert typeof(some_a).name == '?string'
}
