Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC8299A7ED
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Oct 2024 17:37:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1B45C71290;
	Fri, 11 Oct 2024 15:37:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A64CFC7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2024 15:37:16 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BCt8Qb031159;
 Fri, 11 Oct 2024 17:37:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=QOWW2njjRQrA0UyVMHaJ9X
 UMQVfBxS+nd4Dl+S5nKlM=; b=qELgqY5X3jdmr7pv8lXHLM29gHzmUU63dfAOLK
 TT7QMiTRHf0Kb+/0ki+NaFDZSPYrDyFxKF0LsfcnOdat+Pn0qm8Qltx+yv2QJgzQ
 reZb1fGFIN+fNrJm+RIykFoLYNX/2lW3I3W/PWDPQR+7M1Z2b02+oZI8W9GLZ6KZ
 UWJK90FWgj2bwXaNO2diYhOTP3fKptvsV8MbGBmMc2vdt763kj2Dt0D+9Sgqbm8Y
 ZD2+/lFk20IA8JMX8gL0qClb1pkEuztHekvrw5FmBr+aHivKgRs9y/y2jHwGKP28
 m+5toQVD4PAC0if3Mi65+ljI6vRoV9aJ7mn8bLZF/BaOKSNg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 425q5wd23x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2024 17:37:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BFF3A4004D;
 Fri, 11 Oct 2024 17:35:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 144A2289F15;
 Fri, 11 Oct 2024 17:32:16 +0200 (CEST)
Received: from localhost (10.48.86.243) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 11 Oct
 2024 17:32:15 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 11 Oct 2024 17:31:47 +0200
Message-ID: <20241011153152.1637303-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.243]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Vikas Manocha <vikas.manocha@st.com>, Igor Opaniuk <igor.opaniuk@foundries.io>,
 Simon Glass <sjg@chromium.org>, Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dillon Min <dillon.minfei@gmail.com>,
 Etienne CARRIERE <etienne.carriere@foss.st.com>
Subject: [Uboot-stm32] [PATCH 0/4] stm32mp: fix boot issue with OP-TEE
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


The series fix several issues for STM32MP15 boot with OP-TEE
(data abort and ETZPC firewall exception) and regressions for
STM32MP25 support.



Patrick Delaunay (4):
  stm32mp: compute ram_top based on the optee base address only for
    STM32MP1
  ARM: stm32mp: enable data cache after LMB configuration for STM32MP1
  doc: clarify scmi device tree for stm32mp15 boards
  stm32mp: fix name of optee reserved memory node

 arch/arm/mach-stm32mp/Kconfig        |  2 ++
 arch/arm/mach-stm32mp/dram_init.c    | 19 ++++++++++++++-----
 arch/arm/mach-stm32mp/stm32mp1/cpu.c |  7 +++++++
 doc/board/st/stm32mp1.rst            | 25 ++++++++++++++++++++++---
 4 files changed, 45 insertions(+), 8 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
