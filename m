Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EB5DED20
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2019 15:08:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6409C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2019 13:08:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88C49C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2019 13:08:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9LD6jpO025063; Mon, 21 Oct 2019 15:08:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=pwKqNvzNOmR3dKy9VMqzT5NEpf/zU/pOdmO2mARBS84=;
 b=E82jvqI1e8Hubm3xevdXhbsmkNEjOl7FoZ3jZV+DDw068Vn5JgzEwzi4/e9Lx9+KYnCP
 vvid7qjKF0AvwrY0ZE9XWjoMOWlYT4iRZDPz+Vlp7l6/E2fp1HOfISAYLcG7cLMPtSZ7
 33V+ttuadILSDMG8J1hgYF1w03iPmcydE1E6yeZxOygTmGgpxfDj85KM7JQ8Y7+TGcUd
 qb76hsSjMNufzFtgrb+0lUOGpS4Au1AcdXWP92sPFwz7mSCyWDYCY0EpLX7/iFoCsBtj
 TfCz3LtKEbF6GgqBdTCul4im6mNKXkIRRFLQxTstry2iRHxzOmphL4VqHfffggUdJk8T rQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vqwxy138e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2019 15:08:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BB8E10002A;
 Mon, 21 Oct 2019 15:08:12 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ED72B2C2288;
 Mon, 21 Oct 2019 15:08:11 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 21 Oct
 2019 15:08:12 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 21 Oct 2019 15:08:08
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 21 Oct 2019 15:07:54 +0200
Message-ID: <20191021130754.32466-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-21_04:2019-10-21,2019-10-21 signatures=0
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>, Gregory
 CLEMENT <gregory.clement@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 David Wu <david.wu@rock-chips.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Chris Packham <judge.packham@gmail.com>, Simon Glass <sjg@chromium.org>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>
Subject: [Uboot-stm32] [PATCH] pinctrl: Kconfig: remove duplicated nodes
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

Remove the duplicated configs introduced when the same patch is
applied twice times:
- commit e878b53a79d1 ("dm: pinctrl: introduce PINCONF_RECURSIVE
  option")
- commit c20851b3d850 ("dm: pinctrl: introduce PINCONF_RECURSIVE
  option")


Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/pinctrl/Kconfig | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 6b41f66a86..deee92411c 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -75,22 +75,6 @@ config PINCONF_RECURSIVE
 	  configuration; you can save memory footprint when this feature is
 	  no needed.
 
-config PINCONF_RECURSIVE
-	bool "Support recursive binding for pin configuration nodes"
-	depends on PINCTRL_FULL
-	default n if ARCH_STM32MP
-	default y
-	help
-	  In the Linux pinctrl binding, the pin configuration nodes need not be
-	  direct children of the pin controller device (may be grandchildren for
-	  example). It is define is each individual pin controller device.
-	  Say Y here if you want to keep this behavior with the pinconfig
-	  u-class: all sub are recursivelly bounded.
-	  If the option is disabled, this behavior is deactivated and only
-	  the direct children of pin controller will be assumed as pin
-	  configuration; you can save memory footprint when this feature is
-	  no needed.
-
 config SPL_PINCTRL
 	bool "Support pin controllers in SPL"
 	depends on SPL && SPL_DM
@@ -145,15 +129,6 @@ config SPL_PINCONF_RECURSIVE
 	  This option is an SPL-variant of the PINCONF_RECURSIVE option.
 	  See the help of PINCONF_RECURSIVE for details.
 
-config SPL_PINCONF_RECURSIVE
-	bool "Support recursive binding for pin configuration nodes in SPL"
-	depends on SPL_PINCTRL_FULL
-	default n if ARCH_STM32MP
-	default y
-	help
-	  This option is an SPL-variant of the PINCONF_RECURSIVE option.
-	  See the help of PINCONF_RECURSIVE for details.
-
 if PINCTRL || SPL_PINCTRL
 
 config PINCTRL_AR933X
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
