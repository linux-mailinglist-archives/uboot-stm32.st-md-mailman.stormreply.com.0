Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F119DE682
	for <lists+uboot-stm32@lfdr.de>; Fri, 29 Nov 2024 13:29:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 556E6C7802E;
	Fri, 29 Nov 2024 12:29:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50CB7C78024
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Nov 2024 12:29:42 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATB2nte002512;
 Fri, 29 Nov 2024 13:29:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=VFDk6izic4W7l5DERiXs1K
 fcnQgp3fvtZMOZ+I0B/k0=; b=ike07Qd8bqlAomevPgDM4GQk5Cig6/UFMnHITc
 n05WRZZp4lfBmiOtkTUZiP3Cbefun4vfK6C90p+2vE7yoJMObofD8+djV4FIDWvs
 ZS9Q7sYoBzB5xf/UL4AoIILVSpQVpMbUdiBQtFuwYLvigjb1z4JhzSIpnNZNUEK9
 kQhLY74Oz592xrQMgByVAsdDeasdcSTTS986maij5mjRi+TJwxV5yVbSGZZP4CU+
 9Kq9hy3dyGYtF4xwP9043n27h/C3ZCwGJrlCjwjdia2YXjHQaali3AwH6sMZu6QH
 mmHltJE3y1oA7iw45jIn4e0O0393tDgdvYFv/k8mSadXTfZQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4367199nyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 13:29:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DA22C4004B;
 Fri, 29 Nov 2024 13:28:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2385028AF0E;
 Fri, 29 Nov 2024 13:27:18 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 29 Nov
 2024 13:27:17 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 29 Nov 2024 13:27:05 +0100
Message-ID: <20241129122711.411917-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: [Uboot-stm32] [PATCH v1 0/6] Enable SYS_64BIT_LBA flag for STM32MP
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

Enable SYS_64BIT_LBA flag in order to fix issue when flashing
big binary using stm32prog.

Patrice Chotard (6):
  fastboot: Fix warning when CONFIG_SYS_64BIT_LBA is enable
  arm: stm32mp: stm32prog: fix warning when CONFIG_SYS_64BIT_LBA is
    enable
  arm: stm32mp: stm32prog: update multiplier is part-size is above SZ_1G
  configs: stm32mp13: enable CONFIG_SYS_64BIT_LBA
  configs: stm32mp15: enable CONFIG_SYS_64BIT_LBA
  configs: stm32mp25: enable CONFIG_SYS_64BIT_LBA

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 9 ++++++---
 configs/stm32mp13_defconfig                     | 1 +
 configs/stm32mp15_basic_defconfig               | 1 +
 configs/stm32mp15_defconfig                     | 1 +
 configs/stm32mp15_trusted_defconfig             | 1 +
 configs/stm32mp25_defconfig                     | 1 +
 drivers/fastboot/fb_mmc.c                       | 8 ++++----
 7 files changed, 15 insertions(+), 7 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
