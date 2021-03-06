module DraftHelper
  def create_draft_variables(draft_id)
    session[:draft_id] = draft_id
    session[:round] = 1
    session[:drafting_counter] = 0
    session[:shuffled_teams] = Team.where(account_id: session[:account_id]).shuffle
  end

  def next_pick(draft)
    if session[:drafting_counter] != session[:shuffled_teams].length - 1
      session[:drafting_counter] +=1
    else
      session[:drafting_counter] = 0
      session[:shuffled_teams].reverse!
      session[:round] +=1
      if session[:round] == draft.number_of_rounds + 1
        draft.open = false
        draft.save
      end
    end
  end
end
