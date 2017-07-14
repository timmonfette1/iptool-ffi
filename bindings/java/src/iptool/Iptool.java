/* Java binding for the IP Tool.
 *
 * Provides all of the Iptool functions in a
 * Java class.
 *
 * Author:
 * Tim Monfette
 */

package iptool;

import java.io.File;
import jnr.ffi.LibraryLoader;
import jnr.ffi.Pointer;
import static java.lang.System.mapLibraryName;

public class Iptool {

  private static final String libname = mapLibraryName("iptool");
  private static String basedir = System.getProperty("user.dir"); 
  private static String path;
  private static RustLib rlib;

  // Constructors
  public Iptool(String basedir) {
    Iptool.basedir = basedir;
    Iptool.rlib = createRustLib();
  }
  public Iptool() {
    Iptool.rlib = createRustLib();
  }

  // Wrapper for valid_ipv4
  public String valid_ipv4(String userInput) {
    Pointer result = rlib.valid_ipv4(userInput);
    String toReturn = result.getString(0);
    rlib.free_string(result);
    return toReturn;
  }

  // Wrapper for ipv4_ipv6
  public String ipv4_ipv6(String userInput) {
    Pointer result = rlib.ipv4_ipv6(userInput);
    String toReturn = result.getString(0);
    rlib.free_string(result);
    return toReturn;
  }

  // Wrapper for ipv4_bin
  public String ipv4_bin(String userInput) {
    Pointer result = rlib.ipv4_bin(userInput);
    String toReturn = result.getString(0);
    rlib.free_string(result);
    return toReturn;
  }

  // Wrapper for valid_ipv6
  public String valid_ipv6(String userInput) {
    Pointer result = rlib.valid_ipv6(userInput);
    String toReturn = result.getString(0);
    rlib.free_string(result);
    return toReturn;
  }

  // Wrapper for ipv6_ipv4
  public String ipv6_ipv4(String userInput) {
    Pointer result = rlib.ipv6_ipv4(userInput);
    String toReturn = result.getString(0);
    rlib.free_string(result);
    return toReturn;
  }

  // Wrapper for ipv6_bin
  public String ipv6_bin(String userInput) {
    Pointer result = rlib.ipv6_bin(userInput);
    String toReturn = result.getString(0);
    rlib.free_string(result);
    return toReturn;
  }

  // Get the FFI to call
  private RustLib createRustLib() {
    System.setProperty("jnr.ffi.library.path", getLibraryPath());
    RustLib rlib = LibraryLoader.create(RustLib.class).load("iptool");
    return rlib;
  }

  // Get the library path for the shared object file
  private String getLibraryPath() {			
    path = findFile(libname, new File(basedir));

    if (path == null) {
      System.err.println("Cannot find library file for the FFI. Exiting");
      System.exit(1);
    }

    return path;
  }

  // Recursively find the file starting in the basedir
  private static String findFile(String name, File file) {		
    String filepath = null;

    File[] list = file.listFiles();
    if(list!=null)
      for (File fil : list)
      {
        if (fil.isDirectory())
        {
          filepath = findFile(name,fil);
        }
        else if (name.equalsIgnoreCase(fil.getName()))
        {
          filepath = fil.getParent();
        }
      }

    return filepath;
  }
}
