import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

structure ObservationPackage (S : DiscreteEventSystem) where
  projectionMap : ObservationMap
  observableEvents : Set (S.eventSet)
  indistinguishableStrings : Set (List S.eventSet)
  projectionPreservesLanguage : Prop
  indistinguishabilityClosed : Prop

structure ObservationEvidence {S : DiscreteEventSystem} (O : ObservationPackage S) where
  projectionPreservesLanguageClosed : O.projectionPreservesLanguage
  indistinguishabilityClosedClosed : O.indistinguishabilityClosed

def ObservationClosed {S : DiscreteEventSystem} (O : ObservationPackage S) : Prop :=
  O.projectionPreservesLanguage ∧ O.indistinguishabilityClosed

theorem observation_closed_from_evidence
    {S : DiscreteEventSystem} (O : ObservationPackage S)
    (E : ObservationEvidence O) : ObservationClosed O := by
  exact And.intro E.projectionPreservesLanguageClosed E.indistinguishabilityClosedClosed

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse
