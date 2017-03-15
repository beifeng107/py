#coding:utf-8
import web

db_cn = web.database(dbn='mysql', user='root',pw='111111',db='myblog')
render = web.template.render('templates')

class subject(object):
    """docstring for subject"""
    def  GET(self):
        subjects = db_cn.select('subject_tb')
        return render.subject_add(subjects)

    def POST(self):
        data = web.input()
        newtitle = data.title
        db_cn.insert('subject_tb', title=newtitle)
        web.seeother("admin")

class question(object):
    """question page"""
    def GET(self):
        data = web.input()
        sid = data.sid
        return render.question_add()