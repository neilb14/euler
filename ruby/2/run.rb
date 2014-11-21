i,j,result = 1,2,2
while(j < 4_000_000) do 
	i,j = j,i+j
	result += j unless j%2 != 0
end
puts result