class TeacherMailer < ApplicationMailer
  default from: 'notifications@student.com'

  def appreciate_email teacher
    @teacher = teacher
    mail(to: @teacher.email, subject: 'Appreciate your help')
  end
end
