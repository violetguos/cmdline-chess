module Rules
  def Rules.boundry(target)
    if target.x < 0 || target.x > 7 || target.y <0 || target.y > 7
      return false
    else 
      return true
    end
  end

  def Rules.pawn(pawn)

  end
 
end
