require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#status_badge' do
    let(:base_classes) { "inline-block px-3 py-1 text-sm font-semibold rounded-full border" }

    context 'when status is "draft"' do
      it 'returns classes with yellow styling' do
        result = helper.status_badge('draft')
        expected_classes = "#{base_classes} bg-yellow-100 text-yellow-800 border-yellow-300"
        expect(result).to eq(expected_classes)
      end
    end

    context 'when status is "in_progress"' do
      it 'returns classes with blue styling' do
        result = helper.status_badge('in_progress')
        expected_classes = "#{base_classes} bg-blue-100 text-blue-800 border-blue-300"
        expect(result).to eq(expected_classes)
      end
    end

    context 'when status is "completed"' do
      it 'returns classes with green styling' do
        result = helper.status_badge('completed')
        expected_classes = "#{base_classes} bg-green-100 text-green-800 border-green-300"
        expect(result).to eq(expected_classes)
      end
    end

    context 'when status is invalid or nil' do
      it 'returns classes with gray styling for an unknown status' do
        result = helper.status_badge('random_status')
        expected_classes = "#{base_classes} bg-gray-100 text-gray-800 border-gray-300"
        expect(result).to eq(expected_classes)
      end

      it 'returns classes with gray styling for nil status' do
        result = helper.status_badge(nil)
        expected_classes = "#{base_classes} bg-gray-100 text-gray-800 border-gray-300"
        expect(result).to eq(expected_classes)
      end
    end
  end
end
