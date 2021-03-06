import time

from telethon import TelegramClient, events
from datetime import date

# sample API_ID from https://github.com/telegramdesktop/tdesktop/blob/f98fdeab3fb2ba6f55daf8481595f879729d1b84/Telegram/SourceFiles/config.h#L220
# or use your own
api_id = $API_ID
api_hash = '$API_HASH'

# fill in your own details here
phone = '$NUMBER'
session_file = '/session_file/$NUMBER'  # use your username if unsure
password = '$PASSWORD'  # if you have two-step verification enabled

# content of the automatic reply
message = """
ا تشکر از پیام شما 

لطفا در نظر داشته باشید ساعات کاری مدیر حساب شما از دوشنبه الی جمعه، 9:30 الی 18:30 به وقت ایران می باشد.

در صورتی که درخواست شما نیاز به رسیدگی فوری دارد، لطفا با بخش پشتیبانی مشتریان ما که به صورت 24 ساعته و در هفت روز هفته، از طریق چت زنده وب سایت (www.capitalxtend.com )  آماده ارائه پاسخ به سوالات شما عزیزان می باشند ارتباط برقرار کنید.

موفق و پیروز باشید

Thank you  for contacting us. 

We are kindly informing you that the Account Service Managers are available between Monday and Friday from 9.30am to 6.30pm (GMT +4.30).

Should your inquiry be urgent, please note that our Live Chat Customer Support team is available 24/7 on our Website (www.capitalxtend.com ) to assist you.

Kind Regards"""

if __name__ == '__main__':
    # Create the client and connect
    # use sequential_updates=True to respond to messages one at a time
    client = TelegramClient(session_file, api_id, api_hash, sequential_updates=True)


    @client.on(events.NewMessage(incoming=True))
    async def handle_new_message(event):
        if event.is_private:  # only auto-reply to private chats
            from_ = await event.client.get_entity(event.from_id)  # this lookup will be cached by telethon
            if not from_.bot:  # don't auto-reply to bots
                print(time.asctime(), '-', event.message)  # optionally log time and message
                time.sleep(1)  # pause for 1 second to rate-limit automatic replies
                await event.respond(message)


    print(time.asctime(), '-', 'Auto-replying...')
    client.start(phone, password)
    client.run_until_disconnected()
    print(time.asctime(), '-', 'Stopped!')
