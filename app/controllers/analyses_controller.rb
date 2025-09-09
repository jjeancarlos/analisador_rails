# app/controllers/analyses_controller.rb
class AnalysesController < ApplicationController
  # GET /analyses ou /
  def new
    @analysis = Analysis.new
  end

  # GET /analyses/index
  def index
    @analyses = Analysis.order(created_at: :desc)
  end

  # POST /analyses
  def create
    uploaded_file = params[:analysis][:file]

    # Validação do arquivo
    if uploaded_file.nil?
      redirect_to root_path, alert: 'Por favor, selecione um arquivo.'
      return
    end

    # Processamento do arquivo
    sha256_hash = Digest::SHA256.file(uploaded_file.tempfile).hexdigest

    # Busca no banco de dados primeiro para evitar chamadas de API repetidas
    @analysis = Analysis.find_by(sha256_hash: sha256_hash)

    unless @analysis
      # Se não encontrou, consulta a API e cria um novo registro
      api_result = VirusTotalClient.call(sha256_hash)

      @analysis = Analysis.new(
        filename: uploaded_file.original_filename,
        filesize_bytes: uploaded_file.size,
        sha256_hash: sha256_hash,
        is_malicious: api_result[:is_malicious],
        analysis_report: api_result[:report]
      )

      @analysis.save
    end

    # Redireciona para a página de histórico (index), mostrando todos os resultados
    redirect_to analyses_path, notice: "Análise para '#{@analysis.filename}' concluída."
  end
end