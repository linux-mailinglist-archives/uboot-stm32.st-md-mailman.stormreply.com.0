Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A062015CA61
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Feb 2020 19:30:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B5DBC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Feb 2020 18:30:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9EBEC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2020 18:30:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01DIMZXj017136; Thu, 13 Feb 2020 19:29:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=QRnMBl6GhUHvJajAZULLtE2W/IqVXFWz9EiHNDkoEnw=;
 b=qnb6dTvBzF2CNSV2iEadrHn0tO3ybgfMSXyVET12tNF51oqcgSvtb5S+CYeEQmmW7mfI
 6KJ+hw3JkWa7bJ7vUIy9fOJc7MOB7AQKv/qo7MT11/fmpfiG0k9ZHN5pZUQ+lHkT+cnT
 UVGVLGNwBhNgtcwmSPBBUi1UbCnuHOudvpq40fxw05e5V9OGUXXAgZClvYcNddH1NBT/
 OiyixFsnMExSiPP7Wua7KGd85BU7xAukx4O9lN9rwLG/qpQf0KjDFs7Plh+gbhISmeSY
 R6ZQjJFD5Rk76zhExIoGT2+GEVfOmdSvwglCXG227P2LdZH5S+xvEYD8/HbHFwrnn++4 Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uvdxgtx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2020 19:29:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DBD6A10002A;
 Thu, 13 Feb 2020 19:29:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CE5B12AE22D;
 Thu, 13 Feb 2020 19:29:54 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 13 Feb 2020 19:29:54 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 13 Feb 2020 19:29:50 +0100
Message-ID: <20200213182950.10744-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-13_07:2020-02-12,
 2020-02-13 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Keerthy <j-keerthy@ti.com>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] ARM: bootm: take into account gd->ram_top
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

From: Patrice Chotard <patrice.chotard@st.com>

If gd->ram_top has been tuned using board_get_usable_ram_top(),
it must be taken into account when reserving arch lmb.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Reviewed-by: Patrick DELAUNAY <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/lib/bootm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/lib/bootm.c b/arch/arm/lib/bootm.c
index a135bcfc7b..f4b5ca6de0 100644
--- a/arch/arm/lib/bootm.c
+++ b/arch/arm/lib/bootm.c
@@ -75,6 +75,9 @@ void arch_lmb_reserve(struct lmb *lmb)
 			gd->bd->bi_dram[bank].size - 1;
 		if (sp > bank_end)
 			continue;
+		if (bank_end > gd->ram_top)
+			bank_end = gd->ram_top - 1;
+
 		lmb_reserve(lmb, sp, bank_end - sp + 1);
 		break;
 	}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
