class UsersController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    
    def index
        @userList = User.all
    end
    
    def show
    end
    
    def new
        @user = User.new 
    end
    
    def edit
        if session[:id]        
        end
    end

    def create
        
        @user = User.new(user_params)
        
        respond_to do |format|
            if @user.save
                format.html { redirect_to @user, notice: 'New User Created!' }
                format.json { render :show, status: :created, location: @user }
            else
                format.html { render :new }
                format.json { render json: @user.errors, status: :unprocessable_entity }                
            end
        end
    end
    
    def update
        respond_to do |format|
            if @user.update(user_params)
                format.html { redirect_to @user, notice: 'User Updated!' }
                format.json { render :show, status: :created, location: @user }
            else
                format.html { render :new }
                format.json { render json: @user.errors, status: :unprocessable_entity }                
            end
        end
    end
    
    def destroy
        
        @user.destroy

        respond_to do |format|
            format.html { redirect_to users_url, notice: 'User Deleted!' }
            format.json { head :ok }
        end
    end    
        
    private
    
    def user_params
        params.require(:user).permit(:name, :email)
    end    
    
    def set_user
        @user = User.find(params[:id])
    end
    
end
