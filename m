Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CD9A1352B
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Jan 2025 09:19:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9733C78F80;
	Thu, 16 Jan 2025 08:19:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1BDAC78F7D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2025 08:19:06 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G7nVdN001060;
 Thu, 16 Jan 2025 09:19:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 UYcN/2RIifWtkPtVKoqfDyVXJOFdHXaOzEjUpvWueYk=; b=oPyVVK1OewyJoHu+
 1RqajsSIGnMlbc4guN+yMybuAawLSHIzqQkb+V/Si4Lm4kw4ovO9rp8u9qi/qc0+
 hhfdKRovdFa33PWMOHN9zZy0WTH2x/UKt1rZZnK219In/qZwsQEM7nqipwjSRCcH
 z5RwFXBFFbBTQWifZafNDFAg11WPmkCqGwWaOHVthND8cW7F2S8JYH0XByWCpRuh
 FM40f1VwsMkX28NZ+RAYho5YyIV8eTHkv7Ur7LJNSU6+ZS2sFuLXdqkiccBec7x4
 xF61oFjzH8NpVOqGeC/mtephrFfJX1Txhf9RMzaai+jNcjHDIb18J/Uy2C+K80yy
 T6Ux+w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 446m8s9u22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2025 09:19:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B54C240056;
 Thu, 16 Jan 2025 09:18:15 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B047328C112;
 Thu, 16 Jan 2025 09:17:45 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 16 Jan
 2025 09:17:45 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 16 Jan 2025 09:17:34 +0100
Message-ID: <20250116081738.2511223-6-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250116081738.2511223-1-patrice.chotard@foss.st.com>
References: <20250116081738.2511223-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_03,2025-01-16_01,2024-11-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v2 5/9] configs: stih410-b2260: Enable
	USB_DWC3_GENERIC and USB_DWC3_STI flags
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

Enable USB_DWC3_GENERIC and USB_DWC3_STI flags.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>

---

Changes in v2:
  - enable new flag USB_DWC3_STI

 configs/stih410-b2260_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/stih410-b2260_defconfig b/configs/stih410-b2260_defconfig
index e312ca492d2..4fcbf75548b 100644
--- a/configs/stih410-b2260_defconfig
+++ b/configs/stih410-b2260_defconfig
@@ -61,6 +61,8 @@ CONFIG_USB_EHCI_GENERIC=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_GENERIC=y
 CONFIG_USB_DWC3=y
+CONFIG_USB_DWC3_GENERIC=y
+CONFIG_USB_DWC3_STI=y
 CONFIG_USB_HOST_ETHER=y
 CONFIG_USB_ETHER_ASIX=y
 CONFIG_USB_ETHER_MCS7830=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
