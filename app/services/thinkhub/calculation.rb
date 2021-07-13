# frozen_string_literal: true

module Services
  module Thinkhub
    class Calculation 
      include ApplicationService

      def initialize(
        data_base_calculo: nil,     
        codfipe: nil,                
        codmarca: nil,              
        anomodelo: nil,             
        cod_renovacao: nil,         
        cep: nil,                   
        cod_alienado: nil,          
        cod_tipo_pessoa: nil,        
        cod_condutor: nil,           
        cod_estado_civil: nil,       
        cod_habilitacao: nil,        
        cod_sexo: nil,               
        cod_idade: nil,              
        cod_garagem: nil,            
        cod_uso: nil,                
        val_score: nil,              
        val_km_telemetria: nil,      
        ind_vidros: nil,            
        ind_kitgas: nil,            
        ind_blindagem: nil,         
        assinatura_generalli: nil,   
        vlkm_generalli: nil
      )
        super

        @data_base_calculo = data_base_calculo     
        @codfipe = codfipe            
        @codmarca = codmarca              
        @anomodelo = anomodelo             
        @cod_renovacao = cod_renovacao         
        @cep = cep                    
        @cod_alienado = cod_alienado           
        @cod_tipo_pessoa = cod_tipo_pessoa        
        @cod_condutor = cod_condutor            
        @cod_estado_civil = cod_estado_civil        
        @cod_habilitacao = cod_habilitacao        
        @cod_sexo = cod_sexo               
        @cod_idade = cod_idade              
        @cod_garagem = cod_garagem            
        @cod_uso = cod_uso                
        @val_score = val_score              
        @val_km_telemetria = val_km_telemetria      
        @ind_vidros = ind_vidros            
        @ind_kitgas = ind_kitgas            
        @ind_blindagem = ind_blindagem         
        @assinatura_generalli = assinatura_generalli   
        @vlkm_generalli = vlkm_generalli  
      end

      def calculation
        calculation = post(
          endpoint: "/api/procedure/pFipeFabricanteMarcaModelo",
          params: {
            data_base_calculo: @data_base_calculo,     
            codfipe: @codfipe,                
            codmarca: @codmarca,              
            anomodelo: @anomodelo,             
            cod_renovacao: @cod_renovacao,         
            cep: @cep,                   
            cod_alienado: @cod_alienado,          
            cod_tipo_pessoa: @cod_tipo_pessoa,        
            cod_condutor: @cod_condutor,           
            cod_estado_civil: @cod_estado_civil,       
            cod_habilitacao: @cod_habilitacao,        
            cod_sexo: @cod_sexo,               
            cod_idade: @cod_idade,              
            cod_garagem: @cod_garagem,            
            cod_uso: @cod_uso,                
            val_score: @val_score,              
            val_km_telemetria: @val_km_telemetria,      
            ind_vidros: @ind_vidros,            
            ind_kitgas: @ind_kitgas,            
            ind_blindagem: @ind_blindagem,         
            assinatura_generalli: @assinatura_generalli,   
            vlkm_generalli: @vlkm_generalli
          }
        )
        
        calculation[0]
      end
    end
  end
end