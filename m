Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C73A107D2
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Jan 2025 14:30:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E823FC78F64;
	Tue, 14 Jan 2025 13:30:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6206C78031
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 13:30:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ED3tCU012051;
 Tue, 14 Jan 2025 14:30:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=OQxTHr8l4o/hnEGznhwnEb
 ubXxV66kFSEnSCZWBK6XA=; b=4qplDVZeDbI/bAX8vY5jyNkUnzf00tujJHYUCp
 HXl4qLwoyBACDADyXy6nArhkqiYxtnL87QNclOPxubV77bAbQxjL3jiLgIGsVGcn
 rxUwDJvDQHVCKG+W4yCTKEWntTqk4gluiOeb3V+DAabxhY8G++Dams4CGUWEV9Db
 3DGuVvUGJOWdMef8d5en88uV7x2Oh1ojfal5affm36XBxCxntM0D26kDqNqdToWj
 U1vOHwQdkhf2UbjYtgMP1hBKsmU1f9Trfd4Rzsem4sgFeMjdQpf+KMxKPIZpghAj
 H3NyCfIKPl73zcAyckj4DHVaVkfBj8eWUJdGwODNR7LBE+EQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4453a7w1fd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2025 14:30:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9A4F340047;
 Tue, 14 Jan 2025 14:29:38 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A5092A46CD;
 Tue, 14 Jan 2025 14:28:17 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 14 Jan
 2025 14:28:17 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 14 Jan 2025 14:28:13 +0100
Message-ID: <20250114132814.1250117-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, Rasmus Villemoes <ravi@prevas.dk>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Stefan Roese <sr@denx.de>
Subject: [Uboot-stm32] [PATCH v2 1/2] cyclic: Fix rollover every 72 min on
	32 bits platforms
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

Changes in v2:
      _ Replace remaining timer_get_us() by get_timer_us(0)

 common/cyclic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/common/cyclic.c b/common/cyclic.c
index 196797fd61e..fad071a39c6 100644
--- a/common/cyclic.c
+++ b/common/cyclic.c
@@ -36,7 +36,7 @@ void cyclic_register(struct cyclic_info *cyclic, cyclic_func_t func,
 	cyclic->func = func;
 	cyclic->name = name;
 	cyclic->delay_us = delay_us;
-	cyclic->start_time_us = timer_get_us();
+	cyclic->start_time_us = get_timer_us(0);
 	hlist_add_head(&cyclic->list, cyclic_get_list());
 }
 
@@ -61,13 +61,13 @@ static void cyclic_run(void)
 		 * Check if this cyclic function needs to get called, e.g.
 		 * do not call the cyclic func too often
 		 */
-		now = timer_get_us();
+		now = get_timer_us(0);
 		if (time_after_eq64(now, cyclic->next_call)) {
 			/* Call cyclic function and account it's cpu-time */
 			cyclic->next_call = now + cyclic->delay_us;
 			cyclic->func(cyclic);
 			cyclic->run_cnt++;
-			cpu_time = timer_get_us() - now;
+			cpu_time = get_timer_us(0) - now;
 			cyclic->cpu_time_us += cpu_time;
 
 			/* Check if cpu-time exceeds max allowed time */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
