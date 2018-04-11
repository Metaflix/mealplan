"""
Flask Documentation:     http://flask.pocoo.org/docs/
Jinja2 Documentation:    http://jinja.pocoo.org/2/documentation/
Werkzeug Documentation:  http://werkzeug.pocoo.org/documentation/
This file creates your application.
"""

from app import app
from flask import render_template, request, redirect, url_for
from app.ContactForm import ContactForm
import smtplib

###
# Routing for your application.
###

@app.route('/')
def home():
    """Render website's home page."""
    return render_template('home.html')


@app.route('/about/')
def about():
    """Render the website's about page."""
    return render_template('about.html', name="Mary Jane")
    
@app.route('/contact', methods=['GET', 'POST'])
def contact():
    form = ContactForm()
    if request.method == 'POST':
        message = """From: {} <{}>
        To: {} <{}>
        Subject: {}
        {}"""
        fromname = form.Name.data
        fromaddr = form.Email.data
        subject = form.Subject.data
        msg = form.Message.data
        toname = 'Roxy Reid'
        toaddr = 'leonardo.a.grant@gmail.com'
        messagetosend = message.format(
            fromname, fromaddr, toname, toaddr, subject, msg)
        server = smtplib.SMTP('smtp.gmail.com:587')
        server.starttls()
        server.login('therox116@gmail.com', 'owoodmbxqpdjfihs')
        server.sendmail(fromaddr, toaddr, messagetosend)
        server.quit()
        return render_template('ContactForm.html', form=form)
    else:
        return render_template('ContactForm.html', form=form)
    
    return render_template('contact.html', name= "Contact Us")


###
# The functions below should be applicable to all Flask apps.
###

@app.route('/<file_name>.txt')
def send_text_file(file_name):
    """Send your static text file."""
    file_dot_text = file_name + '.txt'
    return app.send_static_file(file_dot_text)


@app.after_request
def add_header(response):
    """
    Add headers to both force latest IE rendering engine or Chrome Frame,
    and also to cache the rendered page for 10 minutes.
    """
    response.headers['X-UA-Compatible'] = 'IE=Edge,chrome=1'
    response.headers['Cache-Control'] = 'public, max-age=600'
    return response


@app.errorhandler(404)
def page_not_found(error):
    """Custom 404 page."""
    return render_template('404.html'), 404
    



if __name__ == "__main__":
    app.run(debug=True,host="0.0.0.0",port="8080")