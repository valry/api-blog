class ReportAllWorker
  include Sidekiq::Worker
  def perform(parameters)
    sort_ar = {}
    @report_ar = []
    User.all.each do |user|
      sort_ar[user.id] = user.posts.date_range(parameters['start_date'], parameters['end_date']).count + user.comments.date_range(parameters['start_date'], parameters['end_date']).count/10
    end
    sort_ar = sort_ar.sort_by{ |k,v| v }.reverse.to_h
    sort_ar.each do |id,v|
      user = User.find(id)
      @report_ar << [user.nickname,
                     user.email,
                     user.posts.date_range(parameters['start_date'], parameters['end_date']).count,
                     user.comments.date_range(parameters['start_date'], parameters['end_date']).count]
    end

    recipient = parameters['recipient_email']
    ReportMailer.send_report(@report_ar, recipient).deliver_now
  end
end
