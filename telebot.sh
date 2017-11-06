#!/usr/bin/python
# -*- coding: utf-8 -*-

from telegram.ext import Updater, CommandHandler
import logging
import os
import random
import json
import requests

updater = Updater('TOKEN')
logging.basicConfig(level=logging.DEBUG,
                    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
                    )


def start(bot, update):
    update.message.reply_text('Hello World!')


def hello(bot, update):
    update.message.reply_text('Hello {}'.format(update.message.from_user.id))


def apps_stat(bot, update):
    msg = update.message.text.split()
    command = ''
    action = os.popen(command)
    action = action.read()
    update.message.reply_text(action)


def tomcat_stat(bot, update):
    msg = update.message.text.split()
    command = ''
    action = os.popen(command)
    action = action.read()
    update.message.reply_text(action)


def tomcat_restart(bot, update):
    msg = update.message.text.split()
    command = ''
    action = os.popen(command)
    action = action.read()
    update.message.reply_text(action)


def apps_restart(bot, update):
    msg = update.message.text.split()
    command = ''
    action = os.popen(command)
    action = action.read()
    update.message.reply_text(action)


def game(bot, update):
    update.message.reply_text(random.randint(1, 10))


def fun(bot, update):
    r = requests.get('https://developerslife.ru/random?json=true',
                     verify=False)
    r = json.loads(r.text)
    desc = r['description']
    gif = r['gifURL']
    fin = desc + ' ' + gif
    update.message.reply_text(fin)


updater.dispatcher.add_handler(CommandHandler('start', start))
updater.dispatcher.add_handler(CommandHandler('hello', hello))
updater.dispatcher.add_handler(CommandHandler('apps_stat', apps_stat))
updater.dispatcher.add_handler(CommandHandler('tomcat_stat',
                               tomcat_stat))
updater.dispatcher.add_handler(CommandHandler('tomcat_restart',
                               tomcat_restart))
updater.dispatcher.add_handler(CommandHandler('apps_restart',
                               apps_restart))
updater.dispatcher.add_handler(CommandHandler('game', game))
updater.dispatcher.add_handler(CommandHandler('fun', fun))

updater.start_polling()
updater.idle()

			