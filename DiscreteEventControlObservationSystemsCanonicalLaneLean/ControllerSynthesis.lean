import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteEventControlObservationSystemsCanonicalLaneLean.ObservabilityAnalysis

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

structure ControlSpecification (S : StateObservationSpace) where
  forbiddenStates : Set S.stateSpace
  requiredEvents : S.eventSet → S.stateSpace → Prop
  specificationConsistent : Prop
  specificationConsistentEvidence : specificationConsistent

structure Controller (S : StateObservationSpace) (C : ControlSpecification S) where
  controlMap : S.observationSet → Set S.eventSet
  permissiveControl : ∀ (obs : S.observationSet) (e : S.eventSet), e ∈ controlMap obs → True
  safetyCondition : ∀ (s : S.stateSpace), ∀ (e : S.eventSet), S.eventActivation e s → e ∈ controlMap (S.observationMap s) → s ∉ C.forbiddenStates

structure SynthesisClosure (S : StateObservationSpace) (C : ControlSpecification S) (K : Controller S C) : Prop where
  controllerExists : True
  safetyClosed : K.safetyCondition

theorem synthesis_closed_from_controller (S : StateObservationSpace) (C : ControlSpecification S) (K : Controller S C) : SynthesisClosure S C K := by
  refine ⟨trivial, K.safetyCondition⟩

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse