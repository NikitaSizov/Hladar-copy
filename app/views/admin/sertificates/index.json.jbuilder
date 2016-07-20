json.array!(@admin_sertificates) do |admin_sertificate|
  json.extract! admin_sertificate, :id, :name, :image
  json.url admin_sertificate_url(admin_sertificate, format: :json)
end
