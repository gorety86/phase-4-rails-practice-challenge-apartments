class TenantsController < ApplicationController
    def index
        render json: Tenant.all
    end

    def show
        tenant = find_tenant
        render json: tenant
    end

    def create
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :created
    end

    def update
        tenant = find_tenant
        tenant.update!(tenant_params)
        render json: tenant, status: :ok
    end

    def destroy
        tenant = find_tenant
        tenant.destroy!
        render json: { message: 'Tenant deleted' }, status: :no_content
    end

    private

    def find_tenant
        Tenant.find(params[:id])
    end

    def render_record_not_found_responce
        render json: { error: 'Tenant not found' }, status: :not_found
    end

    def tenant_params
        params.permit(:name, :age)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
