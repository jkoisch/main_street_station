require 'rails_helper'
require 'fhir/types/human_name'

describe 'FHIR base-type human name', type: :view do
  context 'simple' do
    let(:object) { yaml_load('base/human_name-simple.yaml') }

    context 'JSON' do
      subject { render partial: 'fhir/base/human_name', formats: :json, locals: {human_name: object} }

      it { should match_fhir_json(support_file('base/human_name-simple.json')) }
    end

    context 'XML' do
      subject { render inline: "xml.name {|xml| xml << render('fhir/base/human_name', {human_name: thing})}",
                       type: :builder, locals: {thing: object} }
      it { should match_fhir_xml(support_file('base/human_name-simple.xml')) }
    end
  end

  context 'complete' do
    let(:object) { yaml_load('base/human_name-complete.yaml') }

    context 'JSON' do
      subject { render partial: 'fhir/base/human_name', formats: :json, locals: {human_name: object} }

      it { should match_fhir_json(support_file('base/human_name-complete.json')) }
    end

    context 'XML' do
      subject { render inline: "xml.name {|xml| xml << render('fhir/base/human_name', {human_name: thing})}",
                       type: :builder, locals: {thing: object} }
      it { should match_fhir_xml(support_file('base/human_name-complete.xml')) }
    end
  end
end