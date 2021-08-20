class Seed
  include ParseParams

  def self.run
    Shift.destroy_all
    Visit.destroy_all
    Member.destroy_all
    Employee.destroy_all
    Gym.destroy_all
    Location.destroy_all
    seed = Seed.new
    seed.gen_gyms
    seed.gen_members
    seed.gen_visits
    seed.gen_employees
    seed.gen_shifts
  end

  def gen_gyms
    FactoryBot.create_list(:gym, 25)
    puts "Gyms Created: Count #{Gym.count}"
  end

  def gen_members
    Gym.all.each do |gym|
      50.times do
        member = ParseParams::parse_member FactoryBot.build(:member)
        location = FactoryBot.create(:location)
        gym.members.create!({ **member, location_id: location.id })
      end
      puts "A Members Portion Created: Count #{Member.count}"
    end
    puts "Members Created: Count #{Member.count}"
  end

  def gen_employees
    Gym.all.each do |gym|
      25.times do
        employee = ParseParams::parse_employee FactoryBot.build(:employee)
        location = FactoryBot.create(:location)
        gym.employees.create!({ **employee, location_id: location.id })
      end
      puts "A Employees Portion Created: Count #{Employee.count}"
    end
    puts "Employees Created: Count #{Employee.count}"
  end

  def gen_shifts
    Employee.all.each do |employee|
      (1..360).to_a.reverse.each do |day|
        clock_times = get_between_times(day)
        employee.shifts.create!(clock_times)
      end
      puts "A Shift portion Created: Count #{Shift.count}"
    end
    puts "Shifts Created: Count #{Shift.count}"
  end

  def gen_visits
    Member.all.each do |member|
      (1..360).to_a.reverse.each do |day|
        clock_times = get_between_times(day)
        member.visits.create!(clock_times)
      end
      puts "A Visit portion Created: Count #{Visit.count}"
    end
    puts "ALL Visits Created: Count #{Visit.count}"
  end

  def get_between_times day_modifier
    start_time = Faker::Time
                          .between(
                            from: DateTime.now - day_modifier,
                            to: DateTime.now,
                            format: :short
                          )
    end_time = Faker::Time
                        .between(
                          from: start_time,
                          to: DateTime.now - day_modifier,
                          format: :short
                        )
    {
      check_in: start_time,
      check_out: end_time
    }
  end

end

Seed.run