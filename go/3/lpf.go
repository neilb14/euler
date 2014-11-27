package euler
import "math"

func isPrime(n int) bool {	
	if n <= 2 { return false; }
	for i:=2; i< n/2; i++ {
		if math.Mod(float64(n), float64(i)) == 0 {
			return false;
		}
	}
	return true;
}

func LargestPrimeFactor(n int) int {
	champion,mid := 1,n/2
	for i:=0;i < mid;i++ {
		if math.Mod(float64(n), float64(i)) == 0 && isPrime(n) {
			champion = i
		}
	}
	return champion
}