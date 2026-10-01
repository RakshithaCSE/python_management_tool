from django.urls import path

from .views import (
    project_list,
    project_detail,
    project_create,
    project_update,
    project_delete,
    task_list,
    task_detail,
    task_create,
    task_update,
    kanban_board,
    update_task_status,
    project_report,
    analytics_dashboard,
    time_tracking,
)


urlpatterns = [

    # Projects
    path(
        '',
        project_list,
        name='project-list'
    ),

    path(
        'project/<int:pk>/',
        project_detail,
        name='project-detail'
    ),

    path(
        'project/create/',
        project_create,
        name='project-create'
    ),

    path(
        'project/<int:pk>/update/',
        project_update,
        name='project-update'
    ),

    path(
        'project/<int:pk>/delete/',
        project_delete,
        name='project-delete'
    ),


    # Tasks
    path(
        'tasks/',
        task_list,
        name='task-list'
    ),

    path(
        'tasks/<int:pk>/',
        task_detail,
        name='task-detail'
    ),

    path(
        'tasks/create/',
        task_create,
        name='task-create'
    ),

    path(
        'tasks/<int:pk>/update/',
        task_update,
        name='task-update'
    ),


    # Kanban
    path(
        'kanban/',
        kanban_board,
        name='kanban-board'
    ),

    path(
        'tasks/<int:pk>/update-status/',
        update_task_status,
        name='update-task-status'
    ),


    # Reports
    path(
        'reports/',
        project_report,
        name='project-report'
    ),


    # Analytics
    path(
        'analytics/',
        analytics_dashboard,
        name='analytics-dashboard'
    ),


    # Time Tracking
    path(
        'time-tracking/',
        time_tracking,
        name='time-tracking'
    ),
]