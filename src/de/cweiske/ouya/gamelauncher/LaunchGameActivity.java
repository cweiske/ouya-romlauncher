/*
 * Copyright (C) 2012 OUYA, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package de.cweiske.ouya.gamelauncher;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.res.AssetManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;

public class LaunchGameActivity extends Activity
{
    String assetFilename = "FIXME_ASSETFILENAME";
	
    /**
     * Called when the activity is first created.
     */
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        
        File extractedFile = extractFile(this.assetFilename);
        if (extractedFile == null) {
        	System.err.println("Failed to extract file " + this.assetFilename);
        	finish();
        	return;
        }

        Intent intent = new Intent();
        intent.setComponent(new ComponentName("com.explusalpha.Snes9xPlus", "com.imagine.BaseActivity"));
        intent.setAction("android.intent.action.VIEW");
        intent.setData(Uri.fromFile(extractedFile));
        
		startActivity(intent);
		finish();
		return;
    }

	protected File extractFile(String assetFilename)
	{
		//File cacheDir = this.getExternalCacheDir();
		//File cacheDir = getExternalFilesDir(null);
		File cacheDir = Environment.getExternalStorageDirectory();
		if (cacheDir == null) {
			return null;
		}
		File dir = new File(
			cacheDir.toString()
			+ File.separator
			+ "gamelauncher"
		);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
		File targetFile = new File(dir.toString() + File.separator + assetFilename);
		if (targetFile.exists()) {
			return targetFile;
		}
		
		AssetManager assetManager = this.getAssets();
		try {
		    InputStream in = assetManager.open("game/" + assetFilename);
		    copyFile(in, new FileOutputStream(targetFile));
		    return targetFile;
		} catch (IOException e) {
		    e.printStackTrace();
		}
    	return null;
	}
	
	protected void copyFile(InputStream in, OutputStream out) throws IOException
	{
	    byte[] buffer = new byte[1024];
	    int read;
	    while((read = in.read(buffer)) != -1){
	      out.write(buffer, 0, read);
	    }
	}
}
