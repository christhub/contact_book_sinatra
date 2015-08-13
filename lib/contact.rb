class Contact
  attr_reader(:first_name, :last_name, :job_title, :company, :phones)

  define_method(:initialize) do |attributes|
    @first_name  = attributes.fetch(:first_name)
    @last_name   = attributes.fetch(:last_name)
    @job_title   = attributes.fetch(:job_title)
    @company     = attributes.fetch(:company)
    @phones      = []
  end

end
