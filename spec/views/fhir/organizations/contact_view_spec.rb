require 'rails_helper'
require 'fhir/organization'

describe 'FHIR View Organization Contact', type: :view do
  context 'partial' do
    context 'simple' do
      let(:object) { yaml_load('organizations/contact-standard.yaml') }

      context 'json' do
        subject { render partial: 'fhir/organizations/contact', formats: :json, locals: {contact: object} }

        it { should match_fhir_json(support_file('organizations/contact-standard.json')) }
      end

      context 'xml' do
        subject { render inline: "xml.contact {|xml| xml << render('fhir/organizations/contact', {contact: contact})}",
                         type: :builder, locals: {contact: object} }

        it { should match_fhir_xml(support_file('organizations/contact-standard.xml')) }
      end
    end

    context 'complete' do
      let(:object) { yaml_load('organizations/contact-complete.yaml') }

      context 'json' do
        subject { render partial: 'fhir/organizations/contact', formats: :json, locals: {contact: object} }

        it { should match_fhir_json(support_file('organizations/contact-complete.json')) }
      end

      context 'xml' do
        subject { render inline: "xml.contact {|xml| xml << render('fhir/organizations/contact', {contact: contact})}",
                         type: :builder, locals: {contact: object} }

        it { should match_fhir_xml(support_file('organizations/contact-complete.xml')) }
      end
    end
  end
end