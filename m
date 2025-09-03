Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D988B41EE6
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 Sep 2025 14:26:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B40CDC3FAC8;
	Wed,  3 Sep 2025 12:26:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB2BEC3FAC7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 12:26:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583APFQo029432;
 Wed, 3 Sep 2025 14:26:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=OdLWzHkiT+Huwb9oRgUhsS
 2HqnIwZ9EnGpAWgRjxzR8=; b=PPLPm7SYFGBCEM+1KaIr3Ntcu4WObKxFhlpA+T
 +4vsN3oFCANscUvSmxM5IXpUzRrRHCVOBNb0R1O/1aTZmj8iHFZ27AsyS7WzxlKf
 90nlA/cv8Z1u/eMFhDMu7z5ZKgoMbLXYTNquPcABahTBgbvaBbbocGwaKdTi4sM/
 F0q/87kTCJzet91KrteJ7AkrDztFla0RwFzfF0yJf1FV5A5TtJASOz2VVP7Cg3Gl
 E45E5thW26JGWjZg0vvpwmtR4HC8xfwQ87VTlwrzXjiNX1+sqiGHBMHn23cq0bld
 qrZnRscpgxPkVLtzdvpthCiK6GUGjiCv+2kPo5690afkWv8g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upe7gp7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Sep 2025 14:26:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BCAA240044;
 Wed,  3 Sep 2025 14:25:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 384ED37308C;
 Wed,  3 Sep 2025 14:25:39 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 14:25:38 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Wed, 3 Sep 2025 14:25:34 +0200
Message-ID: <20250903-master-v2-0-5cdf73bff42c@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAL4zuGgC/zXMQQ7CIBCF4as0s5YGplHRVe9hukAYLIsWwxCia
 bi72Ojyf3n5NmBKgRiu3QaJSuAQ1xZ46MDOZn2QCK41oMSj1GoQi+FMSeBg6aKtcUQS2vmZyIf
 XDt2m1nPgHNN7d4v6rj8C5Z8oSkjh7fnklTZ39G70kbnn3Nu4wFRr/QDaC9cOngAAAA==
X-Change-ID: 20250813-master-23ce98cadee0
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
Subject: [Uboot-stm32] [PATCH v2 0/7] Add display support for STM32MP25
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

This series aims to add basic LVDS display support for STM32MP257F-EV1
board.

It introduces:
- the STM32 LVDS Display Interface Transmitter driver.
- a new version of the STM32 LTDC driver.
- the support of "panel-lvds" compatible.

It adds and enables driver support for stm32mp257f-ev1-u-boot
It also brings fixes to the ofnode driver.

This work is based on the Linux device-tree sent recently [1].

[1] https://lore.kernel.org/lkml/20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com/

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
Changes in v2:
- Add Patrice's trailers where relevant.
- Add Yannick and Philippe as reviewers.
- Drop patch [7/8] - "configs: stm32mp25: enable LVDS display support"
- s/cirle/circle in commit log [5/8] - "video: stm32: ltdc: properly search the first available panel"
- Rebase on latest master branch
- Align on latest Linux patchset (which adds a new LTDC compatible)
- stm32_lvds driver:
  - Add 'st,stm32mp255-ltdc' compatible following above change
- stm32_lvds driver:
  - Gather all registers and fields definitions together
  - Uppercase registers on the following pattern: LVDS_<register_name>
  - Uppercase register fields on the following pattern:
                                               <reg_name>_<field_name>
  - Rename priv struct to 'stm32_lvds_priv' and rename variable for more
    explicit context (eg lvds -> priv)
  - Create plat struct 'stm32_lvds_plat'
  - Add .of_to_plat hook and move related content inside
  - Change several function prototypes following above change for more
    explicit context and readability.
  - Correct 'clkin_khz' error condition
- Link to v1: https://lore.kernel.org/r/20250820-master-v1-0-fc76f18ab2fd@foss.st.com

---
Raphael Gallais-Pou (7):
      ofnode: support panel-timings in ofnode_decode_display_timing
      video: simple_panel: add support for "panel-lvds" display
      video: stm32: STM32 driver support for LVDS
      video: stm32: ltdc: support new hardware version for STM32MP25 SoC
      video: stm32: ltdc: properly search the first available panel
      ARM: dts: stm32: use LTDC and LVDS nodes before relocation in stm32mp25-u-boot
      configs: stm32mp25: enable LVDS display support

 MAINTAINERS                        |   1 +
 arch/arm/dts/stm32mp25-u-boot.dtsi |   8 +
 configs/stm32mp25_defconfig        |   3 +
 doc/board/st/st-dt.rst             |   1 +
 drivers/core/ofnode.c              |  17 +-
 drivers/video/simple_panel.c       |   1 +
 drivers/video/stm32/Kconfig        |   9 +
 drivers/video/stm32/Makefile       |   1 +
 drivers/video/stm32/stm32_ltdc.c   | 158 ++++++++-
 drivers/video/stm32/stm32_lvds.c   | 693 +++++++++++++++++++++++++++++++++++++
 10 files changed, 872 insertions(+), 20 deletions(-)
---
base-commit: d367be2b13a388fdb0dc2720f66c30ddcec8a4fd
change-id: 20250813-master-23ce98cadee0

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
