Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C8F879D5F
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Mar 2024 22:16:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68186C6C83C;
	Tue, 12 Mar 2024 21:16:44 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB4D1C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 21:16:43 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 85D5B8785F;
 Tue, 12 Mar 2024 22:16:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1710278203;
 bh=BtmOfXCddIV994DP4RejMEjxtNen5Qq/ce5w6fWAOng=;
 h=From:To:Cc:Subject:Date:From;
 b=ywdF+X1d5/NRjKJXYTAfvZURtCoHZIi6skQtOUmt2VBYbNx3P1W4npZ1RDbGEFhKw
 lyVjQMNMVVW0y5c4fgF3WDaeAc/4I3rZPuybpzDpVXw7BNWShGqU3cQjoWc3tttPBK
 jLLBA6WNcPwY8O6xMQd5khyy0YpW+46i+IfsWYL01XpCWKcB6/a7ADXTlTh9ouA9Dg
 7F1EzzBs+ALxN+vzDuiQX6yQEzvTD9o40FP0Y1JY29pX6QgglWUGtNPtDdI5jF3esp
 XzDT2nvU3GEh9djIvhP7VEhFKQhjnVTzEkaKwrRbDguUGlnSLz0od2eX+0D/xuTU1g
 6W3ZeXwG+BOaQ==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Tue, 12 Mar 2024 22:15:58 +0100
Message-ID: <20240312211628.32842-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com,
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@denx.de>
Subject: [Uboot-stm32] [PATCH] ARM: imx: stm32: Test whether ethernet node
	is enabled before reading MAC EEPROM on DHSOM
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

Check whether the ethernet interface is enabled at all before reading
MAC EEPROM. As a cost saving measure, it can happen that the MAC EEPROM
is not populated on SoMs which do not use ethernet.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>
Cc: Andreas Geisreiter <ageisreiter@dh-electronics.de>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Stefano Babic <sbabic@denx.de>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
NOTE: It is probably best if this goes in via either imx or stm32 tree,
      I can break the patch up, but that would introduce dependency
      between two PRs in different trees. Let me know what you prefer.
---
 board/dhelectronics/common/dh_common.c           | 16 ++++++++++++++++
 board/dhelectronics/common/dh_common.h           |  8 ++++++++
 board/dhelectronics/dh_imx6/dh_imx6.c            |  3 +++
 .../dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c  |  6 ++++++
 board/dhelectronics/dh_stm32mp1/board.c          |  6 ++++++
 5 files changed, 39 insertions(+)

diff --git a/board/dhelectronics/common/dh_common.c b/board/dhelectronics/common/dh_common.c
index 67e3d59b1f3..34094a020b0 100644
--- a/board/dhelectronics/common/dh_common.c
+++ b/board/dhelectronics/common/dh_common.c
@@ -18,6 +18,19 @@ bool dh_mac_is_in_env(const char *env)
 	return eth_env_get_enetaddr(env, enetaddr);
 }
 
+int dh_get_mac_is_enabled(const char *alias)
+{
+	ofnode node = ofnode_path(alias);
+
+	if (!ofnode_valid(node))
+		return -EINVAL;
+
+	if (!ofnode_is_enabled(node))
+		return -ENODEV;
+
+	return 0;
+}
+
 int dh_get_mac_from_eeprom(unsigned char *enetaddr, const char *alias)
 {
 	struct udevice *dev;
@@ -57,6 +70,9 @@ __weak int dh_setup_mac_address(void)
 	if (dh_mac_is_in_env("ethaddr"))
 		return 0;
 
+	if (dh_get_mac_is_enabled("ethernet0"))
+		return 0;
+
 	if (!dh_get_mac_from_eeprom(enetaddr, "eeprom0"))
 		return eth_env_set_enetaddr("ethaddr", enetaddr);
 
diff --git a/board/dhelectronics/common/dh_common.h b/board/dhelectronics/common/dh_common.h
index 2b24637d96d..a2de5b1553e 100644
--- a/board/dhelectronics/common/dh_common.h
+++ b/board/dhelectronics/common/dh_common.h
@@ -11,6 +11,14 @@
  */
 bool dh_mac_is_in_env(const char *env);
 
+/*
+ * dh_get_mac_is_enabled - Test if ethernet MAC is enabled in DT
+ *
+ * @alias: alias for ethernet MAC device tree node
+ * Return: 0 if OK, other value on error
+ */
+int dh_get_mac_is_enabled(const char *alias);
+
 /*
  * dh_get_mac_from_eeprom - Get MAC address from eeprom and write it to enetaddr
  *
diff --git a/board/dhelectronics/dh_imx6/dh_imx6.c b/board/dhelectronics/dh_imx6/dh_imx6.c
index 07fc9b1fe6d..0676587c38a 100644
--- a/board/dhelectronics/dh_imx6/dh_imx6.c
+++ b/board/dhelectronics/dh_imx6/dh_imx6.c
@@ -92,6 +92,9 @@ int dh_setup_mac_address(void)
 	if (dh_mac_is_in_env("ethaddr"))
 		return 0;
 
+	if (dh_get_mac_is_enabled("ethernet0"))
+		return 0;
+
 	if (!dh_imx_get_mac_from_fuse(enetaddr))
 		goto out;
 
diff --git a/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c b/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
index 5f12d787d38..ff2c0e87215 100644
--- a/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
+++ b/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
@@ -47,6 +47,9 @@ static int dh_imx8_setup_ethaddr(void)
 	if (dh_mac_is_in_env("ethaddr"))
 		return 0;
 
+	if (dh_get_mac_is_enabled("ethernet0"))
+		return 0;
+
 	if (!dh_imx_get_mac_from_fuse(enetaddr))
 		goto out;
 
@@ -66,6 +69,9 @@ static int dh_imx8_setup_eth1addr(void)
 	if (dh_mac_is_in_env("eth1addr"))
 		return 0;
 
+	if (dh_get_mac_is_enabled("ethernet1"))
+		return 0;
+
 	if (!dh_imx_get_mac_from_fuse(enetaddr))
 		goto increment_out;
 
diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index 88eb7d1b8d4..b3309c9d330 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -129,6 +129,9 @@ static int dh_stm32_setup_ethaddr(void)
 	if (dh_mac_is_in_env("ethaddr"))
 		return 0;
 
+	if (dh_get_mac_is_enabled("ethernet0"))
+		return 0;
+
 	if (!dh_get_mac_from_eeprom(enetaddr, "eeprom0"))
 		return eth_env_set_enetaddr("ethaddr", enetaddr);
 
@@ -142,6 +145,9 @@ static int dh_stm32_setup_eth1addr(void)
 	if (dh_mac_is_in_env("eth1addr"))
 		return 0;
 
+	if (dh_get_mac_is_enabled("ethernet1"))
+		return 0;
+
 	if (dh_stm32_mac_is_in_ks8851())
 		return 0;
 
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
