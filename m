Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2FE1FAA1C
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 09:41:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAF14C36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 07:41:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6010C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 07:41:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05G7e7l2028817; Tue, 16 Jun 2020 09:40:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=trDbTbr+tpg5eY91k0ud508mdbsi2D7D3/7TyxwdArc=;
 b=gMZBMC9A8EsxT6rLpVFts7BtWCRFJYBjb7/CAPp8JYI5gixKIVK6MSu/xRIKTHDF0nxv
 xVBOKnrUugcN82iBYYMjiwBHk4To98Rkj9SA2aw6T5v466h6lNWLXSHZe+aAYWqQT2CR
 jukVJ/pIcB/vUCOfe6dE2zgfedNxUWWbNaS4y2cI9oH7DIz7x1pCSDusGO6kWtbWtZLR
 7VedypeyIDbsYmI5/wPh9LGmAwev0Km1r9KuvVdpOf+6QqdrFHc3efVqAE34P1P5VHcR
 0t5aY2GANt4v2SWlrx3jq/4XTFnHJqBtX0awLjbHbnK8MTzB637hiiLpQ12Qy9O87YPB nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mnph5mqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 09:40:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6365D100038;
 Tue, 16 Jun 2020 09:40:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 592A42AEF93;
 Tue, 16 Jun 2020 09:40:54 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 16 Jun 2020 09:40:54 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 16 Jun 2020 09:40:44 +0200
Message-ID: <20200616074048.7898-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616074048.7898-1-patrick.delaunay@st.com>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_02:2020-06-15,
 2020-06-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 5/9] sandbox: support the change of env
	location
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

Add support of environment location with a new sandbox command
'env_loc'.

When the user change the environment location with the command
'env_loc <location>' the env is reinitialized and saved;
the GD_FLG_ENV_DEFAULT flag is also updated.

When the user set the same env location, the environment is
re-loaded.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- change cmd_tbl_t to struct cmd_tbl

 board/sandbox/sandbox.c | 42 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/board/sandbox/sandbox.c b/board/sandbox/sandbox.c
index 9cb5fe5c75..bd99141fa8 100644
--- a/board/sandbox/sandbox.c
+++ b/board/sandbox/sandbox.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <command.h>
 #include <cpu_func.h>
 #include <cros_ec.h>
 #include <dm.h>
@@ -21,6 +22,9 @@
  */
 gd_t *gd;
 
+/* env location: current location used during test */
+static enum env_location sandbox_env_location = ENVL_NOWHERE;
+
 /* Add a simple GPIO device */
 U_BOOT_DEVICE(gpio_sandbox) = {
 	.name = "gpio_sandbox",
@@ -53,9 +57,45 @@ enum env_location env_get_location(enum env_operation op, int prio)
 
 	gd->env_load_prio = 0;
 
-	return ENVL_NOWHERE;
+	return sandbox_env_location;
 }
 
+static int do_env_loc(struct cmd_tbl *cmdtp, int flag, int argc,
+		      char * const argv[])
+{
+	enum env_location loc;
+
+	if (argc < 2)
+		return CMD_RET_USAGE;
+
+	loc = (enum env_location)simple_strtoul(argv[1], NULL, 10);
+	if (loc >= ENVL_COUNT)
+		return CMD_RET_FAILURE;
+
+	if (sandbox_env_location != loc) {
+		sandbox_env_location = loc;
+		if (loc == ENVL_NOWHERE) {
+			gd->flags |= GD_FLG_ENV_DEFAULT;
+			gd->env_valid = ENV_VALID;
+		} else {
+			if (gd->flags & GD_FLG_ENV_DEFAULT) {
+				gd->flags &= ~GD_FLG_ENV_DEFAULT;
+				if (!env_init())
+					env_save();
+			}
+		}
+	} else {
+		if (!env_init())
+			env_load();
+	}
+
+	return CMD_RET_SUCCESS;
+}
+
+U_BOOT_CMD(env_loc, 2, 1, do_env_loc,
+	   "set the environment location", "[loc]"
+);
+
 int dram_init(void)
 {
 	gd->ram_size = CONFIG_SYS_SDRAM_SIZE;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
