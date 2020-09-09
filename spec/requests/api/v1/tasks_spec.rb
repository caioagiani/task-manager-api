require 'rails_helper'

RSpec.describe 'Task API' do
  before { host! 'api.task-manager.test' }

  let!(:user) { create(:user) }
  let(:headers) do
    {
      'Content-Type' => Mime[:json].to_s,
      'Accept' => 'application/vnd.taskmanager.v1',
      'Authorization' => user.auth_token
    }
  end

  describe 'GET /api/tasks' do
    before do
      create_list(:task, 5, user_id: user.id)

      get '/api/tasks', params: {}, headers: headers
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns 5 tasks from database' do
      expect(json_body[:tasks].count).to eq(5)
    end
  end

  describe 'GET /api/tasks/:id' do
    let(:task) { create(:task, user_id: user.id) }

    before { get "/api/tasks/#{task.id}", params: {}, headers: headers }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns json for task' do
      expect(json_body[:title]).to eq(task.title)
    end
  end
end
