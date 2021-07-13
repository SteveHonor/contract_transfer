module Generali
  class HawkingContract < ActiveRecord::Base
    self.table_name = "contracts"
    self.abstract_class = true
    
    self.establish_connection(
      {
        adapter: 'postgresql',
        encoding: 'unicode',
        database: 'hawking_ppu_staging',
        username: 'thinkseg',
        password: 'ilovethinkseg',
        host: '173.255.113.163',
        pool: 5
      }
    )

    def self.import
      
    end
  end
end 