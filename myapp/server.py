import tornado.ioloop
import tornado.web
import pymysql

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        title = "Hello, world"
        bgcolor = "darkred"
        self.render("template.hmtl", title=title, bgcolor=bgcolor)
        print(self.request)

class ProbeHandler(tornado.web.RequestHandler):
    def get(self):
        try:
            db = pymswl.connect('localhost', 'app', 'password', 'app')
            cursor = db.cursor()
            cursor.execute("SELECT VERSION()")
            result = cursos.fetchone()
            title = "OK - DB VERSION: %s" % result
            bgcolor = "limegreen"
            self.set_status(200)
        except pymysql.Error as e:
            title = "NOT OK - %s" % e
            bgcolor = "darkred"
            self.set_status(503)
        self.render("template.hmtl", title=title, bgcolor=bgcolor)

def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
        (r"/isalive", ProbeHandler),
    ])

if __name__ == "__main__":
    app = make_app()
    app.listen(8888)
    tornado.ioloop.IOLoop.current().start()