module ApplicationHelper
  
  def item_chosen
    
  end

  def bootstrap_class_for_flash(type)
    case type
      when 'notice' then "alert-info"
      when 'success' then "alert-success"
      when 'error' then "Veuillez saisir un nom et un mot de passe valid."
      when 'alert' then "alert-warning"
    end
  end

end
