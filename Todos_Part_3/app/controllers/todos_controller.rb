class TodosController < ApplicationController

    def show
        render json: Todo.find(params[:id])
    end

    def index
        # unless params[:todo]
            todos = Todo.all
            render json: todos
        # else
        #     todo = Todo.find_by(title: params[:title])
        #     if todo.nil?
        #         render json: "todo not found"
        #     else
        #         render json: todo
        #     end
        # end

    end

    def create

        @todo = Todo.new(todo_params)
        if @todo.save
          render json: @todo
        else
          render json: @todo.errors.full_messages, status: 422
        end
    end

    def update
        todo = Todo.find(params[:id])
        if todo.update(todo_params)
           redirect_to todo_url(todo)
        else
           render json: todo.errors.full_messages, status: :unprocessable_entity # rails method, same as 422
        end
    end

    def destroy
        todos = Todo.find(params[:id])        
        todos.destroy
        redirect_to todos_url
    end

    private

    def todo_params
        params.require(:todo).permit(:title, :body, :done)
    end

end
