from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone


# Project Model
class Project(models.Model):
    STATUS_CHOICES = [
        ('planning', 'Planning'),
        ('in_progress', 'In Progress'),
        ('review', 'Review'),
        ('completed', 'Completed'),
        ('on_hold', 'On Hold'),
        ('cancelled', 'Cancelled'),
    ]

    PRIORITY_CHOICES = [
        ('low', 'Low'),
        ('medium', 'Medium'),
        ('high', 'High'),
        ('urgent', 'Urgent'),
    ]

    name = models.CharField(max_length=200)
    description = models.TextField()
    status = models.CharField(
        max_length=20,
        choices=STATUS_CHOICES,
        default='planning'
    )
    priority = models.CharField(
        max_length=20,
        choices=PRIORITY_CHOICES,
        default='medium'
    )
    start_date = models.DateField()
    end_date = models.DateField()
    budget = models.DecimalField(
        max_digits=12,
        decimal_places=2,
        default=0
    )
    progress = models.IntegerField(default=0)
    created_by = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='created_projects'
    )
    team_members = models.ManyToManyField(
        User,
        related_name='projects'
    )
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['-created_at']


# Task Model
class Task(models.Model):
    STATUS_CHOICES = [
        ('todo', 'To Do'),
        ('in_progress', 'In Progress'),
        ('review', 'Review'),
        ('done', 'Done'),
    ]

    PRIORITY_CHOICES = [
        ('low', 'Low'),
        ('medium', 'Medium'),
        ('high', 'High'),
        ('urgent', 'Urgent'),
    ]

    project = models.ForeignKey(
        Project,
        on_delete=models.CASCADE,
        related_name='tasks'
    )
    title = models.CharField(max_length=200)
    description = models.TextField(blank=True)
    assigned_to = models.ForeignKey(
        User,
        on_delete=models.SET_NULL,
        null=True,
        related_name='assigned_tasks'
    )
    status = models.CharField(
        max_length=20,
        choices=STATUS_CHOICES,
        default='todo'
    )
    priority = models.CharField(
        max_length=20,
        choices=PRIORITY_CHOICES,
        default='medium'
    )
    due_date = models.DateField()
    estimated_hours = models.FloatField(default=0)
    actual_hours = models.FloatField(default=0)
    created_by = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='created_tasks'
    )
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    completed_at = models.DateTimeField(
        null=True,
        blank=True
    )

    def __str__(self):
        return self.title

    class Meta:
        ordering = ['-created_at']


# Task Comment Model
class TaskComment(models.Model):
    task = models.ForeignKey(
        Task,
        on_delete=models.CASCADE,
        related_name='comments'
    )
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE
    )
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['created_at']


# Task Attachment Model
class TaskAttachment(models.Model):
    task = models.ForeignKey(
        Task,
        on_delete=models.CASCADE,
        related_name='attachments'
    )
    file = models.FileField(
        upload_to='task_attachments/'
    )
    uploaded_by = models.ForeignKey(
        User,
        on_delete=models.CASCADE
    )
    description = models.CharField(
        max_length=200,
        blank=True
    )
    uploaded_at = models.DateTimeField(
        auto_now_add=True
    )


# Task Activity Model
class TaskActivity(models.Model):
    task = models.ForeignKey(
        Task,
        on_delete=models.CASCADE,
        related_name='activities'
    )
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE
    )
    action = models.CharField(max_length=100)
    details = models.TextField(blank=True)
    created_at = models.DateTimeField(
        auto_now_add=True
    )

    class Meta:
        ordering = ['-created_at']


# Project File Model
class ProjectFile(models.Model):
    project = models.ForeignKey(
        Project,
        on_delete=models.CASCADE,
        related_name='files'
    )
    name = models.CharField(max_length=200)
    file = models.FileField(
        upload_to='project_files/'
    )
    uploaded_by = models.ForeignKey(
        User,
        on_delete=models.CASCADE
    )
    description = models.TextField(blank=True)
    uploaded_at = models.DateTimeField(
        auto_now_add=True
    )
    updated_at = models.DateTimeField(
        auto_now=True
    )


# Milestone Model
class Milestone(models.Model):
    project = models.ForeignKey(
        Project,
        on_delete=models.CASCADE,
        related_name='milestones'
    )
    name = models.CharField(max_length=200)
    description = models.TextField(blank=True)
    due_date = models.DateField()
    is_completed = models.BooleanField(default=False)
    completed_at = models.DateTimeField(
        null=True,
        blank=True
    )
    created_at = models.DateTimeField(
        auto_now_add=True
    )
    updated_at = models.DateTimeField(
        auto_now=True
    )

    class Meta:
        ordering = ['due_date']


# Time Entry Model
class TimeEntry(models.Model):
    task = models.ForeignKey(
        Task,
        on_delete=models.CASCADE,
        related_name='time_entries'
    )
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE
    )
    hours = models.FloatField()
    date = models.DateField()
    description = models.TextField(blank=True)
    created_at = models.DateTimeField(
        auto_now_add=True
    )

    class Meta:
        ordering = ['-date']


# Project Invitation Model
class ProjectInvitation(models.Model):
    project = models.ForeignKey(
        Project,
        on_delete=models.CASCADE,
        related_name='invitations'
    )
    email = models.EmailField()
    invited_by = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='sent_invitations'
    )
    invited_at = models.DateTimeField(
        auto_now_add=True
    )
    accepted_at = models.DateTimeField(
        null=True,
        blank=True
    )
    token = models.CharField(
        max_length=100,
        unique=True
    )
    is_accepted = models.BooleanField(
        default=False
    )

    def __str__(self):
        return f"{self.project.name} - {self.email}"


# Project Activity Model
class ProjectActivity(models.Model):
    project = models.ForeignKey(
        Project,
        on_delete=models.CASCADE,
        related_name='activities'
    )
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE
    )
    action = models.CharField(max_length=100)
    details = models.TextField(blank=True)
    created_at = models.DateTimeField(
        auto_now_add=True
    )

    class Meta:
        ordering = ['-created_at']