RSpec.describe ToyRobot::Robot do
  subject(:robot) { ToyRobot::Robot.new }

  describe "#place" do
    it "places the robot on the table" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :south)

      expect(robot.report).to eq "0,0,SOUTH"
    end
  end

  context "It hasn't been placed" do
    it "refuses to move" do
      expect { robot.move }.to raise_error ToyRobot::NeedToBeInPlace
      expect { robot.left }.to raise_error ToyRobot::NeedToBeInPlace
      expect { robot.right }.to raise_error ToyRobot::NeedToBeInPlace
    end
  end

  context "It is placed" do
    before do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :north)
    end

    it "allows to move it" do
      expect { robot.move }.to_not raise_error
      expect { robot.left }.to_not raise_error
      expect { robot.right }.to_not raise_error
    end
  end

  describe "#move" do
    it "moves robot one unit when facing north" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :north)
      robot.move

      expect(robot.report).to eq "0,1,NORTH"
    end

    it "moves robot one unit when facing east" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :east)
      robot.move

      expect(robot.report).to eq "1,0,EAST"
    end

    it "moves robot one unit when facing south" do
      direction = ToyRobot::Coordinate.new(0, 4)
      robot.place ToyRobot::Position.new(direction, :south)
      robot.move

      expect(robot.report).to eq "0,3,SOUTH"
    end

    it "moves robot one unit when facing west" do
      direction = ToyRobot::Coordinate.new(4, 4)
      robot.place ToyRobot::Position.new(direction, :west)
      robot.move

      expect(robot.report).to eq "3,4,WEST"
    end
  end

  describe "#left" do
    it "faces west, when facing north" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :north)
      robot.left

      expect(robot.report).to eq "0,0,WEST"
    end

    it "faces south, when facing west" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :west)
      robot.left

      expect(robot.report).to eq "0,0,SOUTH"
    end

    it "faces east, when facing south" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :south)
      robot.left

      expect(robot.report).to eq "0,0,EAST"
    end

    it "faces north, when facing east" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :east)
      robot.left

      expect(robot.report).to eq "0,0,NORTH"
    end
  end

  describe "#right" do
    it "faces east, when facing north" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :north)
      robot.right

      expect(robot.report).to eq  "0,0,EAST"
    end

    it "faces south, when facing east" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :east)
      robot.right

      expect(robot.report).to eq "0,0,SOUTH"
    end

    it "faces west, when facing south" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :south)
      robot.right

      expect(robot.report).to eq "0,0,WEST"
    end

    it "faces north, when facing west" do
      direction = ToyRobot::Coordinate.new(0, 0)
      robot.place ToyRobot::Position.new(direction, :west)
      robot.right

      expect(robot.report).to eq "0,0,NORTH"
    end
  end
end
