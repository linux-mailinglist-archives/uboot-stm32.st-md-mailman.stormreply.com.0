Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BC6646A24
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Dec 2022 09:10:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F11BC65067;
	Thu,  8 Dec 2022 08:10:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FC48C63327
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Dec 2022 08:10:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B87GCRg015549; Thu, 8 Dec 2022 09:10:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=xnhesvEBF9rWLHjF8CQCkE/J1MKZS0UXPh3XKktqL7c=;
 b=ZVeFoIo4FmmdPXt/GAv5G2PSDmHgkg1fIs71K6sM65GTbrcQ0a94lJEsxAJZojqEeczV
 Cxo7vqHRFWUIdUZstIRuzrWJ7Cp+ET5cTBb3oUn1CC9eBNUskajNXIy0+W3XLQnfbboh
 gPB8UquHsdKF8HNKvRztIZujV/ixnSNTwy8zBexyK/jTaJ6Px7P43ZmklovPrqfKdBbi
 KoXsYqn6r+bfLtZlqJjOwlnfLLmb0FY13syw+BbK4X02sPZHbeiYHuWJbdcueZ3A8Y43
 ftz0eflCeWfKQq47h7HCVY3735gBLiMehFezIujyOhZHYKE06mbYVmKjBWU0eXQDO4yX Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7vff5u7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Dec 2022 09:10:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE1DB100034;
 Thu,  8 Dec 2022 09:10:18 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E6E3216ECF;
 Thu,  8 Dec 2022 09:10:18 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 8 Dec
 2022 09:10:15 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 8 Dec 2022 09:10:13 +0100
Message-ID: <20221208091010.1.I87acf9c65e708df1d5a45a57ce8508a14dfeb6a6@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_04,2022-12-07_01,2022-06-22_01
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH] cmd: mtdparts: add SYS_MTDPARTS_RUNTIME
	dependency on CONFIG_MTDIDS/MTDPARTS_DEFAULT
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

The two configuration CONFIG_MTDIDS_DEFAULT and CONFIG_MTDPARTS_DEFAULT
are not needed with mtd configuration CONFIG_SYS_MTDPARTS_RUNTIME which
allows the MTDIDS and MTDPARTS to be configured at runtime.

This patch has no defconfig impacts because CONFIG_SYS_MTDPARTS_RUNTIME
is only used by two platforms (stm32mp and igep00x0) which don't define
CONFIG_MTDIDS_DEFAULT or CONFIG_MTDPARTS_DEFAULT.

This patch solves an UBI environment load issue for NAND boot for
stm32mp15 platform. In mtd_uboot.c, when GD_FLG_ENV_READY is not set,
env_get_f() return a EMPTY string, define in default_environment[]
because CONFIG_MTDIDS_DEFAULT="" and CONFIG_MTDPARTS_DEFAULT="",
but a NULL pointer is expected to allow call of board_mtdparts_default.
Without mtdparts, the env partition [CONFIG_ENV_UBI_PART="UBI"] is not
found in env/ubi.c [CONFIG_ENV_IS_IN_UBI].

It is not a problem when env becomes ready, as these empty variables are
removed form U-Boot environment in env_import() / himport_r().

Fixes: a331017c237c ("Complete migration of MTDPARTS_DEFAULT / MTDIDS_DEFAULT, include in environment")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 cmd/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/cmd/Kconfig b/cmd/Kconfig
index d93731f2af68..cae6ed22fcd1 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -2535,6 +2535,7 @@ config CMD_MTDPARTS_SHOW_NET_SIZES
 config MTDIDS_DEFAULT
 	string "Default MTD IDs"
 	depends on MTD || SPI_FLASH
+	depends on !SYS_MTDPARTS_RUNTIME
 	help
 	  Defines a default MTD IDs list for use with MTD partitions in the
 	  Linux MTD command line partitions format.
@@ -2542,6 +2543,7 @@ config MTDIDS_DEFAULT
 config MTDPARTS_DEFAULT
 	string "Default MTD partition scheme"
 	depends on MTD || SPI_FLASH
+	depends on !SYS_MTDPARTS_RUNTIME
 	help
 	  Defines a default MTD partitioning scheme in the Linux MTD command
 	  line partitions format
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
