#coding:utf-8
import web
import time
import json

db_cn = web.database(dbn='mysql', user='root',pw='111111',db='test')
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
        return render.question_add(sid)
    def POST(self):
        data = web.input()
        qtype = data.qtype
        sid = int(data.sid)
        descrip = data.description
        if qtype == 1:
            ranwser = data.Ranwser1
        else:
            ranwser = data.Ranwser0
        expl = data.explanation
        option = data.options if data.options != "" else "No option"
        
        qid = time.strftime("%Y%m%d%H%M%S",time.localtime())

        db_cn.insert('questions_tb',Id=qid,type=qtype,description=descrip,options=option,right_anwser=ranwser,explanation=expl)
        db_cn.insert('sq_r_tb',subject_id=sid,question_id=qid)

        web.seeother("admin")

class index(object):
    """index"""

    def GET(self):
        subjects = db_cn.select('subject_tb')
        return render.index(subjects)

class show(object):
    """  """
    def GET(self):
        data = web.input()
        sid = data.sid
        if not sid:
            return "无法加载。。。。"
        if not sid.isdigit():
            return "你的操作好像有点问题"
        
        sql = "select * from questions_tb where id in (select question_id from sq_r_tb where subject_id = "+sid+")"

        res = db_cn.query(sql)
        res_data={}
        res_data["count"] = len(res)
        res_data["data"] = []

        for item in res:
            temp = {}
            temp["type"] = str(item.type)
            temp["description"] = item.description
            temp["answer"] =  item.right_anwser
            temp["options"] = item.options
            temp["explanation"] = item.explanation

            res_data["data"].append(temp)
        
        res_data=json.dumps(res_data)
        return render.show(res_data)