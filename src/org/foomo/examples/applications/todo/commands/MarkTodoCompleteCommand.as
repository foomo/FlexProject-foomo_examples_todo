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
	import org.foomo.examples.services.todo.commands.AbstractMarkTodoCompleteCommand;
	import org.foomo.examples.services.todo.events.MarkTodoCompleteCallEvent;

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class MarkTodoCompleteCommand extends AbstractMarkTodoCompleteCommand
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		public var model:ApplicationModel;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function MarkTodoCompleteCommand(id:String, model:ApplicationModel)
		{
			this.model = model;
			super(id, this.model.todoProxy, true);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		override protected function abstractCompleteHandler(event:MarkTodoCompleteCallEvent):void
		{
			this.model.setTodos(event.result);
			this.dispatchCommandCompleteEvent();
		}
	}
}