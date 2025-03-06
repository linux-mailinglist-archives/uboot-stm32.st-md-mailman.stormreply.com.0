Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA80A54E14
	for <lists+uboot-stm32@lfdr.de>; Thu,  6 Mar 2025 15:45:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD42FC7802C;
	Thu,  6 Mar 2025 14:45:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 434F1C78002
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 10:57:50 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526AejCt011567;
 Thu, 6 Mar 2025 11:57:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 WlgpDeafdcsQESauTGLxVYWjEnZ+ivNB8Z3rngO3oT4=; b=P+yKv3famI5oYdkZ
 8GZ7QkVGCGNKWGEE1nDUHiZrxpZa2x+RF3bby8ByfDg/wtLBK+iDVJGeZUNDICAO
 Z4pUwJMFAcLL/Zpm3KGCQtEyQZZqsz9YQJzN/iGt6na1yvzU86IPM8B0ay2jmWsN
 bYuMVzWfjFgSqy3YAkt9hpVO7gqP7ssaE3qhHmemXKgHwrOaDwCm48d3HzQ0RSAI
 4ZDmEJZUbSA7ah5XDLAMbPVvRZQE1/I+A/gAxC5pnx49MCzW58fm04uBW+Hi4QTl
 64jPcd6x3NaV1220i6h+BG6jK4r28yUR1pMEbdYZFoAY3II6lifVEAynaeSxmiTt
 VV3wDA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 457a5pg4gd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Mar 2025 11:57:47 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9F5F640044;
 Thu,  6 Mar 2025 11:57:01 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D80EC5027CA;
 Thu,  6 Mar 2025 11:56:44 +0100 (CET)
Received: from localhost (10.48.86.119) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 11:56:44 +0100
From: Cheick Traore <cheick.traore@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 6 Mar 2025 11:56:16 +0100
Message-ID: <20250306115558.1.I060a56226e03cddfd4a6d6b98bc86c91435710cc@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306105620.624760-1-cheick.traore@foss.st.com>
References: <20250306105620.624760-1-cheick.traore@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.119]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Mailman-Approved-At: Thu, 06 Mar 2025 14:45:13 +0000
Cc: Tom Rini <trini@konsulko.com>, Cheick Traore <cheick.traore@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 1/5] dm: pwm: Check if duty_ns is lower than
	period_ns
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

It was possible to provide a duty_ns greater than period_ns to
"pwm config" command. The framework must check the values before
providing them to drivers.

Signed-off-by: Cheick Traore <cheick.traore@foss.st.com>
---

 drivers/pwm/pwm-uclass.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pwm/pwm-uclass.c b/drivers/pwm/pwm-uclass.c
index 6543db1d623..b4491f7dcd4 100644
--- a/drivers/pwm/pwm-uclass.c
+++ b/drivers/pwm/pwm-uclass.c
@@ -27,6 +27,9 @@ int pwm_set_config(struct udevice *dev, uint channel, uint period_ns,
 	if (!ops->set_config)
 		return -ENOSYS;
 
+	if (duty_ns > period_ns)
+		return -EINVAL;
+
 	return ops->set_config(dev, channel, period_ns, duty_ns);
 }
 
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
