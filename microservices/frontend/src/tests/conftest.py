import pytest
from application import init_app
from config import TestConfig

@pytest.fixture(scope='module')
def app():
    """Create and configure a new app instance for each test module."""
    app = init_app()
    app.config.from_object(TestConfig)  # Ensure TestConfig has the necessary settings for testing
    with app.app_context():
        yield app  # Yield the app context for testing

@pytest.fixture(scope='module')
def client(app):
    """A test client for the app."""
    return app.test_client()
