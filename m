Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3CD5019A1
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Apr 2022 19:07:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99120C5F1D7;
	Thu, 14 Apr 2022 17:07:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53E03C5E2CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Apr 2022 17:07:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23ECZiqm008382;
 Thu, 14 Apr 2022 19:07:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=Y92wNGyIiPlYv1KOGmADBNDY5uj67m7sBLNEDO0WGZ8=;
 b=VF3K9qbtoXyB4pa/jbAWrxiQMMG1h8Hcmt8S/Bai5ibrMZvNVkCQXdXI8IKrGCKHiWpe
 py80lstVXVf+qzUBmiHPkz/YFS8+qme98tebsX2ktPdmSxzekMVSYWutdUKp0v68DACJ
 /8TO9m5Jql/5XgsvZU/XoHT6fX3BLUnPQKm87JtoCyGHl9l86QzaIQEWb0gaj5inSAPT
 wOXwpJlKh7zFQerB/Z25Hym1nDeRYfOXaqLTPL/NaWWI3kEjZxaMO7LozWAcbnEP+M0i
 FIYyrIplyjuJIEEy9yFSN4dZIYkYIyr5RaIK40zK0o2JPn0XBnHSFFDYVZmQfgqf+sOt Bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fdvj5h1ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 19:07:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A70910002A;
 Thu, 14 Apr 2022 19:07:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 618D7233C83;
 Thu, 14 Apr 2022 19:07:10 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 14 Apr 2022 19:07:09
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 14 Apr 2022 19:07:05 +0200
Message-ID: <20220414190657.1.I6c65dc9d8d799131593b7e69cac9ed988027f1ab@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-14_04,2022-04-14_02,2022-02-23_01
Cc: Wolfgang Denk <wd@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Adarsh Babu Kalepalli <opensource.kab@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH] doc: man-page for the env command
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Describe the env command.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 doc/usage/cmd/askenv.rst  |   2 +
 doc/usage/cmd/env.rst     | 365 ++++++++++++++++++++++++++++++++++++++
 doc/usage/cmdline.rst     |   2 +-
 doc/usage/environment.rst |   2 +
 doc/usage/index.rst       |   1 +
 5 files changed, 371 insertions(+), 1 deletion(-)
 create mode 100644 doc/usage/cmd/env.rst

diff --git a/doc/usage/cmd/askenv.rst b/doc/usage/cmd/askenv.rst
index 5c4ca35d4c..347bd59458 100644
--- a/doc/usage/cmd/askenv.rst
+++ b/doc/usage/cmd/askenv.rst
@@ -16,6 +16,8 @@ Description
 Display message and get environment variable name of max size characters
 from stdin.
 
+See also *env ask* in :doc:`env`.
+
 name
     name of the environment variable
 
diff --git a/doc/usage/cmd/env.rst b/doc/usage/cmd/env.rst
new file mode 100644
index 0000000000..e8c5797abd
--- /dev/null
+++ b/doc/usage/cmd/env.rst
@@ -0,0 +1,365 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later:
+
+env command
+===========
+
+Synopsis
+--------
+
+::
+
+	env ask name [message] [size]
+	env callbacks
+	env default [-f] (-a | var [...])
+	env delete [-f] var [...]
+	env edit name
+	env exists name
+	env export [-t | -b | -c] [-s size] addr [var ...]
+	env flags
+	env grep [-e] [-n | -v | -b] string [...]
+	env import [-d] [-t [-r] | -b | -c] addr [size] [var ...]
+	env info [-d] [-p] [-q]
+	env print [-a | name ...]
+	env print -e [-guid guid] [-n] [name ...]
+	env run var [...]
+	env save
+	env erase
+	env load
+	env select [target]
+	env set [-f] name [value]
+	env set -e [-nv][-bs][-rt][-at][-a][-i addr:size][-v] name [value]
+
+Description
+-----------
+The *env* commands is used to handle the U-Boot (:doc:`../environment`) or
+the UEFI variables.
+
+The next commands are kept as alias and for compatibility:
+
++ *editenv* = *env edit*
++ *grepenv* = *env grep*
++ *setenv* = *env set*
++ *askenv* = *env ask*
++ *run* = *env run*
+
+Ask
+~~~
+
+The *env ask* command asks for environment variable (alias :doc:`askenv`).
+
+    name
+        name of the environment variable.
+
+    message
+        message is displayed while the command waits for the  value to be
+        entered from stdin.if no message is specified,a default message
+        "Please enter name:" will be displayed.
+
+    size
+        maximum number of characters that will be stored in environment
+        variable name.this is in decimal number format (unlike in
+        other commands where size values are in hexa-decimal). Default
+        value of size is 1023 (CONFIG_SYS_CBSIZE - 1).
+
+Callbacks
+~~~~~~~~~
+
+The *env callbacks* command prints callbacks and their associated variables.
+
+Default
+~~~~~~~
+
+The *env default* command resets the selected variables in the U-Boot
+environment to their default values.
+
+    var
+        list of variable name.
+    \-a
+        all U-Boot environment.
+    \-f
+        forcibly, overwrite read-only/write-once variables.
+
+Delete
+~~~~~~
+
+The *env delete* command deletes the selected variables in the U-Boot
+environment.
+
+    var
+        name of the variable to delete.
+    \-f
+        forcibly, overwrite read-only/write-once variables.
+
+Edit
+~~~~
+
+The *env edit* command edits an environment variable.
+
+    name
+        name of the variable.
+
+Exists
+~~~~~~
+
+The *env exists* command tests for existence of variable.
+
+    name
+        name of the variable.
+
+Export
+~~~~~~
+
+The *env export* command exports the U-Boot environment in memory; on success,
+the variable "filesize" will be set.
+
+    addr
+        memory address where environment gets stored.
+    var
+        list of variable names that get included into the export.
+        Without arguments, the whole environment gets exported.
+    \-b
+        export as binary format (name=value pairs separated by
+        list end marked by double "\0\0").
+    \-t
+        export as text format; if size is given, data will be
+        padded with '\0' bytes; if not, one terminating '\0'
+        will be added.
+    \-c
+        Export as checksum protected environment format as used by
+        'env save' command.
+    \-s size
+        size of output buffer.
+
+Flags
+~~~~~
+
+The *env flags* command prints variables that have non-default flags.
+
+Grep
+~~~~
+
+The *env grep* command searches environment, list environment name=value pairs
+matching the requested 'string'.
+
+    string
+        string to search in U-Boot environment.
+    \-e
+        enable regular expressions.
+    \-n
+        search string in variable names.
+    \-v
+        search string in vairable values.
+    \-b
+        search both names and values (default).
+
+Import
+~~~~~~
+
+The *env import* command imports environment from memory.
+
+    addr
+        memory address to read from.
+    size
+        length of input data; if missing, proper '\0' termination is mandatory
+        if var is set and size should be missing (i.e. '\0' termination),
+        set size to '-'.
+    var
+        List of the names of the only variables that get imported from
+        the environment at address 'addr'. Without arguments, the whole
+        environment gets imported.
+    \-d
+        delete existing environment before importing if no var is passed;
+        if vars are passed, if one var is in the current environment but not
+        in the environment at addr, delete var from current environment;
+        otherwise overwrite / append to existing definitions.
+    \-t
+        assume text format; either "size" must be given or the text data must
+        be '\0' terminated.
+    \-r
+        handle CRLF like LF, that means exported variables with a content which
+        ends with \r won't get imported. Used to import text files created with
+        editors which are using CRLF for line endings.
+        Only effective in addition to -t.
+    \-b
+        assume binary format ('\0' separated, "\0\0" terminated).
+    \-c
+        assume checksum protected environment format.
+
+Info
+~~~~
+
+The *env info* command displays (without argument) or evaluates the U-Boot
+environment information.
+
+    \-d
+        evaluate if the default environment is used.
+    \-p
+        evaluate if environment can be persisted.
+    \-q
+        quiet output,  use only for command result, by example with
+        'test' command.
+
+Print
+~~~~~
+
+The *env print* command prints the selected variables in U-Boot environment or
+in UEFI variables.
+
+    name
+        list of variable name.
+    \-a
+        all U-Boot environment, when 'name' is absent.
+    \-e
+        print UEFI variables, all by default when 'name'.
+    \-guid guid
+        print only the UEFI variables matching this GUID (any by default)
+        with guid format = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx".
+    \-n
+         suppress dumping variable's value for UEFI.
+
+Run
+~~~
+
+The *env run* command runs commands in an environment variable.
+
+    var
+        name of the variable.
+
+Save
+~~~~
+
+The *env save* command saves the U-Boot environment in persistent storage.
+
+Erase
+~~~~~
+
+The *env erase* command erases the U-Boot environment.
+
+Load
+~~~~
+
+The *env load* command loads the U-Boot environment from persistent storage.
+
+Select
+~~~~~~
+
+The *env select* command selects an U-Boot environment target, it is useful to
+overid the default location when several U-Boot environment backend are
+availables.
+
+    target
+        name of the U-Boot environment backend to select: EEPROM, EXT4, FAT,
+        Flash, MMC, NAND, nowhere, NVRAM, OneNAND, Remote, SATA, SPIFlash, UBI.
+
+
+Set
+~~~
+
+The *env set* command sets or delete (when 'value' or '-i' are absent)
+U-Boot variable in environment or UEFI variables (when -e is specified).
+
+    name
+        variable name to modify.
+    value
+        when present, set the environment variable 'name' to 'value'
+        when absent, delete the environment variable 'name'.
+    \-f
+        forcibly, overwrite read-only/write-once U-Boot variables.
+    \-e
+        update UEFI variables.
+    \-nv
+        set non-volatile attribute (UEFI).
+    \-bs
+        set boot-service attribute (UEFI).
+    \-rt
+        set runtime attribute (UEFI).
+    \-at
+        set time-based authentication attribute (UEFI).
+    \-a
+        append-write (UEFI).
+    \-i addr:size
+        use <addr,size> as variable's value (UEFI).
+    \-v
+        verbose message (UEFI).
+
+Example
+-------
+
+Print the U-Boot environment variables::
+
+    => env print -a
+    => env print bootcmd stdout
+
+Update environment variable in memory::
+
+    => env set bootcmd "run distro_bootcmd"
+    => env set stdout "serial,vidconsole"
+
+Delete environment variable in memory::
+
+    => env delete bootcmd
+    => env set bootcmd
+
+Reset environment variable to default value, in memory::
+
+    => env default bootcmd
+    => env default -a
+
+Save current environment in persistent storage::
+
+    => env save
+
+Restore the default environment in persistent storage::
+
+    => env erase
+
+Create a text snapshot/backup of the current settings in RAM
+(${filesize} can be use to save the snapshot in file)::
+
+    => env export -t ${backup_addr}
+
+Re-import this snapshot, deleting all other settings::
+
+    => env import -d -t ${backup_addr}
+
+Save environment if default enviromnent is used and persistent storage is selected::
+
+    => if env info -p -d -q; then env save; fi
+
+Configuration
+-------------
+
+The env command is always available but some sub-commands need to enable more
+configuration.
+
+ask
+    CONFIG_CMD_ASKENV
+callback
+    CONFIG_CMD_ENV_CALLBACK
+edit
+    CONFIG_CMD_EDITENV
+exists
+    CONFIG_CMD_ENV_EXISTS
+flsgs
+    CONFIG_CMD_ENV_FLAGS
+erase
+    CONFIG_CMD_ERASEENV
+export
+    CONFIG_CMD_EXPORTENV
+grep
+    CONFIG_CMD_GREPENV
+    CONFIG_REGEX for '-e' option
+import
+    CONFIG_CMD_IMPORTENV
+info
+    CONFIG_CMD_NVEDIT_INFO
+load
+    CONFIG_CMD_NVEDIT_LOAD
+run
+    CONFIG_CMD_RUN
+save
+    CONFIG_CMD_SAVEENV
+select
+    CONFIG_CMD_NVEDIT_SELECT
+set, print
+    CONFIG_CMD_NVEDIT_EFI for '-e' option
diff --git a/doc/usage/cmdline.rst b/doc/usage/cmdline.rst
index 88f18c974c..58240c5279 100644
--- a/doc/usage/cmdline.rst
+++ b/doc/usage/cmdline.rst
@@ -14,7 +14,7 @@ Simple command-line parser
 
 This takes very little code space and offers only basic features:
 
-- supports environment variables (through setenv / saveenv commands)
+- supports environment variables (through :doc:`cmd/env`)
 - several commands on one line, separated by ';'
 - variable substitution using "... ${name} ..." syntax
 - special characters ('$', ';') can be escaped by prefixing with '\',
diff --git a/doc/usage/environment.rst b/doc/usage/environment.rst
index 80550fc447..dc61703944 100644
--- a/doc/usage/environment.rst
+++ b/doc/usage/environment.rst
@@ -15,6 +15,8 @@ environment. As long as you don't save the environment, you are
 working with an in-memory copy. In case the Flash area containing the
 environment is erased by accident, a default environment is provided.
 
+See :doc:`cmd/env` for details.
+
 Some configuration is controlled by Environment Variables, so that setting the
 variable can adjust the behaviour of U-Boot (e.g. autoboot delay, autoloading
 from tftp).
diff --git a/doc/usage/index.rst b/doc/usage/index.rst
index f457bffc2c..f343e4e05f 100644
--- a/doc/usage/index.rst
+++ b/doc/usage/index.rst
@@ -30,6 +30,7 @@ Shell commands
    cmd/cbsysinfo
    cmd/conitrace
    cmd/echo
+   cmd/env
    cmd/event
    cmd/exception
    cmd/extension
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
