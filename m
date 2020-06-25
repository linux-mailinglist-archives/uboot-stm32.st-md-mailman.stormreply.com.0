Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9ED209AE5
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 10:00:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEE9EC36B16
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 08:00:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D0B6C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2020 08:00:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05P7r7L0012206; Thu, 25 Jun 2020 10:00:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=yvrQh0I+WinNFsu5V1zBe3ip+Cz3GRrqaPecxFU0guY=;
 b=Zn9MjFfbrSJh0c0YHpSTFwsocfAEwTJKgL/6BImU/ijY/jdAtsTv45PpGQ5SerMCJnSd
 mKm0M0mcPlMhGQhOoCrBjm6gJtzsc7zZYbh7n3ptOLlYh4kgeyEGE0BO8mOrLeWiDMd/
 8JO2qqR06cdO6u0W6qq9iSESNY5C0101Mlv0qgiWU0EYNH99yQQKpZd1hFRfeXES05lA
 A+xQpvRnllwLzXsugPzQcYHJDuxHJgvVWh5WCmFEONMKUof8CA3ZUNmiF4Jy6Avk8utz
 HExXksmqWhnHX69FvBYWFmKqCMjNQr1VRK5oNtOzGvbgDoUAMj/7XhR22dbJ38xJHklJ YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuucgpyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 10:00:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 44BD910003A;
 Thu, 25 Jun 2020 10:00:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 382762A991C;
 Thu, 25 Jun 2020 10:00:30 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 25 Jun 2020 10:00:29 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Jun 2020 09:59:55 +0200
Message-ID: <20200625075958.9868-12-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625075958.9868-1-patrick.delaunay@st.com>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_03:2020-06-25,
 2020-06-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Stephen Warren <swarren@nvidia.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 11/14] test: environment in ext4
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

Add basic test to persistent environment in ext4:
save and load in host ext4 file 'uboot.env'.

On first execution an empty EXT4 file system is created in
persistent data dir: env.ext4.img.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3:
- replace specific sandbox command by generic command
  'env select' and 'env load'
- update after Stephen Warren comments

 test/py/tests/test_env.py | 97 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/test/py/tests/test_env.py b/test/py/tests/test_env.py
index a64aaa9bc5..70913c8d9a 100644
--- a/test/py/tests/test_env.py
+++ b/test/py/tests/test_env.py
@@ -4,6 +4,10 @@
 
 # Test operation of shell commands relating to environment variables.
 
+import os
+import os.path
+from subprocess import call, check_call, CalledProcessError
+
 import pytest
 import u_boot_utils
 
@@ -374,7 +378,6 @@ def test_env_info(state_test_env):
 @pytest.mark.buildconfigspec('cmd_nvedit_info')
 @pytest.mark.buildconfigspec('cmd_echo')
 def test_env_info_sandbox(state_test_env):
-
     """Test 'env info' command result with several options on sandbox
        with a known ENV configuration: ready & default & persistent
     """
@@ -399,3 +402,95 @@ def test_env_info_sandbox(state_test_env):
     response = c.run_command('env info -d -p -q')
     response = c.run_command('echo $?')
     assert response == "1"
+
+def mk_env_ext4(state_test_env):
+
+    """Create a empty ext4 file system volume."""
+    c = state_test_env.u_boot_console
+    filename = 'env.ext4.img'
+    persistent = c.config.persistent_data_dir + '/' + filename
+    fs_img = c.config.result_dir  + '/' + filename
+
+    if os.path.exists(persistent):
+        c.log.action('Disk image file ' + persistent + ' already exists')
+    else:
+        try:
+            u_boot_utils.run_and_log(c, 'dd if=/dev/zero of=%s bs=1M count=16' % persistent)
+            u_boot_utils.run_and_log(c, 'mkfs.ext4 -O ^metadata_csum %s' % persistent)
+        except CalledProcessError:
+            call('rm -f %s' % persistent, shell=True)
+            raise
+
+    u_boot_utils.run_and_log(c, ['cp',  '-f', persistent, fs_img])
+    return fs_img
+
+@pytest.mark.boardspec('sandbox')
+@pytest.mark.buildconfigspec('cmd_echo')
+@pytest.mark.buildconfigspec('cmd_nvedit_info')
+@pytest.mark.buildconfigspec('cmd_nvedit_load')
+@pytest.mark.buildconfigspec('cmd_nvedit_select')
+@pytest.mark.buildconfigspec('env_is_in_ext4')
+def test_env_ext4(state_test_env):
+
+    """Test ENV in EXT4 on sandbox."""
+    c = state_test_env.u_boot_console
+    fs_img = ''
+    try:
+        fs_img = mk_env_ext4(state_test_env)
+
+        c.run_command('host bind 0  %s' % fs_img)
+
+        response = c.run_command('ext4ls host 0:0')
+        assert 'uboot.env' not in response
+
+        # force env location: EXT4 (prio 1 in sandbox)
+        response = c.run_command('env select EXT4')
+        assert 'Select Environment on EXT4: OK' in response
+
+        response = c.run_command('env save')
+        assert 'Saving Environment to EXT4' in response
+
+        response = c.run_command('env load')
+        assert 'Loading Environment from EXT4... OK' in response
+
+        response = c.run_command('ext4ls host 0:0')
+        assert '8192 uboot.env' in response
+
+        response = c.run_command('env info')
+        assert 'env_valid = valid' in response
+        assert 'env_ready = true' in response
+        assert 'env_use_default = false' in response
+
+        response = c.run_command('env info -p -d')
+        assert 'Environment was loaded from persistent storage' in response
+        assert 'Environment can be persisted' in response
+
+        response = c.run_command('env info -d -q')
+        assert response == ""
+        response = c.run_command('echo $?')
+        assert response == "1"
+
+        response = c.run_command('env info -p -q')
+        assert response == ""
+        response = c.run_command('echo $?')
+        assert response == "0"
+
+        # restore env location: NOWHERE (prio 0 in sandbox)
+        response = c.run_command('env select nowhere')
+        assert 'Select Environment on nowhere: OK' in response
+
+        response = c.run_command('env load')
+        assert 'Loading Environment from nowhere... OK' in response
+
+        response = c.run_command('env info')
+        assert 'env_valid = invalid' in response
+        assert 'env_ready = true' in response
+        assert 'env_use_default = true' in response
+
+        response = c.run_command('env info -p -d')
+        assert 'Default environment is used' in response
+        assert 'Environment cannot be persisted' in response
+
+    finally:
+        if fs_img:
+            call('rm -f %s' % fs_img, shell=True)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
