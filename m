Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 074FB624042
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Nov 2022 11:49:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7D0FC65056;
	Thu, 10 Nov 2022 10:49:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C95FC65058
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Nov 2022 10:49:29 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AAAlNP4012704; Thu, 10 Nov 2022 11:49:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=LeWPLgKix9Z7XBA3NBOERmYwKZmWFNa8hHxMYamtLpE=;
 b=rACNm/zyKM04/rXQLHUD2m169fzXVxuU9EnlW5tSZtJfbhq9JE3T1VoayChUvGyQ+Abz
 ypJ57cGFlzVYVspBudRix2xKjjvyiO7nLV9QAmEAHwQ6juvQoKv4RNb8FCJJAfd9VUbW
 EGgbd8P32pVyuE8LYfw131simQg4aYqmCWO+E4j9TTBoe4L63k7nnSJqTt8Vr1KjGYqH
 TgJmMyF/LH+hpagiZ+nkhY4aABVToOMdCaEhemSizQjArd6zd2jldQG+8eQZTcJkm+wy
 sNcnwfULPyI4IWh3OXZCYZbimEpAvZ+B87uaAi/50yc+rHM93VeQdcY+oDC81vn67Moa HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kryux80c3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 11:49:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7C6F9100039;
 Thu, 10 Nov 2022 11:49:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 76810218622;
 Thu, 10 Nov 2022 11:49:16 +0100 (CET)
Received: from localhost (10.252.15.206) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 10 Nov
 2022 11:49:13 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 10 Nov 2022 11:48:57 +0100
Message-ID: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.15.206]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_08,2022-11-09_01,2022-06-22_01
Cc: Peng Fan <peng.fan@nxp.com>, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 0/8] env: mmc: improvements and corrections
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


Update in U-Boot env mmc backend with several cosmetic changes or
corrections and 2 new features:

1/ CONFIG_ENV_MMC_USE_DT = no more use CONFIG_ENV_OFFSET
   in the mmc ENV backend when this config is activated.

   Requested by the STM32MP STMicroelectronics boards which activate
   several ENV_IS_IN_XXX; the value of CONFIG_ENV_OFFSET is invalid for
   SD-Card / eMMC boot; this offset should only used in SPIFlash backend
   (sf.c) for SPI-NOR boot.

   If this offset is used on mmc backend, when partition name in GPT is
   not aligned with  U-Boot DT: "u-boot,mmc-env-partition", the behavior
   is difficult to debug: a partition is corrupted on 'env save' command.

2/ selects the GPT env partition by the "u-boot-env" type GUID introduced
   by the commit c0364ce1c695 ("doc/README.gpt: define partition
   type GUID for U-Boot environment")

   This feature can also avoid issue when 'u-boot-env' partition name
   change in GPT partitioning but not in the U-Boot DT with
   "u-boot,mmc-env-partition"

Few check patch warnings remained in the series,
but after check I can't remove them :

- IS_ENABLED(ENV_MMC_HWPART_REDUND) is normally used as
  IS_ENABLED(CONFIG_ENV_MMC_HWPART_REDUND)
  => ENV_MMC_HWPART_REDUND is locally defined in this file it is not
     a real CONFIG but I can use the IS_ENABLED() macro as it is defined
     to 1

- Use 'if (IS_ENABLED(CONFIG...))' instead of '#if or #ifdef' where
  possible
  + CONFIG_PARTITION_TYPE_GUID => info.type_guid existence
  + CONFIG_ENV_OFFSET_REDUND and CONFIG_ENV_MMC_USE_DT => only for define

As I miss the merge window, not targeted for v2023.01 but for next
v2023.04.

Regards

Patrick



Patrick Delaunay (8):
  env: mmc: introduced ENV_MMC_OFFSET
  env: mcc: Drop unnecessary #ifdefs
  env: mcc: fix compilation error with ENV_IS_EMBEDDED
  env: mmc: add CONFIG_ENV_MMC_USE_DT
  configs: stm32mp: activate CONFIG_ENV_MMC_USE_DT
  env: mmc: select GPT env partition by type guid
  env: mmc: add debug message when mmc-env-partition is not found
  env: mmc: cosmetic: remove unused macro STR(X)

 configs/stm32mp13_defconfig         |   1 +
 configs/stm32mp15_basic_defconfig   |   1 +
 configs/stm32mp15_defconfig         |   1 +
 configs/stm32mp15_trusted_defconfig |   1 +
 env/Kconfig                         |  16 +++
 env/mmc.c                           | 182 ++++++++++++++++++----------
 6 files changed, 135 insertions(+), 67 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
