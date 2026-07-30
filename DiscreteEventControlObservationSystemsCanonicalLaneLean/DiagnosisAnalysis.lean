import DiscreteEventControlObservationSystemsCanonicalLaneLean.ObservabilityAnalysis

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

structure DiagnosisPackage {A : AutomatonModel} (O : ObservabilityPackage A) where
  faultEvents : Set A.eventSet
  diagnosisFunction : A.stateSet → Prop
  diagnosabilityCondition : Prop
  faultDetectionDelay : ℕ

structure DiagnosisEvidence {A : AutomatonModel} {O : ObservabilityPackage A} (D : DiagnosisPackage O) where
  faultEventsDefined : Set.Nonempty D.faultEvents
  diagnosisFunctionDefined : D.diagnosisFunction D.diagnosisFunction ≠ ∅
  diagnosabilityConditionClosed : D.diagnosabilityCondition
  faultDetectionDelayClosed : D.faultDetectionDelay ≥ 0

def DiagnosisClosed {A : AutomatonModel} {O : ObservabilityPackage A} (D : DiagnosisPackage O) : Prop :=
  Set.Nonempty D.faultEvents ∧
  D.diagnosisFunction D.diagnosisFunction ≠ ∅ ∧
  D.diagnosabilityCondition ∧
  D.faultDetectionDelay ≥ 0

theorem diagnosis_closed_from_evidence {A : AutomatonModel} {O : ObservabilityPackage A} (D : DiagnosisPackage O) (E : DiagnosisEvidence D) : DiagnosisClosed D := by
  exact And.intro E.faultEventsDefined
    (And.intro E.diagnosisFunctionDefined
      (And.intro E.diagnosabilityConditionClosed E.faultDetectionDelayClosed))

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse