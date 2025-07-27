class DailyMenuItemsController < ApplicationController
before_action :authenticate_user!
before_action :set_daily_menu_item, only: %i[ show edit update destroy ]

  # GET /daily_menu_items or /daily_menu_items.json
  def index
    @daily_menu_items = DailyMenuItem.all
  end

  # GET /daily_menu_items/1 or /daily_menu_items/1.json
  def show
  end

  # GET /daily_menu_items/new
  def new
    @daily_menu_item = DailyMenuItem.new
  end

  # GET /daily_menu_items/1/edit
  def edit
  end

  # POST /daily_menu_items or /daily_menu_items.json
  def create
    @daily_menu_item = DailyMenuItem.new(daily_menu_item_params)

    respond_to do |format|
      if @daily_menu_item.save
        format.html { redirect_to @daily_menu_item, notice: "Daily menu item was successfully created." }
        format.json { render :show, status: :created, location: @daily_menu_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @daily_menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_menu_items/1 or /daily_menu_items/1.json
  def update
    respond_to do |format|
      if @daily_menu_item.update(daily_menu_item_params)
        format.html { redirect_to @daily_menu_item, notice: "Daily menu item was successfully updated." }
        format.json { render :show, status: :ok, location: @daily_menu_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @daily_menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_menu_items/1 or /daily_menu_items/1.json
  def destroy
    @daily_menu_item.destroy!

    respond_to do |format|
      format.html { redirect_to daily_menu_items_path, status: :see_other, notice: "Daily menu item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_menu_item
      @daily_menu_item = DailyMenuItem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def daily_menu_item_params
      params.expect(daily_menu_item: [ :name, :description, :category, :daily_menu_id ])
    end
end
