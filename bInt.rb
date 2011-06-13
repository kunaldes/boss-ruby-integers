require "Prime"

class Integer
	
	#returns nil for values < 0
	#returns a bignum if necessary
	def factorial
		return 1 if self == 0
		return (1..self).reduce(:*)
	end
	
	#Alias for factorial because Prasanth wanted it
	def fact
		return self.factorial
	end
	
	#Returns 0 if k > self or k < 0
	#Returns nil if self < 0
	def choose k
		return nil if self < 0
		return 0 if k>self || k<0
		return 1 if k == self || k == 0
		a = [k, self-k]
		return ((a.max+1)..self).reduce(:*)/a.min.factorial
	end
	
	#reverses the number. If there's trailing zeroes in self, they get removed.
	def reverse
		return self.to_s.reverse.to_i
	end
	
	#Returns true if a number is equal to its reverse
	def palindrome?
		return self.reverse == self
	end
	
	#returns the euler totient function of self. if self == 1, it returns 1
	def phi
		return 1 if self == 1
		primes = self.prime_division.map{|x,y| x}
		return (self*primes.map{|x| x-1}.reduce(:*)/primes.reduce(:*)).to_i
	end
	
	#returns true if self and other contain the same digits
	#a.permutation? a returns true
	#note: 120 and (0)21 are not permutations
	def permutation? other
		return (self.to_s.split("").sort.join("")) == (other.to_s.split("").sort.join(""))
	end
	
	#the rad function is the product of all unique prime factors of a number
	#rad of 1 is defined as 1
	def rad
		return 1 if self == 1
		return self.prime_division.map{|x,y| x}.reduce(:*)
	end
	
	#determines whether a numbers digits appear in nondecreasing order
	#runs in linear time with respect to the number of digits in the number
	def increasing?
		i = "0"
		self.to_s.split("").each{|x| return false if x < i; i = x}
		return true
	end
	
	#determines whether a numbers digits appear in nonincreasing order
	#runs in linear time with respect to the number of digits in the number
	def decreasing?
		i = "9"
		self.to_s.split("").each{|x| return false if x > i; i = x}
		return true
	end
end