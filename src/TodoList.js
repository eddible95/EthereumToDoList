import React, { Component } from 'react'

class TodoList extends Component {

  render() {
    return (
      // Creates the form and retrieve user's input using ref so that a handler not required
      <div id="content">

        <form onSubmit={(event) => {
          event.preventDefault()
          this.props.createTask(this.task.value)}}>
          <input
            id="newTask"
            ref={(input) => {
              this.task = input
            }}
            type="text"
            className="form-control"
            placeholder="Add task..."
            required />
          <input type="submit" hidden={true} />
        </form>

        <ul id="taskList" className="list-unstyled">
          { this.props.tasks.map((task, key) => {
            return(
              <div className="taskTemplate" className="checkbox" key={key}>
                <label>
                  <input
                  type="checkbox"
                  name={task.id}
                  defaultChecked={task.completed}
                  ref={(input) => {
                    this.checkbox = input
                  }}
                  onClick={(event) => {
                    this.props.toggleCompleted(this.checkbox.name) }}/>
                  <span className="content">{task.content}</span>
                </label>
              </div>
            )
          })}
        </ul>
        <h3>Task Completed</h3>
        <ul id="completedTaskList" className="list-unstyled">
          { this.props.tasks.map((task) => {
            if (task.completed){
              return(
                <div className="content">
                <a>{task.content}</a>
                </div>
              )
            }
          })}
        </ul>
      </div>
    );
  }
}

export default TodoList;
