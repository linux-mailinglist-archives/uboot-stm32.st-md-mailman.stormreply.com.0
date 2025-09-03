Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B25FB41EEC
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 Sep 2025 14:27:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13BB2C3FAC8;
	Wed,  3 Sep 2025 12:27:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88C69C3FAC7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 12:27:40 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583C0S0w024983;
 Wed, 3 Sep 2025 14:27:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 GiP3+xW0FzW9+x5CIFFOXMyQGYe5fT8oS+Vg2B2CKLQ=; b=GZQVlviuK9vT2Ovb
 EFmqYKspvuuQz5Y65mbTEcJVJCKi4BLo8CTbplq8ueRH4G9zf+oB1uMD3kyf4TGK
 KU+rKFhSyiH005XDe6m0fY+2IjBSN2iYArwAZjJ7Qd2cRFkYiCZ+SYmaXhU48aVj
 UGgwGvEwgWq6DQHMy8I2RqJFRwqzekj38tNSH/k/cuo3SpmEO80MN/lKQdI0Hlte
 Br4OnCBe8BRCPzh6qOg9KXtyP4PjpdHfig2Sg3H47tIshf3f1ogOpE6q9sDedzwg
 tZPRJpsxicAAMlXFkqONt34Y/pDXwrty3iPCpDBKhGGldnq3wDfkklXGGeIkVhnX
 LWjKlQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vav2ppbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Sep 2025 14:27:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9D5B140045;
 Wed,  3 Sep 2025 14:26:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3A03539C6F7;
 Wed,  3 Sep 2025 14:25:43 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 14:25:42 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Wed, 3 Sep 2025 14:25:41 +0200
MIME-Version: 1.0
Message-ID: <20250903-master-v2-7-5cdf73bff42c@foss.st.com>
References: <20250903-master-v2-0-5cdf73bff42c@foss.st.com>
In-Reply-To: <20250903-master-v2-0-5cdf73bff42c@foss.st.com>
To: Tom Rini <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Dillon Min
 <dillon.minfei@gmail.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Simon Glass <sjg@chromium.org>, Sumit Garg <sumit.garg@kernel.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: [Uboot-stm32] [PATCH v2 7/7] configs: stm32mp25: enable LVDS
	display support
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

Compile VIDEO_STM32 and VIDEO_STM32_LVDS by default.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 configs/stm32mp25_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
index 2b02cd86d6134497151e398eb54230f08d4e6272..e84df4a2a8f52890376f7689b01d3dcab5079ed9 100644
--- a/configs/stm32mp25_defconfig
+++ b/configs/stm32mp25_defconfig
@@ -78,6 +78,9 @@ CONFIG_SERIAL_RX_BUFFER=y
 CONFIG_SPI=y
 CONFIG_DM_SPI=y
 # CONFIG_OPTEE_TA_AVB is not set
+CONFIG_VIDEO=y
+CONFIG_VIDEO_STM32=y
+CONFIG_VIDEO_STM32_LVDS=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 CONFIG_WDT_ARM_SMC=y

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
