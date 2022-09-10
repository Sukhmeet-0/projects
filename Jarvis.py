import datetime
import pyttsx3
import pyaudio
import wikipedia
import speech_recognition as sr
import webbrowser
import os
import smtplib
import numpy as np

engine=pyttsx3.init('sapi5')
voices=engine.getProperty('voices')
engine.setProperty('voice',voices[0].id)

def speak(audio):
    engine.say(audio)
    engine.runAndWait()

def wishMe():
    hour=int(datetime.datetime.now().hour)
    if hour>=0 and hour<12:
        speak("Good Morning!")
    elif hour>=12 and hour <18:
        speak("Good Afternoon!")
    else:
        speak("Good Evening!")

    speak("I am Sukhmeet 2.0 sir . How can i help you?")

def takeCommand():
    r=sr.Recognizer()
    with sr.Microphone() as source:
        print("Listening...")
        r.pause_threshold=1
        r.energy_threshold=200
        audio=r.listen(source)

    try:
        print("Recognizing...")
        query=r.recognize_google(audio,language='en-in')
        print(f"user said: {query}\n ")
    except Exception as e:
        # print(e)
        print("Say that again please...")
        return "None"
    return query

# def sendEmail(to,content):
#     server=smtplib.SMTP('smtp.gmail.com',587)
#     server.ehlo()
#     server.starttls()
#     server.login('sukhmeets111@gmail.com','password')
#     server.sendmail('yourself@gmail.com',to,content)
#     server.close()



if __name__=="__main__":
    # while(True):
    wishMe()
    while True:
        query=takeCommand().lower()

        if 'wikipedia' in query:
            speak('Searching wikipedia...')
            query=query.replace("wikipedia","")
            results=wikipedia.summary(query,sentences=2)
            speak("According to wikipedia")
            print(results)
            speak(results)
        elif 'open youtube' in query:
            webbrowser.open("youtube.com")
        elif 'open google' in query:
            webbrowser.open("google.com")
        elif 'open stackoverflow' in query:
            webbrowser.open("stackoverflow.com")
        elif 'open javatpoint' in query:
            webbrowser.open("javatpoint.com")
        elif 'play music' in query:
            music_dir=''
            songs=os.listdir(music_dir)
            print(songs)
            i=np.random.randint(0,songs-1)
            os.startfile(os.path.join(music_dir,songs[i]))
        elif 'current time ' in query:
            time=datetime.datetime.now().strftime("%H:%M:%S")
            speak(f"The time is {time}\n")
        elif 'open vs code' in query:
            vsPath="C:\\Users\\sukhm\\AppData\\Local\\Programs\\Microsoft VS Code\\Code.exe"
            os.startfile(vsPath)
        # elif 'email to harmeet' in query:
        #     try:
        #         speak("What should i say?")
        #         content=takeCommand()
        #         to='h4rmeet@gmail.com'
        #         sendEmail(to,content)
        #         speak("Email has been sent!")
        #     except Exception as e:
        #         speak("Sorry sending email failed!")
        elif 'quit program' in query:
            speak('quiting program. Thanks fo your time')
            break