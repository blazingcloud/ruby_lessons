TAX = 0.085

class Payment
   TIP = 0.15

   def calculate(amount)
      amount += amount * (TIP + TAX)
   end
end

