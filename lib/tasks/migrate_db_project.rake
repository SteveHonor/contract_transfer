Dir[Rails.root + 'app/models/**/*.rb'].each do |path|
  require path
end

namespace :migrate do
  desc "Clears all files in tmp/sessions"
  task :project do
    # Darwin
    mapfre_darwin_cart = Mapfre::DarvinCart.new(uuid: SecureRandom.uuid, inserted_at: DateTime.now.utc)
    
    # Hawking
    generali_hawking_contract = Generali::HawkingContract.where(status: :hired).last(2).first
    
    old_customer = Generali::Customer.find_by(email: generali_hawking_contract[:hiring_data]["insured"]["email"])
    
    customer = Mapfre::Customer.new 
    customer.name = old_customer.name
    customer.active = old_customer.active
    customer.email = old_customer.email
    customer.encrypted_password = old_customer.encrypted_password
    customer.sign_in_count = old_customer.sign_in_count
    customer.current_sign_in_at = old_customer.current_sign_in_at
    customer.last_sign_in_at = old_customer.last_sign_in_at
    customer.current_sign_in_ip = old_customer.current_sign_in_ip
    customer.last_sign_in_ip = old_customer.last_sign_in_ip
    customer.provider = old_customer.provider
    customer.uid = old_customer.uid
    customer.tokens = old_customer.tokens
    customer.allow_password_change = old_customer.allow_password_change
    customer.email_hash = old_customer.email_hash
    customer.save!

    fipe               = generali_hawking_contract[:hiring_data]["insured_item"]["vehicle"]["fipe"]
    manufacturing_year = generali_hawking_contract[:hiring_data]["insured_item"]["vehicle"]["manufacturing_year"]
    model_year         = generali_hawking_contract[:hiring_data]["insured_item"]["vehicle"]["model_year"]
    
    vehicle = Services::Thinkhub::BrandModel.new(
      fipe: fipe.insert(6, '-'),
      manufacturing_year: manufacturing_year,
      model_year: model_year
    ).vehicle

    # data_base_calculo:      
    # codfipe:                
    # codmarca:              
    # anomodelo:             
    # cod_renovacao:         
    # cep:                   
    # cod_alienado:          
    # cod_tipo_pessoa:        
    # cod_condutor:           
    # cod_estado_civil:       
    # cod_habilitacao:        
    # cod_sexo:               
    # cod_idade:              
    # cod_garagem:            
    # cod_uso:                
    # val_score:              
    # val_km_telemetria:      
    # ind_vidros:            
    # ind_kitgas:            
    # ind_blindagem:         
    # assinatura_generalli:   
    # vlkm_generalli:  

    calculation_mapfre = Services::Thinkhub::Calculation.new(
      data_base_calculo: generali_hawking_contract     
      codfipe: generali_hawking_contract
      codmarca: generali_hawking_contract              
      anomodelo: generali_hawking_contract
      cod_renovacao: generali_hawking_contract
      cep: generali_hawking_contract   
      cod_alienado: generali_hawking_contract 
      cod_tipo_pessoa: generali_hawking_contract
      cod_condutor: generali_hawking_contract  
      cod_estado_civil: generali_hawking_contract
      cod_habilitacao: generali_hawking_contract
      cod_sexo: generali_hawking_contract  
      cod_idade: generali_hawking_contract 
      cod_garagem: generali_hawking_contract   
      cod_uso: generali_hawking_contract
      val_score: generali_hawking_contract 
      val_km_telemetria: generali_hawking_contract
      ind_vidros: generali_hawking_contract   
      ind_kitgas: generali_hawking_contract   
      ind_blindagem: generali_hawking_contract 
      assinatura_generalli:generali_hawking_contract
      vlkm_generalli: generali_hawking_contract  
    ).migration
  
    generali_hawking_contract[:hiring_data]["insured_item"]["insurer_properties"]["insurer_model_code"] = vehicle["model_code"]
    generali_hawking_contract[:hiring_data]["core"]["cart_uuid"] = mapfre_darwin_cart.uuid
    generali_hawking_contract[:hiring_data]["core"]["original_cart"] = mapfre_darwin_cart.uuid
    
    mapfre_hawking_contract = Mapfre::HawkingContract.new
    mapfre_hawking_contract.customer_id = customer.id
    mapfre_hawking_contract.status = :quoted
    mapfre_hawking_contract.hiring_data = generali_hawking_contract[:hiring_data]
    mapfre_hawking_contract.total_premium = generali_hawking_contract[:total_premium]
    mapfre_hawking_contract.total_premium_without_fee = generali_hawking_contract[:total_premium_without_fee]
    mapfre_hawking_contract.insurer_properties = generali_hawking_contract[:insurer_properties]
    mapfre_hawking_contract.renovation_version = generali_hawking_contract[:renovation_version]
    mapfre_hawking_contract.pre_quotation_uuid = generali_hawking_contract[:pre_quotation_uuid]
    mapfre_hawking_contract.pre_quotation_callback_url = generali_hawking_contract[:pre_quotation_callback_url]
    mapfre_hawking_contract.pre_quotation_response = generali_hawking_contract[:pre_quotation_response]
    mapfre_hawking_contract.quotation_uuid = generali_hawking_contract[:quotation_uuid]
    mapfre_hawking_contract.quotation_callback_url = generali_hawking_contract[:quotation_callback_url]
    mapfre_hawking_contract.quotation_response = generali_hawking_contract[:quotation_response]
    mapfre_hawking_contract.quotation_time = generali_hawking_contract[:quotation_time]
    mapfre_hawking_contract.deductibles = generali_hawking_contract[:deductibles]
    mapfre_hawking_contract.value_per_km = generali_hawking_contract[:value_per_km]
    mapfre_hawking_contract.insurer_quotation_id = generali_hawking_contract[:insurer_quotation_id]
    mapfre_hawking_contract.inspection_required = generali_hawking_contract[:inspection_required]
    mapfre_hawking_contract.tracker_required = generali_hawking_contract[:tracker_required]
    mapfre_hawking_contract.metadata = generali_hawking_contract[:metadata]
    mapfre_hawking_contract.transmission_deadline = generali_hawking_contract[:transmission_deadline]
    mapfre_hawking_contract.coverages = generali_hawking_contract[:coverages]
    mapfre_hawking_contract.inspection_status = generali_hawking_contract[:inspection_status]
    mapfre_hawking_contract.crivo_response = generali_hawking_contract[:crivo_response]
    mapfre_hawking_contract.crivo_callback_url = generali_hawking_contract[:crivo_callback_url]
    mapfre_hawking_contract.last_bonus = generali_hawking_contract[:last_bonus]
    mapfre_hawking_contract.current_bonus = generali_hawking_contract[:current_bonus]
    mapfre_hawking_contract.origin = generali_hawking_contract[:origin]
    mapfre_hawking_contract.cancellation_endorsement_uuid = generali_hawking_contract[:cancellation_endorsement_uuid]
    mapfre_hawking_contract.cancellation_endorsement_status = generali_hawking_contract[:cancellation_endorsement_status]
    mapfre_hawking_contract.cancellation_endorsement_result = generali_hawking_contract[:cancellation_endorsement_result]

    mapfre_hawking_contract.save!

    mapfre_darwin_cart.contract_uuid = mapfre_hawking_contract.id
    mapfre_darwin_cart.first_premium = 0
    mapfre_darwin_cart.domain = generali_hawking_contract[:hiring_data]
    mapfre_darwin_cart.pre_quotation_response = {
      "pre_quotation_response" => generali_hawking_contract[:pre_quotation_response], 
      "status" => "pre_quoted"
    }
   
    mapfre_darwin_cart.quotation_response = {
      "quotation_response" => generali_hawking_contract[:quotation_response], 
      "status" => "quoted",
      "messages" => [],
      "services" => [],
      "coverages" => [],
      "deductibles" => [],
      "reason_type" => nil,
      "value_per_km" => generali_hawking_contract[:value_per_km],
      "total_premium" => generali_hawking_contract[:total_premium],
      "transmission_deadline" => Date.today.to_s, 
      "monthly_fee_quotation_response" => {
        "armor" =>  0, 
        "gas_kit" => 0, 
        "monthly_fee" => 0,
        "iof" => 0
      }
    }

    mapfre_darwin_cart.crivo_response = {
      "status" => "compliant", 
      "document" => generali_hawking_contract[:hiring_data]["insured"]["cpf"], 
      "providers" => {
        "external" => "compliant", 
        "internal" => "compliant"
      }
    }

    mapfre_darwin_cart.quoted_at = DateTime.now.utc

    mapfre_darwin_cart.save!
  
    p "http://darwin-ppu-dot-sandbox-cluster-test.uc.r.appspot.com/carts/#{mapfre_darwin_cart.id}/quotation"
  end
end
