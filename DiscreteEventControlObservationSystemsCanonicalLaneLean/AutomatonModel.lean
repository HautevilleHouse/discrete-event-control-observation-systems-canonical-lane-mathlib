import DiscreteEventControlObservationSystemsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

structure AutomatonModel where
  stateSet : Type u
  eventSet : Type v
  transitionFunction : stateSet → eventSet → stateSet
  initialStates : Set stateSet
  markedStates : Set stateSet
  eventObservable : eventSet → Prop
  observationMapping : eventSet → eventSet
  observableEventSubset : ∀ e : eventSet, eventObservable e → observationMapping e = e

structure AutomatonEvidence (A : AutomatonModel) where
  transitionFunctionDefined : ∀ s : A.stateSet, ∀ e : A.eventSet, A.transitionFunction s e ∈ A.stateSet
  initialStatesNonempty : A.initialStates.Nonempty
  markedStatesDefined : Set.Nonempty A.markedStates
  observationMappingDefined : ∀ e : A.eventSet, A.observationMapping e ∈ A.eventSet
  observableEventSubsetClosed : ∀ e : A.eventSet, A.eventObservable e → A.observationMapping e = e

def AutomatonClosed (A : AutomatonModel) : Prop :=
  (∀ s : A.stateSet, ∀ e : A.eventSet, A.transitionFunction s e ∈ A.stateSet) ∧
  A.initialStates.Nonempty ∧
  Set.Nonempty A.markedStates ∧
  (∀ e : A.eventSet, A.observationMapping e ∈ A.eventSet) ∧
  (∀ e : A.eventSet, A.eventObservable e → A.observationMapping e = e)

theorem automaton_closed_from_evidence (A : AutomatonModel) (E : AutomatonEvidence A) : AutomatonClosed A := by
  exact And.intro E.transitionFunctionDefined
    (And.intro E.initialStatesNonempty
      (And.intro E.markedStatesDefined
        (And.intro E.observationMappingDefined E.observableEventSubsetClosed)))

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse