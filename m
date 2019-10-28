Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94013E728D
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Oct 2019 14:23:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4ED1AC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Oct 2019 13:23:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2545FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Oct 2019 13:23:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9SDLRL8020817; Mon, 28 Oct 2019 14:23:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=hlHIRrmuju0p8Kc7Blyj0zDLXb1JjXYx+b9ADOQcc28=;
 b=1TKJOsD4vAUAo2vDbTWoERtiV0IYe+0aUW9OyRJetGLbYUeM6LEswsP6eLcckKOnoOdr
 aZ2ar+gTvdM5TuFwpOenNguCKKbHHFDLDqfc54l2sYyM0lBPSk8CHPUyu+HLKbQkpsz1
 8PUIZMvL0q2ACEIncOkR/sMrOS8z3krX/7nBedA3U12Esf5v2pICcRenuL/Tg1NI3wXg
 xVUJoshNWSk5kEOfeWgrRMaym7L7P/kA+BIfQoLwRNnQfx694SR20oPsyIo2p/nHgvcm
 F5GBEU0N62QGnND0EWl8JsJyIIsPGRQ+tZomsqZoqYK/SQgDK5OJ4xvjJQO63KR6Bcbi /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vvb98af0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Oct 2019 14:23:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D662210002A;
 Mon, 28 Oct 2019 14:23:22 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC2052BF515;
 Mon, 28 Oct 2019 14:23:22 +0100 (CET)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 28 Oct
 2019 14:23:22 +0100
Received: from localhost (10.201.23.73) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 28 Oct 2019 14:23:22
 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Oct 2019 14:23:19 +0100
Message-ID: <20191028132319.21570-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.23.73]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-28_05:2019-10-25,2019-10-28 signatures=0
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, Stefan Roese <sr@denx.de>,
 Chris
 Packham <judge.packham@gmail.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Anup Patel <anup.patel@wdc.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>, Heiko Schocher <hs@denx.de>,
 Adam Ford <aford173@gmail.com>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>
Subject: [Uboot-stm32] [PATCH] cmd: remove NET and CMD_NET dependency for
	CMD_PXE
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

It allows to use sysboot command on board which have no NET support.

Currently, sysboot command can't be used if CMD_NET and NET flags are
not set, while sysboot allows to load extlinux.conf file from local
filesystem, so it doesn't need to depend of CMD_NET and NET flags.

One solution would be to put sysboot command's code outside pxe.c and
create a new sysboot.c file. But sysboot command code is imbricated
with pxe command code and as all CMD_NET relative code is already under
CMD_NET flag, the easiest way to break sysboot dependency with CMD_NET
and NET flags is to move CMD_PXE outside CMD_NET and NET section in
Kconfig.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 Kconfig     |  2 +-
 cmd/Kconfig | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Kconfig b/Kconfig
index 66b059f749..ce2ad16ea5 100644
--- a/Kconfig
+++ b/Kconfig
@@ -87,7 +87,7 @@ config DISTRO_DEFAULTS
 	select CMD_FS_GENERIC
 	select CMD_PART if PARTITIONS
 	select CMD_PING if CMD_NET
-	select CMD_PXE if NET
+	select CMD_PXE
 	select ENV_VARS_UBOOT_CONFIG
 	select HUSH_PARSER
 	select SUPPORT_RAW_INITRD
diff --git a/cmd/Kconfig b/cmd/Kconfig
index 07060c63a7..2cb0935632 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -1499,12 +1499,6 @@ config CMD_ETHSW
 	  operations such as enabling / disabling a port and
 	  viewing/maintaining the filtering database (FDB)
 
-config CMD_PXE
-	bool "pxe"
-	select MENU
-	help
-	  Boot image via network using PXE protocol
-
 config CMD_WOL
 	bool "wol"
 	help
@@ -1636,6 +1630,12 @@ config CMD_MISC
 	help
 	  Delay execution for some time
 
+config CMD_PXE
+	bool "pxe"
+	select MENU
+	help
+	  Boot image via network using PXE protocol or via local extlinux.conf file
+
 config MP
 	bool "support for multiprocessor"
 	help
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
