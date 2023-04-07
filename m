Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D366DAB00
	for <lists+uboot-stm32@lfdr.de>; Fri,  7 Apr 2023 11:37:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AD53C6B444;
	Fri,  7 Apr 2023 09:37:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96564C6B443
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Apr 2023 09:37:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3377cJ1J015383; Fri, 7 Apr 2023 11:37:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=Slz/2is4GR1ojDvfG+pABllv/rDVqoiA6E5yeWwZgaI=;
 b=IamQKM9KG1LjFrnpdI10leKkxW2cUGEYmTclXNvUgbXoham8CvOdPitpUgTWZOIRaX1y
 NYkbtfJF2sPHGdJoN8bfOgh9ZNY/mOZ8eXfXrx1RuAfFengWnu5VtwBL12uxDOR0BZZx
 IIYTt/aL9oQdPyr4Fb1mvGv3jknpZQR1AjtpuLFTuHdxctV/FWzYhU205h2+zRVvOFlZ
 AVj+7TPY1CnlwFaTnL981sbEsep4HGSDO7aI+do49W6vnX1Xi/xxaoH+q6coqNlKGqwn
 y04Ju6HPD/XudCZoZaWuilpPkluq9lgZRqrvY2gGiy/hkhXS25tJspMY0U2wvN6lhw7L Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ptey58r41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Apr 2023 11:37:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D867810002A;
 Fri,  7 Apr 2023 11:37:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BBE75216EC3;
 Fri,  7 Apr 2023 11:37:10 +0200 (CEST)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 7 Apr
 2023 11:37:10 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 7 Apr 2023 11:37:08 +0200
Message-ID: <20230407113657.1.I298af67004d61e65f93e38284ab3895dd7d5dc66@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_06,2023-04-06_03,2023-02-09_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH] configs: stm32mp15: increase malloc size for
	pre-reloc
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

The early malloc usage increased so the associated defined
CONFIG_SYS_MALLOC_F_LEN need to be increased.

For example, for stm32mp15_defconfig and
stm32mp157c-dk2-scmi.dtsi, we have:

Early malloc usage: 280b8 / 80000

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/stm32mp15_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index 0005e4266441..2676ff381d85 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -1,7 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_STM32MP=y
 CONFIG_TFABOOT=y
-CONFIG_SYS_MALLOC_F_LEN=0x20000
+CONFIG_SYS_MALLOC_F_LEN=0x80000
 CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0xc0100000
 CONFIG_ENV_OFFSET=0x480000
 CONFIG_ENV_SECT_SIZE=0x40000
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
