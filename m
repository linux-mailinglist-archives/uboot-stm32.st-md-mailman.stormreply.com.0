Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C46A109BE
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Jan 2025 15:47:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B4A9C78031;
	Tue, 14 Jan 2025 14:47:04 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B0ECC7802D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 14:47:03 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EB661c026646;
 Tue, 14 Jan 2025 15:46:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 mt+jnpuen9fBLyVWwfUDLzSJDpVyOYgMcFYDPSAj/L8=; b=G2e7okigucfvYgb9
 1Pl0iFttOR3Ens6Uj7xc1XMDBSPaYNXyPPcrPnx6FGWr74i6rDBF4Ls6BOio/Onm
 P3Bwu32BPCj7KAwocp4WYi0iX/CMgQ7olUHNxNkSJ6dX/z4FF5GhuUOBFu+UHmYg
 rPSnIqASu6CKyBY6Tc6GbpN1BDiiS7BVjlS9QpBoKGoobor9THiF69l3P6Q6qZ0b
 irjmVIatY6jZl0irl3YbYlzEgpy4W2Dgn38tl0hcxG1wQeQhUOXoq89oqPtUbnea
 OHrWqzOWG9ocRm5XY7seZ1oclQMvrU7XzoVOBodFh5AYSxXJyEp2OUy+ERj/Qplu
 dESmhA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 445prprutp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2025 15:46:58 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9867640044;
 Tue, 14 Jan 2025 15:46:02 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5CC022ABA77;
 Tue, 14 Jan 2025 15:45:36 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 14 Jan
 2025 15:45:36 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 14 Jan 2025 15:45:24 +0100
Message-ID: <20250114144528.1612168-7-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250114144528.1612168-1-patrice.chotard@foss.st.com>
References: <20250114144528.1612168-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sjoerd Simons <sjoerd@collabora.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 06/10] dw3-generic: Add dependencies whith
	SYSCON and REGMAP
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

Since addition of STiH407 support in dwc3-generic, SYSCON and REGMAP
support are needed.

Add dependencies with SPL_REGMAP and SPL_SYSCON for:
qcm6490, imx8mp_evk, phycore-imx8mp, librem5, qcom,
xilinx_versal_net_virt, amd_versal2_virt, xilinx_zynqmp_kria
xilinx_zynqmp_virt.

Add dependencies with SPL_REGMAP and SPL_SYSCON for am57xx_hs_evm_usb.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>
---

 drivers/usb/dwc3/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 0100723a68b..ef82a3e9626 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -26,6 +26,10 @@ config USB_DWC3_OMAP
 config USB_DWC3_GENERIC
 	bool "Generic implementation of a DWC3 wrapper (aka dwc3 glue)"
 	depends on DM_USB && USB_DWC3 && MISC
+	select SPL_REGMAP if SPL
+	select SPL_SYSCON if SPL
+	select REGMAP
+	select SYSCON
 	help
 	  Select this for Xilinx ZynqMP and similar Platforms.
 	  This wrapper supports Host and Peripheral operation modes.
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
