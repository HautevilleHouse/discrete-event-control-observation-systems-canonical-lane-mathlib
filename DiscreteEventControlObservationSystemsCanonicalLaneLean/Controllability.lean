import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

structure DiscreteEventSystem where
  stateSet : Type u
  eventSet : Type v
  transitionFunction : stateSet → eventSet → Option stateSet
  initialStates : Set stateSet
  markedStates : Set stateSet

structure ObservationMap where
  domain : Type u
  codomain : Type w
  mapping : domain → codomain
  partiallyDefined : Prop

structure ControllabilityPackage (S : DiscreteEventSystem) where
  controllableEvents : Set (S.eventSet)
  uncontrollableEvents : Set (S.eventSet)
  forbiddenStrings : Set (List S.eventSet)
  controllablePrefixClosed : Prop
  controllableAvoidsForbidden : Prop

structure ControllabilityEvidence {S : DiscreteEventSystem} (C : ControllabilityPackage S) where
  controllablePrefixClosedClosed : C.controllablePrefixClosed
  controllableAvoidsForbiddenClosed : C.controllableAvoidsForbidden

def ControllabilityClosed {S : DiscreteEventSystem} (C : ControllabilityPackage S) : Prop :=
  C.controllablePrefixClosed ∧ C.controllableAvoidsForbidden

theorem controllability_closed_from_evidence
    {S : DiscreteEventSystem} (C : ControllabilityPackage S)
    (E : ControllabilityEvidence C) : ControllabilityClosed C := by
  exact And.intro E.controllablePrefixClosedClosed E.controllableAvoidsForbiddenClosed

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse
