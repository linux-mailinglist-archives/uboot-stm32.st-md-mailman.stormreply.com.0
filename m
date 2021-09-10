Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA7E406D74
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Sep 2021 16:17:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6996C5A4D5;
	Fri, 10 Sep 2021 14:17:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9037FC5A4D4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Sep 2021 14:17:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18AAMxYT015271;
 Fri, 10 Sep 2021 16:16:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=9U9WoH0lEe1NgMJWtLoEEWgs9r6Mt93AKGEdABjkjpo=;
 b=WDkMkxTS7decqRT/jy13Bm5le3E/ysQUHgezSO6XP0oDBY/aFUKu+MHl+Z1UPG5Qd5IQ
 cT/kKO0r9oNDplvmDL2+GNmcNlbhY9QXhZjNAs7v28fgIateJkEUGMbgmwAuS3yip51g
 lJlbSdTekiVqKCK5RiP7/qzmq9gSveQH9rSup4kh30x27VT5m00fnw7t0wbFLKtL79+d
 a48aOBK3DRxwOFb7m/3o5HcfQo5n9/rkvafSQyWxHsf4dXD3Pg5hRyqdgOdjwIdp3cJF
 ITFSuGqyRzQo83Sd+gFBpOVrY7JxrlE7vGcfW/Xa/710haF7+ha/5sgS4hjuT7s/jvCu tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b05jdh548-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 16:16:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6736610002A;
 Fri, 10 Sep 2021 16:16:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node2.st.com [10.75.127.2])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5783321F0A7;
 Fri, 10 Sep 2021 16:16:30 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG1NODE2.st.com (10.75.127.2)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 10 Sep 2021 16:16:30
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 Sep 2021 16:16:23 +0200
Message-ID: <20210910141624.25133-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210910141624.25133-1-patrice.chotard@foss.st.com>
References: <20210910141624.25133-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG1NODE2.st.com
 (10.75.127.2)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_06,2021-09-09_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>, Herbert Poetzl <herbert@13thfloor.at>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Nandor Han <nandor.han@vaisala.com>
Subject: [Uboot-stm32] [RESEND][PATCH v2 4/5] configs: sandbox: add
	USB_ETHER and GADGET_DOWNLOAD gadget support
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

This is needed for new gadget binding test.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Herbert Poetzl <herbert@13thfloor.at>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 configs/sandbox_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index ea08a9e5bd..1f646683eb 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -266,6 +266,9 @@ CONFIG_SANDBOX_TIMER=y
 CONFIG_USB=y
 CONFIG_USB_EMUL=y
 CONFIG_USB_KEYBOARD=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_GADGET_DOWNLOAD=y
+CONFIG_USB_ETHER=y
 CONFIG_DM_VIDEO=y
 CONFIG_VIDEO_COPY=y
 CONFIG_CONSOLE_ROTATION=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
