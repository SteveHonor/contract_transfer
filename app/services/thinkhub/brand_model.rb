# frozen_string_literal: true

module Services
  module Thinkhub
    class BrandModel 
      include ApplicationService

      def initialize(
        fipe: nil, 
        manufacturing_year: nil,
        model_year: nil
      )
        super

        @fipe = fipe    
        @manufacturing_year = manufacturing_year     
        @model_year = model_year  
      end

      def vehicle
        vehicles = post(
          endpoint: "/api/procedure/pFipeFabricanteMarcaModelo",
          params: {
            codfipe: @fipe,
            anofabricacao: @manufacturing_year.to_i,
            anomodelo: @model_year.to_i
          }
        )
        
        vehicles[0]["vlis"] = vehicles[0]["vlis"].to_i if vehicles.present?
        vehicles[0]["indicador_veiculoimportado"] = vehicles[0]["indicador_veiculoimportado"] == "Sim" if vehicles.present?

        vehicles[0].transform_keys(&mappings.method(:[])) if vehicles.present?
      end

      private

      def mappings
        { 
          'fabricante' => 'brand', 
          'marca' => 'name',
          'fipe' => 'fipe',
          'cdmarca' => 'model_code',
          'vlis' => 'market_value',
          'indicador_veiculoimportado' => 'imported',
          'anomodelo' => 'model_year'
        }
      end
    end
  end
end