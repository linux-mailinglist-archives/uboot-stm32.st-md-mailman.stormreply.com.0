Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1555B354C4
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Aug 2025 08:51:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 122FAC3FADA;
	Tue, 26 Aug 2025 06:51:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E4B7C3FAD9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 06:51:05 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q4PEE3013844;
 Tue, 26 Aug 2025 08:51:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=KacQYd32H6wGuvlsrhlV6f
 7XoOPUispVXrFoQszjdig=; b=UVXb5Ogwrbm47VZeN/BBANUQNhdjkVQMfVgjs1
 5p4uw2nJWobX4S1b7ze18+7JsOvgIgD8rrjhEe09xItnnqTeTKeI4B75EL1SaG8k
 cjYF+yi1En6j3T8mhre0+EHw/LFnJ7aGbXDN81gbhBGHD1EzeXP/PNV/qvz+gWEJ
 ehwJxAQvqOJaoplDq2nzTe1tbbxjR29zLb+gWExvAAD6APjfff/R00AVI7op9+Z5
 sWmAlh3/yGKQgVb6RahEBaxYtZFzw9bz64wqKfPDqIliyYMvVxPWWNuUS1tNXuaK
 QA2MuCVVIOTIk8/pybqWWv3Df9gQXaJCsRKwu6mGLiZuvO8Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48qq73yhtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Aug 2025 08:51:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 81BCA4002D;
 Tue, 26 Aug 2025 08:50:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC9B55AC2BF;
 Tue, 26 Aug 2025 08:50:19 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 26 Aug
 2025 08:50:19 +0200
Message-ID: <2235ea33-6eb6-4a04-9cf9-e4ee47f27dab@foss.st.com>
Date: Tue, 26 Aug 2025 08:50:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Tom Rini <trini@konsulko.com>, U-Boot STM32
 <uboot-stm32@st-md-mailman.stormreply.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>
Subject: [Uboot-stm32] [PULL] Pull request for u-boot master / v2025.10 =
 u-boot-stm32-20250825
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

Hi Tom

Please pull the STM32 related patches for u-boot/master, v2025.10 = u-boot-stm32-20250825

CI status: https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/27466

Thanks
Patrice

The following changes since commit 7d879baa6f7ca201bcecff74f2a7545560289280:

  Merge branch 'u-boot-nand-23082025' of https://source.denx.de/u-boot/custodians/u-boot-nand-flash (2025-08-24 08:01:29 -0600)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm32-20250825

for you to fetch changes up to 198c48f2657e67ded7fc7679c2ed1c26227f9fdc:

  configs: stm32mp25: Enable OF_UPSTREAM_BUILD_VENDOR (2025-08-25 16:54:53 +0200)

----------------------------------------------------------------
Enable OF_UPSTREAM_BUILD_VENDOR for stm32mp25_defconfig
Fix to avoid inifite loop in stm32_sdmmc2 driver
Populate oobavail field of nand_ecclayout in stm32_fmc2_nand driver

----------------------------------------------------------------
Christophe Kerello (2):
      mtd: rawnand: stm32_fmc2: set available OOB bytes per page
      mmc: stm32_sdmmc2: avoid infinite while loop

Patrice Chotard (1):
      configs: stm32mp25: Enable OF_UPSTREAM_BUILD_VENDOR

 configs/stm32mp25_defconfig            |  2 ++
 drivers/mmc/stm32_sdmmc2.c             | 16 +++++++++++++++-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
