Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09428ABF929
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 May 2025 17:24:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96EADC7A82F;
	Wed, 21 May 2025 15:24:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B857C7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 12:29:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LC0f18017098;
 Wed, 21 May 2025 14:29:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 xwOITI/2hsvhERLqfmjAhHSsl7uqAkMgDz3yMq3GAEs=; b=R5VOAOHoklTty5i9
 52JvZs5nooImo/QXSKh7hD5nGgAQxb91uT4edv3viB9JMmMLSzWWR6TVX8eKGtBL
 sdaqcegv/JxjSAwWuDtwAatLM7lNoqC+ukPOMef02ixjKbwszHIHOD/YDewWOeK3
 k8HFrJnHGQlk4bWghRfSpq/TfeXlBjki5ABQ15O2LbCs0VVt3egdh2X5JFPcn2Oh
 prNZS6Cnaq+HeUWue4MNUBNFzYZK62hJqSIeDKN+2vny5jm0H+lYAwRH9yTYLqfq
 vrWGwQHfF5AUKpe0smj25Jx7r8W4NaZYdAV+j/3KeISk4C5ZAhlfUG1aBJ4+93/3
 EN6Krw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfc3wjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 May 2025 14:29:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1D1E84004A;
 Wed, 21 May 2025 14:28:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F3CFBDE79A;
 Wed, 21 May 2025 14:28:10 +0200 (CEST)
Received: from localhost (10.252.16.84) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 14:28:10 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: <u-boot@lists.denx.de>, Stefan Roese <sr@denx.de>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 21 May 2025 14:27:52 +0200
Message-ID: <20250521122755.265760-2-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521122755.265760-1-antonio.borneo@foss.st.com>
References: <20250521122755.265760-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.16.84]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Mailman-Approved-At: Wed, 21 May 2025 15:24:50 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/4] watchdog: wdt-uclass.c: add
	wdt_set_force_autostart() helper
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

The watchdog could have been already started by a previous boot
stage (e.g. bootrom or secure OS). U-Boot has to start and kick
the watchdog even when CONFIG_WATCHDOG_AUTOSTART is not enabled
or when the DT property u-boot,noautostart is present.

Add the helper wdt_set_force_autostart() that can be called by the
driver's probe() when it detects that the watchdog has already
been started and is running.

Co-developed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/watchdog/wdt-uclass.c | 9 +++++++++
 include/wdt.h                 | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/watchdog/wdt-uclass.c b/drivers/watchdog/wdt-uclass.c
index 10be334e9ed..b32590069d9 100644
--- a/drivers/watchdog/wdt-uclass.c
+++ b/drivers/watchdog/wdt-uclass.c
@@ -46,6 +46,15 @@ struct wdt_priv {
 	struct cyclic_info cyclic;
 };
 
+int wdt_set_force_autostart(struct udevice *dev)
+{
+	struct wdt_priv *priv = dev_get_uclass_priv(dev);
+
+	priv->autostart = true;
+
+	return 0;
+}
+
 static void wdt_cyclic(struct cyclic_info *c)
 {
 	struct wdt_priv *priv = container_of(c, struct wdt_priv, cyclic);
diff --git a/include/wdt.h b/include/wdt.h
index 5026f5a6db4..1ef656585c4 100644
--- a/include/wdt.h
+++ b/include/wdt.h
@@ -18,6 +18,15 @@ struct udevice;
  * which typically include placing the system in a safe, known state.
  */
 
+/*
+ * Force watchdog start during init. Called by driver's probe when the watchdog
+ * is detected as already started.
+ *
+ * @dev: WDT Device
+ * @return: 0 if OK, -ve on error
+ */
+int wdt_set_force_autostart(struct udevice *dev);
+
 /*
  * Start the timer
  *
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
