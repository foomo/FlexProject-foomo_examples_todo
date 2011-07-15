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
package org.foomo.examples.applications.todo.commands
{
	import org.foomo.examples.applications.todo.models.ApplicationModel;
	import org.foomo.examples.services.todo.Service1Proxy;
	import org.foomo.examples.services.todo.commands.AbstractAddTodoCommand;
	import org.foomo.examples.services.todo.events.AddTodoCallEvent;

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class AddTodoCommand extends AbstractAddTodoCommand
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		public var model:ApplicationModel;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function AddTodoCommand(text:String, model:ApplicationModel)
		{
			this.model = model;
			super(text, this.model.todoProxy, true);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		override protected function abstractCompleteHandler(event:AddTodoCallEvent):void
		{
			this.model.setTodos(event.result);
			this.model.currentState = ApplicationModel.STATE_OPEN_LIST;
			this.dispatchCommandCompleteEvent();
		}
	}
}