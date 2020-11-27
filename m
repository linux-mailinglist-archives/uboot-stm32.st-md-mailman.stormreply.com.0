Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C202C62F3
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Nov 2020 11:21:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BBC8C56632;
	Fri, 27 Nov 2020 10:21:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38592C56633
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 10:21:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0ARAICVc030799; Fri, 27 Nov 2020 11:21:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=iNO7Vb41gSgFonSD1mVtLqE0kEyaFTGZ1Eh783KVrMY=;
 b=KIUhq/yorbt1TTLduGxyOCu2vvkXG3Jqc9nb8AyVovKgDWsNLF8ZZXuRnHLegVp2vJoB
 qzcd7ofIgp4nIPJyA+dDTgbqzhRJtc6r4scrdAY8HJh7shpswKpzhrAeBs90fgLw7Mkx
 l2hKhNEEJyJ3Z14SIcBTHsIrKwVWfZ4XH7Nt9znXMwUZ/4lUq6pcUv2mlViU5uAsIWpt
 YGrk+909pFdSo3WRFK2mfzJufMMRC+tSmzv4EHXhRt/jzx71eRPvqdr2sVVuGzlWm2Iz
 mBEBJnY/FVGsqkpPatvd2lLehh9hRCGY+1k/63HTWKXXCBkzHIcWoAI8V8uCMbzE6noO iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0hjw0mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 11:21:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B89D310002A;
 Fri, 27 Nov 2020 11:21:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C6180238DE8;
 Fri, 27 Nov 2020 11:21:09 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 27 Nov 2020 11:21:09
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Nov 2020 11:20:55 +0100
Message-ID: <20201127112000.v2.5.Ic62431f5da403756a2cdf753ce3656555a4263af@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201127102100.11721-1-patrick.delaunay@st.com>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_05:2020-11-26,
 2020-11-27 signatures=0
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH v2 5/9] test: add test for dropped trace
	before log_init
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

Add test for dropped trace before log_init, displayed by debug uart.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- Add test of displayed messages requested before log_init (NEW)

 arch/sandbox/cpu/start.c  |  5 +++++
 test/py/tests/test_log.py | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/sandbox/cpu/start.c b/arch/sandbox/cpu/start.c
index a03e5aa0b3..c5184d59be 100644
--- a/arch/sandbox/cpu/start.c
+++ b/arch/sandbox/cpu/start.c
@@ -8,6 +8,7 @@
 #include <dm/root.h>
 #include <errno.h>
 #include <init.h>
+#include <log.h>
 #include <os.h>
 #include <cli.h>
 #include <sort.h>
@@ -465,6 +466,10 @@ int main(int argc, char *argv[])
 	 */
 	gd->reloc_off = (ulong)gd->arch.text_base;
 
+	/* sandbox test: log functions called before log_init in board_init_f */
+	log_info("sandbox: starting...\n");
+	log_debug("debug: %s\n", __func__);
+
 	/* Do pre- and post-relocation init */
 	board_init_f(0);
 
diff --git a/test/py/tests/test_log.py b/test/py/tests/test_log.py
index 387b392ce9..f889120f2b 100644
--- a/test/py/tests/test_log.py
+++ b/test/py/tests/test_log.py
@@ -36,3 +36,14 @@ def test_log_format(u_boot_console):
         run_with_format('FLfm', 'file.c:123-func() msg')
         run_with_format('lm', 'NOTICE. msg')
         run_with_format('m', 'msg')
+
+@pytest.mark.buildconfigspec('debug_uart')
+@pytest.mark.boardspec('sandbox')
+def test_log_dropped(u_boot_console):
+    """Test dropped 'log' message when debug_uart is activated"""
+
+    cons = u_boot_console
+    cons.restart_uboot()
+    output = cons.get_spawn_output().replace('\r', '')
+    assert 'sandbox: starting...' in output
+    assert (not 'debug: main' in output)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
