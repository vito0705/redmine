module WorkStatusesHelper
  def num_sum_percent(num, sum)
    num = num.to_f
    sum_i = sum.to_i
    sum_f = sum.to_f
    # p num
    # p sum
    if sum_i == 0
      return "----"
    else
      value = (num / sum_f)
      value = (value * 100).round(2).to_s + "%"
      return value
    end
  end

end
