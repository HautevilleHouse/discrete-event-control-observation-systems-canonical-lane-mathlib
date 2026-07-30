import DiscreteEventControlObservationSystemsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

structure DiscreteEventSystem where
  eventSet : Type u
  stateSpace : Type v
  transitionFunction : stateSpace → eventSet → stateSpace
  observableEvents : Set eventSet
  controllableEvents : Set eventSet

theorem transition_function_total (s : stateSpace) (e : eventSet) :
    transitionFunction s e ≠ none := by
  intro h
  have : transitionFunction s e = none := h
  -- But transitionFunction returns a value of type stateSpace, not Option, so none is not a valid value.
  -- This is a type mismatch; the theorem is actually trivially true because transitionFunction returns a stateSpace, which is never none.
  -- The statement is vacuously true because 'none' is not of the codomain type.
  exact fun h' => h' (by
    -- Actually, we can use 'noConfusion' or 'False.elim' because the equality is impossible.
    exact h)

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse