Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 106364FF9AD
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Apr 2022 17:05:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0DEDC6049B;
	Wed, 13 Apr 2022 15:05:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 670D0C5EC56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Apr 2022 15:05:16 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23DF1GpJ000822;
 Wed, 13 Apr 2022 17:05:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=viZdMyeUcMYcZ9zOrqrove2Pu8nFEMVl/eb6UhnZsco=;
 b=09yZZpPTnBRiTGB2l4qZl4w56wG4mUi3EKZ5Lj2zRHjmbRzP6ViHXdJ6nzhCWIL2TmkT
 871R3qu03RSmIPDFNW+tAfReyvoBPvd+B55CqqS+TsThNvegwqUSHUlcywXtw+F/AjSI
 RWYKIok+vkOmeh0w0UfsbnLaT6IpL6RyIcED/0HXCi/KjlxdNhJoATf441+C9pw0DTtt
 06vsi6JMjPJXBiVbyQ8pyD31A6bEwAmKpP0hid9ZuVgCJiSsS3djTUUrqg9l41m0TMu9
 64oKcgP5qQN4m8EmENN9yeyVArvegtb/oq/kl3NbE42kMudH/zYmlwMYG11IiVTCzGTM wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fb74qeuev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Apr 2022 17:05:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 13F80100034;
 Wed, 13 Apr 2022 17:05:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E3EA221789;
 Wed, 13 Apr 2022 17:05:15 +0200 (CEST)
Received: from localhost (10.75.127.47) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 13 Apr
 2022 17:05:14 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 13 Apr 2022 17:04:49 +0200
Message-ID: <20220413150500.23883-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220413150500.23883-1-patrice.chotard@foss.st.com>
References: <20220413150500.23883-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-13_02,2022-04-13_01,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v1 01/12] configs: stm32f746-disco:
	Concatenate spl and u-boot binaries
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

This allows to concatenate spl and u-boot binaries together.
Previously, both binaries has to be flashed separately at the correct
offset (spl at offset 0 and u-boot at offset 0x8000).
With this patch, only one binary is generated (u-boot-with-spl.bin)
and has to be copied in flash at offset 0 using openocd for example
or simply copied in exported mass storage.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32f746-disco_defconfig | 1 +
 include/configs/stm32f746-disco.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_defconfig
index ee7e3293ad..aabffac75f 100644
--- a/configs/stm32f746-disco_defconfig
+++ b/configs/stm32f746-disco_defconfig
@@ -9,6 +9,7 @@ CONFIG_DEFAULT_DEVICE_TREE="stm32f746-disco"
 CONFIG_SPL_TEXT_BASE=0x8000000
 CONFIG_STM32F7=y
 CONFIG_TARGET_STM32F746_DISCO=y
+CONFIG_BUILD_TARGET="u-boot-with-spl.bin"
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_LOAD_ADDR=0x8008000
 CONFIG_BOOTDELAY=3
diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
index 8ad4bb99c8..b93acdcc1f 100644
--- a/include/configs/stm32f746-disco.h
+++ b/include/configs/stm32f746-disco.h
@@ -49,6 +49,7 @@
 #define CONFIG_SYS_UBOOT_START		0x080083FD
 #define CONFIG_SYS_UBOOT_BASE		(CONFIG_SYS_FLASH_BASE + \
 					 CONFIG_SYS_SPL_LEN)
+#define CONFIG_SPL_PAD_TO		0x8000
 
 /* DT blob (fdt) address */
 #define CONFIG_SYS_FDT_BASE		(CONFIG_SYS_FLASH_BASE + \
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
