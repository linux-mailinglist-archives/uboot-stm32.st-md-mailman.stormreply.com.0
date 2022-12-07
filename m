Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89432645565
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Dec 2022 09:27:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37620C65E69;
	Wed,  7 Dec 2022 08:27:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE7BFC65E5D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 08:26:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B73eogq015913; Wed, 7 Dec 2022 09:26:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=UkE56VdiI10QkRVB+e6KC7Q1LxGe4Z5dhE8FHdXRMd8=;
 b=Rrn8doH86Roxa9HVljkliFx78jGk+AeYxB/1Cl8UF4gB3xU4E+jeTjnNg3sZ2MqpHHnZ
 l6VgndJvgIjOhTBXS0941d3sYvuGzdsrkmbfJ+DdBd5CmPWJniWo4/P7IbgG7mbt6UTh
 /AKmwbeBlc/u0fNr77zsc4++jvudQStR+mj68x4b8USqs2AL3iXhk3zhtsulojl+7AQ1
 qfg8zKjuHyl4EtFbIt/C8ORVxlKln77Bn8fwzIOyP8B4AKGF4CmY5qKIQMPH69/DkLjA
 yPE80qA/EBuDq5VlYskQrka1q4ciipGpX6h8g41rWOw3iGZ0DO+zuUR55iZXnjMYPD6K AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7vfexthd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 09:26:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 683A7100045;
 Wed,  7 Dec 2022 09:26:49 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BC4F42194C3;
 Wed,  7 Dec 2022 09:26:49 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 7 Dec
 2022 09:26:46 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 7 Dec 2022 09:26:40 +0100
Message-ID: <20221207092619.1.Ic1687807c70d49f6a2345db4e3da49341142584c@changeid>
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
 Hiremath Gireesh <Gireesh.Hiremath@in.bosch.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Govindaraji Sivanantham <Govindaraji.Sivanantham@in.bosch.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/5] configs: am333x_guardian: move
	MTDIDS_DEFAULT in defconfif
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

Replace MTDIDS_DEFAULT in config include file by CONFIG_MTDIDS_DEFAULT
in defonfig to complete the Kconfig migration

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/am335x_guardian_defconfig | 1 +
 include/configs/am335x_guardian.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/am335x_guardian_defconfig b/configs/am335x_guardian_defconfig
index fef4fd155100..0feac53c3509 100644
--- a/configs/am335x_guardian_defconfig
+++ b/configs/am335x_guardian_defconfig
@@ -64,6 +64,7 @@ CONFIG_SYS_DISABLE_AUTOLOAD=y
 CONFIG_CMD_BMP=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_CMD_MTDPARTS=y
+CONFIG_MTDIDS_DEFAULT="nand0=nand.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=nand.0:256k(SPL),256k(SPL.backup1),256k(SPL.backup2),256k(SPL.backup3),1m(u-boot),1m(u-boot.backup1),1m(u-boot-2),1m(u-boot-2.backup1),256k(u-boot-env),256k(u-boot-env.backup1),256k(splash-screen),-(UBI)"
 CONFIG_CMD_UBI=y
 # CONFIG_SPL_DOS_PARTITION is not set
diff --git a/include/configs/am335x_guardian.h b/include/configs/am335x_guardian.h
index 7c5e7ce475ef..a5b83b0c25dd 100644
--- a/include/configs/am335x_guardian.h
+++ b/include/configs/am335x_guardian.h
@@ -115,7 +115,6 @@
 			}
 #define CFG_SYS_NAND_ECCSIZE         512
 #define CFG_SYS_NAND_ECCBYTES        26
-#define MTDIDS_DEFAULT                  "nand0=nand.0"
 
 #endif /* CONFIG_MTD_RAW_NAND */
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
