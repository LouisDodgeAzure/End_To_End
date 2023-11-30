import os
from flask import Flask
from config import DevConfig, ProdConfig, TestConfig

def init_app():
    """Initialize the core application."""
    app = Flask(__name__, instance_relative_config=False)
    
    # Choose the configuration class based on an environment variable
    env = os.getenv('FLASK_ENV')
    if env == 'dev':
        app.config.from_object(DevConfig)
    elif env == 'test':
        app.config.from_object(TestConfig)
    else:
        app.config.from_object(ProdConfig)
    
    # Import and register routes, blueprints, etc.
    with app.app_context():
        from . import routes
        return app
