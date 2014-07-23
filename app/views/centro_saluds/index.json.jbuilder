json.array!(@centro_saluds) do |centro_salud|
  json.extract! centro_salud, :id, :email, :nombre, :rif, :descripcion, :estado, :ciudad, :direccion, :direccion_fiscal, :telefono, :fax, :sitio_web
  json.url centro_salud_url(centro_salud, format: :json)
end
