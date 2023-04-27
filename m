Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF536F06BB
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Apr 2023 15:36:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07092C6A5E7;
	Thu, 27 Apr 2023 13:36:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46012C6907A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 13:36:52 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RA1gXl023705; Thu, 27 Apr 2023 15:36:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=T6Qul6gJmvku2nnFW0VyHzwOWi0kC1gLrkTQ9cguXTg=;
 b=gKtG5tf1NhEOj4JzqV66PRUqvz1C7cD4gX/ZPGRiSN85XkKntvc/OOPp6h1XP3ZvsngX
 YotJP720wanWTSTUJVOzXgCaGVX29cjhVMVCXT7aHkP1RY3YZC+5/IwZ2tjF06HSCBhU
 LaSCpaHcYJRGDX8zMxAar9Hhe0jyyWhOGWOJ+xBJ84G4rm9oLH2gzGGRcSlYqY1fRMqZ
 6eXYmoULt3Bmx+0sm5IeikdVBADdEF8AH7cfyessAU1rArLsX4013kfWI7VUxpvY47k6
 /SQnXWjh9aZX1rNVreo6Zv/Jo/GFgqyH4qhHac26xNAYVEoF1VwYHcSwQg2ZI1CBzvqB YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q5t4vywd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 15:36:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 145FC10002A;
 Thu, 27 Apr 2023 15:36:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E853226FD5;
 Thu, 27 Apr 2023 15:36:51 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 27 Apr
 2023 15:36:50 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 27 Apr 2023 15:36:35 +0200
Message-ID: <20230427153632.3.Ib054753be65d3ea7a0b3fd189c0a0422d19b37c2@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427133638.1477556-1-patrick.delaunay@foss.st.com>
References: <20230427133638.1477556-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_07,2023-04-27_01,2023-02-09_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 3/6] configs: stm32mp1: reduce
	DDR_CACHEABLE_SIZE to supported 256MB DDR
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

Reduces the CONFIG_DDR_CACHEABLE_SIZE, the size of DDR mapped cacheable
before relocation, to support DDR with only 256MB because the OP-TEE
reserved memory is located at end of the DDR.

By default the new size of 128MB cacheable memory is enough
in dram_bank_mmu_setup() for early_enable_caches() in arch_cpu_init()
and is correct for DDR size = 256MB.

After relocation the real size of DDR, excluding the no-map reserved
memory, is used after the U-Boot device tree parsing.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/stm32mp13_defconfig | 2 +-
 configs/stm32mp15_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index b076573c450f..4c1e412af0e6 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -7,7 +7,7 @@ CONFIG_ENV_OFFSET=0x900000
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp135f-dk"
 CONFIG_SYS_PROMPT="STM32MP> "
 CONFIG_STM32MP13x=y
-CONFIG_DDR_CACHEABLE_SIZE=0x10000000
+CONFIG_DDR_CACHEABLE_SIZE=0x8000000
 CONFIG_CMD_STM32KEY=y
 CONFIG_TARGET_ST_STM32MP13x=y
 CONFIG_ENV_OFFSET_REDUND=0x940000
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index a8eda7b4ad88..b912d6735bc0 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -7,7 +7,7 @@ CONFIG_ENV_OFFSET=0x480000
 CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
 CONFIG_SYS_PROMPT="STM32MP> "
-CONFIG_DDR_CACHEABLE_SIZE=0x10000000
+CONFIG_DDR_CACHEABLE_SIZE=0x8000000
 CONFIG_CMD_STM32KEY=y
 CONFIG_TYPEC_STUSB160X=y
 CONFIG_TARGET_ST_STM32MP15x=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
