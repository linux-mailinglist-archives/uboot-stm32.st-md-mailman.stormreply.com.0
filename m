Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E659DE683
	for <lists+uboot-stm32@lfdr.de>; Fri, 29 Nov 2024 13:30:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67845C71289;
	Fri, 29 Nov 2024 12:30:01 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47BB0C78024
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Nov 2024 12:29:54 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATB2pqa015591;
 Fri, 29 Nov 2024 13:29:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 iyTzFxJrPnhGUN4Nioc5XPcWD7rPiiLKQFSd3nnpCzA=; b=s+0UklyprIMUM58u
 vFo1rhgJpdJ71lhl6AIf3ED+vqnC0vCooUxfQlxqH7GcoakDIHjQnPZtBqtEvMMc
 r4hHCXW4hCr98NGKoFE1of8atJGmzcvKcAkmGqZGj0OzJ19G/ftXUowEdpeInWVT
 ksJceKDLw4lDmhJEWlKfKjjdrL4/nACxCI5Vy5g6t2U5nIa8iKQ0nac+wPD5cqKg
 AAcK4TYp1+p4gAI+MyTOvVSgGBRKCSXlGcc/Sy7oB04/tWoFa5VhLh7LQUPw7gf5
 XCl26byrhzZy2CNl3VI6lJmJypZ85oHe9K4l58xH93EThCu8aU4Y4keEE10Lfnxs
 NfwcqA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 436719hr9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 13:29:50 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BE43C40044;
 Fri, 29 Nov 2024 13:28:51 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1F6FE28C10A;
 Fri, 29 Nov 2024 13:28:23 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 29 Nov
 2024 13:28:22 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 29 Nov 2024 13:27:11 +0100
Message-ID: <20241129122711.411917-7-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241129122711.411917-1-patrice.chotard@foss.st.com>
References: <20241129122711.411917-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 6/6] configs: stm32mp25: enable
	CONFIG_SYS_64BIT_LBA
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

In arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c, in init_device(),
in case of RAW_IMAGE, part->size = block_dev->lba * block_dev->blksz.

  _ part->size is declared as u64.
  _ block_dev->lba is declared as lbaint_t which is uint64_t
    if CONFIG_SYS_64BIT_LBA is enable, otherwise ulong.
  _ block_dev->blksz is declared as unsigned long.

For example, in case block_dev->lba = 0x1dacc00, block_dev->blksz = 0x200
then part->size 0x5980000 which is incorrect as both are declared as ulong.

To fix this overflow issue, enable CONFIG_SYS_64BIT_LBA, block_dev->lba is
then declared as uint64_t and part->size get the correct value 0x3b5980000.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32mp25_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
index d3f0c088157..073172c3804 100644
--- a/configs/stm32mp25_defconfig
+++ b/configs/stm32mp25_defconfig
@@ -33,6 +33,7 @@ CONFIG_CMD_REGULATOR=y
 CONFIG_CMD_LOG=y
 CONFIG_OF_LIVE=y
 CONFIG_NO_NET=y
+CONFIG_SYS_64BIT_LBA=y
 CONFIG_GPIO_HOG=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
