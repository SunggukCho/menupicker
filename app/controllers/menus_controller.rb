class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def today
    @menu_list=["들름집","하나우동","염소탕","명동칼국수","고레카레","전주감자탕","버거킹","롯데리아","맥도날드",
    "대독장(김치찌개)","SNOWFOX","계란김밥","우들목","그냥 대충 암거나 먹어 이ㅅㄲ야","한성돈가스","MOS버거","길 건너 샐러드","길 건너 떡볶이","청국장과 보리밥","버드나무집","토봉 추어탕집",
    "유타로 라멘(시로,쿠로)","듬북담북 뱅뱅점(바지락,비빔밥,떡갈비)","참설농탕","바로 옆 중국집","김가네","그냥 네네치킨이나 먹어라","우리도 족황상제 ㄱㄱ?"]
    @random_pick=@menu_list.sample
  end
  
  def index
    @menus = Menu.all

  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:title, :content)
    end
end
