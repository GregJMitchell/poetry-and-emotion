require 'ibm_watson/authenticators'
require 'ibm_watson/tone_analyzer_v3'
include IBMWatson

class ToneService
  def self.analyze(poem)
    authenticator = Authenticators::IamAuthenticator.new(
      apikey: ENV['IBM_API_KEY']
    )

    tone_analyzer = ToneAnalyzerV3.new(
      version: '2017-09-21',
      authenticator: authenticator
    )
    tone_analyzer.service_url = ENV['IBM_URL']

    text = poem.lines.to_s

    tone = tone_analyzer.tone(
      tone_input: { text: text },
      content_type: 'application/json'
    )
    tone_parsed = JSON.parse(tone.result.to_json, symbolize_names: true)
    { title: poem.title,
      author: poem.author,
      tone: tone_parsed,
      lines: text }
  end
end
