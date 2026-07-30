import DiscreteEventControlObservationSystemsCanonicalLaneLean.ArchitecturePackage

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

/-!
# Verification Package: safety, liveness, diagnosability
-/

structure SafetyProperty where
  invariant : Set String
  reachableStates : Prop
  violationDetected : Prop

structure LivenessProperty where
  eventualGoal : Prop
  fairnessCondition : Prop

structure DiagnosabilityProperty where
  faultSet : Type
  observationDelay : Nat
  detectabilityCondition : Prop

structure VerificationPackage {E : EventSet} {M : ObservationMask} (A : ArchitecturePackage E M) where
  safety : SafetyProperty
  liveness : LivenessProperty
  diagnosability : Option (DiagnosabilityProperty)
  verificationMethod : Prop
  completenessProof : Prop

structure VerificationEvidence {E : EventSet} {M : ObservationMask} {A : ArchitecturePackage E M} (V : VerificationPackage A) where
  safetyClosed : V.safety.invariant ∧ V.safety.reachableStates
  livenessClosed : V.liveness.eventualGoal
  verificationMethodClosed : V.verificationMethod
  completenessProofClosed : V.completenessProof

def VerificationClosed {E : EventSet} {M : ObservationMask} {A : ArchitecturePackage E M} (V : VerificationPackage A) : Prop :=
  (V.safety.invariant ∧ V.safety.reachableStates) ∧ V.liveness.eventualGoal ∧ V.verificationMethod ∧ V.completenessProof

theorem verification_closed_from_evidence {E : EventSet} {M : ObservationMask} {A : ArchitecturePackage E M} (V : VerificationPackage A) (E_vid : VerificationEvidence V) : VerificationClosed V := by
  exact And.intro (And.intro E_vid.safetyClosed.1 E_vid.safetyClosed.2) (And.intro E_vid.livenessClosed (And.intro E_vid.verificationMethodClosed E_vid.completenessProofClosed))

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse