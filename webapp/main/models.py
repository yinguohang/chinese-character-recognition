from django.db import models

class User(models.Model):
    username = models.CharField(max_length=30, unique=True)
    status = models.TextField()

    @classmethod
    def create(cls, username):
        user = cls(username = username, status="[]")
        return user

