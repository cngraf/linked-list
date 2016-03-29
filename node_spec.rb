require_relative './node'

describe 'Node' do
  subject(:lone_node) { Node.new(1) }
  subject(:list_of_two) { Node.new(2, lone_node) }

  context 'at the bare minimum' do
    it 'can instantiate' do
      expect(!!lone_node).to be true
    end

    it 'responds to #length' do
      expect(lone_node.respond_to?(:length)).to be true
    end

    it 'requires a value' do
      expect{Node.new}.to raise_error ArgumentError
    end

    it 'requires the tail to be a node or nil' do
      expect{Node.new(1, 2)}.to raise_error ArgumentError
      expect{lone_node}.not_to raise_error
      expect{list_of_two}.not_to raise_error
    end

    it 'responds to #length' do
      expect(lone_node.respond_to?(:length)).to be true
    end

    it 'responds to #prepend' do
      expect(lone_node.respond_to?(:prepend)).to be true
    end

    it 'responds to #append' do
      expect(lone_node.respond_to?(:append)).to be true
    end

    it 'responds to #behead!' do
      expect(lone_node.respond_to?(:behead!)).to be true
    end

    it 'responds to #betail!' do
      expect(lone_node.respond_to?(:betail!)).to be true
    end

    it 'responds to #bleurgh' do
      expect(lone_node.respond_to?(:bleeeurgh)).to be true
    end

  end

  context '#length' do
    it 'works' do
      expect(lone_node.length).to eq 1
      expect(list_of_two.length).to eq 2
    end
  end

  context '#prepend' do
    it 'works' do
      new_list = lone_node.prepend('apple')
      expect(new_list.value).to eq 'apple'
      expect(new_list.reference).to eq lone_node
    end
  end

  context '#append' do
    it 'works' do
      new_list = lone_node.append('zebra')
      expect(new_list.value).to eq lone_node.value
      expect(new_list.reference.value).to eq 'zebra'
      expect(new_list.reference.reference).to be nil
    end
  end
end
