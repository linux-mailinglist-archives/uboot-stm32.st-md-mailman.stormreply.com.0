Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D38521000
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 10:49:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7EE8C0D2B9;
	Tue, 10 May 2022 08:49:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCE22C0D2B8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 08:49:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A8dI8s028998;
 Tue, 10 May 2022 10:49:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=oC+ND0aPSFkbvgSoA8jaWPyuZ4mHcmDxcwKyy6mGwKs=;
 b=qahfQr6+M/vn8CkUYtYxHdyPVp7ehGBxyBFk5pMo3dQo/PfIXUYRakkmVH1aw6kz1qmH
 jONAjgk93RNPesJ36PvuhCp+rwOZVMgH0RRdMfvDys6GhW3qOo7bOhS/9OS0A5DyRGry
 3UQc9sFoCFZU93DClQr/gP6UOWjrAEDP5ERzYRIN42hpRrYss1vVXsk0WhtxoFdDFO2d
 ab/ecknyE4QIIJXefpXvrF4vrQVIOlQfJggkQNZReHoGBJdpoYxX0RwtU8891M/uNTRq
 7gVmtOtmGhy4tmSU5P11z9wL6XagBH4xS/ZJK9oPb0h3E4JGiF7g5cUULWd+OoBTOcig ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwdw9105d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 10:49:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B23DF10002A;
 Tue, 10 May 2022 10:49:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A79BA214D3C;
 Tue, 10 May 2022 10:49:54 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 10:49:54 +0200
Message-ID: <145d6a32-f2e6-69a1-9326-0069a36d3ac4@foss.st.com>
Date: Tue, 10 May 2022 10:49:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220427115401.155400-1-patrice.chotard@foss.st.com>
 <20220427115401.155400-13-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220427115401.155400-13-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dillon Min <dillon.minfei@gmail.com>, Vikas Manocha <vikas.manocha@st.com>,
 Kamil Lulko <kamil.lulko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 12/12] doc: Add documentation for STM32
	MCUs
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



On 4/27/22 13:54, Patrice Chotard wrote:
> Add documentation for STM32 MCUs (F4, F7 and H7 series).
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> ---
> 
> Changes in v2:
>    - fix documentation file stm32_MCU.rst
> 
>  board/st/stm32f429-discovery/MAINTAINERS  |   1 +
>  board/st/stm32f429-evaluation/MAINTAINERS |   1 +
>  board/st/stm32f469-discovery/MAINTAINERS  |   1 +
>  board/st/stm32f746-disco/MAINTAINERS      |   1 +
>  board/st/stm32h743-disco/MAINTAINERS      |   1 +
>  board/st/stm32h743-eval/MAINTAINERS       |   1 +
>  board/st/stm32h750-art-pi/MAINTAINERS     |   1 +
>  doc/board/st/index.rst                    |   1 +
>  doc/board/st/stm32_MCU.rst                | 186 ++++++++++++++++++++++
>  9 files changed, 194 insertions(+)
>  create mode 100644 doc/board/st/stm32_MCU.rst
> 
> diff --git a/board/st/stm32f429-discovery/MAINTAINERS b/board/st/stm32f429-discovery/MAINTAINERS
> index fdb62e98e8..7661a15fdd 100644
> --- a/board/st/stm32f429-discovery/MAINTAINERS
> +++ b/board/st/stm32f429-discovery/MAINTAINERS
> @@ -1,6 +1,7 @@
>  STM32F429-DISCOVERY BOARD
>  M:	Kamil Lulko <kamil.lulko@gmail.com>
>  S:	Maintained
> +F:	doc/board/st/
>  F:	board/st/stm32f429-discovery/
>  F:	include/configs/stm32f429-discovery.h
>  F:	configs/stm32f429-discovery_defconfig
> diff --git a/board/st/stm32f429-evaluation/MAINTAINERS b/board/st/stm32f429-evaluation/MAINTAINERS
> index 29d00ef27e..b272893ef7 100644
> --- a/board/st/stm32f429-evaluation/MAINTAINERS
> +++ b/board/st/stm32f429-evaluation/MAINTAINERS
> @@ -1,6 +1,7 @@
>  STM32F429-EVALUATION BOARD
>  M:	Patrice Chotard <patrice.chotard@foss.st.com>
>  S:	Maintained
> +F:	doc/board/st/
>  F:	board/st/stm32f429-evaluation/
>  F:	include/configs/stm32f429-evaluation.h
>  F:	configs/stm32f429-evaluation_defconfig
> diff --git a/board/st/stm32f469-discovery/MAINTAINERS b/board/st/stm32f469-discovery/MAINTAINERS
> index 5a6a78b39e..a95f93f6f6 100644
> --- a/board/st/stm32f469-discovery/MAINTAINERS
> +++ b/board/st/stm32f469-discovery/MAINTAINERS
> @@ -1,6 +1,7 @@
>  STM32F469-DISCOVERY BOARD
>  M:	Patrice Chotard <patrice.chotard@foss.st.com>
>  S:	Maintained
> +F:	doc/board/st/
>  F:	board/st/stm32f469-discovery/
>  F:	include/configs/stm32f469-discovery.h
>  F:	configs/stm32f469-discovery_defconfig
> diff --git a/board/st/stm32f746-disco/MAINTAINERS b/board/st/stm32f746-disco/MAINTAINERS
> index bc0952c563..18e4c99c4f 100644
> --- a/board/st/stm32f746-disco/MAINTAINERS
> +++ b/board/st/stm32f746-disco/MAINTAINERS
> @@ -1,6 +1,7 @@
>  STM32F746 DISCOVERY BOARD
>  M:	Vikas Manocha <vikas.manocha@st.com>
>  S:	Maintained
> +F:	doc/board/st/
>  F:	board/st/stm32f746-disco
>  F:	include/configs/stm32f746-disco.h
>  F:	configs/stm32f746-disco_defconfig
> diff --git a/board/st/stm32h743-disco/MAINTAINERS b/board/st/stm32h743-disco/MAINTAINERS
> index 60fbe344f8..f4ecef3aa5 100644
> --- a/board/st/stm32h743-disco/MAINTAINERS
> +++ b/board/st/stm32h743-disco/MAINTAINERS
> @@ -1,6 +1,7 @@
>  STM32H743 DISCOVERY BOARD
>  M:	Patrice Chotard <patrice.chotard@foss.st.com>
>  S:	Maintained
> +F:	doc/board/st/
>  F:	board/st/stm32h743-disco
>  F:	include/configs/stm32h743-disco.h
>  F:	configs/stm32h743-disco_defconfig
> diff --git a/board/st/stm32h743-eval/MAINTAINERS b/board/st/stm32h743-eval/MAINTAINERS
> index fda93db777..b69e0d4abb 100644
> --- a/board/st/stm32h743-eval/MAINTAINERS
> +++ b/board/st/stm32h743-eval/MAINTAINERS
> @@ -1,6 +1,7 @@
>  STM32H743 EVALUATION BOARD
>  M:	Patrice Chotard <patrice.chotard@foss.st.com>
>  S:	Maintained
> +F:	doc/board/st/
>  F:	board/st/stm32h743-eval
>  F:	include/configs/stm32h743-eval.h
>  F:	configs/stm32h743-eval_defconfig
> diff --git a/board/st/stm32h750-art-pi/MAINTAINERS b/board/st/stm32h750-art-pi/MAINTAINERS
> index 9578833068..2fd69e6d1c 100644
> --- a/board/st/stm32h750-art-pi/MAINTAINERS
> +++ b/board/st/stm32h750-art-pi/MAINTAINERS
> @@ -1,6 +1,7 @@
>  STM32H750 ART PI BOARD
>  M:	Dillon Min <dillon.minfei@gmail.com>
>  S:	Maintained
> +F:	doc/board/st/
>  F:	board/st/stm32h750-art-pi
>  F:	include/configs/stm32h750-art-pi.h
>  F:	configs/stm32h750-art-pi_defconfig
> diff --git a/doc/board/st/index.rst b/doc/board/st/index.rst
> index 9bba42f1da..2a8a4ef3b8 100644
> --- a/doc/board/st/index.rst
> +++ b/doc/board/st/index.rst
> @@ -8,3 +8,4 @@ STMicroelectronics
>  
>     st-dt
>     stm32mp1
> +   stm32_MCU
> diff --git a/doc/board/st/stm32_MCU.rst b/doc/board/st/stm32_MCU.rst
> new file mode 100644
> index 0000000000..7ff7c730fa
> --- /dev/null
> +++ b/doc/board/st/stm32_MCU.rst
> @@ -0,0 +1,186 @@
> +.. SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +.. sectionauthor:: Patrice Chotard <patrice.chotardy@foss.st.com>
> +
> +STM32 MCU boards
> +=================
> +
> +This is a quick instruction for setup STM32 MCU boards.
> +
> +Supported devices
> +-----------------
> +
> +U-Boot supports the following STMP32 MCU SoCs:
> +
> + - STM32F429
> + - STM32F469
> + - STM32F746
> + - STM32F769
> + - STM32H743
> + - STM32H750
> +
> +SoCs information:
> +-----------------
> +STM32F4 series are Cortex-M4 MCU.
> +STM32F7 and STM32H7 series are Cortex-M7 MCU.
> +
> + + STM32F4 series: https://www.st.com/en/microcontrollers-microprocessors/stm32f4-series.html
> + + STM32F7 series: https://www.st.com/en/microcontrollers-microprocessors/stm32f7-series.html
> + + STM32H7 series: https://www.st.com/en/microcontrollers-microprocessors/stm32h7-series.html
> +
> +Currently the following boards are supported:
> +
> + + stm32f429-discovery
> + + stm32f469-discovery
> + + stm32746g-evaluation
> + + stm32f746-discovery
> + + stm32f769-discovery
> + + stm32h743i-discovery
> + + stm32h743i-evaluation
> + + stm32h750i-art-pi
> +
> +Boot Sequences
> +--------------
> +
> +For STM32F7 series, 2 boot configurations are supported with and without SPL
> +
> ++------------------------+-------------------------+--------------+
> +| **FSBL**               | **SSBL**                | **OS**       |
> ++------------------------+-------------------------+--------------+
> +| First Stage Bootloader | Second Stage Bootloader | Linux Kernel |
> ++------------------------+-------------------------+--------------+
> +| embedded Flash         | DDR                                    |
> ++------------------------+-------------------------+--------------+
> +
> +The boot chain with SPL
> +```````````````````````
> +
> +defconfig_file :
> +   + **stm32746g-eval_spl_defconfig**
> +   + **stm32f746-disco_spl_defconfig**
> +   + **stm32f769-disco_spl_defconfig**
> +
> ++------------+------------+-------+
> +| FSBL       | SSBL       | OS    |
> ++------------+------------+-------+
> +|U-Boot SPL  | U-Boot     | Linux |
> ++------------+------------+-------+
> +
> +The boot chain without SPL
> +``````````````````````````
> +
> +defconfig_file :
> +   + **stm32f429-discovery_defconfig**
> +   + **stm32f429-evaluation_defconfig**
> +   + **stm32f469-discovery_defconfig**
> +   + **stm32746g-eval_defconfig**
> +   + **stm32f746-disco_defconfig**
> +   + **stm32f769-disco_defconfig**
> +   + **stm32h743-disco_defconfig**
> +   + **stm32h743-eval_defconfig**
> +   + **stm32h750-art-pi_defconfig**
> +
> ++-----------+-------+
> +| FSBL      | OS    |
> ++-----------+-------+
> +|U-Boot     | Linux |
> ++-----------+-------+
> +
> +Build Procedure
> +---------------
> +
> +1. Install the required tools for U-Boot
> +
> +   * install package needed in U-Boot makefile
> +     (libssl-dev, swig, libpython-dev...)
> +
> +   * install ARMv7 toolchain for 32bit Cortex-A (from Linaro,
> +     from SDK for STM32MP15x, or any crosstoolchains from your distribution)
> +     (you can use any gcc cross compiler compatible with U-Boot)
> +
> +2. Set the cross compiler::
> +
> +   # export CROSS_COMPILE=/path/to/toolchain/arm-linux-gnueabi-
> +
> +3. Select the output directory (optional)::
> +
> +   # export KBUILD_OUTPUT=/path/to/output
> +
> +   for example: use one output directory for each configuration::
> +
> +   # export KBUILD_OUTPUT=stm32f4
> +   # export KBUILD_OUTPUT=stm32f7
> +   # export KBUILD_OUTPUT=stm32h7
> +
> +   you can build outside of code directory::
> +
> +   # export KBUILD_OUTPUT=../build/stm32f4
> +
> +4. Configure U-Boot::
> +
> +   # make <defconfig_file>
> +
> +   For example with <defconfig_file>:
> +
> +   - For **stm32f429 discovery** board : **stm32f429-discovery_defconfig**
> +   - For **stm32f769 discovery** board with SPL: **stm32f769-disco_spl_defconfig**
> +   - For **stm32f769 discovery** board without SPL: **stm32f769-disco_defconfig**
> +
> +5. Configure the device-tree and build the U-Boot image::
> +
> +   # make DEVICE_TREE=<name> all
> +
> +   Examples:
> +
> +  a) boot with SPL on stm32f746 discovery board::
> +
> +     # export KBUILD_OUTPUT=stm32f746-disco
> +     # make stm32f746-disco_spl_defconfig
> +     # make all
> +
> +  b) boot without SPL on stm32f746 discovery board::
> +
> +     # export KBUILD_OUTPUT=stm32f746-disco
> +     # make stm32f746-disco_defconfig
> +     # make all
> +
> +  c) boot on stm32h743 discovery board::
> +
> +     # export KBUILD_OUTPUT=stm32h743-disco
> +     # make stm32h743-disco_defconfig
> +     # make all
> +
> +  d) boot on stm32h743 evaluation board::
> +
> +     # export KBUILD_OUTPUT=stm32h743-disco
> +     # make stm32h743-eval_defconfig
> +     # make all
> +
> +6. U-Boot Output files
> +
> +   So in the output directory (selected by KBUILD_OUTPUT),
> +   you can found the needed U-Boot files, for example::
> +
> +     - stm32f746-disco_defconfig = **u-boot-dtb.bin** and **u-boot.dtb**
> +
> +       - FSBL = u-boot-dtb.bin
> +
> +     - stm32f746-disco_spl_defconfig = **u-boot-dtb.bin**, **u-boot.dtb** and **u-boot-with-spl.bin**
> +
> +       - FSBL + SSBL = u-boot-with-spl.bin
> +       - SSBL = u-boot-dtb.bin
> +
> +7. Flash U-Boot files
> +
> +Plug STM32 MCUs board using the USB ST-Link connector, hence it will expose
> +the flash area as a mass-storage. In this mass-storage you will find the
> +following files:
> +
> +- DETAILS.TXT: give the bootrom version and build
> +- MBED.HTM: shortcul to the hardware board description web page from st.com.
> +
> +Copy/paste the u-boot.bin or u-boot-with-spl.bin (in case of bootchain with SPL)
> +to this mass-storage. The "COM" LED will blink alternatively red and green during
> +the flash process. When done the board will reboot automatically.
> +
> +In case of boot with SPL, by default SPL will try to load either a Linux
> +kernel (falcon mode) or, if the key "c" is maintained pressed, the main U-Boot.
Applied to u-boot-stm32

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
