import os
from flask import Flask
from config import DevConfig, ProdConfig

def init_app():
    """Initialize the core application."""
    app = Flask(__name__, instance_relative_config=False)
    
    # Choose the configuration class based on an environment variable
    if os.getenv('FLASK_ENV') == 'prod':
        app.config.from_object(ProdConfig)
    else:
        app.config.from_object(DevConfig)

    with app.app_context():
        # Import and register your routes, blueprints, etc.
        from . import routes

        return app
