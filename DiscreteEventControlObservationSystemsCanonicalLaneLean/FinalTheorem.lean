import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

def ConstrainedDECOSClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_decos_endgame (A : AdmissibleClass) :
    ConstrainedDECOSClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse
