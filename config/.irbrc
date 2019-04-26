def dentaku
  Integer.class_eval do
    alias orig_divide /
    alias / fdiv
  end
end

def undentaku
  Integer.class_eval do
    alias / orig_divide
  end
end
