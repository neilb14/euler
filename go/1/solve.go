package euler
import "math"

func SumMultiples(n int) int {
	sum := 0
	for i:=0;i<n;i++ {
		if math.Mod(float64(i),float64(3)) == 0 || math.Mod(float64(i),float64(5)) == 0 {
			sum += i
		}
	}	
	return sum
}