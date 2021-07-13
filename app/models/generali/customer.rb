module Generali
  class Customer < ActiveRecord::Base
    self.table_name = "customers"
  
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
  end
end
