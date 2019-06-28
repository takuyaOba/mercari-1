module DeviseHelper

  #年を新しい順番に入れ替える
  def birth_years
    [*(1930..2015)].sort {|a, b| b <=> a }
  end

  # 月を表示させる
  def birth_momths
    [*(1..12)]
  end

  #日付を表示させる
  def birth_days
    [*(1..31)]
  end
end