package euler
import (
	"testing"	
)

var assertions = []struct{
	number int
	expected int
} {	
	{13195,29},	
}

func TestSum(t *testing.T) {	
	for testNumber, assert := range assertions {
		if result := LargestPrimeFactor(assert.number); result != assert.expected {
			t.Errorf("[%d] Expected %d but was %d for number %d", testNumber, assert.expected, result, assert.number)
	    }
	}
}