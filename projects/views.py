from django.shortcuts import render, get_object_or_404, redirect
from django.http import JsonResponse
from django.db.models import Count, Q
from django.contrib.auth.models import User
import re

from .models import (
    Project,
    Task,
    TaskActivity,
    TimeEntry,
)

from .forms import (
    ProjectForm,
    TaskForm,
    TaskCommentForm,
    TaskAttachmentForm,
    TimeEntryForm,
)


# =========================================================
# PROJECT MANAGEMENT
# =========================================================

def project_list(request):
    projects = Project.objects.all()

    return render(
        request,
        'projects/project_list.html',
        {
            'projects': projects
        }
    )


def project_detail(request, pk):
    project = get_object_or_404(Project, pk=pk)
    tasks = project.tasks.all()

    return render(
        request,
        'projects/project_detail.html',
        {
            'project': project,
            'tasks': tasks
        }
    )


def project_create(request):

    if request.method == 'POST':

        form = ProjectForm(request.POST)

        if form.is_valid():

            project = form.save(commit=False)
            project.created_by = request.user
            project.save()
            form.save_m2m()

            return redirect('project-list')

    else:
        form = ProjectForm()

    return render(
        request,
        'projects/project_form.html',
        {
            'form': form
        }
    )


def project_update(request, pk):

    project = get_object_or_404(Project, pk=pk)

    if request.method == 'POST':

        form = ProjectForm(
            request.POST,
            instance=project
        )

        if form.is_valid():

            form.save()

            return redirect(
                'project-detail',
                pk=project.pk
            )

    else:

        form = ProjectForm(
            instance=project
        )

    return render(
        request,
        'projects/project_form.html',
        {
            'form': form
        }
    )


def project_delete(request, pk):

    project = get_object_or_404(
        Project,
        pk=pk
    )

    if request.method == 'POST':

        project.delete()

        return redirect('project-list')

    return render(
        request,
        'projects/project_confirm_delete.html',
        {
            'project': project
        }
    )


# =========================================================
# TASK MANAGEMENT
# =========================================================

def task_list(request):

    tasks = Task.objects.all()

    return render(
        request,
        'projects/task_list.html',
        {
            'tasks': tasks
        }
    )


def task_detail(request, pk):

    task = get_object_or_404(
        Task,
        pk=pk
    )

    comments = task.comments.all()
    attachments = task.attachments.all()
    activities = task.activities.all()
    time_entries = task.time_entries.all()

    total_logged_hours = sum(
        entry.hours
        for entry in time_entries
    )

    if request.method == 'POST':

        # =================================================
        # ADD COMMENT
        # =================================================

        if 'comment_submit' in request.POST:

            comment_form = TaskCommentForm(
                request.POST
            )

            attachment_form = TaskAttachmentForm()

            if comment_form.is_valid():

                comment = comment_form.save(
                    commit=False
                )

                comment.task = task
                comment.user = request.user
                comment.save()

                TaskActivity.objects.create(
                    task=task,
                    user=request.user,
                    action='commented',
                    details=(
                        f'Added a comment to '
                        f'task "{task.title}".'
                    )
                )

                # -----------------------------------------
                # @MENTION DETECTION
                # -----------------------------------------

                mentioned_usernames = re.findall(
                    r'@([A-Za-z0-9_]+)',
                    comment.content
                )

                mentioned_usernames = list(
                    dict.fromkeys(
                        mentioned_usernames
                    )
                )

                for username in mentioned_usernames:

                    mentioned_user = User.objects.filter(
                        username=username
                    ).first()

                    if mentioned_user:

                        TaskActivity.objects.create(
                            task=task,
                            user=request.user,
                            action='mentioned',
                            details=(
                                f'@{username} was mentioned '
                                f'in a comment on task '
                                f'"{task.title}".'
                            )
                        )

                return redirect(
                    'task-detail',
                    pk=task.pk
                )

        # =================================================
        # UPLOAD ATTACHMENT
        # =================================================

        elif 'attachment_submit' in request.POST:

            attachment_form = TaskAttachmentForm(
                request.POST,
                request.FILES
            )

            comment_form = TaskCommentForm()

            if attachment_form.is_valid():

                attachment = attachment_form.save(
                    commit=False
                )

                attachment.task = task
                attachment.uploaded_by = request.user
                attachment.save()

                TaskActivity.objects.create(
                    task=task,
                    user=request.user,
                    action='uploaded file',
                    details=(
                        f'Uploaded attachment '
                        f'"{attachment.file.name}".'
                    )
                )

                return redirect(
                    'task-detail',
                    pk=task.pk
                )

        else:

            comment_form = TaskCommentForm()
            attachment_form = TaskAttachmentForm()

    else:

        comment_form = TaskCommentForm()
        attachment_form = TaskAttachmentForm()

    return render(
        request,
        'projects/task_detail.html',
        {
            'task': task,
            'comments': comments,
            'comment_form': comment_form,
            'attachments': attachments,
            'attachment_form': attachment_form,
            'activities': activities,
            'time_entries': time_entries,
            'total_logged_hours': total_logged_hours,
        }
    )


def task_create(request):

    if request.method == 'POST':

        form = TaskForm(request.POST)

        if form.is_valid():

            task = form.save(
                commit=False
            )

            task.created_by = request.user
            task.save()

            TaskActivity.objects.create(
                task=task,
                user=request.user,
                action='created',
                details=(
                    f'Created task '
                    f'"{task.title}".'
                )
            )

            return redirect('task-list')

    else:

        form = TaskForm()

    return render(
        request,
        'projects/task_form.html',
        {
            'form': form
        }
    )


def task_update(request, pk):

    task = get_object_or_404(
        Task,
        pk=pk
    )

    if request.method == 'POST':

        old_status = task.status
        old_assigned_to = task.assigned_to

        form = TaskForm(
            request.POST,
            instance=task
        )

        if form.is_valid():

            updated_task = form.save()

            # Status changed
            if old_status != updated_task.status:

                TaskActivity.objects.create(
                    task=updated_task,
                    user=request.user,
                    action='status changed',
                    details=(
                        f'Status changed from '
                        f'"{old_status}" to '
                        f'"{updated_task.status}".'
                    )
                )

            # Assignment changed
            if old_assigned_to != updated_task.assigned_to:

                assigned_name = (
                    updated_task.assigned_to.username
                    if updated_task.assigned_to
                    else 'Nobody'
                )

                TaskActivity.objects.create(
                    task=updated_task,
                    user=request.user,
                    action='assigned',
                    details=(
                        f'Task assigned to '
                        f'{assigned_name}.'
                    )
                )

            TaskActivity.objects.create(
                task=updated_task,
                user=request.user,
                action='updated',
                details=(
                    f'Updated task '
                    f'"{updated_task.title}".'
                )
            )

            return redirect(
                'task-detail',
                pk=task.pk
            )

    else:

        form = TaskForm(
            instance=task
        )

    return render(
        request,
        'projects/task_form.html',
        {
            'form': form
        }
    )


# =========================================================
# TIME TRACKING
# =========================================================

def time_tracking(request):

    time_entries = TimeEntry.objects.select_related(
        'task',
        'user'
    ).all()

    total_hours = sum(
        entry.hours
        for entry in time_entries
    )

    if request.method == 'POST':

        form = TimeEntryForm(
            request.POST
        )

        if form.is_valid():

            time_entry = form.save(
                commit=False
            )

            time_entry.user = request.user
            time_entry.save()

            # Update task actual hours
            task = time_entry.task

            task.actual_hours = sum(
                entry.hours
                for entry in task.time_entries.all()
            )

            task.save(
                update_fields=[
                    'actual_hours'
                ]
            )

            TaskActivity.objects.create(
                task=task,
                user=request.user,
                action='time logged',
                details=(
                    f'Logged {time_entry.hours} '
                    f'hours for task '
                    f'"{task.title}".'
                )
            )

            return redirect(
                'time-tracking'
            )

    else:

        form = TimeEntryForm()

    return render(
        request,
        'projects/time_tracking.html',
        {
            'form': form,
            'time_entries': time_entries,
            'total_hours': total_hours,
        }
    )


# =========================================================
# KANBAN BOARD
# =========================================================

def kanban_board(request):

    tasks = Task.objects.all()

    todo_tasks = tasks.filter(
        status='todo'
    )

    in_progress_tasks = tasks.filter(
        status='in_progress'
    )

    review_tasks = tasks.filter(
        status='review'
    )

    done_tasks = tasks.filter(
        status='done'
    )

    return render(
        request,
        'projects/kanban.html',
        {
            'todo_tasks': todo_tasks,
            'in_progress_tasks': in_progress_tasks,
            'review_tasks': review_tasks,
            'done_tasks': done_tasks,
        }
    )


def update_task_status(request, pk):

    if request.method == 'POST':

        task = get_object_or_404(
            Task,
            pk=pk
        )

        new_status = request.POST.get(
            'status'
        )

        if new_status in [
            'todo',
            'in_progress',
            'review',
            'done'
        ]:

            old_status = task.status

            task.status = new_status
            task.save()

            TaskActivity.objects.create(
                task=task,
                user=request.user,
                action='status changed',
                details=(
                    f'Status changed from '
                    f'"{old_status}" to '
                    f'"{new_status}".'
                )
            )

            return JsonResponse(
                {
                    'success': True
                }
            )

    return JsonResponse(
        {
            'success': False
        },
        status=400
    )


# =========================================================
# REPORTING
# =========================================================

def project_report(request):

    projects = Project.objects.annotate(

        total_tasks=Count(
            'tasks'
        ),

        completed_tasks=Count(
            'tasks',
            filter=Q(
                tasks__status='done'
            )
        )
    )

    for project in projects:

        project.pending_tasks = (
            project.total_tasks
            - project.completed_tasks
        )

    return render(
        request,
        'projects/project_report.html',
        {
            'projects': projects
        }
    )


# =========================================================
# ANALYTICS
# =========================================================

def analytics_dashboard(request):

    total_projects = Project.objects.count()

    total_tasks = Task.objects.count()

    completed_tasks = Task.objects.filter(
        status='done'
    ).count()

    in_progress_tasks = Task.objects.filter(
        status='in_progress'
    ).count()

    todo_tasks = Task.objects.filter(
        status='todo'
    ).count()

    review_tasks = Task.objects.filter(
        status='review'
    ).count()

    return render(
        request,
        'projects/analytics_dashboard.html',
        {
            'total_projects': total_projects,
            'total_tasks': total_tasks,
            'completed_tasks': completed_tasks,
            'in_progress_tasks': in_progress_tasks,
            'todo_tasks': todo_tasks,
            'review_tasks': review_tasks,
        }
    )