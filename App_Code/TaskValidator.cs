using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

/// <summary>
/// Summary description for TaskValidator
/// </summary>
public class TaskValidator
{
    public List<string> ErrorMessages;

    public TaskValidator()
    {
        ErrorMessages = new List<string>();
    }

    public bool ValididateTask(Task task)
    {
        bool isValid = true;
        if (task.StartDate > task.DueDate)
        {
            ErrorMessages.Add("The Due Date must be after the Start Date");
            isValid = false;
        }

        if ((task.Completed) && (task.PercentComplete < 100))
        {
            ErrorMessages.Add("If the task has been completed Percentage Complete must be 100%");
            isValid = false;
        }

        if (task.TaskId != 0)
        {
            var rep = new TaskRepository();
            var taskBeingChanged = rep.GetTask(task.TaskId);

            if (taskBeingChanged.Completed == true)
            {
                ErrorMessages.Add("You cannot edit a task in completed status");
                isValid = false;
            }

            MembershipUser user = Membership.GetUser();

            if(!taskBeingChanged.UserName.Equals(user.UserName))
            {
                ErrorMessages.Add("You cannot edit a task belonging to another user");
                isValid = false;
            }
        }
        return isValid;
    }
}