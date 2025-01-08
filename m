Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2015A05FAF
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2025 16:11:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F000C78F67;
	Wed,  8 Jan 2025 15:11:12 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BB15C78022
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2025 15:11:05 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508EWGrX023223;
 Wed, 8 Jan 2025 16:10:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=RjXuu+OVVMsYI4L/DMyYJ2
 cyhKBWpdUt3AjNXCZEdQQ=; b=lvVy4vNZIv7mlrLpdTUP9Jsj4BLbmSOwwk8XfD
 nrSgHhzQa63mU/NDNQvjaat1hkG+WrFuCwLD5qgp0W7cR/naPkYL4gR3NjwG8EPc
 uE8KFt2626vH9jXpuA4HFta7pu+/sQVYuvM2KXZUnU9ZaK4Q3LFOz1jMWOkXwpHm
 lucdWapDMSzy2lQCgjWiOocC8XHWJjZWtnwJzsUfPIiyThIYZ8LhUXKYUa7bYmtY
 jysCduxopoaoDZVsHM82wN4e1c8Aj+yF/i9Oz9gJJ8OC/ImIxSjNCV8jyAFT4bN9
 hK+Yo1DYBe2rTC76Yt4nxuh5kZEgbWX8mrP8nLAHjPrcJp/A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441u78r640-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2025 16:10:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BD95940060;
 Wed,  8 Jan 2025 16:10:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C87B9281FA7;
 Wed,  8 Jan 2025 16:09:42 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 16:09:42 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 8 Jan 2025 16:09:39 +0100
Message-ID: <20250108150940.558671-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, Rasmus Villemoes <ravi@prevas.dk>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Stefan Roese <sr@denx.de>
Subject: [Uboot-stm32] [PATCH 1/2] cyclic: Fix rollover every 72 min on 32
	bits platforms
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

On 32 bits platforms, timer_get_us() returns an unsigned long which
is a 32 bits. timer_get_us() wraps around every 72 minutes
(2 ^ 32 / 1000000 =~ 4295 sec =~ 72 min).

So the test "if time_after_eq64(now, cyclic->next_call)" is no more
true when cyclic->next_call becomes above 32 bits max value (4294967295).

At this point after 72 min, no more cyclic function are
executed included watchdog one.

Instead of using timer_get_us(), use get_timer_us() which returns a
uint64_t, this allows a rollover every 584942 years.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 common/cyclic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/common/cyclic.c b/common/cyclic.c
index 196797fd61e..e3f03a19d55 100644
--- a/common/cyclic.c
+++ b/common/cyclic.c
@@ -61,7 +61,7 @@ static void cyclic_run(void)
 		 * Check if this cyclic function needs to get called, e.g.
 		 * do not call the cyclic func too often
 		 */
-		now = timer_get_us();
+		now = get_timer_us(0);
 		if (time_after_eq64(now, cyclic->next_call)) {
 			/* Call cyclic function and account it's cpu-time */
 			cyclic->next_call = now + cyclic->delay_us;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
