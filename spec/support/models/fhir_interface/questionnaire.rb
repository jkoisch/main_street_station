module FhirInterface
  class Questionnaire
    attr_accessor :status, :authored, :subject, :author, :source, :name, :identifier, :encounter
  end

  module QuestionnaireClasses
    class Group
      attr_accessor :name, :header, :text, :subject
    end

    class Question
      attr_accessor :name, :text, :answerDecimal, :answerInteger, :answerBoolean, :answerDate, :answerString,
                    :answerDatetime, :answerInstant, :choice, :options, :data, :remarks
    end
  end
end