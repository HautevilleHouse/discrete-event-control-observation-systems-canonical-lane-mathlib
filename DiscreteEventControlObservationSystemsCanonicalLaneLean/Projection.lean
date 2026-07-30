import discreteEventControlObservationSystemsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def decProjection : Projection DECEndgameState :=
  { toFun := fun x => x
    idempotent := by intro x; rfl
  }

theorem dec_projection_idempotent (x : DECEndgameState) :
    decProjection.toFun (decProjection.toFun x) = decProjection.toFun x := by
  exact decProjection.idempotent x

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse
