Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D689D1B4522
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 14:29:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EB72C36B09
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 12:29:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D949C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 12:29:27 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03MCCEob031101; Wed, 22 Apr 2020 14:29:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ZgwfQKJLlBHbxapLL7QK5G7d8HiSoirXf+n4M6adrQY=;
 b=qDgkhJ+M5/uUG8U9/NCJjaHqKmVs8xwu36+9RxrvD8KzYJNvIRLKrQgJKcO3Vg3g4AyJ
 Zt8LIjKtOCcPa/aidER73SYgduLj27HEogDGtriGDA8v1CdSQrQRQaPaF4QuNGsui+f0
 o9SZ28oZHb54RUhbkVJIz+S5UxxrRLZ7eXXRxbw20Ap6joPWcV7jGq/6Y3419fNx5HOj
 ot/qwonElJ74kl4rZkPrmdMOE+pezH7Ik9gKnNFm4664Z+HQjE44aKYe8uIvRPJlgIe0
 IDH1+ZaKA7uidq6IZNSdsQqjLORRV8rEI38/R0MZcsa73sVlkx3iaJ32Fi96qUduqWxE /g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fpp8xpx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 14:29:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 89AA210002A;
 Wed, 22 Apr 2020 14:29:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7EDA62AE6C5;
 Wed, 22 Apr 2020 14:29:23 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 22 Apr 2020 14:29:22 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Apr 2020 14:29:10 +0200
Message-ID: <20200422142834.v2.2.I703cbd885066981e3bab374021d5578dce7cb035@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422122920.19340-1-patrick.delaunay@st.com>
References: <20200422122920.19340-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_03:2020-04-22,
 2020-04-22 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Wolfgang Denk <wd@denx.de>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 02/12] arm: stm32mp: spl: update error
	management in board_init_f
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

Call hang when an error is detected for probe of any driver
needed for console or DDR init: clk, reset and pincontrol

NB: previous behavior with a return in board_init_f() was not correct;
    DDR is not initialized and SPL execution can't continue


Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- simplify patch after Wolfgang review, as console init alway failed when
  drivers can't probe (remove printf after preloader_console_init call)

 arch/arm/mach-stm32mp/spl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
index ca4231cd0d..445c5a231c 100644
--- a/arch/arm/mach-stm32mp/spl.c
+++ b/arch/arm/mach-stm32mp/spl.c
@@ -92,19 +92,19 @@ void board_init_f(ulong dummy)
 	ret = uclass_get_device(UCLASS_CLK, 0, &dev);
 	if (ret) {
 		debug("Clock init failed: %d\n", ret);
-		return;
+		hang();
 	}
 
 	ret = uclass_get_device(UCLASS_RESET, 0, &dev);
 	if (ret) {
 		debug("Reset init failed: %d\n", ret);
-		return;
+		hang();
 	}
 
 	ret = uclass_get_device(UCLASS_PINCTRL, 0, &dev);
 	if (ret) {
 		debug("%s: Cannot find pinctrl device\n", __func__);
-		return;
+		hang();
 	}
 
 	/* enable console uart printing */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
