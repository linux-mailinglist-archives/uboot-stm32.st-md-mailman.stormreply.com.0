Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A635C428824
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Oct 2021 09:53:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E3EDC597B0;
	Mon, 11 Oct 2021 07:53:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 880B2C58D58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Oct 2021 07:52:59 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B7FxMh020055; 
 Mon, 11 Oct 2021 09:52:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=U1EMR2+/HU0n88BvVtK3mEgxNLgWgyhDv59H1EPOfZw=;
 b=PUXknpRseLPjwFpcKVOkooeU4quLb1K3rFOt6fzmJPPdB5l52/sjLGtkcgTMYc8DUNRx
 ryYqxtv+EWqrdDrcIYim+oFgQB+Um1HhzwJzvL8QBfUnEAeNqJ/apPW/FTI3OWIJJM2S
 ubXHtl+kQUz4mt3tbiAOVsDdiSTWQViBfyZUhLtzsitRFT6grNFeViB0BKVKTr/xrefD
 v2mREIQ+8koAUTQ0AMS3Muq1OiD3ggJYu+/40BUQzcuXSmOkd+/zALeEZJHG3h722IhV
 MlnT0W3yyw6+dxxYzFpOIn2koLLStKyukIdXQD4t5uCG6+sqF5GBdAfcPzyuhIYnG6Uj 5g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bmgqu87bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 09:52:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5CA1A10002A;
 Mon, 11 Oct 2021 09:52:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3794521513A;
 Mon, 11 Oct 2021 09:52:56 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 11 Oct 2021 09:52:55
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 11 Oct 2021 09:52:48 +0200
Message-ID: <20211011075244.1.Icb805e47dd8102559236013264342b52c187813f@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-11_02,2021-10-07_02,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/4] arm: stm32mp: bsec: Update OTP shadow
	registers in SPL
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

Currently the upper OTP (after 57) are shadowed in U-Boot proper,
when TFABOOT is not used.

This choice cause an issue when U-Boot is not executed after SPL,
so this BSEC initialization is moved in SPL and no more executed in U-Boot,
so it is still executed only one time.

After this patch this BSEC initialization is done in FSBL: SPL or TF-A.

To force this initialization in all the case, the probe of the BSEC
driver is forced in SPL in the arch st32mp function: spl_board_init().

Even if today BSEC driver is already probed in STM32MP15x clock driver
clk_stm32mp1.c because get_cpu_type() is called in
stm32mp1_get_max_opp_freq() function.

Reported-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
It is updated version of proposed Alexandru patch:

[v2,06/11] arm: stm32mp: bsec: Update OTP shadow registers in SPL
http://patchwork.ozlabs.org/project/uboot/patch/20210907235933.2798330-7-mr.nuke.me@gmail.com/


 arch/arm/mach-stm32mp/bsec.c | 5 ++---
 arch/arm/mach-stm32mp/cpu.c  | 8 ++++++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index fe39bd80cf..e517acdd01 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -503,10 +503,9 @@ static int stm32mp_bsec_probe(struct udevice *dev)
 
 	/*
 	 * update unlocked shadow for OTP cleared by the rom code
-	 * only executed in U-Boot proper when TF-A is not used
+	 * only executed in SPL, it is done in TF-A for TFABOOT
 	 */
-
-	if (!IS_ENABLED(CONFIG_TFABOOT) && !IS_ENABLED(CONFIG_SPL_BUILD)) {
+	if (IS_ENABLED(CONFIG_SPL_BUILD)) {
 		plat = dev_get_plat(dev);
 
 		for (otp = 57; otp <= BSEC_OTP_MAX_VALUE; otp++)
diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index eb79f3ffd2..0263ffe96a 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -174,7 +174,15 @@ static void dbgmcu_init(void)
 
 void spl_board_init(void)
 {
+	struct udevice *dev;
+	int ret;
+
 	dbgmcu_init();
+
+	/* force probe of BSEC driver to shadow the upper OTP */
+	ret = uclass_get_device_by_driver(UCLASS_MISC, DM_DRIVER_GET(stm32mp_bsec), &dev);
+	if (ret)
+		log_warning("BSEC probe failed: %d\n", ret);
 }
 #endif /* !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD) */
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
