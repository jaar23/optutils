# optutils

optutils is a utility module to work with v's option type. 

### Usage

Let's start with a basic example, unwrap a value in option.

`unwrap`, unwrap a value from option type, exception will be raised if operation failed.
```v
import optutils

fn main() {
	some_val := ?string("hi, there!")

	val := optutils.unwrap(some_val)!

	println(val)

    // hi, there!
}
```

`unwrap_or`, unwrap a value from option type, if value is `none`, it will return the `or` value. `or` value has to be the same type of wrapped value.
```v
import optutils

fn main() {
    some_val := ?string(none)

    val2 := optutils.unwrap_or(some_val, "")
	
    println(val2)

    // ""
}
```

`unwrap_or_other`, unwrap a value from option type or return value with another type, if value is `none`, it will return the `or` value.
```v
import optutils

fn main() {
	some_val2 := ?string(none)

    // unwrap string option, if string option is none
    // return int 1
	option_2 := optutils.unwrap_or_other(some_val2, 1)
	
    if option_2 is string {
		val3 := string(option_2)
		println("string: ${val3}")
	} else if option_2 is int {
		val4 := int(option_2)
		println("int: ${val4}")
	}

    // int: 1
}
```

`unwrap_or_default`, unwrap a value from option type or return the type default value. For example, int default value is 0, bool default value is false.
```v
import optutils

struct TestStruct {
	a string 
	b int
	c bool
	d f64
	e []string
}

fn main() {
	some_val3 := ?TestStruct(none)

	val5 := optutils.unwrap_or_default(some_val3)
	
    println(val5)

    // TestStruct{
    //   a: ''
    //   b: 0
    //   c: false
    //   d: 0.0
    //   e: []
    // }

	some_val4 := ?string(none)

	val6 := optutils.unwrap_or_default(some_val4)

	println(val6)
    // NIL

    println(val6 == "")
    // true
}
```

`unwrap_then`, other than `optutils.unwrap_or_other`, you can use `optutils.unwrap_then(x, fn(y))` to return a value with different data type. Due to the callback function, you can do even more before returning a value. There might be error when unwrapping the value, so you need to handle it with `result`.
```v
import optutils

fn main() {
    some_val5 := ?int(0)

	val7 := optutils.unwrap_then(some_val5, fn (x int) bool {
		if x == 0 {
			return true
		} else {
			return false
		}
	})!

	println(val7)

    // true
}
```

`try_map`, return an option array based on the callback function, the callback function should return only the same data type, you can use it for further processing with the array.
```v
import optutils

fn main() {
	some_arr := [0, 2, 4, 6, 8]

	map_val := optutils.try_map(some_arr, fn (x int) int {
		y := x/2
		return y
	})

	println(map_val)

    // Option[0, 1, 2, 3, 4]
}
```

`unwrap_try_map`, similar to the previous function, but unwrap the return value of `try_map`, you get an array instead.
```v
import optutils

fn main() {
	some_arr := [0, 2, 4, 6, 8]

	umap_val := optutils.unwrap_try_map(some_arr, fn (x int) int {
		y := x/2
		return y
	})

	println(umap_val)

    // [0, 1, 2, 3, 4]
}

```

`try_filter`, return an option array based on the callback function, the callback function should return `bool` which used as a predicate.
```v
import optutils

fn main() {
	some_arr := [0, 2, 4, 6, 8]

	filter_val := optutils.try_filter(some_arr, fn (x int) bool {
		return x/2 > 1
	})

	println(filter_val)

    //Option[4, 6, 8]
}
```

`unwrap_try_filter`, similar to previous function, but unwrap the return value of `try_filter`, you get an array instead.
```v
import optutils

fn main() {
	some_arr := [0, 2, 4, 6, 8]

	ufilter_val := optutils.unwrap_try_filter(some_arr, fn (x int) bool {
		return x/2 > 1
	})

	println(ufilter_val)

    // [4, 6, 8]
}
```

`is_equal`, compare two `option` variables, return `true` if equal, else `false`
```v
import optutils

fn main() {
	some_val := ?int(10)

	some_val2 := ?int(11)

	some_val3 := ?int(none)
	
	some_val4 := ?int(10)

	eq := optutils.is_equal(some_val, some_val2)

	eq2 := optutils.is_equal(some_val, some_val4)

	println("some_val equal some_val2? ${eq}")
    // false

	println("some_val equal some_val4? ${eq2}")
    // true
}
```

`is_some`, check if something in the `option` variable, return `true` if something, else `false`.
```v
import optutils

fn main() {
	some_val := ?int(10)

	some := optutils.is_some(some_val)

	println("got something? ${some}")
    
    // true, it is something there
}
```

`is_none`, check if the `option` variable is none, return `true` if nothing, else `false`.
```v
import optutils

fn main() {
	some_val := ?int(10)

	nothing := optutils.is_none(some_val3)

	println("got nothing? ${nothing}")

    // true, it is nothing there
}
```

### Using it

Install via Github
```shell
v install --git https://github.com/jaar23/optutils
```

import in your code
```v
import optutils
```
