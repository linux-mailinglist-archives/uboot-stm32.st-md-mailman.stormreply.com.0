Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 431FF7E105B
	for <lists+uboot-stm32@lfdr.de>; Sat,  4 Nov 2023 17:32:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A3E1C6B457;
	Sat,  4 Nov 2023 16:32:20 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98A88C6B458
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Nov 2023 16:32:18 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id EBCB186F63;
 Sat,  4 Nov 2023 17:32:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1699115533;
 bh=/dFPSv5AuXhEqGI5aHuoHyBfY8jPuQQiNtnqYkKEdVk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pNs8L+iqbMlo+09+/tHzfymj3uwW6rfHxNnJOItYxZYMw3OncFW3mhKwzuX9xh64o
 T1buY7RUGtHq0n0m4HNRagfyQNTgkpHHNBbdDhv5x/GReijOIbN+KkjZSTybnW0WVi
 wyjZMENE6OG53Ca+eTfr0i44WZlyjWY/dE0zLiZstoL1Q4jfhh1ZfolexX/zXgDcPn
 JUx3T+ASiy5vzBp+hSoFTz+sa09cXXvHF5wys4HkuqU1xRffhGZgwrRQWAZzl8OnIU
 2wWoNFDzf2nomVwmpwuWnE3pLAAdIHyeMII4Bu/hCQEINCZEC6h61mWugKc1SIoxjr
 tvPE/x39Te6rQ==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sat,  4 Nov 2023 17:31:57 +0100
Message-ID: <20231104163203.117382-2-marex@denx.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231104163203.117382-1-marex@denx.de>
References: <20231104163203.117382-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH 2/2] arm: stm32: Limit u-boot.itb size to
	0x160000 bytes on DH STM32MP15 DHSOM
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

The maximum size of u-boot.itb in SPI NOR on DH STM32MP15 DHSOM is
0x160000 . Define this size in U-Boot config to prevent misconfigured
builds from emitting larger u-boot.itb than the one which fits the
SPI NOR area reserved for the blob.

The SPI NOR layout is as follows:
0x00_0000..0x03_ffff ... SPL 1
0x04_0000..0x07_ffff ... SPL 2
0x08_0000..0x1d_ffff ... U-Boot
0x1e_0000..0x1e_ffff ... Environment 1
0x1f_0000..0x1f_ffff ... Environment 2

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andreas Geisreiter <ageisreiter@dh-electronics.de>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 configs/stm32mp15_dhcom_basic_defconfig | 2 ++
 configs/stm32mp15_dhcor_basic_defconfig | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
index 08aac878f8e..1d241529be7 100644
--- a/configs/stm32mp15_dhcom_basic_defconfig
+++ b/configs/stm32mp15_dhcom_basic_defconfig
@@ -25,6 +25,8 @@ CONFIG_SPL_SPI=y
 CONFIG_SYS_LOAD_ADDR=0xc2000000
 CONFIG_SYS_MEMTEST_START=0xc0000000
 CONFIG_SYS_MEMTEST_END=0xc4000000
+CONFIG_HAS_BOARD_SIZE_LIMIT=y
+CONFIG_BOARD_SIZE_LIMIT=1441792
 CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0xc1000000
diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
index 8cd6924b580..6e0c4a8cf9f 100644
--- a/configs/stm32mp15_dhcor_basic_defconfig
+++ b/configs/stm32mp15_dhcor_basic_defconfig
@@ -23,6 +23,8 @@ CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI=y
 # CONFIG_ARMV7_VIRT is not set
 CONFIG_SYS_LOAD_ADDR=0xc2000000
+CONFIG_HAS_BOARD_SIZE_LIMIT=y
+CONFIG_BOARD_SIZE_LIMIT=1441792
 CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_LOAD_FIT_ADDRESS=0xc1000000
-- 
2.42.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
