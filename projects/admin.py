from django.contrib import admin
from .models import (
    Project,
    Task,
    TaskComment,
    TaskAttachment,
    TaskActivity,
    ProjectFile,
    Milestone,
    TimeEntry,
    ProjectInvitation,
    ProjectActivity,
)

admin.site.register(Project)
admin.site.register(Task)
admin.site.register(TaskComment)
admin.site.register(TaskAttachment)
admin.site.register(TaskActivity)
admin.site.register(ProjectFile)
admin.site.register(Milestone)
admin.site.register(TimeEntry)
admin.site.register(ProjectInvitation)
admin.site.register(ProjectActivity)