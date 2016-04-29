require_relative 'room'

# Room 3
class GreatHall < Room
  # GreatHall::DESCRIPTION
  DESCRIPTION = %q{
    You are in the great hall, and l–shaped room,
    there are doors to the east and to the north.
    In the alcove is a door to the west
  }


  MOVEMENTS = {
    north: AudienceChamber
    south: NULL
    east: InnerHallway
    west: NULL
    up: NULL
    down: NULL
  }
end
