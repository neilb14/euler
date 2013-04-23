package euler
import (
	"testing"	
)

var assertions = []struct{
	maximum int
	expected int
} {
	{10,23},
	{1000,233168},
}

func TestSum(t *testing.T) {	
	for testNumber, assert := range assertions {
		if result := SumMultiples(assert.maximum); result != assert.expected {
			t.Errorf("[%d] Expected %d but was %d", testNumber, assert.expected, result)
	    }
	}
}