Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9743F15AFCF
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:30:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CF00C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:30:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AA15C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:30:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CICiME001215; Wed, 12 Feb 2020 19:30:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=HAX7akF+EwBPK3DsIb46V9XzXI20N0NyBhEt5aaI8UY=;
 b=06AE3jhIyxjO01Z4n71jxshvdz7P9ctNLvkLmGWfFhG3laGa58NIvmMkeVPDPLi8ieYB
 nb1RsLdU4bSpB4wGic+aXQ/vxDTl6fuP+kXfS/7TqkXehsHY1C8APIMB/Rtrb1SZ6+W2
 /lYbRNQGhACptWC2+cJn9PtqgN0MGcpgl4659n+at1j5leZK8MCOAidP2BuHKWpFBDOO
 J+QZb7KDQFxT3FlNt0pn+gaEVreB07W5h5O0hBVjQgxk/kU9DjNx1Wjli+d2/Vf0rcqB
 RJMHsKhTpHJ7dxgm9K0CC1eOkFDS+oimINDsZB2+mwGjgt5cX/eGbvTXRNyaawor9lit +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uda026u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:30:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 999E410003E;
 Wed, 12 Feb 2020 19:30:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8F06C207403;
 Wed, 12 Feb 2020 19:30:29 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:30:28 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:30:17 +0100
Message-ID: <20200212183021.4844-7-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212183021.4844-1-patrick.delaunay@st.com>
References: <20200212183021.4844-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stephen Warren <swarren@nvidia.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 06/10] test: environment in ext4
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
