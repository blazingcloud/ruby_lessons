# 
class Temperature
  # (F - 32) * 5/9
  def ftoc(f_temp)
    (f_temp - 32) * 5/9.0
  end
  # C * 9/5 + 32
  def ctof(c_temp)
    c_temp * 9/5.0 + 32
  end
end


