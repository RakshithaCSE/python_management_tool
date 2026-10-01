from django.test import TestCase
from django.contrib.auth.models import User
from django.urls import reverse
from datetime import date

from .models import Project, Task


class ProjectModelTest(TestCase):

    def setUp(self):
        self.user = User.objects.create_user(
            username='testuser',
            password='testpassword'
        )

        self.project = Project.objects.create(
            name='Test Project',
            description='Test project description',
            status='planning',
            priority='medium',
            start_date=date(2026, 1, 1),
            end_date=date(2026, 12, 31),
            budget=10000,
            progress=50,
            created_by=self.user
        )

    def test_project_creation(self):
        self.assertEqual(
            self.project.name,
            'Test Project'
        )

    def test_project_status(self):
        self.assertEqual(
            self.project.status,
            'planning'
        )


class TaskModelTest(TestCase):

    def setUp(self):
        self.user = User.objects.create_user(
            username='taskuser',
            password='testpassword'
        )

        self.project = Project.objects.create(
            name='Task Project',
            description='Task project description',
            status='planning',
            priority='medium',
            start_date=date(2026, 1, 1),
            end_date=date(2026, 12, 31),
            created_by=self.user
        )

        self.task = Task.objects.create(
            project=self.project,
            title='Test Task',
            description='Test task description',
            assigned_to=self.user,
            status='todo',
            priority='high',
            due_date=date(2026, 12, 31),
            estimated_hours=5,
            actual_hours=0,
            created_by=self.user
        )

    def test_task_creation(self):
        self.assertEqual(
            self.task.title,
            'Test Task'
        )

    def test_task_status(self):
        self.assertEqual(
            self.task.status,
            'todo'
        )


class ViewTest(TestCase):

    def setUp(self):
        self.user = User.objects.create_user(
            username='viewuser',
            password='testpassword'
        )

        self.project = Project.objects.create(
            name='View Test Project',
            description='View test project',
            status='planning',
            priority='medium',
            start_date=date(2026, 1, 1),
            end_date=date(2026, 12, 31),
            created_by=self.user
        )

    def test_project_list_view(self):
        response = self.client.get(
            reverse('project-list')
        )

        self.assertEqual(
            response.status_code,
            200
        )

    def test_task_list_view(self):
        response = self.client.get(
            reverse('task-list')
        )

        self.assertEqual(
            response.status_code,
            200
        )

    def test_kanban_view(self):
        response = self.client.get(
            reverse('kanban-board')
        )

        self.assertEqual(
            response.status_code,
            200
        )

    def test_report_view(self):
        response = self.client.get(
            reverse('project-report')
        )

        self.assertEqual(
            response.status_code,
            200
        )

    def test_analytics_view(self):
        response = self.client.get(
            reverse('analytics-dashboard')
        )

        self.assertEqual(
            response.status_code,
            200
        )