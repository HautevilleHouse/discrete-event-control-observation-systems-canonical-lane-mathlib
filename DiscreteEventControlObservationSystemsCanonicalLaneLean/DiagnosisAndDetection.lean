import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteEventControlObservationSystemsCanonicalLaneLean.SupervisoryControl

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

structure DiagnosisPackage (S : StateObservationSpace) where
  faultEvents : Set S.eventSet
  diagnosabilityCondition : Prop
  detectionCondition : Prop
  diagnosisDelay : ℕ
  diagnosabilityEvidence : diagnosabilityCondition
  detectionEvidence : detectionCondition

structure DiagnosisClosure (S : StateObservationSpace) (D : DiagnosisPackage S) : Prop where
  diagnosabilityClosed : D.diagnosabilityCondition
  detectionClosed : D.detectionCondition

theorem diagnosis_closed_from_package (S : StateObservationSpace) (D : DiagnosisPackage S) : DiagnosisClosure S D := by
  refine ⟨D.diagnosabilityEvidence, D.detectionEvidence⟩

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse