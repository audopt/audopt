json.extract! report, :id, :reason, :created_at, :updated_at
json.url report_url(report, format: :json)