class Questions
  attr_accessor :answer, :first_num, :second_num
  def initialize
    @question1 = self.create_question
  end
  
  def create_question
    @first_num = rand(1...42)
    @second_num = rand(1...42)
    @answer = first_num + second_num
  end
end