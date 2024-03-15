import optutils

struct TestStruct {
	a string 
	b int
	c bool
	d f64
	e []string
}

fn main() {
	some_val := ?string("hi, there!")

	val := optutils.unwrap(some_val)!
	println(val)

	none_val := ?string(none)
	val8 := optutils.try_unwrap(none_val) or {"alternative"}
	println(val8)

	val2 := optutils.unwrap_or(some_val, "")
	println(val2)

	some_val2 := ?string(none)
	option_2 := optutils.unwrap_or_other(some_val2, 1)
	if option_2 is string {
		val3 := string(option_2)
		println("string: ${val3}")
	} else if option_2 is int {
		val4 := int(option_2)
		println("int: ${val4}")
	}

	some_val3 := ?TestStruct(none)
	val5 := optutils.unwrap_or_default(some_val3)
	println(val5)

	some_val4 := ?string(none)
	val6 := optutils.unwrap_or_default(some_val4)
	println(val6 == "")


	some_val5 := ?int(0)
	val7 := optutils.unwrap_then(some_val5, fn (x int) bool {
		if x == 0 {
			return true
		} else {
			return false
		}
	})!

	println(val7)
}