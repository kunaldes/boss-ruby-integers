require "Prime"

class  Integer
	def !
		return 1 if self == 0
		return (1..self).reduce(:*)
	end
	
	def choose k
		return 0 if k>self || self<0
		a = [k, self-k]
		return ((a.max+1)..self).reduce(:*)/a.min.!
	end
	
	def reverse
		return self.to_s.reverse.to_i
	end
	
	def palindrome?
		return self.reverse == self
	end
	
	def phi
		return (self*self.prime_division.map{|x,y| 1-Rational(1,x)}.reduce(:*)).to_i
	end
	
	def permutation? other
		return (self.to_s.split("").sort.join("")) == (other.to_s.split("").sort.join(""))
	end
end