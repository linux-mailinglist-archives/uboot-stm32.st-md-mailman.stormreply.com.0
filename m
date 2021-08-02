Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A6E3DDD3C
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Aug 2021 18:08:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65EBFC597AE;
	Mon,  2 Aug 2021 16:08:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66D26C57B51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Aug 2021 16:08:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 172G3UOi032166; Mon, 2 Aug 2021 18:08:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=7WuHHUoXVZBpA4LZNxbtYMNz601kpKDRox6Xm2igYyk=;
 b=FNQ+Gg/N+rplNRe7dmHW7cFnX9/XNisjL5PGyltZ1CVXeN0lUHzr514uPT5zSLYpYBsU
 JBcu9taTal7r0YKsxuNDo5x2g1+dFjBeZqQWr6NRCcI+2Ulq0S38gHCb0S2iAxmQaK7c
 Y01H2Ky8mbk/HdIfIH9ppZ/Ks9/8OUJuG3K8WNfUqWjD49jHR1bagHabZXkjp4VIf7t3
 s84pmP3KEqhDt6yjwy2E7U9jCOY9Q2CdbMbeP93bsNoVg9SeUTXfUFU8ZHxhWZVI8wxo
 GgQpfTfz/Sy3RpGqVe+upuePW0CQSOQCI37TZ7HfD6BRgWwUYKH0fs7RedEKLuO2FRd6 og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a6cx526kc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 18:08:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6FA8A10002A;
 Mon,  2 Aug 2021 18:08:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 63CA0241860;
 Mon,  2 Aug 2021 18:08:44 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 2 Aug 2021 18:08:44
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 2 Aug 2021 18:08:36 +0200
Message-ID: <20210802180823.1.I3aa79d907e5213c8692d2d428f5a1fbccdce555b@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-02_07:2021-08-02,
 2021-08-02 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] doc: stm32mp1: add page for device tree
	bindings
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

From: Patrick Delaunay <patrick.delaunay@foss.st.com>

With device tree binding migration to yaml it is difficult to synchronize
the binding from Linux kernel to U-Boot.

Instead of maintaining the same dt bindings, this patch adds in the U-Boot
documentation the path to the device tree bindings in Linux kernel for
STMicroelectronics devices, when they are used without modification.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 doc/board/st/index.rst                        |   1 +
 doc/board/st/st.rst                           |  68 ++++++
 doc/device-tree-bindings/adc/st,stm32-adc.txt | 141 ------------
 .../clock/st,stm32-rcc.txt                    |  95 --------
 .../clock/st,stm32h7-rcc.txt                  | 152 -------------
 doc/device-tree-bindings/i2c/i2c-stm32.txt    |  30 ---
 .../memory-controllers/st,stm32-fmc.txt       |  58 -----
 .../mtd/stm32-fmc2-nand.txt                   |  61 -----
 .../phy/phy-stm32-usbphyc.txt                 |  75 -------
 .../pinctrl/st,stm32-pinctrl.txt              | 208 ------------------
 .../regulator/st,stm32-vrefbuf.txt            |  23 --
 .../reset/st,stm32-rcc.txt                    |   6 -
 .../spi/spi-stm32-qspi.txt                    |  44 ----
 13 files changed, 69 insertions(+), 893 deletions(-)
 create mode 100644 doc/board/st/st.rst
 delete mode 100644 doc/device-tree-bindings/adc/st,stm32-adc.txt
 delete mode 100644 doc/device-tree-bindings/clock/st,stm32-rcc.txt
 delete mode 100644 doc/device-tree-bindings/clock/st,stm32h7-rcc.txt
 delete mode 100644 doc/device-tree-bindings/i2c/i2c-stm32.txt
 delete mode 100644 doc/device-tree-bindings/memory-controllers/st,stm32-fmc.txt
 delete mode 100644 doc/device-tree-bindings/mtd/stm32-fmc2-nand.txt
 delete mode 100644 doc/device-tree-bindings/phy/phy-stm32-usbphyc.txt
 delete mode 100644 doc/device-tree-bindings/pinctrl/st,stm32-pinctrl.txt
 delete mode 100644 doc/device-tree-bindings/regulator/st,stm32-vrefbuf.txt
 delete mode 100644 doc/device-tree-bindings/reset/st,stm32-rcc.txt
 delete mode 100644 doc/device-tree-bindings/spi/spi-stm32-qspi.txt

diff --git a/doc/board/st/index.rst b/doc/board/st/index.rst
index 91f1d51b42..8a06a954a2 100644
--- a/doc/board/st/index.rst
+++ b/doc/board/st/index.rst
@@ -6,4 +6,5 @@ STMicroelectronics
 .. toctree::
    :maxdepth: 2
 
+   st
    stm32mp1
diff --git a/doc/board/st/st.rst b/doc/board/st/st.rst
new file mode 100644
index 0000000000..de574fd42e
--- /dev/null
+++ b/doc/board/st/st.rst
@@ -0,0 +1,68 @@
+.. SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+.. sectionauthor:: Patrick Delaunay <patrick.delaunay@st.com>
+
+U-Boot device tree bindings
+----------------------------
+
+The U-Boot specific bindings are defined in the U-Boot directory:
+doc/device-tree-bindings
+
+* clock
+        - clock/st,stm32mp1.txt
+* ram
+        - memory-controllers/st,stm32mp1-ddr.txt
+
+All the other device tree bindings used in U-Boot are specified in Linux
+kernel. Please refer dt bindings from below specified paths in the Linux
+kernel binding directory = Documentation/devicetree/bindings/
+
+* acd
+	- iio/adc/st,stm32-adc.yaml
+* clock
+        - clock/st,stm32-rcc.txt
+        - clock/st,stm32h7-rcc.txt
+	- clock/st,stm32mp1-rcc.yaml
+* display
+	- display/st,stm32-dsi.yaml
+	- display/st,stm32-ltdc.yaml
+* gpio
+	- pinctrl/st,stm32-pinctrl.yaml
+* hwlock
+	- hwlock/st,stm32-hwspinlock.yaml
+* i2c
+	- i2c/st,stm32-i2c.yaml
+* mailbox
+	- mailbox/st,stm32-ipcc.yaml
+* mmc
+	- mmc/arm,pl18x.yaml
+* nand
+	- mtd/st,stm32-fmc2-nand.yaml
+	- memory-controllers/st,stm32-fmc2-ebi.yaml
+* net
+        - net/stm32-dwmac.yaml
+* nvmem
+        - nvmem/st,stm32-romem.yaml
+* remoteproc
+	- remoteproc/st,stm32-rproc.yaml
+* regulator
+	- regulator/st,stm32mp1-pwr-reg.yaml
+	- regulator/st,stm32-vrefbuf.yaml
+* reset
+	- reset/st,stm32-rcc.txt
+	- reset/st,stm32mp1-rcc.txt
+* rng
+	- rng/st,stm32-rng.yaml
+* rtc
+	- rtc/st,stm32-rtc.yaml
+* serial
+	- serial/st,stm32-uart.yaml
+* spi
+	- spi/st,stm32-spi.yaml
+	- spi/st,stm32-qspi.yaml
+* syscon
+        - arm/stm32/st,stm32-syscon.yaml
+* usb
+	- phy/phy-stm32-usbphyc.yaml
+        - usb/dwc2.yaml
+* watchdog
+	- watchdog/st,stm32-iwdg.yaml
diff --git a/doc/device-tree-bindings/adc/st,stm32-adc.txt b/doc/device-tree-bindings/adc/st,stm32-adc.txt
deleted file mode 100644
index 07fb6cd76b..0000000000
--- a/doc/device-tree-bindings/adc/st,stm32-adc.txt
+++ /dev/null
@@ -1,141 +0,0 @@
-STMicroelectronics STM32 ADC device
-
-STM32 ADC is a successive approximation analog-to-digital converter.
-It has several multiplexed input channels. Conversions can be performed
-in single, continuous, scan or discontinuous mode. Result of the ADC is
-stored in a left-aligned or right-aligned 32-bit data register.
-Conversions can be launched in software or using hardware triggers.
-
-The analog watchdog feature allows the application to detect if the input
-voltage goes beyond the user-defined, higher or lower thresholds.
-
-Each STM32 ADC block can have up to 3 ADC instances.
-
-Each instance supports two contexts to manage conversions, each one has its
-own configurable sequence and trigger:
-- regular conversion can be done in sequence, running in background
-- injected conversions have higher priority, and so have the ability to
-  interrupt regular conversion sequence (either triggered in SW or HW).
-  Regular sequence is resumed, in case it has been interrupted.
-
-Contents of a stm32 adc root node:
------------------------------------
-Required properties:
-- compatible: Should be one of:
-  "st,stm32f4-adc-core"
-  "st,stm32h7-adc-core"
-  "st,stm32mp1-adc-core"
-- reg: Offset and length of the ADC block register set.
-- interrupts: One or more interrupts for ADC block. Some parts like stm32f4
-  and stm32h7 share a common ADC interrupt line. stm32mp1 has two separate
-  interrupt lines, one for each ADC within ADC block.
-- clocks: Core can use up to two clocks, depending on part used:
-  - "adc" clock: for the analog circuitry, common to all ADCs.
-    It's required on stm32f4.
-    It's optional on stm32h7.
-  - "bus" clock: for registers access, common to all ADCs.
-    It's not present on stm32f4.
-    It's required on stm32h7.
-- clock-names: Must be "adc" and/or "bus" depending on part used.
-- interrupt-controller: Identifies the controller node as interrupt-parent
-- vref-supply: Phandle to the vref input analog reference voltage.
-- #interrupt-cells = <1>;
-- #address-cells = <1>;
-- #size-cells = <0>;
-
-Optional properties:
-- A pinctrl state named "default" for each ADC channel may be defined to set
-  inX ADC pins in mode of operation for analog input on external pin.
-
-Contents of a stm32 adc child node:
------------------------------------
-An ADC block node should contain at least one subnode, representing an
-ADC instance available on the machine.
-
-Required properties:
-- compatible: Should be one of:
-  "st,stm32f4-adc"
-  "st,stm32h7-adc"
-  "st,stm32mp1-adc"
-- reg: Offset of ADC instance in ADC block (e.g. may be 0x0, 0x100, 0x200).
-- clocks: Input clock private to this ADC instance. It's required only on
-  stm32f4, that has per instance clock input for registers access.
-- interrupt-parent: Phandle to the parent interrupt controller.
-- interrupts: IRQ Line for the ADC (e.g. may be 0 for adc@0, 1 for adc@100 or
-  2 for adc@200).
-- st,adc-channels: List of single-ended channels muxed for this ADC.
-  It can have up to 16 channels on stm32f4 or 20 channels on stm32h7, numbered
-  from 0 to 15 or 19 (resp. for in0..in15 or in0..in19).
-- st,adc-diff-channels: List of differential channels muxed for this ADC.
-  Depending on part used, some channels can be configured as differential
-  instead of single-ended (e.g. stm32h7). List here positive and negative
-  inputs pairs as <vinp vinn>, <vinp vinn>,... vinp and vinn are numbered
-  from 0 to 19 on stm32h7)
-  Note: At least one of "st,adc-channels" or "st,adc-diff-channels" is required.
-  Both properties can be used together. Some channels can be used as
-  single-ended and some other ones as differential (mixed). But channels
-  can't be configured both as single-ended and differential (invalid).
-- #io-channel-cells = <1>: See the IIO bindings section "IIO consumers" in
-  Documentation/devicetree/bindings/iio/iio-bindings.txt
-
-Optional properties:
-- dmas: Phandle to dma channel for this ADC instance.
-  See ../../dma/dma.txt for details.
-- dma-names: Must be "rx" when dmas property is being used.
-- assigned-resolution-bits: Resolution (bits) to use for conversions. Must
-  match device available resolutions:
-  * can be 6, 8, 10 or 12 on stm32f4
-  * can be 8, 10, 12, 14 or 16 on stm32h7
-  Default is maximum resolution if unset.
-- st,min-sample-time-nsecs: Minimum sampling time in nanoseconds.
-  Depending on hardware (board) e.g. high/low analog input source impedance,
-  fine tune of ADC sampling time may be recommended.
-  This can be either one value or an array that matches 'st,adc-channels' list,
-  to set sample time resp. for all channels, or independently for each channel.
-
-Example:
-	adc: adc@40012000 {
-		compatible = "st,stm32f4-adc-core";
-		reg = <0x40012000 0x400>;
-		interrupts = <18>;
-		clocks = <&rcc 0 168>;
-		clock-names = "adc";
-		vref-supply = <&reg_vref>;
-		interrupt-controller;
-		pinctrl-names = "default";
-		pinctrl-0 = <&adc3_in8_pin>;
-
-		#interrupt-cells = <1>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		adc@0 {
-			compatible = "st,stm32f4-adc";
-			#io-channel-cells = <1>;
-			reg = <0x0>;
-			clocks = <&rcc 0 168>;
-			interrupt-parent = <&adc>;
-			interrupts = <0>;
-			st,adc-channels = <8>;
-			dmas = <&dma2 0 0 0x400 0x0>;
-			dma-names = "rx";
-			assigned-resolution-bits = <8>;
-		};
-		...
-		other adc child nodes follow...
-	};
-
-Example to setup:
-- channel 1 as single-ended
-- channels 2 & 3 as differential (with resp. 6 & 7 negative inputs)
-
-	adc: adc@40022000 {
-		compatible = "st,stm32h7-adc-core";
-		...
-		adc1: adc@0 {
-			compatible = "st,stm32h7-adc";
-			...
-			st,adc-channels = <1>;
-			st,adc-diff-channels = <2 6>, <3 7>;
-		};
-	};
diff --git a/doc/device-tree-bindings/clock/st,stm32-rcc.txt b/doc/device-tree-bindings/clock/st,stm32-rcc.txt
deleted file mode 100644
index 0532d815da..0000000000
--- a/doc/device-tree-bindings/clock/st,stm32-rcc.txt
+++ /dev/null
@@ -1,95 +0,0 @@
-STMicroelectronics STM32 Reset and Clock Controller
-===================================================
-
-The RCC IP is both a reset and a clock controller.
-
-Please refer to clock-bindings.txt for common clock controller binding usage.
-Please also refer to reset.txt for common reset controller binding usage.
-
-Required properties:
-- compatible: Should be:
-  "st,stm32f42xx-rcc"
-  "st,stm32f469-rcc"
-- reg: should be register base and length as documented in the
-  datasheet
-- #reset-cells: 1, see below
-- #clock-cells: 2, device nodes should specify the clock in their "clocks"
-  property, containing a phandle to the clock device node, an index selecting
-  between gated clocks and other clocks and an index specifying the clock to
-  use.
-
-Example:
-
-	rcc: rcc@40023800 {
-		#reset-cells = <1>;
-		#clock-cells = <2>
-		compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
-		reg = <0x40023800 0x400>;
-	};
-
-Specifying gated clocks
-=======================
-
-The primary index must be set to 0.
-
-The secondary index is the bit number within the RCC register bank, starting
-from the first RCC clock enable register (RCC_AHB1ENR, address offset 0x30).
-
-It is calculated as: index = register_offset / 4 * 32 + bit_offset.
-Where bit_offset is the bit offset within the register (LSB is 0, MSB is 31).
-
-To simplify the usage and to share bit definition with the reset and clock
-drivers of the RCC IP, macros are available to generate the index in
-human-readble format.
-
-For STM32F4 series, the macro are available here:
- - include/dt-bindings/mfd/stm32f4-rcc.h
-
-Example:
-
-	/* Gated clock, AHB1 bit 0 (GPIOA) */
-	... {
-		clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOA)>
-	};
-
-	/* Gated clock, AHB2 bit 4 (CRYP) */
-	... {
-		clocks = <&rcc 0 STM32F4_AHB2_CLOCK(CRYP)>
-	};
-
-Specifying other clocks
-=======================
-
-The primary index must be set to 1.
-
-The secondary index is bound with the following magic numbers:
-
-	0	SYSTICK
-	1	FCLK
-
-Example:
-
-	/* Misc clock, FCLK */
-	... {
-		clocks = <&rcc 1 STM32F4_APB1_CLOCK(TIM2)>
-	};
-
-
-Specifying softreset control of devices
-=======================================
-
-Device nodes should specify the reset channel required in their "resets"
-property, containing a phandle to the reset device node and an index specifying
-which channel to use.
-The index is the bit number within the RCC registers bank, starting from RCC
-base address.
-It is calculated as: index = register_offset / 4 * 32 + bit_offset.
-Where bit_offset is the bit offset within the register.
-For example, for CRC reset:
-  crc = AHB1RSTR_offset / 4 * 32 + CRCRST_bit_offset = 0x10 / 4 * 32 + 12 = 140
-
-example:
-
-	timer2 {
-		resets	= <&rcc STM32F4_APB1_RESET(TIM2)>;
-	};
diff --git a/doc/device-tree-bindings/clock/st,stm32h7-rcc.txt b/doc/device-tree-bindings/clock/st,stm32h7-rcc.txt
deleted file mode 100644
index 9d4b5873d9..0000000000
--- a/doc/device-tree-bindings/clock/st,stm32h7-rcc.txt
+++ /dev/null
@@ -1,152 +0,0 @@
-STMicroelectronics STM32H7 Reset and Clock Controller
-=====================================================
-
-The RCC IP is both a reset and a clock controller.
-
-Please refer to clock-bindings.txt for common clock controller binding usage.
-Please also refer to reset.txt for common reset controller binding usage.
-
-Required properties:
-- compatible: Should be:
-  "st,stm32h743-rcc"
-
-- reg: should be register base and length as documented in the
-  datasheet
-
-- #reset-cells: 1, see below
-
-- #clock-cells : from common clock binding; shall be set to 1
-
-- clocks: External oscillator clock phandle
-  - high speed external clock signal (HSE)
-  - low speed external clock signal (LSE)
-  - external I2S clock (I2S_CKIN)
-
-- st,syscfg: phandle for pwrcfg, mandatory to disable/enable backup domain
-  write protection (RTC clock).
-
-- pll x node: Allow to register a pll with specific parameters.
-  Please see PLL section below.
-
-Example:
-
-	rcc: rcc@58024400 {
-		#reset-cells = <1>;
-		#clock-cells = <2>
-		compatible = "st,stm32h743-rcc", "st,stm32-rcc";
-		reg = <0x58024400 0x400>;
-		clocks = <&clk_hse>, <&clk_lse>, <&clk_i2s_ckin>;
-
-		st,syscfg = <&pwrcfg>;
-
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vco1@58024430 {
-			#clock-cells = <0>;
-			compatible = "stm32,pll";
-			reg = <0>;
-		};
-
-		vco2@58024438 {
-			#clock-cells = <0>;
-			compatible = "stm32,pll";
-			reg = <1>;
-			st,clock-div = <2>;
-			st,clock-mult = <40>;
-			st,frac-status = <0>;
-			st,frac = <0>;
-			st,vcosel = <1>;
-			st,pllrge = <2>;
-		};
-	};
-
-
-STM32H7 PLL
------------
-
-The VCO of STM32 PLL could be reprensented like this:
-
-  Vref    ---------       --------
-    ---->| / DIVM  |---->| x DIVN | ------> VCO
-          ---------       --------
-		             ^
-			     |
-	                  -------
-		         | FRACN |
-		          -------
-
-When the PLL is configured in integer mode:
-- VCO = ( Vref / DIVM ) * DIVN
-
-When the PLL is configured in fractional mode:
-- VCO = ( Vref / DIVM ) * ( DIVN + FRACN / 2^13)
-
-
-Required properties for pll node:
-- compatible: Should be:
-  "stm32,pll"
-
-- #clock-cells: from common clock binding; shall be set to 0
-- reg: Should be the pll number.
-
-Optional properties:
-- st,clock-div:  DIVM division factor       : <1..63>
-- st,clock-mult: DIVN multiplication factor : <4..512>
-
-- st,frac-status:
-   - 0 Pll is configured in integer mode
-   - 1 Pll is configure in fractional mode
-
-- st,frac: Fractional part of the multiplication factor : <0..8191>
-
-- st,vcosel: VCO selection
-  - 0: Wide VCO range:192 to 836 MHz
-  - 1: Medium VCO range:150 to 420 MHz
-
-- st,pllrge: PLL input frequency range
-  - 0: The PLL input (Vref / DIVM) clock range frequency is between 1 and 2 MHz
-  - 1: The PLL input (Vref / DIVM) clock range frequency is between 2 and 4 MHz
-  - 2: The PLL input (Vref / DIVM) clock range frequency is between 4 and 8 MHz
-  - 3: The PLL input (Vref / DIVM) clock range frequency is between 8 and 16 MHz
-
-
-The peripheral clock consumer should specify the desired clock by
-having the clock ID in its "clocks" phandle cell.
-
-All available clocks are defined as preprocessor macros in
-dt-bindings/clock/stm32h7-clks.h header and can be used in device
-tree sources.
-
-Example:
-
-		timer5: timer@40000c00 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000c00 0x400>;
-			interrupts = <50>;
-			clocks = <&rcc TIM5_CK>;
-
-		};
-
-Specifying softreset control of devices
-=======================================
-
-Device nodes should specify the reset channel required in their "resets"
-property, containing a phandle to the reset device node and an index specifying
-which channel to use.
-The index is the bit number within the RCC registers bank, starting from RCC
-base address.
-It is calculated as: index = register_offset / 4 * 32 + bit_offset.
-Where bit_offset is the bit offset within the register.
-
-For example, for CRC reset:
-  crc = AHB4RSTR_offset / 4 * 32 + CRCRST_bit_offset = 0x88 / 4 * 32 + 19 = 1107
-
-All available preprocessor macros for reset are defined dt-bindings//mfd/stm32h7-rcc.h
-header and can be used in device tree sources.
-
-example:
-
-	timer2 {
-		resets	= <&rcc STM32H7_APB1L_RESET(TIM2)>;
-	};
diff --git a/doc/device-tree-bindings/i2c/i2c-stm32.txt b/doc/device-tree-bindings/i2c/i2c-stm32.txt
deleted file mode 100644
index df03743ace..0000000000
--- a/doc/device-tree-bindings/i2c/i2c-stm32.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-* I2C controller embedded in STMicroelectronis STM32 platforms
-
-Required properties :
-- compatible : Must be "st,stm32f7-i2c"
-- reg : Offset and length of the register set for the device
-- resets: Must contain the phandle to the reset controller
-- clocks: Must contain the input clock of the I2C instance
-- A pinctrl state named "default" must be defined to set pins in mode of
-  operation for I2C transfer
-- #address-cells = <1>;
-- #size-cells = <0>;
-
-Optional properties :
-- clock-frequency : Desired I2C bus clock frequency in Hz. If not specified,
-  the default 100 kHz frequency will be used. As only Normal, Fast and Fast+
-  modes are implemented, possible values are 100000, 400000 and 1000000.
-
-Example :
-
-	i2c1: i2c@40005400 {
-		compatible = "st,stm32f7-i2c";
-		reg = <0x40005400 0x400>;
-		resets = <&rcc 181>;
-		clocks = <&clk_pclk1>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2c1>;
-		clock-frequency = <400000>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
diff --git a/doc/device-tree-bindings/memory-controllers/st,stm32-fmc.txt b/doc/device-tree-bindings/memory-controllers/st,stm32-fmc.txt
deleted file mode 100644
index 99f76d515f..0000000000
--- a/doc/device-tree-bindings/memory-controllers/st,stm32-fmc.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-ST, stm32 flexible memory controller Drive
-Required properties:
-- compatible	: "st,stm32-fmc"
-- reg		: fmc controller base address
-- clocks	: fmc controller clock
-u-boot,dm-pre-reloc: flag to initialize memory before relocation.
-
-on-board sdram memory attributes:
-- st,sdram-control : parameters for sdram configuration, in this order:
-  number of columns
-  number of rows
-  memory width
-  number of intenal banks in memory
-  cas latency
-  read burst enable or disable
-  read pipe delay
-
-- st,sdram-timing: timings for sdram, in this order:
-  tmrd
-  txsr
-  tras
-  trc
-  trp
-  trcd
-
-There is device tree include file at :
-include/dt-bindings/memory/stm32-sdram.h to define sdram control and timing
-parameters as MACROS.
-
-Example:
-	fmc: fmc@A0000000 {
-	     compatible = "st,stm32-fmc";
-	     reg = <0xA0000000 0x1000>;
-	     clocks = <&rcc 0 64>;
-	     u-boot,dm-pre-reloc;
-	};
-
-	&fmc {
-		pinctrl-0 = <&fmc_pins>;
-		pinctrl-names = "default";
-		status = "okay";
-
-		/* sdram memory configuration from sdram datasheet */
-		bank1: bank@0 {
-		       st,sdram-control = /bits/ 8 <NO_COL_8 NO_ROW_12 MWIDTH_16 BANKS_2
-						CAS_3 RD_BURST_EN RD_PIPE_DL_0>;
-		       st,sdram-timing = /bits/ 8 <TMRD_1 TXSR_60 TRAS_42 TRC_60 TRP_18
-						TRCD_18>;
-		};
-
-		/* sdram memory configuration from sdram datasheet */
-		bank2: bank@1 {
-		       st,sdram-control = /bits/ 8 <NO_COL_8 NO_ROW_12 MWIDTH_16 BANKS_2
-						CAS_3 RD_BURST_EN RD_PIPE_DL_0>;
-		       st,sdram-timing = /bits/ 8 <TMRD_1 TXSR_60 TRAS_42 TRC_60 TRP_18
-						TRCD_18>;
-		};
-	}
diff --git a/doc/device-tree-bindings/mtd/stm32-fmc2-nand.txt b/doc/device-tree-bindings/mtd/stm32-fmc2-nand.txt
deleted file mode 100644
index ad2bef8265..0000000000
--- a/doc/device-tree-bindings/mtd/stm32-fmc2-nand.txt
+++ /dev/null
@@ -1,61 +0,0 @@
-STMicroelectronics Flexible Memory Controller 2 (FMC2)
-NAND Interface
-
-Required properties:
-- compatible: Should be one of:
-              * st,stm32mp15-fmc2
-- reg: NAND flash controller memory areas.
-       First region contains the register location.
-       Regions 2 to 4 respectively contain the data, command,
-       and address space for CS0.
-       Regions 5 to 7 contain the same areas for CS1.
-- interrupts: The interrupt number
-- pinctrl-0: Standard Pinctrl phandle (see: pinctrl/pinctrl-bindings.txt)
-- clocks: The clock needed by the NAND flash controller
-
-Optional properties:
-- resets: Reference to a reset controller asserting the FMC controller
-- dmas: DMA specifiers (see: dma/stm32-mdma.txt)
-- dma-names: Must be "tx", "rx" and "ecc"
-
-* NAND device bindings:
-
-Required properties:
-- reg: describes the CS lines assigned to the NAND device.
-
-Optional properties:
-- nand-on-flash-bbt: see nand.txt
-- nand-ecc-strength: see nand.txt
-- nand-ecc-step-size: see nand.txt
-
-The following ECC strength and step size are currently supported:
- - nand-ecc-strength = <1>, nand-ecc-step-size = <512> (Hamming)
- - nand-ecc-strength = <4>, nand-ecc-step-size = <512> (BCH4)
- - nand-ecc-strength = <8>, nand-ecc-step-size = <512> (BCH8) (default)
-
-Example:
-
-	fmc: nand-controller@58002000 {
-		compatible = "st,stm32mp15-fmc2";
-		reg = <0x58002000 0x1000>,
-		      <0x80000000 0x1000>,
-		      <0x88010000 0x1000>,
-		      <0x88020000 0x1000>,
-		      <0x81000000 0x1000>,
-		      <0x89010000 0x1000>,
-		      <0x89020000 0x1000>;
-		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&rcc FMC_K>;
-		resets = <&rcc FMC_R>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&fmc_pins_a>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		nand@0 {
-			reg = <0>;
-			nand-on-flash-bbt;
-			#address-cells = <1>;
-			#size-cells = <1>;
-		};
-	};
diff --git a/doc/device-tree-bindings/phy/phy-stm32-usbphyc.txt b/doc/device-tree-bindings/phy/phy-stm32-usbphyc.txt
deleted file mode 100644
index edfe4b426c..0000000000
--- a/doc/device-tree-bindings/phy/phy-stm32-usbphyc.txt
+++ /dev/null
@@ -1,75 +0,0 @@
-STMicroelectronics STM32 USB HS PHY controller
-
-The STM32 USBPHYC block contains a dual port High Speed UTMI+ PHY and a UTMI
-switch. It controls PHY configuration and status, and the UTMI+ switch that
-selects either OTG or HOST controller for the second PHY port. It also sets
-PLL configuration.
-
-USBPHYC
-      |_ PLL
-      |
-      |_ PHY port#1 _________________ HOST controller
-      |                    _                 |
-      |                  / 1|________________|
-      |_ PHY port#2 ----|   |________________
-      |                  \_0|                |
-      |_ UTMI switch_______|          OTG controller
-
-
-Phy provider node
-=================
-
-Required properties:
-- compatible: must be "st,stm32mp1-usbphyc"
-- reg: address and length of the usb phy control register set
-- clocks: phandle + clock specifier for the PLL phy clock
-- vdda1v1-supply: phandle to the regulator providing 1V1 power to the PHY
-- vdda1v8-supply: phandle to the regulator providing 1V8 power to the PHY
-- #address-cells: number of address cells for phys sub-nodes, must be <1>
-- #size-cells: number of size cells for phys sub-nodes, must be <0>
-
-Optional properties:
-- assigned-clocks: phandle + clock specifier for the PLL phy clock
-- assigned-clock-parents: the PLL phy clock parent
-- resets: phandle + reset specifier
-
-Required nodes: one sub-node per port the controller provides.
-
-Phy sub-nodes
-==============
-
-Required properties:
-- reg: phy port index
-- phy-supply: phandle to the regulator providing 3V3 power to the PHY,
-	      see phy-bindings.txt in the same directory.
-- #phy-cells: see phy-bindings.txt in the same directory, must be <0> for PHY
-  port#1 and must be <1> for PHY port#2, to select USB controller
-
-Optional properties:
-- vbus-supply: phandle to the regulator providing 5V vbus to the USB connector
-
-Example:
-		usbphyc: usb-phy@5a006000 {
-			compatible = "st,stm32mp1-usbphyc";
-			reg = <0x5a006000 0x1000>;
-			clocks = <&rcc_clk USBPHY_K>;
-			resets = <&rcc_rst USBPHY_R>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			usbphyc_port0: usb-phy@0 {
-				reg = <0>;
-				phy-supply = <&vdd_usb>;
-				vdda1v1-supply = <&reg11>;
-				vdda1v8-supply = <&reg18>
-				#phy-cells = <0>;
-			};
-
-			usbphyc_port1: usb-phy@1 {
-				reg = <1>;
-				phy-supply = <&vdd_usb>;
-				vdda1v1-supply = <&reg11>;
-				vdda1v8-supply = <&reg18>
-				#phy-cells = <1>;
-			};
-		};
diff --git a/doc/device-tree-bindings/pinctrl/st,stm32-pinctrl.txt b/doc/device-tree-bindings/pinctrl/st,stm32-pinctrl.txt
deleted file mode 100644
index 00169255e4..0000000000
--- a/doc/device-tree-bindings/pinctrl/st,stm32-pinctrl.txt
+++ /dev/null
@@ -1,208 +0,0 @@
-* STM32 GPIO and Pin Mux/Config controller
-
-STMicroelectronics's STM32 MCUs intregrate a GPIO and Pin mux/config hardware
-controller. It controls the input/output settings on the available pins and
-also provides ability to multiplex and configure the output of various on-chip
-controllers onto these pads.
-
-Pin controller node:
-Required properies:
- - compatible: value should be one of the following:
-   "st,stm32f429-pinctrl"
-   "st,stm32f469-pinctrl"
-   "st,stm32f746-pinctrl"
-   "st,stm32f769-pinctrl"
-   "st,stm32h743-pinctrl"
-   "st,stm32mp157-pinctrl"
-   "st,stm32mp157-z-pinctrl"
- - #address-cells: The value of this property must be 1
- - #size-cells	: The value of this property must be 1
- - ranges	: defines mapping between pin controller node (parent) to
-   gpio-bank node (children).
- - pins-are-numbered: Specify the subnodes are using numbered pinmux to
-   specify pins.
-
-GPIO controller/bank node:
-Required properties:
- - gpio-controller : Indicates this device is a GPIO controller
- - #gpio-cells	  : Should be two.
-			The first cell is the pin number
-			The second one is the polarity:
-				- 0 for active high
-				- 1 for active low
- - reg		  : The gpio address range, relative to the pinctrl range
- - clocks	  : clock that drives this bank
- - st,bank-name	  : Should be a name string for this bank as specified in
-   the datasheet
-
-Optional properties:
- - reset:	  : Reference to the reset controller
- - st,syscfg: Should be phandle/offset/mask.
-	-The phandle to the syscon node which includes IRQ mux selection register.
-	-The offset of the IRQ mux selection register
-	-The field mask of IRQ mux, needed if different of 0xf.
- - gpio-ranges: Define a dedicated mapping between a pin-controller and
-   a gpio controller. Format is <&phandle a b c> with:
-	-(phandle): phandle of pin-controller.
-	-(a): gpio base offset in range.
-	-(b): pin base offset in range.
-	-(c): gpio count in range
-   This entry has to be used either if there are holes inside a bank:
-	GPIOB0/B1/B2/B14/B15 (see example 2)
-   or if banks are not contiguous:
-	GPIOA/B/C/E...
-   NOTE: If "gpio-ranges" is used for a gpio controller, all gpio-controller
-   have to use a "gpio-ranges" entry.
-   More details in Documentation/devicetree/bindings/gpio/gpio.txt.
- - st,bank-ioport: should correspond to the EXTI IOport selection (EXTI line
-   used to select GPIOs as interrupts).
- - hwlocks: reference to a phandle of a hardware spinlock provider node.
- - st,package: Indicates the SOC package used.
-   More details in include/dt-bindings/pinctrl/stm32-pinfunc.h
-
-Example 1:
-#include <dt-bindings/pinctrl/stm32f429-pinfunc.h>
-...
-
-	pin-controller {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "st,stm32f429-pinctrl";
-		ranges = <0 0x40020000 0x3000>;
-		pins-are-numbered;
-
-		gpioa: gpio@40020000 {
-			gpio-controller;
-			#gpio-cells = <2>;
-			reg = <0x0 0x400>;
-			resets = <&reset_ahb1 0>;
-			st,bank-name = "GPIOA";
-		};
-		...
-		pin-functions nodes follow...
-	};
-
-Example 2:
-#include <dt-bindings/pinctrl/stm32f429-pinfunc.h>
-...
-
-	pinctrl: pin-controller {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "st,stm32f429-pinctrl";
-		ranges = <0 0x40020000 0x3000>;
-		pins-are-numbered;
-
-		gpioa: gpio@40020000 {
-			gpio-controller;
-			#gpio-cells = <2>;
-			reg = <0x0 0x400>;
-			resets = <&reset_ahb1 0>;
-			st,bank-name = "GPIOA";
-			gpio-ranges = <&pinctrl 0 0 16>;
-		};
-
-		gpiob: gpio@40020400 {
-			gpio-controller;
-			#gpio-cells = <2>;
-			reg = <0x0 0x400>;
-			resets = <&reset_ahb1 0>;
-			st,bank-name = "GPIOB";
-			ngpios = 4;
-			gpio-ranges = <&pinctrl 0 16 3>,
-				      <&pinctrl 14 30 2>;
-		};
-
-
-		...
-		pin-functions nodes follow...
-	};
-
-
-Contents of function subnode node:
-----------------------------------
-Subnode format
-A pinctrl node should contain at least one subnode representing the
-pinctrl group available on the machine. Each subnode will list the
-pins it needs, and how they should be configured, with regard to muxer
-configuration, pullups, drive, output high/low and output speed.
-
-    node {
-	pinmux = <PIN_NUMBER_PINMUX>;
-	GENERIC_PINCONFIG;
-    };
-
-Required properties:
-- pinmux: integer array, represents gpio pin number and mux setting.
-  Supported pin number and mux varies for different SoCs, and are defined in
-  dt-bindings/pinctrl/<soc>-pinfunc.h directly.
-  These defines are calculated as:
-    ((port * 16 + line) << 8) | function
-  With:
-    - port: The gpio port index (PA = 0, PB = 1, ..., PK = 11)
-    - line: The line offset within the port (PA0 = 0, PA1 = 1, ..., PA15 = 15)
-    - function: The function number, can be:
-      * 0 : GPIO
-      * 1 : Alternate Function 0
-      * 2 : Alternate Function 1
-      * 3 : Alternate Function 2
-      * ...
-      * 16 : Alternate Function 15
-      * 17 : Analog
-
-  To simplify the usage, macro is available to generate "pinmux" field.
-  This macro is available here:
-    - include/dt-bindings/pinctrl/stm32-pinfunc.h
-
-  Some examples of using macro:
-    /* GPIO A9 set as alernate function 2 */
-    ... {
-		pinmux = <STM32_PINMUX('A', 9, AF2)>;
-    };
-    /* GPIO A9 set as GPIO  */
-    ... {
-		pinmux = <STM32_PINMUX('A', 9, GPIO)>;
-    };
-    /* GPIO A9 set as analog */
-    ... {
-		pinmux = <STM32_PINMUX('A', 9, ANALOG)>;
-    };
-
-Optional properties:
-- GENERIC_PINCONFIG: is the generic pinconfig options to use.
-  Available options are:
-   - bias-disable,
-   - bias-pull-down,
-   - bias-pull-up,
-   - drive-push-pull,
-   - drive-open-drain,
-   - output-low
-   - output-high
-   - slew-rate = <x>, with x being:
-       < 0 > : Low speed
-       < 1 > : Medium speed
-       < 2 > : Fast speed
-       < 3 > : High speed
-
-Example:
-
-pin-controller {
-...
-	usart1_pins_a: usart1@0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('A', 9, AF7)>;
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <0>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('A', 10, AF7)>;
-			bias-disable;
-		};
-	};
-};
-
-&usart1 {
-	pinctrl-0 = <&usart1_pins_a>;
-	pinctrl-names = "default";
-};
diff --git a/doc/device-tree-bindings/regulator/st,stm32-vrefbuf.txt b/doc/device-tree-bindings/regulator/st,stm32-vrefbuf.txt
deleted file mode 100644
index 0f6b6feda3..0000000000
--- a/doc/device-tree-bindings/regulator/st,stm32-vrefbuf.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-STM32 VREFBUF - Voltage reference buffer
-
-Some STM32 devices embed a voltage reference buffer which can be used as
-voltage reference for ADCs, DACs and also as voltage reference for external
-components through the dedicated VREF+ pin.
-
-Required properties:
-- compatible:		Must be "st,stm32-vrefbuf".
-- reg:			Offset and length of VREFBUF register set.
-- clocks:		Must contain an entry for peripheral clock.
-
-Optional properties:
-- vdda-supply:		Phandle to the parent vdda supply regulator node.
-
-Example:
-	vrefbuf: regulator@58003c00 {
-		compatible = "st,stm32-vrefbuf";
-		reg = <0x58003C00 0x8>;
-		clocks = <&rcc VREF_CK>;
-		regulator-min-microvolt = <1500000>;
-		regulator-max-microvolt = <2500000>;
-		vdda-supply = <&vdda>;
-	};
diff --git a/doc/device-tree-bindings/reset/st,stm32-rcc.txt b/doc/device-tree-bindings/reset/st,stm32-rcc.txt
deleted file mode 100644
index 01db343751..0000000000
--- a/doc/device-tree-bindings/reset/st,stm32-rcc.txt
+++ /dev/null
@@ -1,6 +0,0 @@
-STMicroelectronics STM32 Peripheral Reset Controller
-====================================================
-
-The RCC IP is both a reset and a clock controller.
-
-Please see Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
diff --git a/doc/device-tree-bindings/spi/spi-stm32-qspi.txt b/doc/device-tree-bindings/spi/spi-stm32-qspi.txt
deleted file mode 100644
index adeeb63e84..0000000000
--- a/doc/device-tree-bindings/spi/spi-stm32-qspi.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-* STMicroelectronics Quad Serial Peripheral Interface(QSPI)
-
-Required properties:
-- compatible: should be "st,stm32f469-qspi"
-- reg: the first contains the register location and length.
-       the second contains the memory mapping address and length
-- reg-names: should contain the reg names "qspi" "qspi_mm"
-- interrupts: should contain the interrupt for the device
-- clocks: the phandle of the clock needed by the QSPI controller
-- A pinctrl must be defined to set pins in mode of operation for QSPI transfer
-
-Optional properties:
-- resets: must contain the phandle to the reset controller.
-
-A spi flash (NOR/NAND) must be a child of spi node and could have some
-properties. Also see jedec,spi-nor.txt.
-
-Required properties:
-- reg: chip-Select number (QSPI controller may connect 2 flashes)
-- spi-max-frequency: max frequency of spi bus
-
-Optional property:
-- spi-rx-bus-width: see ./spi-bus.txt for the description
-
-Example:
-
-qspi: spi@a0001000 {
-	compatible = "st,stm32f469-qspi";
-	reg = <0xa0001000 0x1000>, <0x90000000 0x10000000>;
-	reg-names = "qspi", "qspi_mm";
-	interrupts = <91>;
-	resets = <&rcc STM32F4_AHB3_RESET(QSPI)>;
-	clocks = <&rcc 0 STM32F4_AHB3_CLOCK(QSPI)>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_qspi0>;
-
-	flash@0 {
-		compatible = "jedec,spi-nor";
-		reg = <0>;
-		spi-rx-bus-width = <4>;
-		spi-max-frequency = <108000000>;
-		...
-	};
-};
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
