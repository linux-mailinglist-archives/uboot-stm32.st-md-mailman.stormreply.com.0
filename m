Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EAA645566
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Dec 2022 09:27:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44D45C65E6B;
	Wed,  7 Dec 2022 08:27:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15D13C65E69
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 08:27:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B73eoKZ015901; Wed, 7 Dec 2022 09:26:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=IXcKSxIeyeZeevjdJzbs3fpGsbtEyv90XYDx5xXsI9k=;
 b=hLFCwtz7v4rzhAvepyMjGNJrJ0TsQ/z3u/BgyCfmGUAcRTJk+J3epT4eeAkVAum4IDa2
 4PaA24vz0Y4B5jlTKinuZr1MV/Pf1G3xA6AKvQ37QCQUHNIFILxceQDTEy42Ib1Wn30U
 uPxEDOWH8H5rRtj4EfZ6dsFOWSbuhNsZJJECbiv4gkkXzudUESOZRkv1mUDVP/9MZiuC
 SvACw0MDXFJ5RqIqYkPMhsp37t4e+n24xZpJQWscVjt7j5GWIpkAcoBQGTsKF/LJBipS
 W1Rg+b1aqZUspi5oVYGIzdXDvIcYjnhqqKLqfiCtDRaMs+GXcGwu15VTC4ANkRFhmMQj Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7vfexth4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 09:26:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 98B4D10003E;
 Wed,  7 Dec 2022 09:26:48 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 938AD2194C9;
 Wed,  7 Dec 2022 09:26:48 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 7 Dec
 2022 09:26:47 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 7 Dec 2022 09:26:41 +0100
Message-ID: <20221207092619.2.I849d172d58c5b8ac785a9fd4e1ad3d0fec2f22ad@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221207082644.3515486-1-patrick.delaunay@foss.st.com>
References: <20221207082644.3515486-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_04,2022-12-06_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [Uboot-stm32] [PATCH 2/5] configs: x530: move
	MTDPART/MTDIDS_DEFAULT in defconfig
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

Replace MTDIDS_DEFAULT and MTDPARTS_DEFAULT in the config include file by
CONFIG_MTDIDS_DEFAULT and CONFIG_MTDPARTS_DEFAULT in defconfig to complete
the Kconfig migration.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/x530_defconfig | 2 ++
 include/configs/x530.h | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/x530_defconfig b/configs/x530_defconfig
index 2f8be2fcd776..70c08adcde97 100644
--- a/configs/x530_defconfig
+++ b/configs/x530_defconfig
@@ -57,6 +57,8 @@ CONFIG_CMD_EXT4=y
 CONFIG_CMD_FAT=y
 CONFIG_CMD_FS_GENERIC=y
 CONFIG_CMD_MTDPARTS=y
+CONFIG_MTDIDS_DEFAULT="nand0=nand"
+CONFIG_MTDPARTS_DEFAULT="mtdparts=nand:240M(user),8M(errlog),8M(nand-bbt)"
 CONFIG_CMD_UBI=y
 CONFIG_ENV_OVERWRITE=y
 CONFIG_ARP_TIMEOUT=200
diff --git a/include/configs/x530.h b/include/configs/x530.h
index dee87cb77325..c213dc6074b0 100644
--- a/include/configs/x530.h
+++ b/include/configs/x530.h
@@ -32,8 +32,6 @@
 
 /* SPI NOR flash default params, used by sf commands */
 
-#define MTDIDS_DEFAULT			"nand0=nand"
-#define MTDPARTS_DEFAULT		"mtdparts=nand:240M(user),8M(errlog),8M(nand-bbt)"
 #define MTDPARTS_MTDOOPS		"errlog"
 
 /* Partition support */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
