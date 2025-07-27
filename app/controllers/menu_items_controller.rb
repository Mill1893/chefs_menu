class MenuItemsController < ApplicationController
before_action :authenticate_user!
before_action :set_menu_item, only: %i[ show edit update destroy ]

  # GET /menu_items or /menu_items.json
  def index
    @menu_items = MenuItem.all
    @add_to_daily_menu = params[:add_to_daily_menu]
    @daily_menu = DailyMenu.find_by(id: @add_to_daily_menu) if @add_to_daily_menu.present?
  end

  def add_to_daily_menu
    @daily_menu = DailyMenu.find(params[:daily_menu_id])
    @menu_item = MenuItem.find(params[:menu_item_id])
    # Copy menu item details into a new DailyMenuItem
    daily_menu_item = DailyMenuItem.create(
      name: @menu_item.name,
      description: @menu_item.description,
      category: @menu_item.category,
      daily_menu: @daily_menu
    )
    # Copy ingredients as plain text into the description (or extend model if needed)
    if @menu_item.ingredients.any?
      ingredient_list = @menu_item.ingredients.map { |i| "#{i.quantity} #{i.name}" }.join(", ")
      daily_menu_item.update(description: [daily_menu_item.description, "Ingredients: #{ingredient_list}"].compact.join("\n\n"))
    end
    redirect_to daily_menu_path(@daily_menu), notice: 'Menu item and its ingredients added to daily menu.'
  end

  # GET /menu_items/1 or /menu_items/1.json
  def show
  end

  # GET /menu_items/new
  def new
    @menu_item = MenuItem.new
  end

  # GET /menu_items/1/edit
  def edit
  end

  # POST /menu_items or /menu_items.json
  def create
    @menu_item = MenuItem.new(menu_item_params)

    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to @menu_item, notice: "Menu item was successfully created." }
        format.json { render :show, status: :created, location: @menu_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_items/1 or /menu_items/1.json
  def update
    respond_to do |format|
      if @menu_item.update(menu_item_params)
        format.html { redirect_to @menu_item, notice: "Menu item was successfully updated." }
        format.json { render :show, status: :ok, location: @menu_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_items/1 or /menu_items/1.json
  def destroy
    @menu_item.destroy!

    respond_to do |format|
      format.html { redirect_to menu_items_path, status: :see_other, notice: "Menu item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_item
      @menu_item = MenuItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_item_params
      params.require(:menu_item).permit(:name, :description, :category)
    end
end
