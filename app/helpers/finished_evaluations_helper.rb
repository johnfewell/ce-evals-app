module FinishedEvaluationsHelper
  def has_finished_evaluations?(eval)
    eval.finsihed_evaluations.any?
  end
end
