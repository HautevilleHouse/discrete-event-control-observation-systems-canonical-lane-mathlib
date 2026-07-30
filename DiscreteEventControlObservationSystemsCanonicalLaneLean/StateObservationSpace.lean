import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

structure StateObservationSpace where
  eventSet : Type u
  observationSet : Type v
  stateSpace : Type w
  observationMap : stateSpace → observationSet
  eventActivation : eventSet → stateSpace → Prop
  initialStates : Set stateSpace
  observableEvents : eventSet → Prop
  eventActivationClosed : ∀ (e : eventSet), ∀ (s : stateSpace), eventActivation e s → True
  initialStatesNonempty : initialStates.Nonempty

def ObservationClosed (S : StateObservationSpace) : Prop :=
  (∀ s : S.stateSpace, S.observationMap s ∈ S.observationSet) ∧
  (∀ e : S.eventSet, S.observableEvents e → ∃ s : S.stateSpace, S.eventActivation e s)

theorem observation_closed_from_structure (S : StateObservationSpace) : ObservationClosed S := by
  refine ⟨?_, ?_⟩
  · intro s; exact trivial
  · intro e h
    refine ⟨?, ?_⟩
    · exact Classical.choice (by
        have : Nonempty S.stateSpace := by
          rcases S.initialStatesNonempty with ⟨s, _⟩
          exact ⟨s⟩
        exact this)
    · exact S.eventActivationClosed e _

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse