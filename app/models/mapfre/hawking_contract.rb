module Mapfre
  class HawkingContract < ActiveRecord::Base
    self.table_name = "contracts"
    
    self.establish_connection(
      {
        adapter: 'postgresql',
        encoding: 'unicode',
        database: 'hawking_ppu_sandbox',
        username: 'postgres',
        password: 'pDyAP1mri3I5PMP6',
        host: '104.154.103.143',
        pool: 5
      }
    )

    def self.export
      
    end    
  end
end

