# frozen_string_literal: true

module Api
  class ContainersController < ApplicationController
    before_action :set_container, only: %i[show update]
    before_action :guard_container, only: %i[update]

    def show
      render(json: @container)
    end

    def create
      container = Container.new(container_params)

      if container.valid?
        container.save
        render(json: container)
      else
        render_container_errors(container)
      end
    end

    def update
      @container.assign_attributes(container_params)

      if @container.valid?
        @container.save
        render(json: @container)
      else
        render_container_errors(@container)
      end
    end

    private

    def set_container
      @container = current_user.containers.find_by(id: params[:id])
      return if @container.present?

      render(status: :not_found, json: { error: 'Could not find Container' })
    end

    def guard_container
      return if @container.state == 'PENDING'

      render(status: :forbidden, json: { error: 'Cannot update a Container already loaded.' })
    end

    def render_container_errors(container)
      render(
        status: :unprocessable_entity,
        json: { error: container.errors.full_messages.to_sentence }
      )
    end

    def container_params
      permitted_params = params.permit(:type, :size, :state)
      permitted_params.merge(user: current_user)
    end
  end
end
