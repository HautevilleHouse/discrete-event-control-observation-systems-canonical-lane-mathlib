import discreteEventControlObservationSystemsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

structure AdmissibleClass where
  object : DECAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DECWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse
