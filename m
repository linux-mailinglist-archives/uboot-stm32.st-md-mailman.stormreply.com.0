Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A333CD089
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jul 2021 11:22:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25E13C58D7F;
	Mon, 19 Jul 2021 09:22:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5B16CFAC5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jul 2021 09:22:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J9CbJ0005557; Mon, 19 Jul 2021 11:22:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Z4VaxV5wJfbCXlRgMWua1HQo2DlllChBWgJEevqyovA=;
 b=Nzp438/UqEiIYzpmMyE/rQaFBe0BG9tNTHtJGUp+rATrf8w2snKyLTCXJzHgisWSihKM
 /sP27JTfV2fboDgc721mMQt5t41XA9AVLn8jMsqBmF/qt30R1kucrONcegHRuge5WuCb
 P6cdLoGlygqxN8oDeFNytCyTxn9xIlJrLhPE1ZR5Qnf7J/5+uemazZTr7wO/zkWyRg+7
 i3Dm66oO9I2hYBXg/vS/y2caFgnTHH6n/MoqUqEKLNN6KDRHo+q2rjqGuODCzF3mNHXn
 jVbUnsKslDnW/PGVQFh1mMS74lMqWZ8kfmD09ZCVbJAzywcyP07k7mpSHzMz6uDyTLiU hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39w4kggum0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 11:22:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3CD84100034;
 Mon, 19 Jul 2021 11:22:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2577A21A209;
 Mon, 19 Jul 2021 11:22:05 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Jul 2021 11:22:04
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 19 Jul 2021 11:21:50 +0200
Message-ID: <20210719112135.v2.1.Idb1d70f42e92c6b612467611501246064bcddeef@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719092151.1346480-1-patrick.delaunay@foss.st.com>
References: <20210719092151.1346480-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_02:2021-07-16,
 2021-07-19 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Weijie Gao <weijie.gao@mediatek.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Harald Seiler <hws@denx.de>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH v2 1/2] arm: use the correct prototype for
	reset_cpu function
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

Align reset_cpu function with the next prototypes in
sysreset.h or in cpu_func.h to solve compilation issue:

  void reset_cpu(void);

This patch solves the prototype conflict when cpu_func.h is
included.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- NEW: solve conflicts when cpu_func.h is included

 arch/arm/mach-mediatek/mt8183/init.c    | 2 +-
 board/congatec/cgtqmx8/cgtqmx8.c        | 2 +-
 board/hoperun/hihope-rzg2/hihope-rzg2.c | 2 +-
 board/silinux/ek874/ek874.c             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-mediatek/mt8183/init.c b/arch/arm/mach-mediatek/mt8183/init.c
index 877f387102..7496029705 100644
--- a/arch/arm/mach-mediatek/mt8183/init.c
+++ b/arch/arm/mach-mediatek/mt8183/init.c
@@ -48,7 +48,7 @@ int mtk_soc_early_init(void)
 	return 0;
 }
 
-void reset_cpu(ulong addr)
+void reset_cpu(void)
 {
 	psci_system_reset();
 }
diff --git a/board/congatec/cgtqmx8/cgtqmx8.c b/board/congatec/cgtqmx8/cgtqmx8.c
index fb0cf09138..a50a052df7 100644
--- a/board/congatec/cgtqmx8/cgtqmx8.c
+++ b/board/congatec/cgtqmx8/cgtqmx8.c
@@ -374,7 +374,7 @@ void detail_board_ddr_info(void)
 /*
  * Board specific reset that is system reset.
  */
-void reset_cpu(ulong addr)
+void reset_cpu(void)
 {
 	/* TODO */
 }
diff --git a/board/hoperun/hihope-rzg2/hihope-rzg2.c b/board/hoperun/hihope-rzg2/hihope-rzg2.c
index c1bfdcbc1d..c1db387b27 100644
--- a/board/hoperun/hihope-rzg2/hihope-rzg2.c
+++ b/board/hoperun/hihope-rzg2/hihope-rzg2.c
@@ -65,7 +65,7 @@ int board_init(void)
 	return 0;
 }
 
-void reset_cpu(ulong addr)
+void reset_cpu(void)
 {
 	unsigned long midr, cputype;
 
diff --git a/board/silinux/ek874/ek874.c b/board/silinux/ek874/ek874.c
index 5a219cd98d..1e948489f3 100644
--- a/board/silinux/ek874/ek874.c
+++ b/board/silinux/ek874/ek874.c
@@ -24,7 +24,7 @@ int board_init(void)
 	return 0;
 }
 
-void reset_cpu(ulong addr)
+void reset_cpu(void)
 {
 	writel(RST_CA53_CODE, RST_CA53RESCNT);
 }
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
