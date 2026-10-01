from django import forms
from .models import (
    Project,
    Task,
    TaskComment,
    TaskAttachment,
    TimeEntry,
)


class ProjectForm(forms.ModelForm):

    class Meta:
        model = Project

        fields = [
            'name',
            'description',
            'status',
            'priority',
            'start_date',
            'end_date',
            'budget',
            'progress',
            'team_members',
        ]

        widgets = {
            'name': forms.TextInput(
                attrs={'class': 'form-control'}
            ),

            'description': forms.Textarea(
                attrs={
                    'class': 'form-control',
                    'rows': 4
                }
            ),

            'status': forms.Select(
                attrs={'class': 'form-select'}
            ),

            'priority': forms.Select(
                attrs={'class': 'form-select'}
            ),

            'start_date': forms.DateInput(
                attrs={
                    'class': 'form-control',
                    'type': 'date'
                }
            ),

            'end_date': forms.DateInput(
                attrs={
                    'class': 'form-control',
                    'type': 'date'
                }
            ),

            'budget': forms.NumberInput(
                attrs={'class': 'form-control'}
            ),

            'progress': forms.NumberInput(
                attrs={
                    'class': 'form-control',
                    'min': 0,
                    'max': 100
                }
            ),

            'team_members': forms.SelectMultiple(
                attrs={'class': 'form-select'}
            ),
        }


class TaskForm(forms.ModelForm):

    class Meta:
        model = Task

        fields = [
            'project',
            'title',
            'description',
            'assigned_to',
            'status',
            'priority',
            'due_date',
            'estimated_hours',
            'actual_hours',
        ]

        widgets = {
            'project': forms.Select(
                attrs={'class': 'form-select'}
            ),

            'title': forms.TextInput(
                attrs={'class': 'form-control'}
            ),

            'description': forms.Textarea(
                attrs={
                    'class': 'form-control',
                    'rows': 4
                }
            ),

            'assigned_to': forms.Select(
                attrs={'class': 'form-select'}
            ),

            'status': forms.Select(
                attrs={'class': 'form-select'}
            ),

            'priority': forms.Select(
                attrs={'class': 'form-select'}
            ),

            'due_date': forms.DateInput(
                attrs={
                    'class': 'form-control',
                    'type': 'date'
                }
            ),

            'estimated_hours': forms.NumberInput(
                attrs={
                    'class': 'form-control',
                    'step': '0.5',
                    'min': '0'
                }
            ),

            'actual_hours': forms.NumberInput(
                attrs={
                    'class': 'form-control',
                    'step': '0.5',
                    'min': '0'
                }
            ),
        }


class TaskCommentForm(forms.ModelForm):

    class Meta:
        model = TaskComment

        fields = [
            'content'
        ]

        widgets = {
            'content': forms.Textarea(
                attrs={
                    'class': 'form-control',
                    'rows': 3,
                    'placeholder': (
                        'Write a comment... '
                        'Use @username to mention a team member.'
                    )
                }
            ),
        }


class TaskAttachmentForm(forms.ModelForm):

    class Meta:
        model = TaskAttachment

        fields = [
            'file',
            'description'
        ]

        widgets = {
            'file': forms.ClearableFileInput(
                attrs={
                    'class': 'form-control'
                }
            ),

            'description': forms.TextInput(
                attrs={
                    'class': 'form-control',
                    'placeholder': 'File description'
                }
            ),
        }


class TimeEntryForm(forms.ModelForm):

    class Meta:
        model = TimeEntry

        fields = [
            'task',
            'hours',
            'date',
            'description',
        ]

        widgets = {
            'task': forms.Select(
                attrs={
                    'class': 'form-select'
                }
            ),

            'hours': forms.NumberInput(
                attrs={
                    'class': 'form-control',
                    'step': '0.5',
                    'min': '0.5',
                    'placeholder': 'Enter hours'
                }
            ),

            'date': forms.DateInput(
                attrs={
                    'class': 'form-control',
                    'type': 'date'
                }
            ),

            'description': forms.Textarea(
                attrs={
                    'class': 'form-control',
                    'rows': 3,
                    'placeholder': 'Describe the work completed'
                }
            ),
        }