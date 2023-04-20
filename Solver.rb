class Solver
  def factorial(n)
    raise "Integer should be positive" if n < 0
    return 1 if (n == 0 || n == 1)
    return n * factorial(n - 1)
  end

  def reverse(word)

  end

  def fizzbuzz(n)

  end
end