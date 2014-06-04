class UsersController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    def index
        
        @userList = User.all
        
    end
    
    def show
        
        @user = User.find(params[:id])
        
    end
    
    def new
        
        @user = User.new
        
    end
    
    def user_params
        
        params.require(:user).permit(:name, :email)
        
    end
    
    def create
        
        @user = User.new(user_params)
        
        respond_to do |format|
           
            if @user.save
                
                format.html { redirect_to @user, notice: 'New User Created' }
                format.json { render :show, status: :created, location: @user }
                
            else
                
                format.html { render :new }
                format.json { render json: @user.errors, status: :unprocessable_entity }                
            end
            
        end
        
    end    
    
end
