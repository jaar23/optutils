import optutils

fn main() {
	some_arr := [0, 2, 4, 6, 8]

	map_val := optutils.try_map(some_arr, fn (x int) int {
		y := x/2
		return y
	})
	println(map_val)


	umap_val := optutils.unwrap_try_map(some_arr, fn (x int) int {
		y := x/2
		return y
	})
	println(umap_val)

	filter_val := optutils.try_filter(some_arr, fn (x int) bool {
		return x/2 > 1
	})

	println(filter_val)

	ufilter_val := optutils.unwrap_try_filter(some_arr, fn (x int) bool {
		return x/2 > 1
	})

	println(ufilter_val)
}