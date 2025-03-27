Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D73A7349F
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Mar 2025 15:39:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6504EC78F72;
	Thu, 27 Mar 2025 14:39:32 +0000 (UTC)
Received: from mx3.securetransport.de (mx3.securetransport.de [116.203.31.6])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id
 63659C78F6D for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Mar 2025 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1743086360;
 bh=Gz+f8ldq07zPClYOyakbS/3I33vNC19DZ5Q6s3+jUyg=;
 h=From:To:CC:Subject:Date:From;
 b=XznV9uo6gleD2E+psiOaajFbKjRUKBFeIvsnIVWVj6lrSf3nns8bqrAULgeHggD4w
 0adSU06nz89kxRWAvd9Xor3++jOr+tvw/73BTJ+997XHz2kcDb0v68SIYmFyTcGdkE
 ANUWtx1e6uAJDryvqb1vHliL+gJXxxzMN3QuURnH/NDXEGBHB2TqCYArXjZlUvYjUZ
 zHWxDNcsDA3SidCpdIUGGsED3AV9LFUjoAdWVd6h+bl1A05Dbam+egpUlIIEIt9VEv
 XLFuPYTVABquoItqa1e8rhxmPfs+70f/3oSiUtMe1FhenJXmb48j8MKB/LuHsMO6VK
 MAWRgBQx3ZR3Q==
From: Pascal Zimmermann <pzimmermann@dh-electronics.com>
To: <u-boot@lists.denx.de>
Date: Thu, 27 Mar 2025 15:38:41 +0100
Message-ID: <20250327143843.19358-1-pzimmermann@dh-electronics.com>
X-klartext: yes
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>
Subject: [Uboot-stm32] [RESEND PATCH 0/2] ARM: stm32: env: Enable scan and
	start for AB schema on STM32MP15 DHSOM
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

For the STM32MP15 DHSOM, change the default environment so an AB schema
on a device can be detected.

The first patch makes possible to substitute the 'part list' command
inside 'scan_dev_for_boot_part' with a custom board specific
implementation.

The second patch uses the change of the first patch to plug the board
specific code for booting from AB into the standard boot of all boot
targets at the STM32MP15 DHSOM.

The detection works by looking for the partitions with specific lables.
The name of those partitions are in the variables and its defaults:
* dh_ab_partname_primary=rootfs-a
* dh_ab_partname_secondary=rootfs-b

To prevent being hanging at bootcmd, enable "CONFIG_BOOT_RETRY" and
"CONFIG_RESET_TO_RETRY", but the timer will only be activated, if the AB
partitions are detected.

Pascal Zimmermann (2):
  config_distro_bootcmd: make possible to substitute 'part list' in
    distro_bootcmd
  ARM: stm32: env: Enable scan and start for AB schema on STM32MP15
    DHSOM

 configs/stm32mp15_dhsom.config       |  3 +++
 include/config_distro_bootcmd.h      |  7 +++++-
 include/configs/stm32mp15_dh_dhsom.h | 33 ++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)

Signed-off-by: Pascal Zimmermann <pzimmermann@dh-electronics.com>
---
Cc: Marek Vasut <marex@denx.de>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
Cc: u-boot@lists.denx.de

-- 
2.30.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
