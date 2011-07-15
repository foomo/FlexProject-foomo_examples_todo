/*
 * This file is part of the foomo Opensource Framework.
 *
 * The foomo Opensource Framework is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License as
 * published  by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * The foomo Opensource Framework is distributed in the hope that it will
 * be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License along with
 * the foomo Opensource Framework. If not, see <http://www.gnu.org/licenses/>.
 */
package org.foomo.examples.applications.todo.controllers
{
	import org.foomo.examples.applications.todo.commands.AddTodoCommand;
	import org.foomo.examples.applications.todo.commands.GetTodosCommand;
	import org.foomo.examples.applications.todo.commands.MarkTodoCompleteCommand;
	import org.foomo.examples.applications.todo.commands.RemoveCompleteTodosCommand;
	import org.foomo.examples.applications.todo.commands.UpdateTodoCommand;
	import org.foomo.examples.applications.todo.models.ApplicationModel;
	import org.foomo.examples.applications.todo.views.ApplicationView;
	import org.foomo.zugspitze.core.ZugspitzeController;
	import org.foomo.zugspitze.services.namespaces.php.foomo.examples.todo.service.Todo;

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class ApplicationController extends ZugspitzeController
	{
		//-----------------------------------------------------------------------------------------
		// ~ Initialize application
		//-----------------------------------------------------------------------------------------

		public function initialize():void
		{
			this.getTodos();
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		public function setCurrentState(state:String):void
		{
			this.model.currentState = state;
		}

		public function editTodo(todo:Todo):void
		{
			this.model.todo = todo;
			this.model.currentState = ApplicationModel.STATE_EDIT;
		}

		public function addTodo(text:String):AddTodoCommand
		{
			return this.executeCommand(new AddTodoCommand(text, this.model)) as AddTodoCommand;
		}

		public function getTodos():GetTodosCommand
		{
			return this.executeCommand(new GetTodosCommand(this.model)) as GetTodosCommand;
		}

		public function updateTodos(id:String, text:String):UpdateTodoCommand
		{
			return this.executeCommand(new UpdateTodoCommand(id, text, this.model)) as UpdateTodoCommand;
		}

		public function markTodoComplete(id:String):MarkTodoCompleteCommand
		{
			return this.executeCommand(new MarkTodoCompleteCommand(id, this.model)) as MarkTodoCompleteCommand;
		}

		public function removeCompleteTodos():RemoveCompleteTodosCommand
		{
			return this.executeCommand(new RemoveCompleteTodosCommand(this.model)) as RemoveCompleteTodosCommand;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Private helper methods
		//-----------------------------------------------------------------------------------------

		private function get model():ApplicationModel
		{
			return this.zugspitze.model as ApplicationModel
		}

		private function get view():ApplicationView
		{
			return this.zugspitze.view as ApplicationView
		}
	}
}