Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75230AB3EDF
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 May 2025 19:22:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CCB8C7A82D;
	Mon, 12 May 2025 17:22:16 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDD81C7A82A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 17:22:14 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Zx5yG3jyxz9sZZ;
 Mon, 12 May 2025 19:22:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747070534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WYXjOB+K3Z2KR7xuK7x7x3a55sdyOyCuH/JvPtCJnek=;
 b=geQbnHv7m6RCmrBwUQUGHZStt9ZT/wzJ+ap9iKTqAosIle7TvqT20yoVkgJESJpzum0iz3
 yoOTXMD3CwM/v02xxdEePrhJTNAK+FvkqjQwWtV6T6hVF0zYF8WU624kEFpBtSbTKUFWdE
 8obpUS7PXjIWjkhnjFdtREa3jrssjYJaAdPEpp/eCmqK/y6ahhHvGyQig5ve9VSVu+1Vu8
 5J3OxzVKvMXzMnHglpdXiHGiXUgrpOy/lxfFQ+hWc9WDdm0WtSHWlC938lkNXd+NX3EYJW
 j67VQmANh4H2oQfPd/qta0iJ6yqOe3lmfUuIrXrGTj6FhTEbJo8hjIEtARcUQA==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1747070532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WYXjOB+K3Z2KR7xuK7x7x3a55sdyOyCuH/JvPtCJnek=;
 b=Nd/df1VXN1rhqpcDSbioPhuVtugtMHy9Ff6DnOQnFcnOrhny5oIuTARykljxHLUPmLztiW
 OGl5kqMMgjZx8i1/0qnRg6oM52jdnA5bQZr18amjM1ev/Yu9IbeIHWTgF6N1UluJaHUgO/
 Mgc+osndpARM0AViu4GSlOYH3KCK0MjevkBv5PRUJJ3VTA9wdyrxnul8o2STlQ8/6ijTvq
 Aei5bQ9rSZR9+I+Gm3inW+AHUjMTH+VsoefLANORaLEnD9vZptl8nbKB9SO+rQxHg0aRU3
 pWq1tWQnfJV2WXHwygVvbhU9NWBIxjSDPOnh3j9W9nPQ2iVIXnqkgIW96Yg3AQ==
To: u-boot@lists.denx.de
Date: Mon, 12 May 2025 19:21:27 +0200
Message-ID: <20250512172149.150214-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 35e53e0ba4e6d1cc2fb
X-MBO-RS-META: ojxa45sgmekbkqbawmz4o39n7op8cg6b
X-Rspamd-Queue-Id: 4Zx5yG3jyxz9sZZ
Cc: Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, u-boot@dh-electronics.com,
 Marek Vasut <marek.vasut@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Lionel Debieve <lionel.debieve@foss.st.com>,
 Pascal Zimmermann <pzimmermann@dh-electronics.com>
Subject: [Uboot-stm32] [PATCH 00/10] ARM: stm32: Add STM32MP13xx SPL and
	OpTee-OS start support
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

Add SPL support to STM32MP13xx, so U-Boot SPL can initialize the hardware
without depending on any out-of-tree blobs. Enable the ability to start
OpTee-OS as a fitImage loadable, which allows booting the Linux kernel, DT
and OpTee-OS blob together from a single fitImage container file. This
avoids any ABI compatibility problems between OpTee-OS SCMI provider ABI
and the Linux kernel SCMI consumer ABI expectations, which led to unbootable
and irrecoverable systems after updates due to incompatible ABI changes.

Marek Vasut (10):
  ARM: stm32: Add STM32MP13xx SPL Kconfig options
  ARM: stm32: Add STM32MP13xx SPL hardware initialization
  ARM: stm32: Limit early cache enablement in SPL to STM32MP15xx
  ARM: stm32: Add STM32MP13xx PMIC initialization for DDR3 DRAM type
  ARM: stm32: Add STM32MP13xx debug UART initialization
  ARM: dts: stm32: Add stm32mp13-ddr.dtsi template
  ARM: dts: stm32: Add 512 MiB DRAM settings for DH STM32MP13xx DHCOR
    DHSBC
  ARM: dts: stm32: Add STM32MP13x SPL specific DT additions
  ARM: dts: stm32: Add SPL specifics for DH STM32MP13xx DHCOR DHSBC
  ARM: dts: stm32: Switch defconfig to SPL for DH STM32MP13xx DHCOR
    DHSBC

 arch/arm/dts/stm32mp1-ddr.dtsi                | 187 ++++++++++++++++
 arch/arm/dts/stm32mp13-ddr.dtsi               |  49 +++++
 .../stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi | 100 +++++++++
 arch/arm/dts/stm32mp13-u-boot.dtsi            |  89 ++++++++
 arch/arm/dts/stm32mp13xx-dhcor-u-boot.dtsi    | 156 +++++++++++++-
 arch/arm/dts/stm32mp15-ddr.dtsi               | 170 +--------------
 arch/arm/mach-stm32mp/Kconfig                 |   7 +-
 arch/arm/mach-stm32mp/Kconfig.13x             |   3 +-
 arch/arm/mach-stm32mp/include/mach/stm32.h    |   2 +
 arch/arm/mach-stm32mp/stm32mp1/cpu.c          |   9 +-
 arch/arm/mach-stm32mp/stm32mp1/spl.c          |   3 +-
 arch/arm/mach-stm32mp/stm32mp1/stm32mp13x.c   | 204 ++++++++++++++++++
 board/st/common/stpmic1.c                     |  51 +++--
 board/st/stm32mp1/debug_uart.c                |  21 +-
 configs/stm32mp13_dhcor_defconfig             |  30 ++-
 configs/stm32mp15_dhsom.config                |  48 +----
 configs/stm32mp_dhsom.config                  |  35 ++-
 17 files changed, 914 insertions(+), 250 deletions(-)
 create mode 100644 arch/arm/dts/stm32mp1-ddr.dtsi
 create mode 100644 arch/arm/dts/stm32mp13-ddr.dtsi
 create mode 100644 arch/arm/dts/stm32mp13-ddr3-dhsom-1x2Gb-1066-binG.dtsi

---
Cc: Cheick Traore <cheick.traore@foss.st.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Lionel Debieve <lionel.debieve@foss.st.com>
Cc: Pascal Zimmermann <pzimmermann@dh-electronics.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com

-- 
2.47.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
