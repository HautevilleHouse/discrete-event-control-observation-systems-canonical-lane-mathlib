import discreteEventControlObservationSystemsCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DECWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse
