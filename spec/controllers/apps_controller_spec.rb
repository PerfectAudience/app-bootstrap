require 'spec_helper'

describe AppsController do

  context '#show' do
    let(:source) { 'image_url' }
    let(:parameters) { { source: source } }
    let(:app_instance) { stub(timeline_options: nil) }
    let(:customization) { stub(to_query_string: '') }

    before do
      App.should_receive(:new) { app_instance }
      Customization.should_receive(:new) { customization }
    end

    context 'with valid parameters' do
      let(:user_hash) { { 'name' => source } }
      let(:tweets_array) { [] }
      let(:attributes_hash) { { source: "image_url" } }

      before do
        app_instance.should_receive(:valid?) { true }
        customization.should_receive(:valid?) { true }
      end

      it 'assigns @app' do
        get :show, parameters
        assigns[:app].should == app_instance
      end

      it 'assigns @customization' do
        get :show, parameters
        assigns[:customization].should == customization
      end

      it 'responds successfully' do
        get :show, parameters
        response.should be_success
      end

      it 'renders the show template with the serve layout' do
        get :show, parameters
        response.should render_template('show', layout: 'serve')
      end
    end

    context 'with invalid parameters' do
      before do
        app_instance.should_receive(:valid?) { false }
        customization.should_receive(:valid?) { false }
      end

      it 'assigns @app' do
        get :show, parameters
        assigns[:app].should == app_instance
      end

      it 'assigns @customization' do
        get :show, parameters
        assigns[:customization].should == customization
      end

      it 'renders the error template with the errors layout' do
        get :show, parameters
        response.should render_template('error', layout: 'errors')
      end
    end
  end
end
