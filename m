Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D889DB81F
	for <lists+uboot-stm32@lfdr.de>; Thu, 28 Nov 2024 13:59:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63C56C78038;
	Thu, 28 Nov 2024 12:59:00 +0000 (UTC)
Received: from mx3.securetransport.de (mx3.securetransport.de [116.203.31.6])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id
 D6C25C78F83 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2024 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1732703401;
 bh=Gz+f8ldq07zPClYOyakbS/3I33vNC19DZ5Q6s3+jUyg=;
 h=From:To:CC:Subject:Date:From;
 b=u5qus3KYQig0QP2VPsXW8Xpa5wbc2CIuV8vttqrHieAJ0uHpgFFgEJWyGQPtyG51S
 NAKwKfyuNo0g3tK+3xhNAbvE7vEryZCb3Ud4sqJgiM5mae2FBaibBmBVj0lqghx2Jr
 XtdjeWtdQ7OGPHeNbC6liy9RLYaJKURnZpAJaQvdKRqauzQRXMvFBLE67/2de05VTk
 HHWmAeL40Bd6GeuOG9sdWyAx/Q2+KNpKbLZNHUoJxiBFWSOJjtUZPX65smgz3baOCF
 Ktuo2oj7iaanm+zwssEiQjzfqRPRIzHLhy/CJo98PYK/ctprUyidT7JJ2hSelPrN1/
 ci2VPX6pv/ZJQ==
From: Pascal Zimmermann <pzimmermann@dh-electronics.com>
To: <u-boot@lists.denx.de>
Date: Wed, 27 Nov 2024 11:29:22 +0100
Message-ID: <20241127102924.7652-1-pzimmermann@dh-electronics.com>
X-klartext: yes
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Nov 2024 12:59:00 +0000
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>
Subject: [Uboot-stm32] [PATCH 0/2] ARM: stm32: env: Enable scan and start
	for AB schema on STM32MP15 DHSOM
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
