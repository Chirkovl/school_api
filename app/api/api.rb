# frozen_string_literal: true

require 'grape'
require 'grape-swagger'
require_relative '../services/auth_service'

class API < Grape::API
  format :json
  prefix :api
  version 'v1', using: :path

  get do
    { version: '1' }
  end

  resource :students do
    desc 'Регистрация нового студента'
    params do
      requires :student, type: Hash do
        requires :first_name
        requires :last_name
        requires :surname
        requires :klass_id
        requires :magic_school_id
      end
    end
    post do
      student = Student.new(params[:student])

      if student.save
        auth_token = AuthService.new.auth_token(student.id)

        header 'X-Auth-Token', auth_token
        status 201

        { student: student }
      else
        status 405
        { error: 'Invalid input' }
      end
    end

    route_param :user_id do
      desc 'Удалить студента'
      params do
        requires :bearer
      end
      delete do
        student = Student.find_by_id(params[:user_id])

        if student
          student_auth = StudentAuth.find_by(student_id: student.id, auth_token: params[:bearer])

          if student_auth
            student.destroy
            { message: 'Студент успешно удален' }
          else
            error!({ error: 'Некорректная авторизация' }, 401)
          end
        else
          error!({ error: 'Некорректный id студента' }, 400)
        end
      end
    end
  end

  resource :schools do
    route_param :magic_school_id do
      resource :classes do
        desc 'Вывести список студентов класса'
        params do
          requires :klass_id
        end
        get '/students' do
          klass = Klass.find_by_id(params[:klass_id])

          if klass
            students = Student.where(klass_id: klass.id)
            students
          else
            error!({ error: 'Некорректный id класса' }, 400)
          end
        end
      end

      desc 'Вывести список классов школы'
      get '/classes' do
        magic_school = MagicSchool.find_by_id(params[:magic_school_id])

        if magic_school
          classes = Klass.where(magic_school_id: magic_school.id)
          classes
        else
          error!({ error: 'Некорректный id школы' }, 400)
        end
      end
    end
  end

  add_swagger_documentation(
    info: {
      title: 'School API',
      version: '0.1.0'
    },
    tags: [
      { name: 'students', description: 'Что касается учеников' },
      { name: 'schools', description: 'Что касается классов' }
    ]
  )
end
