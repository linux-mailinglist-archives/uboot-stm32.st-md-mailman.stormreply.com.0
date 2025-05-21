Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CA0ABF927
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 May 2025 17:24:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87A20C7A82A;
	Wed, 21 May 2025 15:24:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D4D5C78F6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 12:29:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L827BX010857;
 Wed, 21 May 2025 14:29:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 +RcbzCogerlOEpMRKpTvwg0vOxTcvBbVUSoSfjfiMwg=; b=hoNgdCScR6nrWmV3
 +Yff+RuWhQI4kit98fUjPCFDvJoAhHY/u6s+H9n9n/Z7oXisTJ1ywb0fTJhSpk0N
 JsCT+r8JxX+jGnKCIlQZIqPx16/VbmHO1Q1yQR6pgQYD1M1sMHzfiuVWpuxH8EmG
 P3vTvOkb1LCPxNPp/xJzndNrMZ9GbPNBq6qSVh+CNQ09epjRWdruqP9HL8AEnp5e
 nA83tVKIvAoXZN8qKLKsP0UMQvAK8QTiVjUDaFCzyMgj6DzUc9hXcM4m41WZ167K
 R92rWFoPOf2NwQCh5qDenanTRvmAnYwNvsOwlvP1cJMCDBW8qKzw4qHU10kUq5nA
 mgmcfg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfc3wjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 May 2025 14:29:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1113B4004F;
 Wed, 21 May 2025 14:28:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 65059BDE7AD;
 Wed, 21 May 2025 14:28:11 +0200 (CEST)
Received: from localhost (10.252.16.84) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 14:28:11 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: <u-boot@lists.denx.de>, Stefan Roese <sr@denx.de>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 21 May 2025 14:27:53 +0200
Message-ID: <20250521122755.265760-3-antonio.borneo@foss.st.com>
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
Subject: [Uboot-stm32] [PATCH 2/4] watchdog: arm_smc_wdt: get wdt status
	through SMCWD_GET_TIMELEFT
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

The optional SMCWD_GET_TIMELEFT command can be used to detect if
the watchdog has already been started.
See the implementation in OP-TEE secure OS [1].

At probe time, check if the watchdog is already started and then
call wdt_set_force_autostart(). This will keep U-Boot pinging the
watchdog even when the property 'u-boot,noautostart' is present.

Link: https://github.com/OP-TEE/optee_os/commit/a7f2d4bd8632 [1]

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/watchdog/arm_smc_wdt.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
index 0ea44445700..f6854aa9ac9 100644
--- a/drivers/watchdog/arm_smc_wdt.c
+++ b/drivers/watchdog/arm_smc_wdt.c
@@ -46,6 +46,8 @@ static int smcwd_call(struct udevice *dev, enum smcwd_call call,
 		return -ENODEV;
 	if (res->a0 == PSCI_RET_INVALID_PARAMS)
 		return -EINVAL;
+	if (res->a0 == PSCI_RET_DISABLED)
+		return -ENODATA;
 	if (res->a0 != PSCI_RET_SUCCESS)
 		return -EIO;
 
@@ -99,6 +101,21 @@ static int smcwd_probe(struct udevice *dev)
 	priv->min_timeout = res.a1;
 	priv->max_timeout = res.a2;
 
+	/* If already started, then force u-boot to use it */
+	err = smcwd_call(dev, SMCWD_GET_TIMELEFT, 0, NULL);
+	switch (err) {
+	case 0:
+		dev_dbg(dev, "Already started\n");
+		wdt_set_force_autostart(dev);
+		break;
+	case -ENODATA:
+		dev_dbg(dev, "Not already started\n");
+		break;
+	default:
+		/* Optional SMCWD_GET_TIMELEFT not implemented */
+		break;
+	}
+
 	return 0;
 }
 
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
