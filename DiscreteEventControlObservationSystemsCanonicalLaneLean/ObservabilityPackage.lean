import DiscreteEventControlObservationSystemsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

/-!
# Observability Package
-/

structure EventSet where
  eventType : Type
  observable : Prop
  unobservable : Prop

structure ObservationMask where
  maskPattern : Type
  maskApplied : Prop

structure DetectableLanguage where
  language : Set String
  prefixClosed : Prop
  observableProjection : Prop

structure ObservabilityPackage (E : EventSet) (M : ObservationMask) where
  observableLanguage : DetectableLanguage
  unobservableLanguage : DetectableLanguage
  maskCompatibility : Prop
  observerConstruction : Prop

structure ObservabilityEvidence {E : EventSet} {M : ObservationMask} (P : ObservabilityPackage E M) where
  observableLanguageClosed : P.observableLanguage.prefixClosed
  maskCompatibilityClosed : P.maskCompatibility
  observerConstructionClosed : P.observerConstruction

def ObservabilityClosed {E : EventSet} {M : ObservationMask} (P : ObservabilityPackage E M) : Prop :=
  P.observableLanguage.prefixClosed ∧ P.maskCompatibility ∧ P.observerConstruction

theorem observability_closed_from_evidence {E : EventSet} {M : ObservationMask} (P : ObservabilityPackage E M) (E_vid : ObservabilityEvidence P) : ObservabilityClosed P := by
  exact And.intro E_vid.observableLanguageClosed (And.intro E_vid.maskCompatibilityClosed E_vid.observerConstructionClosed)

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse