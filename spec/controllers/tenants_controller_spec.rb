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

RSpec.describe TenantsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Tenant. As you add validations to Tenant, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    FactoryGirl.attributes_for(:tenant)
  end

  let(:invalid_attributes) do
    FactoryGirl.attributes_for(:tenant, :invalid)
  end

  before :each do
    @user = FactoryGirl.build :user
    User.stubs(:find).returns(@user)
    sign_in FactoryGirl.create(:user, :admin_user)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TenantsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all tenants as @tenants' do
      tenant = Tenant.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:tenants)).to eq([tenant])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested tenant as @tenant' do
      tenant = Tenant.create! valid_attributes
      get :show, { id: tenant.to_param }, valid_session
      expect(assigns(:tenant)).to eq(tenant)
    end
  end

  describe 'GET #new' do
    it 'assigns a new tenant as @tenant' do
      get :new, {}, valid_session
      expect(assigns(:tenant)).to be_a_new(Tenant)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested tenant as @tenant' do
      tenant = Tenant.create! valid_attributes
      get :edit, { id: tenant.to_param }, valid_session
      expect(assigns(:tenant)).to eq(tenant)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Tenant' do
        expect do
          post :create, { tenant: valid_attributes }, valid_session
        end.to change(Tenant, :count).by(1)
      end

      it 'assigns a newly created tenant as @tenant' do
        post :create, { tenant: valid_attributes }, valid_session
        expect(assigns(:tenant)).to be_a(Tenant)
        expect(assigns(:tenant)).to be_persisted
      end

      it 'redirects to the created tenant' do
        post :create, { tenant: valid_attributes }, valid_session
        expect(response).to redirect_to(Tenant.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved tenant as @tenant' do
        post :create, { tenant: invalid_attributes }, valid_session
        expect(assigns(:tenant)).to be_a_new(Tenant)
      end

      it "re-renders the 'new' template" do
        post :create, { tenant: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        FactoryGirl.attributes_for(:tenant, :new_tenant)
      end

      it 'updates the requested tenant' do
        tenant = Tenant.create! valid_attributes
        put :update, { id: tenant.to_param, tenant: new_attributes }, valid_session
        tenant.reload
        expect(tenant.nome).to eq(new_attributes[:nome])
      end

      it 'assigns the requested tenant as @tenant' do
        tenant = Tenant.create! valid_attributes
        put :update, { id: tenant.to_param, tenant: valid_attributes }, valid_session
        expect(assigns(:tenant)).to eq(tenant)
      end

      it 'redirects to the tenant' do
        tenant = Tenant.create! valid_attributes
        put :update, { id: tenant.to_param, tenant: valid_attributes }, valid_session
        expect(response).to redirect_to(tenant)
      end
    end

    context 'with invalid params' do
      it 'assigns the tenant as @tenant' do
        tenant = Tenant.create! valid_attributes
        put :update, { id: tenant.to_param, tenant: invalid_attributes }, valid_session
        expect(assigns(:tenant)).to eq(tenant)
      end

      it "re-renders the 'edit' template" do
        tenant = Tenant.create! valid_attributes
        put :update, { id: tenant.to_param, tenant: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested tenant' do
      tenant = Tenant.create! valid_attributes
      expect do
        delete :destroy, { id: tenant.to_param }, valid_session
      end.to change(Tenant, :count).by(-1)
    end

    it 'redirects to the tenants list' do
      tenant = Tenant.create! valid_attributes
      delete :destroy, { id: tenant.to_param }, valid_session
      expect(response).to redirect_to(tenants_url)
    end
  end
end
