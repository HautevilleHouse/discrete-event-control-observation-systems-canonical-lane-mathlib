import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

structure SupervisoryControlPackage (S : DiscreteEventSystem) (C : ControllabilityPackage S) (O : ObservationPackage S) where
  supervisorMap : S.stateSet → Set (S.eventSet)
  admissibleSupervisor : Prop
  nonblockingSupervisor : Prop
  observationCompatibility : Prop
  admissibleSupervisorClosed : admissibleSupervisor
  nonblockingSupervisorClosed : nonblockingSupervisor
  observationCompatibilityClosed : observationCompatibility

structure SupervisoryControlEvidence {S : DiscreteEventSystem} {C : ControllabilityPackage S} {O : ObservationPackage S} (U : SupervisoryControlPackage S C O) where
  admissibleSupervisorClosedClosed : U.admissibleSupervisorClosed
  nonblockingSupervisorClosedClosed : U.nonblockingSupervisorClosed
  observationCompatibilityClosedClosed : U.observationCompatibilityClosed

def SupervisoryControlClosed {S : DiscreteEventSystem} {C : ControllabilityPackage S} {O : ObservationPackage S} (U : SupervisoryControlPackage S C O) : Prop :=
  U.admissibleSupervisor ∧ U.nonblockingSupervisor ∧ U.observationCompatibility

theorem supervisory_control_closed_from_evidence
    {S : DiscreteEventSystem} {C : ControllabilityPackage S} {O : ObservationPackage S}
    (U : SupervisoryControlPackage S C O) (E : SupervisoryControlEvidence U) : SupervisoryControlClosed U := by
  exact And.intro E.admissibleSupervisorClosedClosed
    (And.intro E.nonblockingSupervisorClosedClosed E.observationCompatibilityClosedClosed)

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse
