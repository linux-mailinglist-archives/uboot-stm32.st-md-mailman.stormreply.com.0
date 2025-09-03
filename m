Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D68B41EEB
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 Sep 2025 14:27:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07D09C3FAC8;
	Wed,  3 Sep 2025 12:27:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59648C3FAC7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 12:27:35 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583CHuXK021895;
 Wed, 3 Sep 2025 14:27:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 eEvAs1Ns599g56TpuSNqHLfzxzG6VaKjvoYHQcsW7eI=; b=Yd29pCwv2RMNkKV/
 ApHCNBQrh44i+IQyEuO2XwF5jcPC6oG5cq0JK40I7y98I7/w7epNe1HW4+ZYwUye
 VBUzY8H7yLRem/1fNre+dtIvAyYs8CRIebAoR6skRkPSEiH1HZ8Z3poqh2exuQoF
 USjN76UEwb5ds6UqW7U6IL29YdJhMKb5HVI/Muaw3ToMSS8/7RmlobwZlQ7l/wDu
 qDvd0xZgA+UjPggiRAHqVkrLoXuptRxc8ftIobeYUm/6Ob9Tw2tY+3znIRJId2dk
 l0x8D9H6Wbak7EZvPLlldCDkgk5Ix3pk9yqPDBfxxpjHnb2IIlLkoNQOzwlrEJm/
 JyaHqA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vav2ppb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Sep 2025 14:27:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A1C914004A;
 Wed,  3 Sep 2025 14:26:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A18F339C6FB;
 Wed,  3 Sep 2025 14:25:42 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 14:25:42 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Wed, 3 Sep 2025 14:25:40 +0200
MIME-Version: 1.0
Message-ID: <20250903-master-v2-6-5cdf73bff42c@foss.st.com>
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
Subject: [Uboot-stm32] [PATCH v2 6/7] ARM: dts: stm32: use LTDC and LVDS
 nodes before relocation in stm32mp25-u-boot
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

Use LTDC and LVDS nodes in all boot phases.  This is specially useful
before U-Boot relocation.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm/dts/stm32mp25-u-boot.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/dts/stm32mp25-u-boot.dtsi b/arch/arm/dts/stm32mp25-u-boot.dtsi
index d9aeeb6d510df9dea9700148cf8a8ad5efcfd4f9..3ac35c4a6bc27c72eeeb532742fd4412b7aa1b85 100644
--- a/arch/arm/dts/stm32mp25-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp25-u-boot.dtsi
@@ -93,6 +93,14 @@
 	bootph-all;
 };
 
+&ltdc {
+	bootph-all;
+};
+
+&lvds {
+	bootph-all;
+};
+
 &pinctrl {
 	bootph-all;
 };

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
