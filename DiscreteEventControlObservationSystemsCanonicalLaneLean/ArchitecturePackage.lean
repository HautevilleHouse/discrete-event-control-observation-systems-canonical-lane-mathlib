import DiscreteEventControlObservationSystemsCanonicalLaneLean.ControlSynthesisPackage

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

/-!
# Architecture Package: centralized, decentralized, hierarchical
-/

structure CentralizedArchitecture (E : EventSet) where
  singleController : Controller
  globalObservability : Prop
  globalControllability : Prop

structure DecentralizedArchitecture (E : EventSet) where
  localControllers : List Controller
  communicationProtocol : Prop
  fusionRule : Prop
  localObservability : Prop

structure HierarchicalArchitecture (E : EventSet) (M : ObservationMask) where
  highLevelModel : ControlSynthesisPackage (P : ObservabilityPackage E M)
  lowLevelModel : ControlSynthesisPackage (P : ObservabilityPackage E M)
  abstractionConsistency : Prop
  interfaceSpecification : Prop

structure ArchitecturePackage (E : EventSet) (M : ObservationMask) where
  centralized : CentralizedArchitecture E
  decentralized : Option (DecentralizedArchitecture E)
  hierarchical : Option (HierarchicalArchitecture E M)
  architectureComparison : Prop
  modularityProof : Prop

structure ArchitectureEvidence {E : EventSet} {M : ObservationMask} (A : ArchitecturePackage E M) where
  centralizedClosed : A.centralized.globalObservability ∧ A.centralized.globalControllability
  modularityProofClosed : A.modularityProof

def ArchitectureClosed {E : EventSet} {M : ObservationMask} (A : ArchitecturePackage E M) : Prop :=
  (A.centralized.globalObservability ∧ A.centralized.globalControllability) ∧ A.modularityProof

theorem architecture_closed_from_evidence {E : EventSet} {M : ObservationMask} (A : ArchitecturePackage E M) (E_vid : ArchitectureEvidence A) : ArchitectureClosed A := by
  exact And.intro E_vid.centralizedClosed E_vid.modularityProofClosed

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse