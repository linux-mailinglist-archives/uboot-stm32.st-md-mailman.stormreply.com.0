Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1705A48B218
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Jan 2022 17:27:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD571C5F1F5;
	Tue, 11 Jan 2022 16:27:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87FC3C5F1FC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jan 2022 16:27:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20BFmohQ022168;
 Tue, 11 Jan 2022 17:27:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=2bvt+DNovOiUL9hbd+35yx1hcNH8fMXJ/t3JyNEuk68=;
 b=lDF3UDsNmdCpJMOV8ExxXLL5aNTN3dT3xCbrtLlH8NXLxDyIb2B9+zWWJwQPz3WCYNrL
 OoYtToI2+gxsubFM6w5psZqiaUiOfLCemGbQBvQk1Z+ETi0S2T3Z1FKQbK6XNXhia2/C
 TRemzBiDmjd/n4GZnEPo3n6ncpmnnRcwgLk2YSygsLN3VrSMzUxDnUR/cpZxjny+IgPF
 kjWVG/9E75mB75kWmhK81smuG/Et/g0JUVIdW0l++2A6O3ZDWy6kfV8ErCktNi3T/oPH
 xDX/AYebZ+y2EFHAHn94ZkiDLOOTGA3/NdD8YE84YQj9GhzI6OYJioYdsqaAq1iISUHZ Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dh2m5uvyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 17:27:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A782A10002A;
 Tue, 11 Jan 2022 17:27:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A036E231237;
 Tue, 11 Jan 2022 17:27:17 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 11 Jan 2022 17:27:17
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 11 Jan 2022 17:27:13 +0100
Message-ID: <20220111172710.3.I8b2905e3dfc95c21afd004977b40787144509b5c@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111162713.632395-1-patrick.delaunay@foss.st.com>
References: <20220111162713.632395-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_04,2022-01-11_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 3/3] sandox: test: activate tests for the
	command LOG
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

Activate the CONFIG_CMD_LOG in sandbox to execute the LOG tests
by default and correct the test log format after 72fa1ad8d9 ("log: Allow
padding of the function name").

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/sandbox_defconfig | 2 +-
 test/py/tests/test_log.py | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index 4f413582fb..a4aeee062f 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -30,7 +30,6 @@ CONFIG_AUTOBOOT_STOP_STR_CRYPT="$5$rounds=640000$HrpE65IkB8CM5nCL$BKT3QdF98Bo8fJ
 CONFIG_CONSOLE_RECORD=y
 CONFIG_CONSOLE_RECORD_OUT_SIZE=0x1000
 CONFIG_PRE_CONSOLE_BUFFER=y
-CONFIG_LOG=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
 CONFIG_MISC_INIT_F=y
 CONFIG_STACKPROTECTOR=y
@@ -108,6 +107,7 @@ CONFIG_CMD_CRAMFS=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_CMD_SQUASHFS=y
 CONFIG_CMD_MTDPARTS=y
+CONFIG_CMD_LOG=y
 CONFIG_CMD_STACKPROTECTOR_TEST=y
 CONFIG_MAC_PARTITION=y
 CONFIG_AMIGA_PARTITION=y
diff --git a/test/py/tests/test_log.py b/test/py/tests/test_log.py
index 140dcb9aa2..20a3e56301 100644
--- a/test/py/tests/test_log.py
+++ b/test/py/tests/test_log.py
@@ -27,13 +27,13 @@ def test_log_format(u_boot_console):
 
     cons = u_boot_console
     with cons.log.section('format'):
-        run_with_format('all', 'NOTICE.arch,file.c:123-func() msg')
+        run_with_format('all', 'NOTICE.arch,file.c:123-                func() msg')
         output = cons.run_command('log format')
         assert output == 'Log format: clFLfm'
 
-        run_with_format('fm', 'func() msg')
-        run_with_format('clfm', 'NOTICE.arch,func() msg')
-        run_with_format('FLfm', 'file.c:123-func() msg')
+        run_with_format('fm', '                func() msg')
+        run_with_format('clfm', 'NOTICE.arch,                func() msg')
+        run_with_format('FLfm', 'file.c:123-                func() msg')
         run_with_format('lm', 'NOTICE. msg')
         run_with_format('m', 'msg')
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
