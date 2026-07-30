import DiscreteEventControlObservationSystemsCanonicalLaneLean.DiscreteEventSystem

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

structure ObservationMapping (S : DiscreteEventSystem) where
  observationFunction : S.stateSpace → S.stateSpace
  consistentWithEvents : ∀ (s : S.stateSpace) (e : S.eventSet),
    observationFunction (S.transitionFunction s e) = S.transitionFunction (observationFunction s) e

theorem observation_function_idempotent (S : DiscreteEventSystem) (obs : ObservationMapping S) (s : S.stateSpace) :
    obs.observationFunction (obs.observationFunction s) = obs.observationFunction s := by
  rfl

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse