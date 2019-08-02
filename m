Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E4F7F734
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 14:48:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BD1FC35E03
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 12:48:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C28AC35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 12:48:17 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72CWEvO001971; Fri, 2 Aug 2019 14:48:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=2g8q8EbBXxfJ7ZqEqyLfF1aeSzu2FRT9sgCJ1aAHMcg=;
 b=fO6Rj6Bzq23ZakAdu9dv364fJ9ZRZVaGMJyLXaAohALyo6VVzAyhTU2kuIDS+J4Kf5Yi
 /WQUjAWZ0L3sUhCYwGdb1vemITiIwY+69tnumXiNL5FPoR1XNeJRfzr7uwWhqFq1KbO4
 cf62XPQLhZGU5zdX9n+iA+kG6PryAHAicEqj7Fu9yikJGcUVC5GOeO6ps8sYrLoWAXpE
 5JfVPp7XsmWiGVSA+wUMWV2GXxiXNJeiyU/imKNttHYOrtCQ43jFz/jQ6svge6l9BTD1
 7A+cBMvZN9oHwJ17ULAyvMwbOvAg19mDUBsJ2LhfebXaopviGXRpqwLIWpCezrS8Boiv Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4up9y-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 14:48:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 14B0E31;
 Fri,  2 Aug 2019 12:48:05 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0211A2C3249;
 Fri,  2 Aug 2019 14:48:05 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 14:48:04 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 14:48:04
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Aug 2019 14:48:00 +0200
Message-ID: <1564750081-31319-2-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564750081-31319-1-git-send-email-patrick.delaunay@st.com>
References: <1564750081-31319-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_06:, , signatures=0
Cc: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>, Lukasz
 Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, Ryder Lee <ryder.lee@mediatek.com>,
 David Wu <david.wu@rock-chips.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Chris Packham <judge.packham@gmail.com>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>
Subject: [Uboot-stm32] [RESEND PATCH 2/2] dm: pinctrl: introduce
	PINCONF_RECURSIVE option
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

In the Linux pinctrl binding, the pin configuration nodes don't need to
be direct children of the pin controller device (may be grandchildren for
example). This behavior is managed with the pinconfig u-class which
recursively bind all the sub-node of the pin controller.

But for some binding (when pin configuration is only children of pin
controller) that is not necessary. U-Boot can save memory and reduce
the number of pinconf instance when this feature is deactivated
(for arch stm32mp for example for SPL).

This patch allows to control this feature with a new option
CONFIG_PINCONF_RECURSIVE when it is possible for each individual
pin controller device.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Hi,

Found her a proposal to have a more clear output of "dm tree" command
and to reduce the memory footprint of PINCTRL_FULL for the arch stm32mp1
(bdinfo "Early malloc usage" is reduced from 2588 to 2144).

On stm32mp157c-ev1, each pin configuration have one other
several sub node "pins"

pinctrl: pin-controller@50002000 {
...
adc12_usb_pwr_pins_a: adc12-usb-pwr-pins-0 {
	pins {
		pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* ADC12 in18 */
			 <STM32_PINMUX('A', 5, ANALOG)>; /* ADC12 in19 */
	};
};

cec_pins_a: cec-0 {
	pins {
		pinmux = <STM32_PINMUX('A', 15, AF4)>;
		bias-disable;
		drive-open-drain;
		slew-rate = <0>;
	};
};

cec_pins_sleep_a: cec-sleep-0 {
	pins {
		pinmux = <STM32_PINMUX('A', 15, ANALOG)>; /* HDMI_CEC */
	};
};
...
ethernet0_rgmii_pins_a: rgmii-0 {
	pins1 {
		pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
			 <STM32_PINMUX('G', 4, AF11)>, /* ETH_RGMII_GTX_CLK */
			 <STM32_PINMUX('G', 13, AF11)>, /* ETH_RGMII_TXD0 */
			 <STM32_PINMUX('G', 14, AF11)>, /* ETH_RGMII_TXD1 */
			 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
			 <STM32_PINMUX('E', 2, AF11)>, /* ETH_RGMII_TXD3 */
			 <STM32_PINMUX('B', 11, AF11)>, /* ETH_RGMII_TX_CTL */
			 <STM32_PINMUX('C', 1, AF11)>; /* ETH_MDC */
		bias-disable;
		drive-push-pull;
		slew-rate = <2>;
	};
	pins2 {
		pinmux = <STM32_PINMUX('A', 2, AF11)>; /* ETH_MDIO */
		bias-disable;
		drive-push-pull;
		slew-rate = <0>;
	};
	pins3 {
		pinmux = <STM32_PINMUX('C', 4, AF11)>, /* ETH_RGMII_RXD0 */
			 <STM32_PINMUX('C', 5, AF11)>, /* ETH_RGMII_RXD1 */
			 <STM32_PINMUX('B', 0, AF11)>, /* ETH_RGMII_RXD2 */
			 <STM32_PINMUX('B', 1, AF11)>, /* ETH_RGMII_RXD3 */
			 <STM32_PINMUX('A', 1, AF11)>, /* ETH_RGMII_RX_CLK */
			 <STM32_PINMUX('A', 7, AF11)>; /* ETH_RGMII_RX_CTL */
		bias-disable;
		};
	};
...

before the patch all "pins" subnode are bounded but are unused.

    STM32MP> dm tree
     Class     Index  Probed  Driver                Name
    -----------------------------------------------------------
     root          0  [ + ]   root_driver           root_driver
     sysreset      0  [   ]   syscon_reboot         |-- reboot
     simple_bus    0  [ + ]   generic_simple_bus    |-- soc
     serial        0  [ + ]   serial_stm32          |   |-- serial@40010000
     i2c           0  [   ]   stm32f7-i2c           |   |-- i2c@40013000
     i2c_generi    0  [   ]   stmfx                 |   |   `-- stmfx@42
     i2c           1  [   ]   stm32f7-i2c           |   |-- i2c@40015000
     usb           0  [   ]   dwc2-udc-otg          |   |-- usb-otg@49000000
     hwspinlock    0  [ + ]   hwspinlock_stm32mp1   |   |-- hwspinlock@4c000000
     mailbox       0  [   ]   stm32_ipcc            |   |-- mailbox@4c001000
     misc          0  [ + ]   stm32-rcc             |   |-- rcc@50000000
     clk           0  [ + ]   stm32mp1_clk          |   |   |-- stm32mp1_clk
     reset         0  [ + ]   stm32_rcc_reset       |   |   `-- stm32_rcc_reset
     syscon        0  [ + ]   stmp32mp_syscon       |   |-- pwr@50001000
     pmic          0  [ + ]   stm32mp_pwr_pmic      |   |   `-- pwr-regulators
     regulator     0  [ + ]   stm32mp_pwr_regulato  |   |       |-- reg11
     regulator     1  [ + ]   stm32mp_pwr_regulato  |   |       |-- reg18
     regulator     2  [ + ]   stm32mp_pwr_regulato  |   |       `-- usb33
     syscon        1  [   ]   syscon                |   |-- interrupt-controller@5000d000
     syscon        2  [ + ]   stmp32mp_syscon       |   |-- syscon@50020000
     mtd           0  [ + ]   stm32_fmc2_nand       |   |-- nand-controller@58002000
     spi           0  [   ]   stm32_qspi            |   |-- spi@58003000
     spi_flash     0  [   ]   spi_flash_std         |   |   |-- mx66l51235l@0
     spi_flash     1  [   ]   spi_flash_std         |   |   `-- mx66l51235l@1
     mmc           0  [ + ]   stm32_sdmmc2          |   |-- sdmmc@58005000
     blk           0  [ + ]   mmc_blk               |   |   `-- sdmmc@58005000.blk
     mmc           1  [ + ]   stm32_sdmmc2          |   |-- sdmmc@58007000
     blk           1  [   ]   mmc_blk               |   |   `-- sdmmc@58007000.blk
     eth           0  [ + ]   eth_eqos              |   |-- ethernet@5800a000
     usb           0  [   ]   ehci_generic          |   |-- usbh-ehci@5800d000
     phy           0  [   ]   stm32-usbphyc         |   |-- usbphyc@5a006000
     i2c           2  [ + ]   stm32f7-i2c           |   |-- i2c@5c002000
     pmic          1  [ + ]   stpmic1_pmic          |   |   `-- stpmic@33
     regulator     3  [ + ]   stpmic1_buck          |   |       |-- buck1
     regulator     4  [ + ]   stpmic1_buck          |   |       |-- buck2
     regulator     5  [ + ]   stpmic1_buck          |   |       |-- buck3
     regulator     6  [ + ]   stpmic1_buck          |   |       |-- buck4
     regulator     7  [ + ]   stpmic1_ldo           |   |       |-- ldo1
     regulator     8  [ + ]   stpmic1_ldo           |   |       |-- ldo2
     regulator     9  [ + ]   stpmic1_ldo           |   |       |-- ldo3
     regulator    10  [ + ]   stpmic1_ldo           |   |       |-- ldo4
     regulator    11  [ + ]   stpmic1_ldo           |   |       |-- ldo5
     regulator    12  [ + ]   stpmic1_ldo           |   |       |-- ldo6
     regulator    13  [ + ]   stpmic1_vref_ddr      |   |       |-- vref_ddr
     regulator    14  [ + ]   stpmic1_boost         |   |       |-- boost
     regulator    15  [ + ]   stpmic1_pwr_sw        |   |       |-- pwr_sw1
     regulator    16  [ + ]   stpmic1_pwr_sw        |   |       |-- pwr_sw2
     sysreset      1  [   ]   stpmic1-sysreset      |   |       `-- stpmic1-sysreset
     rtc           0  [   ]   rtc-stm32             |   |-- rtc@5c004000
     misc          1  [ + ]   stm32mp_bsec          |   |-- nvmem@5c005000
     pinctrl       0  [ + ]   pinctrl_stm32         |   |-- pin-controller@50002000
     gpio          0  [ + ]   gpio_stm32            |   |   |-- gpio@50002000
     gpio          1  [ + ]   gpio_stm32            |   |   |-- gpio@50003000
     gpio          2  [ + ]   gpio_stm32            |   |   |-- gpio@50004000
     gpio          3  [ + ]   gpio_stm32            |   |   |-- gpio@50005000
     gpio          4  [ + ]   gpio_stm32            |   |   |-- gpio@50006000
     gpio          5  [ + ]   gpio_stm32            |   |   |-- gpio@50007000
     gpio          6  [ + ]   gpio_stm32            |   |   |-- gpio@50008000
     gpio          7  [ + ]   gpio_stm32            |   |   |-- gpio@50009000
     gpio          8  [   ]   gpio_stm32            |   |   |-- gpio@5000a000
     gpio          9  [   ]   gpio_stm32            |   |   |-- gpio@5000b000
     gpio         10  [   ]   gpio_stm32            |   |   |-- gpio@5000c000
     pinconfig     0  [   ]   pinconfig             |   |   |-- adc12-usb-pwr-pins-0
     pinconfig     1  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig     2  [   ]   pinconfig             |   |   |-- cec-0
     pinconfig     3  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig     4  [   ]   pinconfig             |   |   |-- cec-sleep-0
     pinconfig     5  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig     6  [   ]   pinconfig             |   |   |-- cec-1
     pinconfig     7  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig     8  [   ]   pinconfig             |   |   |-- cec-sleep-1
     pinconfig     9  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    10  [ + ]   pinconfig             |   |   |-- rgmii-0
     pinconfig    11  [   ]   pinconfig             |   |   |   |-- pins1
     pinconfig    12  [   ]   pinconfig             |   |   |   |-- pins2
     pinconfig    13  [   ]   pinconfig             |   |   |   `-- pins3
     pinconfig    14  [   ]   pinconfig             |   |   |-- rgmii-sleep-0
     pinconfig    15  [   ]   pinconfig             |   |   |   `-- pins1
     pinconfig    16  [ + ]   pinconfig             |   |   |-- fmc-0
     pinconfig    17  [   ]   pinconfig             |   |   |   |-- pins1
     pinconfig    18  [   ]   pinconfig             |   |   |   `-- pins2
     pinconfig    19  [   ]   pinconfig             |   |   |-- fmc-sleep-0
     pinconfig    20  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    21  [   ]   pinconfig             |   |   |-- i2c1-0
     pinconfig    22  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    23  [   ]   pinconfig             |   |   |-- i2c1-1
     pinconfig    24  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    25  [   ]   pinconfig             |   |   |-- i2c1-2
     pinconfig    26  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    27  [   ]   pinconfig             |   |   |-- i2c2-0
     pinconfig    28  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    29  [   ]   pinconfig             |   |   |-- i2c2-1
     pinconfig    30  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    31  [   ]   pinconfig             |   |   |-- i2c2-2
     pinconfig    32  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    33  [   ]   pinconfig             |   |   |-- i2c5-0
     pinconfig    34  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    35  [   ]   pinconfig             |   |   |-- i2c5-1
     pinconfig    36  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    37  [   ]   pinconfig             |   |   |-- ltdc-a-0
     pinconfig    38  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    39  [   ]   pinconfig             |   |   |-- ltdc-a-1
     pinconfig    40  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    41  [   ]   pinconfig             |   |   |-- ltdc-b-0
     pinconfig    42  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    43  [   ]   pinconfig             |   |   |-- ltdc-b-1
     pinconfig    44  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    45  [   ]   pinconfig             |   |   |-- m-can1-0
     pinconfig    46  [   ]   pinconfig             |   |   |   |-- pins1
     pinconfig    47  [   ]   pinconfig             |   |   |   `-- pins2
     pinconfig    48  [   ]   pinconfig             |   |   |-- m_can1-sleep@0
     pinconfig    49  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    50  [   ]   pinconfig             |   |   |-- pwm2-0
     pinconfig    51  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    52  [   ]   pinconfig             |   |   |-- pwm8-0
     pinconfig    53  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    54  [   ]   pinconfig             |   |   |-- pwm12-0
     pinconfig    55  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    56  [   ]   pinconfig             |   |   |-- qspi-clk-0
     pinconfig    57  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    58  [   ]   pinconfig             |   |   |-- qspi-bk1-0
     pinconfig    59  [   ]   pinconfig             |   |   |   |-- pins1
     pinconfig    60  [   ]   pinconfig             |   |   |   `-- pins2
     pinconfig    61  [   ]   pinconfig             |   |   |-- qspi-bk2-0
     pinconfig    62  [   ]   pinconfig             |   |   |   |-- pins1
     pinconfig    63  [   ]   pinconfig             |   |   |   `-- pins2
     pinconfig    64  [ + ]   pinconfig             |   |   |-- sdmmc1-b4-0
     pinconfig    65  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    66  [   ]   pinconfig             |   |   |-- sdmmc1-b4-od-0
     pinconfig    67  [   ]   pinconfig             |   |   |   |-- pins1
     pinconfig    68  [   ]   pinconfig             |   |   |   `-- pins2
     pinconfig    69  [   ]   pinconfig             |   |   |-- sdmmc1-b4-sleep-0
     pinconfig    70  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    71  [ + ]   pinconfig             |   |   |-- sdmmc1-dir-0
     pinconfig    72  [   ]   pinconfig             |   |   |   |-- pins1
     pinconfig    73  [   ]   pinconfig             |   |   |   `-- pins2
     pinconfig    74  [   ]   pinconfig             |   |   |-- sdmmc1-dir-sleep-0
     pinconfig    75  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    76  [   ]   pinconfig             |   |   |-- sdmmc2-b4-0
     pinconfig    77  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    78  [   ]   pinconfig             |   |   |-- sdmmc2-d47-0
     pinconfig    79  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    80  [   ]   pinconfig             |   |   |-- spdifrx-0
     pinconfig    81  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    82  [   ]   pinconfig             |   |   |-- spdifrx-1
     pinconfig    83  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    84  [   ]   pinconfig             |   |   |-- spi2-0
     pinconfig    85  [   ]   pinconfig             |   |   |   |-- pins1
     pinconfig    86  [   ]   pinconfig             |   |   |   `-- pins2
     pinconfig    87  [   ]   pinconfig             |   |   |-- stusb1600-0
     pinconfig    88  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig    89  [ + ]   pinconfig             |   |   |-- uart4-0
     pinconfig    90  [   ]   pinconfig             |   |   |   |-- pins1
     pinconfig    91  [   ]   pinconfig             |   |   |   `-- pins2
     pinconfig    92  [   ]   pinconfig             |   |   |-- uart4-1
     pinconfig    93  [   ]   pinconfig             |   |   |   |-- pins1
     pinconfig    94  [   ]   pinconfig             |   |   |   `-- pins2
     pinconfig    95  [   ]   pinconfig             |   |   |-- uart7-0
     pinconfig    96  [   ]   pinconfig             |   |   |   |-- pins1
     pinconfig    97  [   ]   pinconfig             |   |   |   `-- pins2
     pinconfig    98  [   ]   pinconfig             |   |   `-- usbotg_hs-0
     pinconfig    99  [   ]   pinconfig             |   |       `-- pins
     pinctrl       1  [ + ]   pinctrl_stm32         |   |-- pin-controller-z@54004000
     gpio         11  [ + ]   gpio_stm32            |   |   |-- gpio@54004000
     pinconfig   100  [ + ]   pinconfig             |   |   |-- i2c4-0
     pinconfig   101  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig   102  [   ]   pinconfig             |   |   |-- i2c4-1
     pinconfig   103  [   ]   pinconfig             |   |   |   `-- pins
     pinconfig   104  [   ]   pinconfig             |   |   `-- spi1-0
     pinconfig   105  [   ]   pinconfig             |   |       |-- pins1
     pinconfig   106  [   ]   pinconfig             |   |       `-- pins2
     ram           0  [   ]   stm32mp1_ddr          |   `-- ddr@5A003000
     regulator    17  [ + ]   gpio regulator        |-- regulator-sd_switch
     led           0  [ + ]   gpio_led              |-- led
     led           1  [ + ]   gpio_led              |   |-- red
     led           2  [ + ]   gpio_led              |   |-- green
     led           3  [ + ]   gpio_led              |   |-- orange
     led           4  [   ]   gpio_led              |   `-- blue
     clk           1  [ + ]   fixed_rate_clock      |-- clk-hse
     clk           2  [ + ]   fixed_rate_clock      |-- clk-hsi
     clk           3  [ + ]   fixed_rate_clock      |-- clk-lse
     clk           4  [ + ]   fixed_rate_clock      |-- clk-lsi
     clk           5  [ + ]   fixed_rate_clock      `-- clk-csi

With the patch only the needed "pinconfig" instances are kept:

STM32MP> dm tree
 Class     Index  Probed  Driver                Name
-----------------------------------------------------------
 root          0  [ + ]   root_driver           root_driver
 sysreset      0  [   ]   syscon_reboot         |-- reboot
 simple_bus    0  [ + ]   generic_simple_bus    |-- soc
 serial        0  [ + ]   serial_stm32          |   |-- serial@40010000
 i2c           0  [   ]   stm32f7-i2c           |   |-- i2c@40013000
 i2c_generi    0  [   ]   stmfx                 |   |   `-- stmfx@42
 i2c           1  [   ]   stm32f7-i2c           |   |-- i2c@40015000
 usb           0  [   ]   dwc2-udc-otg          |   |-- usb-otg@49000000
 hwspinlock    0  [ + ]   hwspinlock_stm32mp1   |   |-- hwspinlock@4c000000
 mailbox       0  [   ]   stm32_ipcc            |   |-- mailbox@4c001000
 misc          0  [ + ]   stm32-rcc             |   |-- rcc@50000000
 clk           0  [ + ]   stm32mp1_clk          |   |   |-- stm32mp1_clk
 reset         0  [ + ]   stm32_rcc_reset       |   |   `-- stm32_rcc_reset
 syscon        0  [ + ]   stmp32mp_syscon       |   |-- pwr@50001000
 pmic          0  [ + ]   stm32mp_pwr_pmic      |   |   `-- pwr-regulators
 regulator     0  [ + ]   stm32mp_pwr_regulato  |   |       |-- reg11
 regulator     1  [ + ]   stm32mp_pwr_regulato  |   |       |-- reg18
 regulator     2  [ + ]   stm32mp_pwr_regulato  |   |       `-- usb33
 syscon        1  [   ]   syscon                |   |-- interrupt-controller@5000d000
 syscon        2  [ + ]   stmp32mp_syscon       |   |-- syscon@50020000
 mtd           0  [ + ]   stm32_fmc2_nand       |   |-- nand-controller@58002000
 spi           0  [   ]   stm32_qspi            |   |-- spi@58003000
 spi_flash     0  [   ]   spi_flash_std         |   |   |-- mx66l51235l@0
 spi_flash     1  [   ]   spi_flash_std         |   |   `-- mx66l51235l@1
 mmc           0  [ + ]   stm32_sdmmc2          |   |-- sdmmc@58005000
 blk           0  [ + ]   mmc_blk               |   |   `-- sdmmc@58005000.blk
 mmc           1  [ + ]   stm32_sdmmc2          |   |-- sdmmc@58007000
 blk           1  [   ]   mmc_blk               |   |   `-- sdmmc@58007000.blk
 eth           0  [ + ]   eth_eqos              |   |-- ethernet@5800a000
 usb           0  [   ]   ehci_generic          |   |-- usbh-ehci@5800d000
 phy           0  [   ]   stm32-usbphyc         |   |-- usbphyc@5a006000
 i2c           2  [ + ]   stm32f7-i2c           |   |-- i2c@5c002000
 pmic          1  [ + ]   stpmic1_pmic          |   |   `-- stpmic@33
 regulator     3  [ + ]   stpmic1_buck          |   |       |-- buck1
 regulator     4  [ + ]   stpmic1_buck          |   |       |-- buck2
 regulator     5  [ + ]   stpmic1_buck          |   |       |-- buck3
 regulator     6  [ + ]   stpmic1_buck          |   |       |-- buck4
 regulator     7  [ + ]   stpmic1_ldo           |   |       |-- ldo1
 regulator     8  [ + ]   stpmic1_ldo           |   |       |-- ldo2
 regulator     9  [ + ]   stpmic1_ldo           |   |       |-- ldo3
 regulator    10  [ + ]   stpmic1_ldo           |   |       |-- ldo4
 regulator    11  [ + ]   stpmic1_ldo           |   |       |-- ldo5
 regulator    12  [ + ]   stpmic1_ldo           |   |       |-- ldo6
 regulator    13  [ + ]   stpmic1_vref_ddr      |   |       |-- vref_ddr
 regulator    14  [ + ]   stpmic1_boost         |   |       |-- boost
 regulator    15  [ + ]   stpmic1_pwr_sw        |   |       |-- pwr_sw1
 regulator    16  [ + ]   stpmic1_pwr_sw        |   |       |-- pwr_sw2
 sysreset      1  [   ]   stpmic1-sysreset      |   |       `-- stpmic1-sysreset
 rtc           0  [   ]   rtc-stm32             |   |-- rtc@5c004000
 misc          1  [ + ]   stm32mp_bsec          |   |-- nvmem@5c005000
 pinctrl       0  [ + ]   pinctrl_stm32         |   |-- pin-controller@50002000
 gpio          0  [ + ]   gpio_stm32            |   |   |-- gpio@50002000
 gpio          1  [ + ]   gpio_stm32            |   |   |-- gpio@50003000
 gpio          2  [ + ]   gpio_stm32            |   |   |-- gpio@50004000
 gpio          3  [ + ]   gpio_stm32            |   |   |-- gpio@50005000
 gpio          4  [ + ]   gpio_stm32            |   |   |-- gpio@50006000
 gpio          5  [ + ]   gpio_stm32            |   |   |-- gpio@50007000
 gpio          6  [ + ]   gpio_stm32            |   |   |-- gpio@50008000
 gpio          7  [ + ]   gpio_stm32            |   |   |-- gpio@50009000
 gpio          8  [   ]   gpio_stm32            |   |   |-- gpio@5000a000
 gpio          9  [   ]   gpio_stm32            |   |   |-- gpio@5000b000
 gpio         10  [   ]   gpio_stm32            |   |   |-- gpio@5000c000
 pinconfig     0  [   ]   pinconfig             |   |   |-- adc12-usb-pwr-pins-0
 pinconfig     1  [   ]   pinconfig             |   |   |-- cec-0
 pinconfig     2  [   ]   pinconfig             |   |   |-- cec-sleep-0
 pinconfig     3  [   ]   pinconfig             |   |   |-- cec-1
 pinconfig     4  [   ]   pinconfig             |   |   |-- cec-sleep-1
 pinconfig     5  [ + ]   pinconfig             |   |   |-- rgmii-0
 pinconfig     6  [   ]   pinconfig             |   |   |-- rgmii-sleep-0
 pinconfig     7  [ + ]   pinconfig             |   |   |-- fmc-0
 pinconfig     8  [   ]   pinconfig             |   |   |-- fmc-sleep-0
 pinconfig     9  [   ]   pinconfig             |   |   |-- i2c1-0
 pinconfig    10  [   ]   pinconfig             |   |   |-- i2c1-1
 pinconfig    11  [   ]   pinconfig             |   |   |-- i2c1-2
 pinconfig    12  [   ]   pinconfig             |   |   |-- i2c2-0
 pinconfig    13  [   ]   pinconfig             |   |   |-- i2c2-1
 pinconfig    14  [   ]   pinconfig             |   |   |-- i2c2-2
 pinconfig    15  [   ]   pinconfig             |   |   |-- i2c5-0
 pinconfig    16  [   ]   pinconfig             |   |   |-- i2c5-1
 pinconfig    17  [   ]   pinconfig             |   |   |-- ltdc-a-0
 pinconfig    18  [   ]   pinconfig             |   |   |-- ltdc-a-1
 pinconfig    19  [   ]   pinconfig             |   |   |-- ltdc-b-0
 pinconfig    20  [   ]   pinconfig             |   |   |-- ltdc-b-1
 pinconfig    21  [   ]   pinconfig             |   |   |-- m-can1-0
 pinconfig    22  [   ]   pinconfig             |   |   |-- m_can1-sleep@0
 pinconfig    23  [   ]   pinconfig             |   |   |-- pwm2-0
 pinconfig    24  [   ]   pinconfig             |   |   |-- pwm8-0
 pinconfig    25  [   ]   pinconfig             |   |   |-- pwm12-0
 pinconfig    26  [   ]   pinconfig             |   |   |-- qspi-clk-0
 pinconfig    27  [   ]   pinconfig             |   |   |-- qspi-bk1-0
 pinconfig    28  [   ]   pinconfig             |   |   |-- qspi-bk2-0
 pinconfig    29  [ + ]   pinconfig             |   |   |-- sdmmc1-b4-0
 pinconfig    30  [   ]   pinconfig             |   |   |-- sdmmc1-b4-od-0
 pinconfig    31  [   ]   pinconfig             |   |   |-- sdmmc1-b4-sleep-0
 pinconfig    32  [ + ]   pinconfig             |   |   |-- sdmmc1-dir-0
 pinconfig    33  [   ]   pinconfig             |   |   |-- sdmmc1-dir-sleep-0
 pinconfig    34  [   ]   pinconfig             |   |   |-- sdmmc2-b4-0
 pinconfig    35  [   ]   pinconfig             |   |   |-- sdmmc2-d47-0
 pinconfig    36  [   ]   pinconfig             |   |   |-- spdifrx-0
 pinconfig    37  [   ]   pinconfig             |   |   |-- spdifrx-1
 pinconfig    38  [   ]   pinconfig             |   |   |-- spi2-0
 pinconfig    39  [   ]   pinconfig             |   |   |-- stusb1600-0
 pinconfig    40  [ + ]   pinconfig             |   |   |-- uart4-0
 pinconfig    41  [   ]   pinconfig             |   |   |-- uart4-1
 pinconfig    42  [   ]   pinconfig             |   |   |-- uart7-0
 pinconfig    43  [   ]   pinconfig             |   |   `-- usbotg_hs-0
 pinctrl       1  [ + ]   pinctrl_stm32         |   |-- pin-controller-z@54004000
 gpio         11  [ + ]   gpio_stm32            |   |   |-- gpio@54004000
 pinconfig    44  [ + ]   pinconfig             |   |   |-- i2c4-0
 pinconfig    45  [   ]   pinconfig             |   |   |-- i2c4-1
 pinconfig    46  [   ]   pinconfig             |   |   `-- spi1-0
 ram           0  [   ]   stm32mp1_ddr          |   `-- ddr@5A003000
 regulator    17  [ + ]   gpio regulator        |-- regulator-sd_switch
 led           0  [ + ]   gpio_led              |-- led
 led           1  [ + ]   gpio_led              |   |-- red
 led           2  [ + ]   gpio_led              |   |-- green
 led           3  [ + ]   gpio_led              |   |-- orange
 led           4  [   ]   gpio_led              |   `-- blue
 clk           1  [ + ]   fixed_rate_clock      |-- clk-hse
 clk           2  [ + ]   fixed_rate_clock      |-- clk-hsi
 clk           3  [ + ]   fixed_rate_clock      |-- clk-lse
 clk           4  [ + ]   fixed_rate_clock      |-- clk-lsi
 clk           5  [ + ]   fixed_rate_clock      `-- clk-csi


 drivers/pinctrl/Kconfig          | 25 +++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-uclass.c |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index a0ac167..deee924 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -59,6 +59,22 @@ config PINCONF
 	  This option enables pin configuration through the generic pinctrl
 	  framework.
 
+config PINCONF_RECURSIVE
+	bool "Support recursive binding for pin configuration nodes"
+	depends on PINCTRL_FULL
+	default n if ARCH_STM32MP
+	default y
+	help
+	  In the Linux pinctrl binding, the pin configuration nodes need not be
+	  direct children of the pin controller device (may be grandchildren for
+	  example). It is define is each individual pin controller device.
+	  Say Y here if you want to keep this behavior with the pinconfig
+	  u-class: all sub are recursivelly bounded.
+	  If the option is disabled, this behavior is deactivated and only
+	  the direct children of pin controller will be assumed as pin
+	  configuration; you can save memory footprint when this feature is
+	  no needed.
+
 config SPL_PINCTRL
 	bool "Support pin controllers in SPL"
 	depends on SPL && SPL_DM
@@ -104,6 +120,15 @@ config SPL_PINCONF
 	  This option is an SPL-variant of the PINCONF option.
 	  See the help of PINCONF for details.
 
+config SPL_PINCONF_RECURSIVE
+	bool "Support recursive binding for pin configuration nodes in SPL"
+	depends on SPL_PINCTRL_FULL
+	default n if ARCH_STM32MP
+	default y
+	help
+	  This option is an SPL-variant of the PINCONF_RECURSIVE option.
+	  See the help of PINCONF_RECURSIVE for details.
+
 if PINCTRL || SPL_PINCTRL
 
 config PINCTRL_AR933X
diff --git a/drivers/pinctrl/pinctrl-uclass.c b/drivers/pinctrl/pinctrl-uclass.c
index 5b1cd29..bf799a7 100644
--- a/drivers/pinctrl/pinctrl-uclass.c
+++ b/drivers/pinctrl/pinctrl-uclass.c
@@ -151,7 +151,9 @@ static int pinconfig_post_bind(struct udevice *dev)
 
 UCLASS_DRIVER(pinconfig) = {
 	.id = UCLASS_PINCONFIG,
+#if CONFIG_IS_ENABLED(PINCONFIG_RECURSIVE)
 	.post_bind = pinconfig_post_bind,
+#endif
 	.name = "pinconfig",
 };
 
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
