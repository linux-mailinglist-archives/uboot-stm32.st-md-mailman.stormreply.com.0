Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DECD3FEBA6
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Sep 2021 11:56:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDA4EC597AC;
	Thu,  2 Sep 2021 09:56:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F290C0614D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Sep 2021 09:56:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1828jvMU022937;
 Thu, 2 Sep 2021 11:56:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=4rTe/8KCP8b0Tb33RpXG5Dov8adI7dDEYZFtZSPTaaA=;
 b=3UeXu4gr0vSNMz08JWPEpjPMBhwl4xcyKHqSJ1QKgSWeCSV8U6dZsTMQQHUga6xwORyQ
 F9sOGFjU05RuwdEhv9pYCRUa2ZKqNBxIW3eTQRp0z/GMQq3jdUw/2TzbpjUWaNY4VxIt
 yoBtEgZSX2TDkBk+wApJp7jMjbQubcB5mPy29IXYdA9TdaCh3rpLjxie5t140rhDpQiE
 PrafqTm2KwBPtEVyjjCgXj55OxgQmlsiu4HxvZ4GLeGyd6eNEiDM6QLc+CwDuBE8juHG
 xrG7PD2y5aHbkosw8YlM/rYlHqtXLGr/tYBSJqh2z610tc+RdBZlIoauBabd0r+onv3o Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3atuctgfxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Sep 2021 11:56:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BBD07100034;
 Thu,  2 Sep 2021 11:56:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0FC52309CC;
 Thu,  2 Sep 2021 11:56:26 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep 2021 11:56:26
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 2 Sep 2021 11:56:17 +0200
Message-ID: <20210902115512.2.Ibfbc7792766c73de7904b13321d9fc5658d929a8@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902115512.1.I1c6536da7609f8240549cccae2708e075dc9fcf3@changeid>
References: <20210902115512.1.I1c6536da7609f8240549cccae2708e075dc9fcf3@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-02_03,2021-09-01_01,2020-04-07_01
Cc: Simon Glass <sjg@chromium.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com, "Alex G ." <mr.nuke.me@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, etienne.carriere@linaro.org
Subject: [Uboot-stm32] [PATCH 2/2] tee: add a stub for tee_find_device
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

Add stub for tee_find_device function when CONFIG_TEE is not activated
to simplify the caller code.

This patch allows to remove the CONFIG_IS_ENABLED(OPTEE) tests
for stm32 platform.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/fdt.c        |  1 -
 board/st/common/stm32mp_mtdparts.c |  3 +--
 include/tee.h                      | 11 +++++++++++
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
index a19e954cf7..91330a68a4 100644
--- a/arch/arm/mach-stm32mp/fdt.c
+++ b/arch/arm/mach-stm32mp/fdt.c
@@ -341,7 +341,6 @@ int ft_system_setup(void *blob, struct bd_info *bd)
 	 * when FIP is not used by TF-A
 	 */
 	if (CONFIG_IS_ENABLED(STM32MP15x_STM32IMAGE) &&
-	    CONFIG_IS_ENABLED(OPTEE) &&
 	    !tee_find_device(NULL, NULL, NULL, NULL))
 		stm32_fdt_disable_optee(blob);
 
diff --git a/board/st/common/stm32mp_mtdparts.c b/board/st/common/stm32mp_mtdparts.c
index 8b636d62fa..18878424c7 100644
--- a/board/st/common/stm32mp_mtdparts.c
+++ b/board/st/common/stm32mp_mtdparts.c
@@ -119,8 +119,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 	}
 
 #ifdef CONFIG_STM32MP15x_STM32IMAGE
-	if (!serial && CONFIG_IS_ENABLED(OPTEE) &&
-	    tee_find_device(NULL, NULL, NULL, NULL))
+	if (!serial && tee_find_device(NULL, NULL, NULL, NULL))
 		tee = true;
 #endif
 
diff --git a/include/tee.h b/include/tee.h
index 2ef29bfc8f..44e9cd4321 100644
--- a/include/tee.h
+++ b/include/tee.h
@@ -307,11 +307,22 @@ bool tee_shm_is_registered(struct tee_shm *shm, struct udevice *dev);
  * Returns a probed TEE device of the first TEE device matched by the
  * match() callback or NULL.
  */
+#if CONFIG_IS_ENABLED(TEE)
 struct udevice *tee_find_device(struct udevice *start,
 				int (*match)(struct tee_version_data *vers,
 					     const void *data),
 				const void *data,
 				struct tee_version_data *vers);
+#else
+static inline struct udevice *tee_find_device(struct udevice *start,
+					      int (*match)(struct tee_version_data *vers,
+							   const void *data),
+					      const void *data,
+					      struct tee_version_data *vers)
+{
+	return NULL;
+}
+#endif
 
 /**
  * tee_get_version() - Query capabilities of TEE device
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
