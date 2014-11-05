require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe TotalPerformancesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # TotalPerformance. As you add validations to TotalPerformance, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TotalPerformancesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all total_performances as @total_performances" do
      total_performance = TotalPerformance.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:total_performances)).to eq([total_performance])
    end
  end

  describe "GET show" do
    it "assigns the requested total_performance as @total_performance" do
      total_performance = TotalPerformance.create! valid_attributes
      get :show, {:id => total_performance.to_param}, valid_session
      expect(assigns(:total_performance)).to eq(total_performance)
    end
  end

  describe "GET new" do
    it "assigns a new total_performance as @total_performance" do
      get :new, {}, valid_session
      expect(assigns(:total_performance)).to be_a_new(TotalPerformance)
    end
  end

  describe "GET edit" do
    it "assigns the requested total_performance as @total_performance" do
      total_performance = TotalPerformance.create! valid_attributes
      get :edit, {:id => total_performance.to_param}, valid_session
      expect(assigns(:total_performance)).to eq(total_performance)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TotalPerformance" do
        expect {
          post :create, {:total_performance => valid_attributes}, valid_session
        }.to change(TotalPerformance, :count).by(1)
      end

      it "assigns a newly created total_performance as @total_performance" do
        post :create, {:total_performance => valid_attributes}, valid_session
        expect(assigns(:total_performance)).to be_a(TotalPerformance)
        expect(assigns(:total_performance)).to be_persisted
      end

      it "redirects to the created total_performance" do
        post :create, {:total_performance => valid_attributes}, valid_session
        expect(response).to redirect_to(TotalPerformance.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved total_performance as @total_performance" do
        post :create, {:total_performance => invalid_attributes}, valid_session
        expect(assigns(:total_performance)).to be_a_new(TotalPerformance)
      end

      it "re-renders the 'new' template" do
        post :create, {:total_performance => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested total_performance" do
        total_performance = TotalPerformance.create! valid_attributes
        put :update, {:id => total_performance.to_param, :total_performance => new_attributes}, valid_session
        total_performance.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested total_performance as @total_performance" do
        total_performance = TotalPerformance.create! valid_attributes
        put :update, {:id => total_performance.to_param, :total_performance => valid_attributes}, valid_session
        expect(assigns(:total_performance)).to eq(total_performance)
      end

      it "redirects to the total_performance" do
        total_performance = TotalPerformance.create! valid_attributes
        put :update, {:id => total_performance.to_param, :total_performance => valid_attributes}, valid_session
        expect(response).to redirect_to(total_performance)
      end
    end

    describe "with invalid params" do
      it "assigns the total_performance as @total_performance" do
        total_performance = TotalPerformance.create! valid_attributes
        put :update, {:id => total_performance.to_param, :total_performance => invalid_attributes}, valid_session
        expect(assigns(:total_performance)).to eq(total_performance)
      end

      it "re-renders the 'edit' template" do
        total_performance = TotalPerformance.create! valid_attributes
        put :update, {:id => total_performance.to_param, :total_performance => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested total_performance" do
      total_performance = TotalPerformance.create! valid_attributes
      expect {
        delete :destroy, {:id => total_performance.to_param}, valid_session
      }.to change(TotalPerformance, :count).by(-1)
    end

    it "redirects to the total_performances list" do
      total_performance = TotalPerformance.create! valid_attributes
      delete :destroy, {:id => total_performance.to_param}, valid_session
      expect(response).to redirect_to(total_performances_url)
    end
  end

end