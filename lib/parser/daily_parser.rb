require 'csv'

def parse_daily
    CSV.foreach(stats.csv, headers: true) do |row|
        amplua_code = row[1]
        amplua_code.slice!(0, 3)

        case amplua_code
        when "FOR"
            prep_amplua_id = 4
        when "MID"
            prep_amplua_id = 3
        when "DEF"
            prep_amplua_id = 2
        when "GK"
            prep_amplua_id = 1
        end

        Player.where(name: row[0]).Perfomance do |performance|
            if row[2] -

        end

    end
end
