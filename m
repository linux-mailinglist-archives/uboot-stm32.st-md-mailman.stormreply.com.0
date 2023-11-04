Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA0D7E105A
	for <lists+uboot-stm32@lfdr.de>; Sat,  4 Nov 2023 17:32:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01094C6B457;
	Sat,  4 Nov 2023 16:32:17 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65CC3C6B44D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Nov 2023 16:32:15 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 744A886E05;
 Sat,  4 Nov 2023 17:32:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1699115532;
 bh=ykUOhPw2aO5lzp8CyuAMwB/93aRw3tHDkW4fmeRj9CA=;
 h=From:To:Cc:Subject:Date:From;
 b=KzKgQlRTYkDQZwdVon6pPWiOY6LkUJtuiBMCSZk7MmETFfJM6Cx8rt7iWE1ovyOuM
 FG/v82fkhl7yHu77bPCGRbq1IKM8Fpi0bmX+7UNTJDVIZib1AcMg1gB6MyKVFDD2sG
 8SA/+a5wkBJ1is0mOtvuzqEPhqblciiX/QJLct+d3i+ltntwQdIvJRtlK6vd+jqJfC
 AgWwbDoClXlNIwvJ0UZK6eeh7qDRQAx9XwbaFZEKUEQ7CU0x1AwHW+mGxhDq+G9TM3
 Vx5rA1kXgTeAGRVZLa5dqezLUatDhyRsLFOVrPSSDGz+PNgbzPSrANPG4hvM7S12oQ
 uWFSmQVoXeTow==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sat,  4 Nov 2023 17:31:56 +0100
Message-ID: <20231104163203.117382-1-marex@denx.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH 1/2] arm: stm32: Enable TCP, IPv6,
	wget on DH STM32MP15 DHSOM
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

Enable support for TCP protocol, wget, and IPv6 on this platform.
The former two allow users download payload into the U-Boot from
a web server, which may be more convenient or easier to set up
than TFTP server. The later is enabled to future proof the IP
stack on this platform.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andreas Geisreiter <ageisreiter@dh-electronics.de>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 configs/stm32mp15_dhcom_basic_defconfig | 5 +++++
 configs/stm32mp15_dhcor_basic_defconfig | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
index b6cd0a47fa7..08aac878f8e 100644
--- a/configs/stm32mp15_dhcom_basic_defconfig
+++ b/configs/stm32mp15_dhcom_basic_defconfig
@@ -76,7 +76,10 @@ CONFIG_CMD_REMOTEPROC=y
 CONFIG_CMD_SPI=y
 CONFIG_CMD_USB=y
 CONFIG_CMD_USB_MASS_STORAGE=y
+CONFIG_CMD_DHCP6=y
+CONFIG_CMD_TFTPPUT=y
 CONFIG_SYS_DISABLE_AUTOLOAD=y
+CONFIG_CMD_WGET=y
 CONFIG_CMD_BOOTCOUNT=y
 CONFIG_CMD_CACHE=y
 CONFIG_CMD_TIME=y
@@ -101,6 +104,8 @@ CONFIG_IP_DEFRAG=y
 CONFIG_TFTP_TSIZE=y
 CONFIG_USE_SERVERIP=y
 CONFIG_SERVERIP="192.168.1.1"
+CONFIG_PROT_TCP_SACK=y
+CONFIG_IPV6=y
 CONFIG_STM32_ADC=y
 CONFIG_SPL_BLOCK_CACHE=y
 CONFIG_BOOTCOUNT_LIMIT=y
diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
index d1acf9c657e..8cd6924b580 100644
--- a/configs/stm32mp15_dhcor_basic_defconfig
+++ b/configs/stm32mp15_dhcor_basic_defconfig
@@ -74,7 +74,10 @@ CONFIG_CMD_REMOTEPROC=y
 CONFIG_CMD_SPI=y
 CONFIG_CMD_USB=y
 CONFIG_CMD_USB_MASS_STORAGE=y
+CONFIG_CMD_DHCP6=y
+CONFIG_CMD_TFTPPUT=y
 CONFIG_SYS_DISABLE_AUTOLOAD=y
+CONFIG_CMD_WGET=y
 CONFIG_CMD_BOOTCOUNT=y
 CONFIG_CMD_CACHE=y
 CONFIG_CMD_TIME=y
@@ -99,6 +102,8 @@ CONFIG_IP_DEFRAG=y
 CONFIG_TFTP_TSIZE=y
 CONFIG_USE_SERVERIP=y
 CONFIG_SERVERIP="192.168.1.1"
+CONFIG_PROT_TCP_SACK=y
+CONFIG_IPV6=y
 CONFIG_STM32_ADC=y
 CONFIG_SPL_BLOCK_CACHE=y
 CONFIG_BOOTCOUNT_LIMIT=y
-- 
2.42.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
