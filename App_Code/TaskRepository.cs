using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Xml;

/// <summary>
/// Summary description for TaskRepository
/// </summary>
public class TaskRepository
{
    public TaskRepository()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private SqlConnection DBConnection
    {
        get
        {
            return new SqlConnection(ConfigurationManager.ConnectionStrings["MyTasksConnectionString1"].ConnectionString);
        }
    }

    public void AddTask(Task task)
    {
        var ctx = new MyTasksDataContext();
        ctx.Tasks.InsertOnSubmit(task);
        ctx.SubmitChanges();
    }

    public List<Task> GetTasks()
    {
        var ctx = new MyTasksDataContext();
        var query = from t in ctx.Tasks
                    select t;

        return query.ToList<Task>();
    }

    public List<Task> GetTasksByOwner(string userName)
    {
        var ctx = new MyTasksDataContext();
        var query = from t in ctx.Tasks
                    where t.UserName == userName
                    select t;

        return query.ToList<Task>();
    }


    public List<Task> GetCompletedTasksByOwner(string userName)
    {
        var ctx = new MyTasksDataContext();
        var query = from t in ctx.Tasks
                    where t.UserName == userName &&
                          t.Completed == true
                    select t;

        return query.ToList<Task>();
    }

    public List<Task> GetPendingTasksByOwner(string userName)
    {
        var ctx = new MyTasksDataContext();
        var query = from t in ctx.Tasks
                    where t.UserName == userName &&
                          t.Completed == false
                    select t;

        return query.ToList<Task>();
    }

    public List<Task> GetUserTasksByCategory(string userName, int category)
    {
        var ctx = new MyTasksDataContext();
        var query = from t in ctx.Tasks
                    where t.UserName == userName &&
                          t.CategoryId == category
                    select t;

        return query.ToList<Task>();
    }


    public Task GetTask(int taskId)
    {
        var ctx = new MyTasksDataContext();   
        var task = (from t in ctx.Tasks
                     where t.TaskId == taskId
                     select t).SingleOrDefault<Task>();
           
        return task;
    }

    public void UpdateTask(Task task)
    {
        var ctx = new MyTasksDataContext();

        Task taskToUpdate = (from t in ctx.Tasks
                             where t.TaskId == task.TaskId
                             select t).SingleOrDefault<Task>();     

        if(taskToUpdate != null)
        {
            taskToUpdate.CategoryId = task.CategoryId;
            taskToUpdate.StartDate = task.StartDate;
            taskToUpdate.DueDate = task.DueDate;
            taskToUpdate.Completed = task.Completed;
            taskToUpdate.Priority = task.Priority;
            taskToUpdate.PercentComplete = task.PercentComplete;

            ctx.SubmitChanges();
        }
    }

    public List<Category> GetCategoriesList()
    {
        var ctx = new MyTasksDataContext();
        var query = from c in ctx.Categories
                    select c;

        return query.ToList<Category>();
    }

    public void AddCategory(string category)
    {
        var ctx = new MyTasksDataContext();
        Category cat = new Category();
        cat.Name = category;
        ctx.Categories.InsertOnSubmit(cat);
        ctx.SubmitChanges();
    }
}