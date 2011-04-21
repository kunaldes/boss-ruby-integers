require "Prime"

class  Integer
	def factorial
		return 1 if self == 0
		return (1..self).reduce(:*)
	end
	
	def fact
		return self.factorial
	end
	
	def choose k
		return 0 if k>self || self<0
		a = [k, self-k]
		return ((a.max+1)..self).reduce(:*)/a.min.factorial
	end
	
	def reverse
		return self.to_s.reverse.to_i
	end
	
	def palindrome?
		return self.reverse == self
	end
	
	def phi
		primes = self.prime_division.map{|x,y| x}
		return (self*primes.map{|x| x-1}.reduce(:*)/primes.reduce(:*)).to_i
	end
	
	def permutation? other
		return (self.to_s.split("").sort.join("")) == (other.to_s.split("").sort.join(""))
	end
	
	def rad
		return 1 if self == 1
		return self.prime_division.map{|x,y| x}.reduce(:*)
	end
end