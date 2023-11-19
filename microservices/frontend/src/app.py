import os
from flask import Flask

app = Flask(__name__)

# Load configuration from environment variables
app.config['DEBUG'] = os.environ.get('FLASK_DEBUG', False)

@app.route('/')
def hello_world():
    return 'Hello, World! This image has been updated.'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)

