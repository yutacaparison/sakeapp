module SakesHelper

  def choose_new_or_edit_sakes
    if action_name == :new || action_name == :confirm
      confirm_sakes_path
    elsif action_name == :edit
      sake_path
    end
  end

end
