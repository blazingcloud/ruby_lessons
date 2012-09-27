class Machine
  def do_something(n=1)
    (n-1).times { yield }
    yield
  end
end