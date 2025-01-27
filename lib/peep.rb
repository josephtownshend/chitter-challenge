require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_test')
    else
      connection = PG.connect(dbname: 'Chitter')
    end

    result = connection.exec("SELECT * FROM peeps")
    result.map { |peep| peep['peep'] }
  end
end
