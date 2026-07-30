import discreteEventControlObservationSystemsCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DiscreteEventControlObservationSystemsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DECSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DECAdmittedObject where
  system : DECSpace
  eventSet : Set (Event system)
  languageMarked : Set (List (Event system))
  controllableEvents : Set (Event system)
  observableEvents : Set (Event system)
  supervisorExists : Prop
  conclusion : supervisorExists

structure DECEndgameState where
  object : DECAdmittedObject

def DECWitnessClosed (O : DECAdmittedObject) : Prop :=
  O.supervisorExists

end DiscreteEventControlObservationSystemsCanonicalLaneLean
end HautevilleHouse
