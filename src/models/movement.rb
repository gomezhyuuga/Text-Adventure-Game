DB.create_table? :movements do
  primary_key :id

  foreign_key :room_name, :rooms, type: String
  String :north
  String :south
  String :east
  String :west
  String :up
  String :down
end

#The Movement class, specifies the valid movements in the room
class Movement < Sequel::Model
  # Gets the room asociated to this movements
  def room
    Room[self.room_name]
  end
end
Movement.unrestrict_primary_key
