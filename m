Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D1015B013
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:45:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97102C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:45:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0FA6C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:45:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIgf4Z023880; Wed, 12 Feb 2020 19:45:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=HAX7akF+EwBPK3DsIb46V9XzXI20N0NyBhEt5aaI8UY=;
 b=qCXuj6mR2pEVYEgdlO2YcQQzBmim4zONwLB4NAlFaFme7GKIWUUOYXLL3QETMNnucrmd
 ksxfrE6xyYIyBFOGHFDxOYu9BLbz9Vz/j0JKLg493zb4O1HjC3PJZ/dH1/9ISk3KXCmI
 vSUN6tf7VOBEHNXAYawZpQNOz2+Ido2tgeKH85/ssFwNLTacNwdvG+qp+9FIlFrcyvW+
 Xz+ZzuZC9uoC877NlGg0jxJkffeR4Isr9bmBV0vWGqkKWy9mpnlJJCmSWbFwz6ZAV9op
 dCWgZDD/xe75h5RSVt5JxiAHpqXm3W3nhLWQhQhI/Nad0JOP9792ZDBbuGh9GDnsiJ/d hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uda04ce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:45:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A7225100045;
 Wed, 12 Feb 2020 19:45:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F4BC2C60B1;
 Wed, 12 Feb 2020 19:45:08 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:45:07 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:44:57 +0100
Message-ID: <20200212184501.5911-7-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212184501.5911-1-patrick.delaunay@st.com>
References: <20200212184501.5911-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stephen Warren <swarren@nvidia.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RESEND PATCH 06/10] test: environment in ext4
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

On first execution a empty EXT4 file system is created in
persistent data dir: env.ext4.img.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 test/py/tests/test_env.py | 87 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/test/py/tests/test_env.py b/test/py/tests/test_env.py
index cbdb41031c..d35ad888a7 100644
--- a/test/py/tests/test_env.py
+++ b/test/py/tests/test_env.py
@@ -4,6 +4,10 @@
 
 # Test operation of shell commands relating to environment variables.
 
+import os
+import os.path
+from subprocess import call, check_call
+
 import pytest
 import u_boot_utils
 
@@ -380,3 +384,86 @@ def test_env_info_quiet(state_test_env):
     assert response == ""
     response = c.run_command('echo $?')
     assert response == "1"
+
+def mk_env_ext4(state_test_env):
+    c = state_test_env.u_boot_console
+
+    """Create a empty ext4 file system volume.
+    """
+    filename = 'env.ext4.img'
+    persistent = c.config.persistent_data_dir + '/' + filename
+    fs_img = c.config.result_dir  + '/' + filename
+
+    if os.path.exists(persistent):
+        c.log.action('Disk image file ' + persistent + ' already exists')
+    else:
+        try:
+            check_call('rm -f %s' % persistent, shell=True)
+            check_call('dd if=/dev/zero of=%s bs=1M count=16'
+                % persistent, shell=True)
+            check_call('mkfs.ext4 -O ^metadata_csum %s' % persistent, shell=True)
+        except CalledProcessError:
+            call('rm -f %s' % persistent, shell=True)
+            raise
+
+    call('cp -f %s %s' % (persistent, fs_img), shell=True)
+    return fs_img
+
+@pytest.mark.boardspec('sandbox')
+@pytest.mark.buildconfigspec('cmd_nvedit_info')
+@pytest.mark.buildconfigspec('cmd_echo')
+@pytest.mark.buildconfigspec('env_is_in_ext4')
+def test_env_ext4(state_test_env):
+
+    c = state_test_env.u_boot_console
+
+    fs_img = mk_env_ext4(state_test_env)
+    c.run_command('host bind 0  %s' % fs_img)
+
+    response = c.run_command('ext4ls host 0:0')
+    assert 'uboot.env' not in response
+
+    """ env_location: ENVL_EXT4 (2)
+    """
+    response = c.run_command('env_loc 2')
+    assert 'Saving Environment to EXT4' in response
+
+    response = c.run_command('env_loc 2')
+    assert 'Loading Environment from EXT4... OK' in response
+
+    response = c.run_command('ext4ls host 0:0')
+    assert '8192 uboot.env' in response
+
+    response = c.run_command('env info')
+    assert 'env_valid = valid' in response
+    assert 'env_ready = true' in response
+    assert 'env_use_default = false' in response
+
+    response = c.run_command('env info -p -d')
+    assert 'Environment was loaded from persistent storage' in response
+    assert 'Environment can be persisted' in response
+
+    response = c.run_command('env info -d -q')
+    assert response == ""
+    response = c.run_command('echo $?')
+    assert response == "1"
+
+    response = c.run_command('env info -p -q')
+    assert response == ""
+    response = c.run_command('echo $?')
+    assert response == "0"
+
+    """ restore env_location: ENVL_NOWHERE (12)
+    """
+    c.run_command('env_loc 12')
+
+    response = c.run_command('env info')
+    assert 'env_valid = valid' in response
+    assert 'env_ready = true' in response
+    assert 'env_use_default = true' in response
+
+    response = c.run_command('env info -p -d')
+    assert 'Default environment is used' in response
+    assert 'Environment cannot be persisted' in response
+
+    call('rm -f %s' % fs_img, shell=True)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
