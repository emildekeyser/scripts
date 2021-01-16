import mailbox
import time
import calendar

now = calendar.timegm(time.gmtime())
six_months = 6 * 30 * 24 * 60

print(now)

for mail in mailbox.Maildir("~/.local/share/mail/school/INBOX"):
    date = mail.get_date()
    if date < now - six_months:
        print('EMAIL ARCHIVED:', date, mail['date'], mail['subject'])
    else:
        print('EMAIL KEPT:', date, mail['date'], mail['subject'])

