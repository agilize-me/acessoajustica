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

RSpec.describe EstagiariosController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Estagiario. As you add validations to Estagiario, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    FactoryGirl.attributes_for(:estagiario)
  end

  let(:invalid_attributes) do
    FactoryGirl.attributes_for(:estagiario, :estagiario_invalid)
  end

  let(:new_attributes) do
    FactoryGirl.attributes_for(:estagiario, :new_estagiario)
  end

  before :each do
      @user = FactoryGirl.build :user
      User.stubs(:find).returns(@user)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EstagiariosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all estagiarios as @estagiarios" do
      estagiario = Estagiario.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:estagiarios)).to eq([estagiario])
    end
  end

  describe "GET #show" do
    it "assigns the requested estagiario as @estagiario" do
      estagiario = Estagiario.create! valid_attributes
      get :show, {:id => estagiario.to_param}, valid_session
      expect(assigns(:estagiario)).to eq(estagiario)
    end
  end

  describe "GET #new" do
    it "assigns a new estagiario as @estagiario" do
      get :new, {}, valid_session
      expect(assigns(:estagiario)).to be_a_new(Estagiario)
    end
  end

  describe "GET #edit" do
    it "assigns the requested estagiario as @estagiario" do
      estagiario = Estagiario.create! valid_attributes
      get :edit, {:id => estagiario.to_param}, valid_session
      expect(assigns(:estagiario)).to eq(estagiario)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Estagiario" do
        expect {
          post :create, {:estagiario => valid_attributes}, valid_session
        }.to change(Estagiario, :count).by(1)
      end

      it "assigns a newly created estagiario as @estagiario" do
        post :create, {:estagiario => valid_attributes}, valid_session
        expect(assigns(:estagiario)).to be_a(Estagiario)
        expect(assigns(:estagiario)).to be_persisted
      end

      it "redirects to the created estagiario" do
        post :create, {:estagiario => valid_attributes}, valid_session
        expect(response).to redirect_to(Estagiario.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved estagiario as @estagiario" do
        post :create, {:estagiario => invalid_attributes}, valid_session
        expect(assigns(:estagiario)).to be_a_new(Estagiario)
      end

      it "re-renders the 'new' template" do
        post :create, {:estagiario => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do

      it "updates the requested estagiario" do
        estagiario = Estagiario.create! valid_attributes
        put :update, {:id => estagiario.to_param, :estagiario => new_attributes}, valid_session
        estagiario.reload
        expect(estagiario.nome).to eq(new_attributes[:nome])
      end

      it "assigns the requested estagiario as @estagiario" do
        estagiario = Estagiario.create! valid_attributes
        put :update, {:id => estagiario.to_param, :estagiario => valid_attributes}, valid_session
        expect(assigns(:estagiario)).to eq(estagiario)
      end

      it "redirects to the estagiario" do
        estagiario = Estagiario.create! valid_attributes
        put :update, {:id => estagiario.to_param, :estagiario => valid_attributes}, valid_session
        expect(response).to redirect_to(estagiario)
      end
    end

    context "with invalid params" do
      it "assigns the estagiario as @estagiario" do
        estagiario = Estagiario.create! valid_attributes
        put :update, {:id => estagiario.to_param, :estagiario => invalid_attributes}, valid_session
        expect(assigns(:estagiario)).to eq(estagiario)
      end

      it "re-renders the 'edit' template" do
        estagiario = Estagiario.create! valid_attributes
        put :update, {:id => estagiario.to_param, :estagiario => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested estagiario" do
      estagiario = Estagiario.create! valid_attributes
      expect {
        delete :destroy, {:id => estagiario.to_param}, valid_session
      }.to change(Estagiario, :count).by(-1)
    end

    it "redirects to the estagiarios list" do
      estagiario = Estagiario.create! valid_attributes
      delete :destroy, {:id => estagiario.to_param}, valid_session
      expect(response).to redirect_to(estagiarios_url)
    end
  end

end
