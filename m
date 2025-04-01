Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C82D6A77CCF
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Apr 2025 15:53:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F6A3C78F90;
	Tue,  1 Apr 2025 13:53:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2935EC78034
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 13:53:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531C3DGf021916;
 Tue, 1 Apr 2025 15:53:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=Zc67h+/XXaapQI1/3NrHvB
 39YMcsZJASptLfaA2zJPQ=; b=ho3MPfia5DLFqQiQF66r0KUO8IIfGDOVHRu3Vf
 qwIXaAbjDIFJ6g62ta4EBcdZrHKeCK+bNviLnlGr4qIYf1ArlUJ/7w8m6kWq6Xpv
 4ldjKro2uIFWtzGkR3gHf8qG18brNRq9RjyaAKwiWXofNpWsmZiBCqVFFpkaz+SW
 Q/DV9GOpdDrfLAujmmpPB66h7rVZGNu2cJOFjsXhgR/OvKedY4qpLNKOJ4fwq9JU
 TyjKAq8fsPHJbdGFO5+mVpUhmI6sAFfphu/UDU9QuMXi5GOarfNfRWe3yiKmssjq
 pItxcIWOzD8XRFd4qnVOKKWxeGSL9g0FCJkdzU7Px8ediylA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45p8mmna64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Apr 2025 15:53:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AA91D400A6;
 Tue,  1 Apr 2025 15:51:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 652028A53F7;
 Tue,  1 Apr 2025 15:51:40 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 15:51:40 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 1 Apr 2025 15:51:26 +0200
Message-ID: <20250401135132.395518-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_05,2025-03-27_02,2024-11-22_01
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 0/6] configs: stm32: Fix console cmdline for
	stm32 MCU's board
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

This series fixes console command line for some STM32 MCU's board.

Patrice Chotard (6):
  configs: stm32f769-disco_spl: Fix console cmdline
  configs: stm32f746-disco_spl: Fix console cmdline
  configs: stm32f769-disco: Fix console cmdline
  configs: stm32f729-discovery: Fix console cmdline
  configs: stm32746-eval_spl: Fix console cmdline
  configs: stm32746-eval: Fix console cmdline

 configs/stm32746g-eval_defconfig      | 2 +-
 configs/stm32746g-eval_spl_defconfig  | 2 +-
 configs/stm32f429-discovery_defconfig | 2 +-
 configs/stm32f746-disco_defconfig     | 2 +-
 configs/stm32f746-disco_spl_defconfig | 2 +-
 configs/stm32f769-disco_spl_defconfig | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
