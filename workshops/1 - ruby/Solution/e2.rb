## Exampl solns

def odd_even_array a
	(a.inject(0){|s,x| (x.odd?) ? s-=1 : s+= 1 })>=0 ? :odd : :even
end

def sum_binary a
	a.reduce(:+).to_s(2)
end

def average a
	a.reduce(:+)/a.count.to_f
end

def flatten_array a
	a.inject([]){|f,e| e.instance_of? Array ? (f+flatten_array(e)) : f<<e }
end3.