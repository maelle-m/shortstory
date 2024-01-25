class OpenaiService
  include HTTParty
  base_uri 'https://api.openai.com/v1'

  def initialize(prompt)
    @prompt = prompt
  end

  def call
    response = self.class.post("/chat/completions", {
      headers: {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{ENV['OPENAI_KEY']}"
      },
      body: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: @prompt }]
      }.to_json,
      timeout: 60
    })
    raise StandardError, "OpenAI Error: #{response['error']['message']}" if response.code != 200

    response.parsed_response['choices'][0]['message']['content']
  end
end
