json.array!(@medicos) do |medico|
  json.extract! medico, :id, :email, :nombre, :apellido, :cedula, :direccion, :telefono_casa, :telefono_celular, :telefono_oficina, :sexo, :fecha_nacimiento, :cmv, :cv, :url
  json.url medico_url(medico, format: :json)
end
