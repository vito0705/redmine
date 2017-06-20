module WorkStatusesHelper
  def num_sum_percent(num, sum)
    num = num.to_f
    sum = sum.to_i
    # p num
    # p sum
    if sum == 0
      return "----"
    else
      value = (num / sum)
      value = (value * 100).round(2).to_s + "%"
      return value
    end
  end
end
