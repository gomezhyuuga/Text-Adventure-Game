require_relative 'room'
# Room 17
class Chambermaids < Room
  # Chambermaids::DESCRIPTION
  DESCRIPTION = %q{
    Oooh...You are in the cambermaids bedroom,
    there is an exit to the west and a door to the south...
  }

  MOVEMENTS = {
    north: DressingChamber,
    south: NULL,
    east:  Treasury,
    west:  MasterBedroom,
    up:    NULL,
    down:  NULL
  }
end
