Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD21148536
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jan 2020 13:34:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85E90C36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jan 2020 12:34:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA583C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 12:34:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00OCXx7t000471; Fri, 24 Jan 2020 13:34:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=cpaQnj0+9xGpGDZVOokK5fyDdmIOG67qyto8aFn6xFM=;
 b=qLl+L8DIbY8iXJ4YTXrct4sx0xRrwdiAxbqzRp1BCmnjXPdQKJNAbKHMMxczz/4sCMKe
 CNsO1UyhcN5S/B6umgPAvVHOAJjJiel0O2WkGtuMlyTDKs+eqio0GJcOg4C5ZWiWjYeN
 +RRrOaY3GCzjeK8DHOEEDwiqq4FO+SYI/iIviVtRaiuMC3w/uQR62D7/gICrwnZn4s23
 5ecW2a7zY6I/slqWyfM9uN4fMRx6CnM93BeNjPQBiJx/BRFxr0Na1S1FWO2DdDHAdkTx
 37LdDQdUjrKC0s0/HECQZCyVVDigvZp7/8PAQ5ESoh4oOgkfa+387+K0XZFIotf7rbrf QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xksspfmhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jan 2020 13:33:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 24F6F10003B;
 Fri, 24 Jan 2020 13:33:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 133012A76F9;
 Fri, 24 Jan 2020 13:33:51 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 24 Jan 2020 13:33:50 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 24 Jan 2020 13:33:43 +0100
Message-ID: <20200124123346.32210-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200124123346.32210-1-patrick.delaunay@st.com>
References: <20200124123346.32210-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-24_03:2020-01-24,
 2020-01-24 signatures=0
Cc: Leo Ruan <tingquan.ruan@cn.bosch.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/5] cmd: env: use ENV_IS_IN_DEVICE in env info
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

Use the define ENV_IS_IN_DEVICE to test if one the
CONFIG_ENV_IS_IN_...  is defined and correct the detection of
persistent storage support in the command "env info"
if CONFIG_ENV_IS_NOWHERE is activated.

Since commit 60d5ed2593c9 ("env: allow ENV_IS_NOWHERE with
other storage target") test CONFIG_ENV_IS_NOWHERE is not
enough; see also commit 953db29a1e9c6 ("env: enable saveenv
command when one CONFIG_ENV_IS_IN is activated").

This patch avoids issue for this command in stm32mp1 platform.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 cmd/nvedit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cmd/nvedit.c b/cmd/nvedit.c
index aaa032cd96..3d1054e763 100644
--- a/cmd/nvedit.c
+++ b/cmd/nvedit.c
@@ -1268,7 +1268,7 @@ static int do_env_info(cmd_tbl_t *cmdtp, int flag,
 
 	/* evaluate whether environment can be persisted */
 	if (eval_flags & ENV_INFO_IS_PERSISTED) {
-#if defined(CONFIG_CMD_SAVEENV) && !defined(CONFIG_ENV_IS_NOWHERE)
+#if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
 		if (!quiet)
 			printf("Environment can be persisted\n");
 		eval_results |= ENV_INFO_IS_PERSISTED;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
