Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1B8490BC0
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Jan 2022 16:49:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA64CC5F1EB;
	Mon, 17 Jan 2022 15:49:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98B9BC5EC57
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jan 2022 15:49:31 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20HDQ2eA007719;
 Mon, 17 Jan 2022 16:49:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=pR9f8VvkY8ZIdXC/eibOWY0+fq7juczV1DV3uqu6vmU=;
 b=iiE3Duo60BG1Pt2hodDccInO0te4M1ILdbZ8Ri5Dc3Z17nAEoKnRTKs+HgnMb6eWguMt
 jVooyhwLPVPiIAwhazEafXuaubE+oO48O9HatGeH6I68vI9BccghCFkVDO7R0H3k6jIp
 u0LxAxgVJ/0jv/hHlJ9TJDqQFddId/tR9WGLIeRb/wYPdC+n/9JPW3MCWpuj45PK0hCa
 1/96L6ImMiMVXAtkDajAKoGjS2rPV9Y4+OyjAqLy1TyuecC6wEIjxewkLhiFGtYz/MKN
 aIWuY1SgT/SMvYOLApsD5IjRYs9PT+XEY8IiSpVrt6F9pEZf2U/aulCO8VVUxsoqjz42 Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dmwkwkpbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 16:49:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D9D6010002A;
 Mon, 17 Jan 2022 16:49:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D246521E670;
 Mon, 17 Jan 2022 16:49:29 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 16:49:29
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 17 Jan 2022 16:49:22 +0100
Message-ID: <20220117164919.v2.3.I8b2905e3dfc95c21afd004977b40787144509b5c@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117154922.1085936-1-patrick.delaunay@foss.st.com>
References: <20220117154922.1085936-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_07,2022-01-14_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH v2 3/3] sandbox: test: activate tests for the
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

Changes in v2:
- update commit message "sandox" => "sandbox"

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
