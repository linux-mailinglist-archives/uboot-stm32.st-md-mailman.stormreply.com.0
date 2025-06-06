Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1C7AD1928
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jun 2025 09:41:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3010C3F93A;
	Mon,  9 Jun 2025 07:41:36 +0000 (UTC)
Received: from freeshell.de (freeshell.de [116.202.128.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A7F0C3F938
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Jun 2025 22:46:40 +0000 (UTC)
Received: from hay.lan. (unknown
 [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
 (Authenticated sender: e)
 by freeshell.de (Postfix) with ESMTPSA id 4E28AB4C35AB;
 Sat,  7 Jun 2025 00:46:34 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>,
 Tingting Meng <tingting.meng@altera.com>, Peng Fan <peng.fan@nxp.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Michal Simek <michal.simek@amd.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Simon Glass <sjg@chromium.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Kever Yang <kever.yang@rock-chips.com>, Anatolij Gustschin <agust@denx.de>
Date: Fri,  6 Jun 2025 15:44:58 -0700
Message-ID: <20250606224558.1117422-4-e@freeshell.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606224558.1117422-1-e@freeshell.de>
References: <20250606224558.1117422-1-e@freeshell.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Jun 2025 07:41:36 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, E Shattow <e@freeshell.de>
Subject: [Uboot-stm32] [PATCH v1 3/7] drivers: use lowercase hex prefix style
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

Use consistent lowercase hex prefix style in drivers/*

Does not change hex prefix case in allcaps uppercase style error messages

Signed-off-by: E Shattow <e@freeshell.de>
---
 drivers/ata/dwc_ahsata_priv.h             |  4 +-
 drivers/clk/renesas/r8a774a1-cpg-mssr.c   |  2 +-
 drivers/clk/stm32/clk-stm32mp1.c          |  2 +-
 drivers/ddr/altera/iossm_mailbox.c        |  2 +-
 drivers/mmc/sdhci-cadence6.c              |  2 +-
 drivers/mmc/zynq_sdhci.c                  |  2 +-
 drivers/mtd/nand/raw/lpc32xx_nand_mlc.c   |  4 +-
 drivers/net/fsl-mc/mc.c                   |  2 +-
 drivers/net/phy/ca_phy.c                  |  2 +-
 drivers/phy/rockchip/phy-rockchip-typec.c |  2 +-
 drivers/power/regulator/act8846.c         |  4 +-
 drivers/ram/k3-ddrss/k3-ddrss.c           |  2 +-
 drivers/ram/octeon/octeon3_lmc.c          |  2 +-
 drivers/sound/max98088.h                  | 50 +++++++++++------------
 drivers/sound/max98095.h                  |  2 +-
 drivers/video/bridge/dp501.c              |  2 +-
 drivers/video/hx8238d.c                   |  2 +-
 drivers/video/zynqmp/zynqmp_dpsub.h       |  2 +-
 18 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/ata/dwc_ahsata_priv.h b/drivers/ata/dwc_ahsata_priv.h
index 0c2cd5446b5..f2a118420f9 100644
--- a/drivers/ata/dwc_ahsata_priv.h
+++ b/drivers/ata/dwc_ahsata_priv.h
@@ -117,8 +117,8 @@
 #define SATA_HOST_GPARAM1R_PHY_TYPE	0x00001000
 #define SATA_HOST_GPARAM1R_RETURN_ERR	0x00000400
 #define SATA_HOST_GPARAM1R_AHB_ENDIAN_MASK	0x00000300
-#define SATA_HOST_GPARAM1R_S_HADDR	0X00000080
-#define SATA_HOST_GPARAM1R_M_HADDR	0X00000040
+#define SATA_HOST_GPARAM1R_S_HADDR	0x00000080
+#define SATA_HOST_GPARAM1R_M_HADDR	0x00000040
 
 /* Global Parameter 2 Register */
 #define SATA_HOST_GPARAM2R_DEV_CP	0x00004000
diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
index d23041a8026..c8972106d90 100644
--- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
@@ -305,7 +305,7 @@ static const struct mstp_stop_table r8a774a1_mstp_table[] = {
 	{ 0xD00C7C1F, 0, 0xD00C7C1F, 0 },
 	{ 0x80000004, 0, 0x80000004, 0 },
 	{ 0x00DF0006, 0, 0x00DF0006, 0 },
-	{ 0XC5EACCCE, 0, 0XC5EACCCE, 0 },
+	{ 0xC5EACCCE, 0, 0xC5EACCCE, 0 },
 	{ 0x29E1401C, 0, 0x29E1401C, 0 },
 	{ 0x00009FF1, 0, 0x00009FF1, 0 },
 	{ 0xFC4FDFE0, 0, 0xFC4FDFE0, 0 },
diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
index 9cb69a01f7f..823ce132d0b 100644
--- a/drivers/clk/stm32/clk-stm32mp1.c
+++ b/drivers/clk/stm32/clk-stm32mp1.c
@@ -117,7 +117,7 @@ DECLARE_GLOBAL_DATA_PTR;
 #define RCC_DSICKSELR		0x924
 #define RCC_ADCCKSELR		0x928
 #define RCC_MP_APB1ENSETR	0xA00
-#define RCC_MP_APB2ENSETR	0XA08
+#define RCC_MP_APB2ENSETR	0xA08
 #define RCC_MP_APB3ENSETR	0xA10
 #define RCC_MP_AHB2ENSETR	0xA18
 #define RCC_MP_AHB3ENSETR	0xA20
diff --git a/drivers/ddr/altera/iossm_mailbox.c b/drivers/ddr/altera/iossm_mailbox.c
index fc09dde3f9e..21f94959a04 100644
--- a/drivers/ddr/altera/iossm_mailbox.c
+++ b/drivers/ddr/altera/iossm_mailbox.c
@@ -41,7 +41,7 @@
 
 /* Offset of Mailbox Read-only Registers  */
 #define IOSSM_MAILBOX_HEADER_OFFSET			0x0
-#define IOSSM_MEM_INTF_INFO_0_OFFSET			0X200
+#define IOSSM_MEM_INTF_INFO_0_OFFSET			0x200
 #define IOSSM_MEM_INTF_INFO_1_OFFSET			0x280
 #define IOSSM_MEM_TECHNOLOGY_INTF0_OFFSET		0x210
 #define IOSSM_MEM_TECHNOLOGY_INTF1_OFFSET		0x290
diff --git a/drivers/mmc/sdhci-cadence6.c b/drivers/mmc/sdhci-cadence6.c
index a5ed87321ab..9a92b8437a6 100644
--- a/drivers/mmc/sdhci-cadence6.c
+++ b/drivers/mmc/sdhci-cadence6.c
@@ -19,7 +19,7 @@
 #include "sdhci-cadence.h"
 
 /* IO Delay Information */
-#define SDHCI_CDNS_HRS07		0X1C
+#define SDHCI_CDNS_HRS07		0x1C
 #define   SDHCI_CDNS_HRS07_RW_COMPENSATE	GENMASK(20, 16)
 #define   SDHCI_CDNS_HRS07_IDELAY_VAL		GENMASK(4, 0)
 
diff --git a/drivers/mmc/zynq_sdhci.c b/drivers/mmc/zynq_sdhci.c
index 0e2bdab4e7e..2375b15539b 100644
--- a/drivers/mmc/zynq_sdhci.c
+++ b/drivers/mmc/zynq_sdhci.c
@@ -83,7 +83,7 @@
 
 #define VERSAL_NET_EMMC_ICLK_PHASE_DDR52_DLY_CHAIN	39
 #define VERSAL_NET_EMMC_ICLK_PHASE_DDR52_DLL		146
-#define VERSAL_NET_PHY_CTRL_STRB90_STRB180_VAL		0X77
+#define VERSAL_NET_PHY_CTRL_STRB90_STRB180_VAL		0x77
 
 struct arasan_sdhci_clk_data {
 	int clk_phase_in[MMC_TIMING_MMC_HS400 + 1];
diff --git a/drivers/mtd/nand/raw/lpc32xx_nand_mlc.c b/drivers/mtd/nand/raw/lpc32xx_nand_mlc.c
index 4430c4e93ee..7779e63fa5d 100644
--- a/drivers/mtd/nand/raw/lpc32xx_nand_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_nand_mlc.c
@@ -165,9 +165,9 @@ static void lpc32xx_cmd_ctrl(struct mtd_info *mtd, int cmd,
 		return;
 
 	if (ctrl & NAND_CLE)
-		writeb(cmd & 0Xff, &lpc32xx_nand_mlc_registers->cmd);
+		writeb(cmd & 0xff, &lpc32xx_nand_mlc_registers->cmd);
 	else if (ctrl & NAND_ALE)
-		writeb(cmd & 0Xff, &lpc32xx_nand_mlc_registers->addr);
+		writeb(cmd & 0xff, &lpc32xx_nand_mlc_registers->addr);
 }
 
 /**
diff --git a/drivers/net/fsl-mc/mc.c b/drivers/net/fsl-mc/mc.c
index c2869ce4010..86daf0fb2bb 100644
--- a/drivers/net/fsl-mc/mc.c
+++ b/drivers/net/fsl-mc/mc.c
@@ -45,7 +45,7 @@
 #define MC_BUFFER_SIZE   (1024 * 1024 * 16)
 #define MAGIC_MC 0x4d430100
 #define MC_FW_ADDR_MASK_LOW 0xE0000000
-#define MC_FW_ADDR_MASK_HIGH 0X1FFFF
+#define MC_FW_ADDR_MASK_HIGH 0x1FFFF
 #define MC_STRUCT_BUFFER_OFFSET 0x01000000
 #define MC_OFFSET_DELTA MC_STRUCT_BUFFER_OFFSET
 
diff --git a/drivers/net/phy/ca_phy.c b/drivers/net/phy/ca_phy.c
index 5b2c67d2fda..72d370274a1 100644
--- a/drivers/net/phy/ca_phy.c
+++ b/drivers/net/phy/ca_phy.c
@@ -73,7 +73,7 @@ static void __external_phy_init(struct phy_device *phydev, int reset_phy)
 	val &= ~(1 << 2);
 	phy_write(phydev, MDIO_DEVAD_NONE, 27, val);
 
-	/* REG31 write 0X0000, back to page0 */
+	/* REG31 write 0x0000, back to page0 */
 	phy_write(phydev, MDIO_DEVAD_NONE, 31, 0x0000);
 }
 
diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
index c7459dbc5fc..c48a5cd5267 100644
--- a/drivers/phy/rockchip/phy-rockchip-typec.c
+++ b/drivers/phy/rockchip/phy-rockchip-typec.c
@@ -284,7 +284,7 @@ DECLARE_GLOBAL_DATA_PTR;
  * clock 0: PLL 0 div 1
  * clock 1: PLL 1 div 2
  */
-#define CLK_PLL_CONFIG			0X30
+#define CLK_PLL_CONFIG			0x30
 #define CLK_PLL_MASK			0x33
 
 #define CMN_READY			BIT(0)
diff --git a/drivers/power/regulator/act8846.c b/drivers/power/regulator/act8846.c
index d3e72da0d35..144032692f6 100644
--- a/drivers/power/regulator/act8846.c
+++ b/drivers/power/regulator/act8846.c
@@ -29,7 +29,7 @@ enum {
 	REG_SYS0,
 	REG_SYS1,
 	REG1_VOL	= 0x10,
-	REG1_CTL	= 0X11,
+	REG1_CTL	= 0x11,
 	REG2_VOL0	= 0x20,
 	REG2_VOL1,
 	REG2_CTL,
@@ -41,7 +41,7 @@ enum {
 	REG4_CTL,
 	REG5_VOL	= 0x50,
 	REG5_CTL,
-	REG6_VOL	= 0X58,
+	REG6_VOL	= 0x58,
 	REG6_CTL,
 	REG7_VOL	= 0x60,
 	REG7_CTL,
diff --git a/drivers/ram/k3-ddrss/k3-ddrss.c b/drivers/ram/k3-ddrss/k3-ddrss.c
index ff87faf6a22..6590d57ad84 100644
--- a/drivers/ram/k3-ddrss/k3-ddrss.c
+++ b/drivers/ram/k3-ddrss/k3-ddrss.c
@@ -35,7 +35,7 @@
 
 #define DDRSS_V2A_CTL_REG_SDRAM_IDX_CALC(x)	((ilog2(x) - 16) << 5)
 #define DDRSS_V2A_CTL_REG_SDRAM_IDX_MASK	(~(0x1F << 0x5))
-#define DDRSS_V2A_CTL_REG_REGION_IDX_MASK	(~(0X1F))
+#define DDRSS_V2A_CTL_REG_REGION_IDX_MASK	(~(0x1F))
 #define DDRSS_V2A_CTL_REG_REGION_IDX_DEFAULT	0xF
 
 #define DDRSS_ECC_CTRL_REG_DEFAULT		0x0
diff --git a/drivers/ram/octeon/octeon3_lmc.c b/drivers/ram/octeon/octeon3_lmc.c
index eaef0fa5c12..dc4b8f8cf23 100644
--- a/drivers/ram/octeon/octeon3_lmc.c
+++ b/drivers/ram/octeon/octeon3_lmc.c
@@ -8692,7 +8692,7 @@ int init_octeon3_ddr3_interface(struct ddr_priv *priv,
 		bank_bits = min((int)bank_bits, 4);
 
 		spd_package =
-		    0XFF & read_spd(&dimm_config_table[0], 0,
+		    0xFF & read_spd(&dimm_config_table[0], 0,
 				    DDR4_SPD_PACKAGE_TYPE);
 		if (spd_package & 0x80) {	// non-monolithic device
 			is_stacked_die = ((spd_package & 0x73) == 0x11);
diff --git a/drivers/sound/max98088.h b/drivers/sound/max98088.h
index b1307a73623..2ca6ca1f734 100644
--- a/drivers/sound/max98088.h
+++ b/drivers/sound/max98088.h
@@ -15,14 +15,14 @@
 #define M98088_REG_JACK_STAUS		0x02
 #define M98088_REG_BATTERY_VOLTAGE	0x03
 #define M98088_REG_IRQ_ENABLE		0x0f
-#define M98088_REG_SYS_CLK		0X10
+#define M98088_REG_SYS_CLK		0x10
 #define M98088_REG_DAI1_CLKMODE		0x11
 #define M98088_REG_DAI1_CLKCFG_HI	0x12
 #define M98088_REG_DAI1_CLKCFG_LO	0x13
 #define M98088_REG_DAI1_FORMAT		0x14
 #define M98088_REG_DAI1_CLOCK		0x15
 #define M98088_REG_DAI1_IOCFG		0x16
-#define M98088_REG_DAI1_TDM		0X17
+#define M98088_REG_DAI1_TDM		0x17
 #define M98088_REG_DAI1_FILTERS		0x18
 #define M98088_REG_DAI2_CLKMODE		0x19
 #define M98088_REG_DAI2_CLKCFG_HI	0x1a
@@ -30,10 +30,10 @@
 #define M98088_REG_DAI2_FORMAT		0x1c
 #define M98088_REG_DAI2_CLOCK		0x1d
 #define M98088_REG_DAI2_IOCFG		0x1e
-#define M98088_REG_DAI2_TDM		0X1f
+#define M98088_REG_DAI2_TDM		0x1f
 #define M98088_REG_DAI2_FILTERS		0x20
-#define M98088_REG_SRC			0X21
-#define M98088_REG_MIX_DAC		0X22
+#define M98088_REG_SRC			0x21
+#define M98088_REG_MIX_DAC		0x22
 #define M98088_REG_MIX_ADC_LEFT		0x23
 #define M98088_REG_MIX_ADC_RIGHT	0x24
 #define M98088_REG_MIX_HP_LEFT		0x25
@@ -50,37 +50,37 @@
 #define M98088_REG_LVL_DAI1_PLAY_EQ	0x30
 #define M98088_REG_LVL_DAI2_PLAY	0x31
 #define M98088_REG_LVL_DAI2_PLAY_EQ	0x32
-#define M98088_REG_LVL_ADC_L		0X33
-#define M98088_REG_LVL_ADC_R		0X34
-#define M98088_REG_LVL_MIC1		0X35
-#define M98088_REG_LVL_MIC2		0X36
-#define M98088_REG_LVL_INA		0X37
-#define M98088_REG_LVL_INB		0X38
-#define M98088_REG_LVL_HP_L		0X39
-#define M98088_REG_LVL_HP_R		0X3a
-#define M98088_REG_LVL_REC_L		0X3b
-#define M98088_REG_LVL_REC_R		0X3c
-#define M98088_REG_LVL_SPK_L		0X3d
-#define M98088_REG_LVL_SPK_R		0X3e
+#define M98088_REG_LVL_ADC_L		0x33
+#define M98088_REG_LVL_ADC_R		0x34
+#define M98088_REG_LVL_MIC1		0x35
+#define M98088_REG_LVL_MIC2		0x36
+#define M98088_REG_LVL_INA		0x37
+#define M98088_REG_LVL_INB		0x38
+#define M98088_REG_LVL_HP_L		0x39
+#define M98088_REG_LVL_HP_R		0x3a
+#define M98088_REG_LVL_REC_L		0x3b
+#define M98088_REG_LVL_REC_R		0x3c
+#define M98088_REG_LVL_SPK_L		0x3d
+#define M98088_REG_LVL_SPK_R		0x3e
 #define M98088_REG_MICAGC_CFG		0x3f
 #define M98088_REG_MICAGC_THRESH	0x40
-#define M98088_REG_SPKDHP		0X41
+#define M98088_REG_SPKDHP		0x41
 #define M98088_REG_SPKDHP_THRESH	0x42
 #define M98088_REG_SPKALC_COMP		0x43
 #define M98088_REG_PWRLMT_CFG		0x44
 #define M98088_REG_PWRLMT_TIME		0x45
 #define M98088_REG_THDLMT_CFG		0x46
 #define M98088_REG_CFG_AUDIO_IN		0x47
-#define M98088_REG_CFG_MIC		0X48
-#define M98088_REG_CFG_LEVEL		0X49
+#define M98088_REG_CFG_MIC		0x48
+#define M98088_REG_CFG_LEVEL		0x49
 #define M98088_REG_CFG_BYPASS		0x4a
 #define M98088_REG_CFG_JACKDET		0x4b
-#define M98088_REG_PWR_EN_IN		0X4c
+#define M98088_REG_PWR_EN_IN		0x4c
 #define M98088_REG_PWR_EN_OUT		0x4d
-#define M98088_REG_BIAS_CNTL		0X4e
-#define M98088_REG_DAC_BIAS1		0X4f
-#define M98088_REG_DAC_BIAS2		0X50
-#define M98088_REG_PWR_SYS		0X51
+#define M98088_REG_BIAS_CNTL		0x4e
+#define M98088_REG_DAC_BIAS1		0x4f
+#define M98088_REG_DAC_BIAS2		0x50
+#define M98088_REG_PWR_SYS		0x51
 #define M98088_REG_DAI1_EQ_BASE		0x52
 #define M98088_REG_DAI2_EQ_BASE		0x84
 #define M98088_REG_DAI1_BIQUAD_BASE	0xb6
diff --git a/drivers/sound/max98095.h b/drivers/sound/max98095.h
index 1521f3f02f9..009164d85d2 100644
--- a/drivers/sound/max98095.h
+++ b/drivers/sound/max98095.h
@@ -176,7 +176,7 @@ enum en_max_audio_interface {
 #define M98095_0FF_REV_ID		0xFF
 
 #define M98095_REG_CNT			(0xFF+1)
-#define M98095_REG_MAX_CACHED		0X97
+#define M98095_REG_MAX_CACHED		0x97
 
 /* MAX98095 Registers Bit Fields */
 
diff --git a/drivers/video/bridge/dp501.c b/drivers/video/bridge/dp501.c
index 9937cfe095b..0ad589304aa 100644
--- a/drivers/video/bridge/dp501.c
+++ b/drivers/video/bridge/dp501.c
@@ -99,7 +99,7 @@
 #define SD_DB15			0x4F
 
 /* Aux Channel and PCS */
-#define DPCD_REV		0X50
+#define DPCD_REV		0x50
 #define MAX_LINK_RATE		0x51
 #define MAX_LANE_COUNT		0x52
 #define MAX_DOWNSPREAD		0x53
diff --git a/drivers/video/hx8238d.c b/drivers/video/hx8238d.c
index 2491a32810e..f0220e4cc07 100644
--- a/drivers/video/hx8238d.c
+++ b/drivers/video/hx8238d.c
@@ -22,7 +22,7 @@ DECLARE_GLOBAL_DATA_PTR;
 #define HX8238D_OUTPUT_CTRL_ADDR        0x01
 #define HX8238D_LCD_AC_CTRL_ADDR        0x02
 #define HX8238D_POWER_CTRL_1_ADDR       0x03
-#define HX8238D_DATA_CLR_CTRL_ADDR      0X04
+#define HX8238D_DATA_CLR_CTRL_ADDR      0x04
 #define HX8238D_FUNCTION_CTRL_ADDR      0x05
 #define HX8238D_LED_CTRL_ADDR           0x08
 #define HX8238D_CONT_BRIGHT_CTRL_ADDR   0x0A
diff --git a/drivers/video/zynqmp/zynqmp_dpsub.h b/drivers/video/zynqmp/zynqmp_dpsub.h
index 7d2737e31aa..dc549559cae 100644
--- a/drivers/video/zynqmp/zynqmp_dpsub.h
+++ b/drivers/video/zynqmp/zynqmp_dpsub.h
@@ -553,7 +553,7 @@ struct zynqmp_dpsub_priv {
 #define DPDMA_DESCRIPTOR_LINE_SIZE_STRIDE_SHIFT				18
 #define DPDMA_DESCRIPTOR_SRC_ADDR_WIDTH					32U
 #define DPDMA_DESCRIPTOR_ADDR_EXT_SRC_ADDR_EXT_SHIFT			16U
-#define DPDMA_CH0_DSCR_STRT_ADDR					0X0204U
+#define DPDMA_CH0_DSCR_STRT_ADDR					0x0204U
 #define DPDMA_CH_OFFSET							0x100U
 #define DPDMA_CH0_CNTL							0x0218U
 #define DPDMA_CH3_CNTL							0x0518U
-- 
2.49.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
