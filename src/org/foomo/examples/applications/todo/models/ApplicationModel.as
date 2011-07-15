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
package org.foomo.examples.applications.todo.models
{
	import mx.collections.ArrayCollection;

	import org.foomo.examples.services.todo.Service1Proxy;
	import org.foomo.zugspitze.core.ZugspitzeModel;
	import org.foomo.zugspitze.services.namespaces.php.foomo.examples.todo.service.Todo;

	[Bindable]

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class ApplicationModel extends ZugspitzeModel
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const STATE_LOADING:String 		= 'loading';
		public static const STATE_COMPLETE_LIST:String 	= 'completeList';
		public static const STATE_OPEN_LIST:String 		= 'openList';
		public static const STATE_EDIT:String 			= 'edit';
		public static const STATE_ADD:String 			= 'add';

		//-----------------------------------------------------------------------------------------
		// ~ Proxies
		//-----------------------------------------------------------------------------------------

		public var todoProxy:Service1Proxy = new Service1Proxy;

		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		public var currentState:String = STATE_LOADING;

		public var opentTodos:ArrayCollection;

		public var completeTodos:ArrayCollection;

		public var todo:Todo;

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		public function setTodos(todos:Array):void
		{
			var open:Array = new Array;
			var complete:Array = new Array;
			for each (var todo:Todo in todos)  {
				if (todo.complete) {
					complete.push(todo);
				} else {
					open.push(todo);
				}
			}
			this.completeTodos = new ArrayCollection(complete);
			this.opentTodos = new ArrayCollection(open);
		}
	}
}