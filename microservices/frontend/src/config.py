class DevConfig:
    DEBUG = True
    # Add other development-specific settings

class ProdConfig:
    DEBUG = False
    # Add other production-specific settings
    
class TestConfig:
    DEBUG = True
    TESTING = True
    