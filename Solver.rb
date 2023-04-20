class Solver
  def factorial(n)
    raise "Integer should be positive" if n < 0
    return 1 if (n == 0 || n == 1)
    return n * factorial(n - 1)
  end

  def reverse(word)
    word.reverse
  end

  def fizzbuzz(n)
    if n%3 == 0 && n%5 == 0
      return 'fizzbuzz'
    elsif n%3 == 0
      return 'fizz'
    elsif n%5 == 0
      return 'buzz'
    else
      return n.to_s
    end
  end
end