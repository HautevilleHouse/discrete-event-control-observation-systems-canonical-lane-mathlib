import DiscreteEventControlObservationSystemsCanonicalLaneLean.AutomatonModel

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

structure ObservabilityPackage (A : AutomatonModel) where
  naturalProjection : A.eventSet → A.eventSet
  observableLanguage : Set (List A.eventSet)
  currentStateUncertainty : Set (Set A.stateSet)
  observabilityCondition : Prop
  currentStateUncertaintyRefinement : Prop

structure ObservabilityEvidence {A : AutomatonModel} (O : ObservabilityPackage A) where
  naturalProjectionDefined : ∀ e : A.eventSet, O.naturalProjection e ∈ A.eventSet
  observableLanguageClosed : O.observableLanguage.Nonempty
  currentStateUncertaintyClosed : O.currentStateUncertainty.Nonempty
  observabilityConditionClosed : O.observabilityCondition
  currentStateUncertaintyRefinementClosed : O.currentStateUncertaintyRefinement

def ObservabilityClosed {A : AutomatonModel} (O : ObservabilityPackage A) : Prop :=
  (∀ e : A.eventSet, O.naturalProjection e ∈ A.eventSet) ∧
  O.observableLanguage.Nonempty ∧
  O.currentStateUncertainty.Nonempty ∧
  O.observabilityCondition ∧
  O.currentStateUncertaintyRefinement

theorem observability_closed_from_evidence {A : AutomatonModel} (O : ObservabilityPackage A) (E : ObservabilityEvidence O) : ObservabilityClosed O := by
  exact And.intro E.naturalProjectionDefined
    (And.intro E.observableLanguageClosed
      (And.intro E.currentStateUncertaintyClosed
        (And.intro E.observabilityConditionClosed E.currentStateUncertaintyRefinementClosed)))

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse