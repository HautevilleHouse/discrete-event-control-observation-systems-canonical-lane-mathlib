import DiscreteEventControlObservationSystemsCanonicalLaneLean.Observability

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

structure Diagnosability (S : DiscreteEventSystem) (obs : Observability S) where
  faultEvents : Set S.eventSet
  diagnosable : Prop
  finiteDelay : ℕ
  detectionCondition : ∀ (s : S.stateSpace) (f : S.eventSet), f ∈ faultEvents →
    (∃ (n : ℕ) (obsSequence : List (S.stateSpace)),
      (∀ i ≤ n, obsSequence.get? i = some (S.transitionFunction s f)) ∧
      (obsSequence.get? n = some s) →
      (∃ (t : S.stateSpace) (g : S.eventSet), g ∈ faultEvents ∧
        obs.observationMapping t = obs.observationMapping s))

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse
