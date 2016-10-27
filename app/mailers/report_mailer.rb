class ReportMailer < ApplicationMailer
  def send_report(report_ar, recipient)
    @report_ar = report_ar
    mail(
        from: SET['smtp']['smtp_email'],
        to: recipient,
        subject: "Report infromation"
    )
  end
end
