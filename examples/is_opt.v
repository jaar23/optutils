import optutils

fn main() {
	some_val := ?int(10)

	some_val2 := ?int(11)

	some_val3 := ?int(none)
	
	some_val4 := ?int(10)

	eq := optutils.is_equal(some_val, some_val2)

	eq2 := optutils.is_equal(some_val, some_val4)

	println("some_val equal some_val2? ${eq}")

	println("some_val equal some_val4? ${eq2}")

	some := optutils.is_some(some_val)

	println("got something? ${some}")

	nothing := optutils.is_none(some_val3)

	println("got nothing? ${nothing}")
}