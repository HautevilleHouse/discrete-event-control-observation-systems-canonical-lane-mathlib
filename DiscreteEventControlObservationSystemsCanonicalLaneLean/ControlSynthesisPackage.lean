import DiscreteEventControlObservationSystemsCanonicalLaneLean.ObservabilityPackage

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

/-!
# Control Synthesis Package
-/

structure Controller where
  controlActions : Type
  stateBased : Prop
  eventBased : Prop
  permissive : Prop
  restrictive : Prop

structure ControlObligation (E : EventSet) where
  forbiddenStates : Prop
  safetySpecification : Prop
  livenessSpecification : Prop
  controllability : Prop

structure ControlSynthesisPackage {E : EventSet} {M : ObservationMask} (P : ObservabilityPackage E M) where
  controller : Controller
  obligation : ControlObligation E
  synthesisMethod : Prop
  correctnessProof : Prop

structure ControlSynthesisEvidence {E : EventSet} {M : ObservationMask} {P : ObservabilityPackage E M} (C : ControlSynthesisPackage P) where
  controllerFinite : C.controller.stateBased
  obligationControllable : C.obligation.controllability
  correctnessProofClosed : C.correctnessProof

def ControlSynthesisClosed {E : EventSet} {M : ObservationMask} {P : ObservabilityPackage E M} (C : ControlSynthesisPackage P) : Prop :=
  C.controller.stateBased ∧ C.obligation.controllability ∧ C.correctnessProof

theorem control_synthesis_closed_from_evidence {E : EventSet} {M : ObservationMask} {P : ObservabilityPackage E M} (C : ControlSynthesisPackage P) (E_vid : ControlSynthesisEvidence C) : ControlSynthesisClosed C := by
  exact And.intro E_vid.controllerFinite (And.intro E_vid.obligationControllable E_vid.correctnessProofClosed)

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse