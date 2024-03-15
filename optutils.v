module optutils

pub type OptionTwo[T, K] = K | T

pub fn unwrap[T](optional_val ?T) !T {
	if x := optional_val {
		return x
	} else {
		return error('unable to unwrap option variable')
	}
}

pub fn unwrap_or[T](optional_val ?T, default T) T {
	if x := optional_val {
		return x
	} else {
		return default
	}
}

pub fn unwrap_or_other[T, K](optional_val ?T, other_val K) OptionTwo[T, K] {
	if x := optional_val {
		return x
	} else {
		return other_val
	}
}

pub fn unwrap_then[T, K](optional_val ?T, func fn (T) K) !K {
	if x := optional_val {
		return func(x)
	} else {
		return error('unable to unwrap option variable')
	}
}

pub fn unwrap_or_default[T](optional_val ?T) T {
	if x := optional_val {
		return x
	} else {
		return T{}
	}
}

pub fn try_map[T](optional_val ?[]T, func fn (T) T) ?[]T {
	if x := optional_val {
		return x.map(func)
	} else {
		return none
	}
}

pub fn unwrap_try_map[T](optional_val ?[]T, func fn (T) T) []T {
	map_vals := try_map(optional_val, func)
	if x := map_vals {
		return x
	} else {
		return []
	}
}

pub fn try_filter[T](optional_val ?[]T, func fn (T) bool) ?[]T {
	if x := optional_val {
		mut result := []T{}
		for i in x {
			if func(i) {
				result << i
			}
		}
		return result
	} else {
		return none
	}
}

pub fn unwrap_try_filter[T](optional_val ?[]T, func fn (T) bool) []T {
	filtered_val := try_filter(optional_val, func)
	if x := filtered_val {
		return x
	} else {
		return []
	}
}

pub fn is_equal[T](a ?T, b ?T) bool {
	unwrap_a := unwrap_or_default(a)

	unwrap_b := unwrap_or_default(b)
	// println('${unwrap_a}, ${unwrap_b}')
	return unwrap_a == unwrap_b
}

pub fn is_some[T](optional_val ?T) bool {
	if _ := optional_val {
		return true
	} else {
		return false
	}
}

pub fn is_none[T](optional_val ?T) bool {
	if _ := optional_val {
		return false
	} else {
		return true
	}
}
