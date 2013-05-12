// ===================================================================================================
//                           _  __     _ _
//                          | |/ /__ _| | |_ _  _ _ _ __ _
//                          | ' </ _` | |  _| || | '_/ _` |
//                          |_|\_\__,_|_|\__|\_,_|_| \__,_|
//
// This file is part of the Kaltura Collaborative Media Suite which allows users
// to do with audio, video, and animation what Wiki platfroms allow them to do with
// text.
//
// Copyright (C) 2006-2011  Kaltura Inc.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
// @ignore
// ===================================================================================================
package com.kaltura.commands.thumbAsset
{
	import com.kaltura.vo.KalturaThumbParams;
	import com.kaltura.delegates.thumbAsset.ThumbAssetGetUrlDelegate;
	import com.kaltura.net.KalturaCall;

	/**
	 * Get download URL for the asset
	 * 
	 **/
	public class ThumbAssetGetUrl extends KalturaCall
	{
		public var filterFields : String;
		
		/**
		 * @param id String
		 * @param storageId int
		 * @param thumbParams KalturaThumbParams
		 **/
		public function ThumbAssetGetUrl( id : String,storageId : int=int.MIN_VALUE,thumbParams : KalturaThumbParams=null )
		{
			service= 'thumbasset';
			action= 'getUrl';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push('id');
			valueArr.push(id);
			keyArr.push('storageId');
			valueArr.push(storageId);
 			if (thumbParams) { 
 			keyValArr = kalturaObject2Arrays(thumbParams, 'thumbParams');
			keyArr = keyArr.concat(keyValArr[0]);
			valueArr = valueArr.concat(keyValArr[1]);
 			} 
			applySchema(keyArr, valueArr);
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields', filterFields);
			delegate = new ThumbAssetGetUrlDelegate( this , config );
		}
	}
}
