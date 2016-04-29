# Room 6
class Entrance < Room
  # Hallway::DESCRIPTION
  DESCRIPTION = %q{
    You are at the entrance to a forbidding–Looking
    stone castle. You are facing east.
  }

  MOVEMENTS = {
    north: NULL
    south: NULL
    east: Hallway
    west: NULL
    up: NULL
    down: NULL
  }
end
