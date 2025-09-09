# app/services/virus_total_client.rb
require 'httparty'

class VirusTotalClient
  include HTTParty
  base_uri 'https://www.virustotal.com/api/v3'

  def initialize
    @api_key = Rails.application.credentials.virus_total_api_key
    raise "API Key do VirusTotal não configurada nas credentials!" if @api_key.nil?
    @headers = { "x-apikey" => @api_key }
  end

  # Método principal para ser chamado
  def self.call(sha256_hash)
    new.get_file_report(sha256_hash)
  end

  def get_file_report(sha256_hash)
    puts "Consultando VirusTotal para o hash: #{sha256_hash}"
    response = self.class.get("/files/#{sha256_hash}", headers: @headers)

    return parse_response(response) if response.success?

    # Se o arquivo nunca foi visto, a API retorna 404 (Not Found).
    { is_malicious: false, report: "Arquivo não encontrado no VirusTotal (hash desconhecido)." }
  end

  private

  def parse_response(response)
    stats = response.parsed_response.dig('data', 'attributes', 'last_analysis_stats')
    return { is_malicious: false, report: "Análise incompleta ou sem estatísticas." } if stats.nil?

    malicious_count = stats['malicious']
    {
      is_malicious: malicious_count > 0,
      report: "Análise do VirusTotal: #{stats['malicious']} malicioso(s), #{stats['suspicious']} suspeito(s), #{stats['undetected']} inofensivo(s)."
    }
  end
end