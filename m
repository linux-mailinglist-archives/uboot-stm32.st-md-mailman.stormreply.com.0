Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 835717D880
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Aug 2019 11:24:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AD70C35E04
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Aug 2019 09:24:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C60EC35E03
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Aug 2019 09:24:22 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x719OGAr009267; Thu, 1 Aug 2019 11:24:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Xaey3d3yVNlblH27o8Iso2dm/1ZPKekj+t9LBD4m6D8=;
 b=A+eaPw0vr4yBlfvZWirtlnmhgGRIn07sWu/FfCyYUIY2Q6tY2/fvCzD4aEh1A1h9GdhG
 iZLgl5ghDRUxmlQ+MBAt8Je5+QmYDfGP24Rx99Fe+BvtS4QOPNR4vZR6hIAF2s23KnCI
 04k3NoR31GD9oFpta+OT8WVTdWq2JdPD3y2w0kNBjJxs9HDqr0yAqUuQvkYHyhUxQa0B
 5iQa2Ow9igict1dK0aX62Us1c6Mc3iPTDmvaEgDKC/Tg5Kpo1wFWX1GadBMTiY+M2TgR
 rndX8EvtBM6O/8EMw9YYwzj6dFVntddi80KfPICfLo0Xkk52eq7Zi2kcnDzyaPgRBWJl uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0c2ynj61-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 01 Aug 2019 11:24:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 23B16153;
 Thu,  1 Aug 2019 09:22:58 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 09A75DC769;
 Thu,  1 Aug 2019 11:22:58 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 1 Aug 2019
 11:22:58 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 1 Aug 2019 11:22:57
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 1 Aug 2019 11:22:54 +0200
Message-ID: <1564651375-26779-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-01_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] dm: Tidy up dump output when there are
	many devices
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

At present the 'Index' column of 'dm tree' assumes there is
two digits, this patch increase it to 3 digits.

It also aligns output of 'dm uclass', assuming the same 3 digits index.

The boards with CONFIG_PINCTRL_FULL activated have one pinconfig
by pin configuration, so they can have more than 100 devices
pinconfig (for example with stm32mp157c-ev1 board we have
106 pinconfig node).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

stm32mp157c-ev1 trace before the patch

STM32MP> dm tree
 Class     Index  Probed  Driver                Name
-----------------------------------------------------------
 root         0  [ + ]   root_driver           root_driver
 sysreset     0  [   ]   syscon_reboot         |-- reboot
....
 pinctrl      0  [ + ]   pinctrl_stm32         |   |-- pin-controller@50002000
 gpio         0  [ + ]   gpio_stm32            |   |   |-- gpio@50002000
 gpio         1  [ + ]   gpio_stm32            |   |   |-- gpio@50003000
...
 gpio         9  [   ]   gpio_stm32            |   |   |-- gpio@5000b000
 gpio        10  [   ]   gpio_stm32            |   |   |-- gpio@5000c000
 pinconfig    0  [   ]   pinconfig             |   |   |-- adc12-usb-pwr-pins-0
 pinconfig   95  [   ]   pinconfig             |   |   |-- uart7-0
...
 pinconfig   99  [   ]   pinconfig             |   |       `-- pins
....
 pinctrl      1  [ + ]   pinctrl_stm32         |   |-- pin-controller-z@54004000
 gpio        11  [ + ]   gpio_stm32            |   |   |-- gpio@54004000
 pinconfig   100  [ + ]   pinconfig             |   |   |-- i2c4-0
 pinconfig   101  [   ]   pinconfig             |   |   |   `-- pins
....

STM32MP> dm uclass
.....
uclass 60: pinconfig
0   adc12-usb-pwr-pins-0 @ fdf56140
1   pins @ fdf56198
...
8   cec-sleep-1 @ fdf56400
9   pins @ fdf56458
10 * rgmii-0 @ fdf564b0, seq 5, (req -1)
11   pins1 @ fdf56508
...
98   usbotg_hs-0 @ fdf582f0
99   pins @ fdf58348
100 * i2c4-0 @ fdf58450, seq 0, (req -1)
101   pins @ fdf584a8
....

Full trace with the patch

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

STM32MP> dm uclass
uclass 0: root
0   * root_driver @ fdf4b0a8, seq 0, (req -1)

uclass 13: adc
uclass 17: blk
0   * sdmmc@58005000.blk @ fdf4be70, seq 0, (req -1)
1     sdmmc@58007000.blk @ fdf4c0f8

uclass 21: clk
0   * stm32mp1_clk @ fdf4b668, seq 0, (req -1)
1   * clk-hse @ fdf4fab8, seq 2, (req -1)
2   * clk-hsi @ fdf4fb40, seq 1, (req -1)
3   * clk-lse @ fdf4fbc8, seq 5, (req -1)
4   * clk-lsi @ fdf4fc50, seq 4, (req -1)
5   * clk-csi @ fdf4fcd8, seq 3, (req -1)

EFI: Initializing UCLASS_EFI
uclass 26: efi
uclass 27: eth
0   * ethernet@5800a000 @ fdf4c208, seq 0, (req 0)

uclass 30: gpio
0   * gpio@50002000 @ fdf4cdf0, seq 0, (req 0)
1   * gpio@50003000 @ fdf4ce48, seq 1, (req 1)
2   * gpio@50004000 @ fdf4cea0, seq 2, (req 2)
3   * gpio@50005000 @ fdf4cef8, seq 3, (req 3)
4   * gpio@50006000 @ fdf4cf50, seq 4, (req 4)
5   * gpio@50007000 @ fdf4cfa8, seq 5, (req 5)
6   * gpio@50008000 @ fdf4d000, seq 6, (req 6)
7   * gpio@50009000 @ fdf4d058, seq 7, (req 7)
8     gpio@5000a000 @ fdf4d0b0, seq -1, (req 8)
9     gpio@5000b000 @ fdf4d108, seq -1, (req 9)
10    gpio@5000c000 @ fdf4d160, seq -1, (req 10)
11  * gpio@54004000 @ fdf4f490, seq 25, (req 25)

uclass 31: hwspinlock
0   * hwspinlock@4c000000 @ fdf4b500, seq 0, (req -1)

uclass 32: i2c
0     i2c@40013000 @ fdf4b2b8, seq -1, (req 1)
1     i2c@40015000 @ fdf4b398, seq -1, (req 4)
2   * i2c@5c002000 @ fdf4c380, seq 3, (req 3)

uclass 34: i2c_generic
0     stmfx@42 @ fdf4b330

uclass 40: led
0   * led @ fdf4f8b0, seq 0, (req -1)
1   * red @ fdf4f918, seq 1, (req -1)
2   * green @ fdf4f980, seq 2, (req -1)
3   * orange @ fdf4f9e8, seq 3, (req -1)
4     blue @ fdf4fa50

uclass 42: mailbox
0     mailbox@4c001000 @ fdf4b578

uclass 43: usb_mass_storage
uclass 46: misc
0   * rcc@50000000 @ fdf4b5f0, seq 0, (req -1)
1   * nvmem@5c005000 @ fdf4ccf0, seq 1, (req -1)

uclass 47: mmc
0   * sdmmc@58005000 @ fdf4bca8, seq 0, (req 0)
1   * sdmmc@58007000 @ fdf4bf50, seq 1, (req 1)

uclass 49: mtd
0   * nand-controller@58002000 @ fdf4bac8, seq 0, (req -1)

uclass 50: nop
uclass 59: phy
0     usbphyc@5a006000 @ fdf4c328

uclass 60: pinconfig
0     adc12-usb-pwr-pins-0 @ fdf4d1d8
1     pins @ fdf4d230
2     cec-0 @ fdf4d288
3     pins @ fdf4d2e0
4     cec-sleep-0 @ fdf4d338
5     pins @ fdf4d390
6     cec-1 @ fdf4d3e8
7     pins @ fdf4d440
8     cec-sleep-1 @ fdf4d498
9     pins @ fdf4d4f0
10  * rgmii-0 @ fdf4d548, seq 5, (req -1)
11    pins1 @ fdf4d5a0
12    pins2 @ fdf4d5f8
13    pins3 @ fdf4d650
14    rgmii-sleep-0 @ fdf4d6a8
15    pins1 @ fdf4d700
16  * fmc-0 @ fdf4d758, seq 2, (req -1)
17    pins1 @ fdf4d7b0
18    pins2 @ fdf4d808
19    fmc-sleep-0 @ fdf4d860
20    pins @ fdf4d8b8
21    i2c1-0 @ fdf4d910
22    pins @ fdf4d968
23    i2c1-1 @ fdf4d9c0
24    pins @ fdf4da18
25    i2c1-2 @ fdf4da70
26    pins @ fdf4dac8
27    i2c2-0 @ fdf4db20
28    pins @ fdf4db78
29    i2c2-1 @ fdf4dbd0
30    pins @ fdf4dc28
31    i2c2-2 @ fdf4dc80
32    pins @ fdf4dcd8
33    i2c5-0 @ fdf4dd30
34    pins @ fdf4dd88
35    i2c5-1 @ fdf4dde0
36    pins @ fdf4de38
37    ltdc-a-0 @ fdf4de90
38    pins @ fdf4dee8
39    ltdc-a-1 @ fdf4df40
40    pins @ fdf4df98
41    ltdc-b-0 @ fdf4dff0
42    pins @ fdf4e048
43    ltdc-b-1 @ fdf4e0a0
44    pins @ fdf4e0f8
45    m-can1-0 @ fdf4e150
46    pins1 @ fdf4e1a8
47    pins2 @ fdf4e200
48    m_can1-sleep@0 @ fdf4e258
49    pins @ fdf4e2b0
50    pwm2-0 @ fdf4e308
51    pins @ fdf4e360
52    pwm8-0 @ fdf4e3b8
53    pins @ fdf4e410
54    pwm12-0 @ fdf4e468
55    pins @ fdf4e4c0
56    qspi-clk-0 @ fdf4e518
57    pins @ fdf4e570
58    qspi-bk1-0 @ fdf4e5c8
59    pins1 @ fdf4e620
60    pins2 @ fdf4e678
61    qspi-bk2-0 @ fdf4e6d0
62    pins1 @ fdf4e728
63    pins2 @ fdf4e780
64  * sdmmc1-b4-0 @ fdf4e7d8, seq 3, (req -1)
65    pins @ fdf4e830
66    sdmmc1-b4-od-0 @ fdf4e888
67    pins1 @ fdf4e8e0
68    pins2 @ fdf4e938
69    sdmmc1-b4-sleep-0 @ fdf4e990
70    pins @ fdf4e9e8
71  * sdmmc1-dir-0 @ fdf4ea40, seq 4, (req -1)
72    pins1 @ fdf4ea98
73    pins2 @ fdf4eaf0
74    sdmmc1-dir-sleep-0 @ fdf4eb48
75    pins @ fdf4eba0
76    sdmmc2-b4-0 @ fdf4ebf8
77    pins @ fdf4ec50
78    sdmmc2-d47-0 @ fdf4eca8
79    pins @ fdf4ed00
80    spdifrx-0 @ fdf4ed58
81    pins @ fdf4edb0
82    spdifrx-1 @ fdf4ee08
83    pins @ fdf4ee60
84    spi2-0 @ fdf4eeb8
85    pins1 @ fdf4ef10
86    pins2 @ fdf4ef68
87    stusb1600-0 @ fdf4efc0
88    pins @ fdf4f018
89  * uart4-0 @ fdf4f070, seq 1, (req -1)
90    pins1 @ fdf4f0c8
91    pins2 @ fdf4f120
92    uart4-1 @ fdf4f178
93    pins1 @ fdf4f1d0
94    pins2 @ fdf4f228
95    uart7-0 @ fdf4f280
96    pins1 @ fdf4f2d8
97    pins2 @ fdf4f330
98    usbotg_hs-0 @ fdf4f388
99    pins @ fdf4f3e0
100 * i2c4-0 @ fdf4f4e8, seq 0, (req -1)
101   pins @ fdf4f540
102   i2c4-1 @ fdf4f598
103   pins @ fdf4f5f0
104   spi1-0 @ fdf4f648
105   pins1 @ fdf4f6a0
106   pins2 @ fdf4f6f8

uclass 61: pinctrl
0   * pin-controller@50002000 @ fdf4cd78, seq 0, (req 0)
1   * pin-controller-z@54004000 @ fdf4f438, seq 1, (req 1)

uclass 62: pmic
0   * pwr-regulators @ fdf4b7d0, seq 0, (req -1)
1   * stpmic@33 @ fdf4c3d8, seq 1, (req -1)

uclass 66: ram
0     ddr@5A003000 @ fdf4f770

uclass 67: regulator
0   * reg11 @ fdf4b848, seq 0, (req -1)
1   * reg18 @ fdf4b8d8, seq 1, (req -1)
2   * usb33 @ fdf4b968, seq 2, (req -1)
3   * buck1 @ fdf4c440, seq 3, (req -1)
4   * buck2 @ fdf4c4d0, seq 4, (req -1)
5   * buck3 @ fdf4c560, seq 5, (req -1)
6   * buck4 @ fdf4c5f0, seq 6, (req -1)
7   * ldo1 @ fdf4c680, seq 7, (req -1)
8   * ldo2 @ fdf4c710, seq 8, (req -1)
9   * ldo3 @ fdf4c7a0, seq 9, (req -1)
10  * ldo4 @ fdf4c830, seq 10, (req -1)
11  * ldo5 @ fdf4c8c0, seq 11, (req -1)
12  * ldo6 @ fdf4c950, seq 12, (req -1)
13  * vref_ddr @ fdf4c9e0, seq 13, (req -1)
14  * boost @ fdf4ca70, seq 14, (req -1)
15  * pwr_sw1 @ fdf4cb00, seq 15, (req -1)
16  * pwr_sw2 @ fdf4cb90, seq 16, (req -1)
17  * regulator-sd_switch @ fdf4f7c8, seq 17, (req -1)

uclass 68: remoteproc
uclass 69: reset
0   * stm32_rcc_reset @ fdf4b6e0, seq 0, (req -1)

uclass 70: rtc
0     rtc@5c004000 @ fdf4cc98

uclass 72: serial
0   * serial@40010000 @ fdf4b220, seq 0, (req 0)

uclass 73: simple_bus
0   * soc @ fdf4b198, seq 0, (req -1)

uclass 76: spi
0     spi@58003000 @ fdf4bb40, seq -1, (req 0)

uclass 77: spi_flash
0     mx66l51235l@0 @ fdf4bbb8
1     mx66l51235l@1 @ fdf4bc20

uclass 78: spi_generic
uclass 80: syscon
0   * pwr@50001000 @ fdf4b758, seq 0, (req -1)
1     interrupt-controller@5000d000 @ fdf4b9f8
2   * syscon@50020000 @ fdf4ba50, seq 1, (req -1)

uclass 81: sysreset
0     reboot @ fdf4b120
1     stpmic1-sysreset @ fdf4cc20

uclass 86: usb
0     usbh-ehci@5800d000 @ fdf4c2b0

uclass 87: usb_dev_generic
uclass 88: usb_hub
uclass 89: usb
0     usb-otg@49000000 @ fdf4b410, seq -1, (req 0)


 drivers/core/dump.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/core/dump.c b/drivers/core/dump.c
index 8fbfd93..4704049 100644
--- a/drivers/core/dump.c
+++ b/drivers/core/dump.c
@@ -16,7 +16,7 @@ static void show_devices(struct udevice *dev, int depth, int last_flag)
 	struct udevice *child;
 
 	/* print the first 20 characters to not break the tree-format. */
-	printf(" %-10.10s  %2d  [ %c ]   %-20.20s  ", dev->uclass->uc_drv->name,
+	printf(" %-10.10s  %3d  [ %c ]   %-20.20s  ", dev->uclass->uc_drv->name,
 	       dev_get_uclass_index(dev, NULL),
 	       dev->flags & DM_FLAG_ACTIVATED ? '+' : ' ', dev->driver->name);
 
@@ -64,7 +64,7 @@ void dm_dump_all(void)
  */
 static void dm_display_line(struct udevice *dev, int index)
 {
-	printf("%i %c %s @ %08lx", index,
+	printf("%-3i %c %s @ %08lx", index,
 	       dev->flags & DM_FLAG_ACTIVATED ? '*' : ' ',
 	       dev->name, (ulong)map_to_sysmem(dev));
 	if (dev->seq != -1 || dev->req_seq != -1)
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
