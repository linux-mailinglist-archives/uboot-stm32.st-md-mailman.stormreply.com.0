Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB2D732FF7
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jun 2023 13:36:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85680C65E58;
	Fri, 16 Jun 2023 11:36:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0272AC64110
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 11:36:20 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35G85o20021488; Fri, 16 Jun 2023 13:36:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=KffJ0Z6Av7uHbE7VpMGy4bl9OHbvInVHIcwPHbsbCm4=;
 b=mogD8arvPDNVVCDgkBAXxk0i/bwDpz3Svb/MY5zb0DTYLGFofM0vicn4YS6C4aMxs4s0
 T32NmTY4KbQAqJxCpamlNxUKS6n5wQitT4GcGBwc/95Te0/cO8F3JBejZXw23bYALLIN
 nhqWTZIanpWQlIAbjEP+gcJe0qnKKlvoiuPARRwESRW92Hd1qg/zXaSzLMxGzgQ/wZ/l
 yQfFpVrVLQju8OYWTq8tLIRevJ+zRDSyp2qtyqTxAT+VTYUtNvFGrJDii+3Ts+2k5xW4
 uUA1kc1r3tSRJDqAcHoq0CvEUbW3ehD/hkubl6gMWHCw5luD9LA0pKXDeBXX49TQK47y ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r8kx2hdf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 13:36:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DDAE10002A;
 Fri, 16 Jun 2023 13:36:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7557023151B;
 Fri, 16 Jun 2023 13:36:09 +0200 (CEST)
Received: from [10.252.4.57] (10.252.4.57) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 16 Jun
 2023 13:36:08 +0200
Message-ID: <ae9797f2-efa0-8069-5f43-6c6df172774c@foss.st.com>
Date: Fri, 16 Jun 2023 13:36:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
X-Originating-IP: [10.252.4.57]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_08,2023-06-16_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Sean Anderson <sean.anderson@seco.com>,
 Simon Glass <sjg@chromium.org>, Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 00/12] stm32mp1: use U-Boot device tree to
 configure MTD partitions
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



On 6/8/23 17:16, Patrick Delaunay wrote:
> 
> Add the MTD partitions subnode in U-Boot device tree for all stm32mp13
> and stm32mp15 boards and no more rely on mtdids and mtdparts variables
> or CONFIG_SYS_MTDPARTS_RUNTIME.
> 
> When these variables are absent, the required OF fallback is performed in
> mtd_probe_devices() with commit dc339bf784f0 ("mtd: add support for parsing
> partitions defined in OF").
> 
> To allow dynamically configuration of MTD partitioning for Linux kernel,
> the MTD partitioning is only defined in U-Boot device tree and copied
> in Linux kernel device tree.
> 
> This serie also disable CMD_MTDPARTS as it is strongly encouraged to
> no more use this command.
> 
> Marek, I modify the dhcom/dhcor boardd in the last patch of the serie
> but if you prefer I can drop this patch.
> 
> For "stm32mp157c-ev1.dts" used by stm32mp15_trusted_defconfig
> 
> * nand0
>   - type: NAND flash
>   - block size: 0x40000 bytes
>   - min I/O: 0x1000 bytes
>   - OOB size: 224 bytes
>   - OOB available: 118 bytes
>   - ECC strength: 8 bits
>   - ECC step size: 512 bytes
>   - bitflip threshold: 6 bits
>   - 0x000000000000-0x000040000000 : "nand0"
> 	  - 0x000000000000-0x000000200000 : "fsbl"
> 	  - 0x000000200000-0x000000600000 : "fip1"
> 	  - 0x000000600000-0x000000a00000 : "fip2"
> 	  - 0x000000a00000-0x000040000000 : "UBI"
> * nor0
>   - device: flash@0
>   - parent: spi@58003000
>   - driver: jedec_spi_nor
>   - path: /soc/spi@58003000/flash@0
>   - type: NOR flash
>   - block size: 0x10000 bytes
>   - min I/O: 0x1 bytes
>   - 0x000000000000-0x000004000000 : "nor0"
> 	  - 0x000000000000-0x000000040000 : "fsbl1"
> 	  - 0x000000040000-0x000000080000 : "fsbl2"
> 	  - 0x000000080000-0x000000480000 : "fip"
> 	  - 0x000000480000-0x000000500000 : "u-boot-env"
> 	  - 0x000000500000-0x000004000000 : "nor-user"
> 
> 
> For "stm32mp157c-ev1-scmi.dts" the device tree file used by
> stm32mp15_defconfig, with TF-A BL2 and OP-TEE including a SCMI server
> for secure resources (when TZEN=1), the default STMicroelectronics
> configuration.
> 
> I align the NOR and NAND layout on EV1 boards with the STMicroelectronics
> recommendations used in OpenSTLinux V4.0:
> with support of TF-A BL2 firmware update, required 2 "metadata" partition
> for redundancy and 2 FIPs for A/B update.
> 
> * nand0
>   - type: NAND flash
>   - block size: 0x40000 bytes
>   - min I/O: 0x1000 bytes
>   - OOB size: 224 bytes
>   - OOB available: 118 bytes
>   - ECC strength: 8 bits
>   - ECC step size: 512 bytes
>   - bitflip threshold: 6 bits
>   - 0x000000000000-0x000040000000 : "nand0"
> 	  - 0x000000000000-0x000000080000 : "fsbl1"
> 	  - 0x000000080000-0x000000100000 : "fsbl2"
> 	  - 0x000000100000-0x000000180000 : "metadata1"
> 	  - 0x000000180000-0x000000200000 : "metadata2"
> 	  - 0x000000200000-0x000000600000 : "fip-a1"
> 	  - 0x000000600000-0x000000a00000 : "fip-a2"
> 	  - 0x000000a00000-0x000000e00000 : "fip-b1"
> 	  - 0x000000e00000-0x000001200000 : "fip-b2"
> 	  - 0x000001200000-0x000040000000 : "UBI"
> * nor0
>   - device: flash@0
>   - parent: spi@58003000
>   - driver: jedec_spi_nor
>   - path: /soc/spi@58003000/flash@0
>   - type: NOR flash
>   - block size: 0x10000 bytes
>   - min I/O: 0x1 bytes
>   - 0x000000000000-0x000004000000 : "nor0"
> 	  - 0x000000000000-0x000000040000 : "fsbl1"
> 	  - 0x000000040000-0x000000080000 : "fsbl2"
> 	  - 0x000000080000-0x0000000c0000 : "metadata1"
> 	  - 0x0000000c0000-0x000000100000 : "metadata2"
> 	  - 0x000000100000-0x000000500000 : "fip-a"
> 	  - 0x000000500000-0x000000900000 : "fip-b"
> 	  - 0x000000900000-0x000000980000 : "u-boot-env"
> 	  - 0x000000980000-0x000004000000 : "nor-user"
> 
> 
> 
> Patrice Chotard (5):
>   stm32mp: stm32prog: Remove usage of "mtdparts" function
>   arm: dts: stm32: Add partitions in flash0 and nand node for
>     stm32mp15xx-ev1
>   configs: stm32mp: Disable SYS_MTDPARTS_RUNTIME for stm32mp15 and
>     stm32mp13
>   stm32mp: stm32prog: Remove tee_detected from stm32prog_data struct
>   configs: stm32mp1: disable CMD_MTDPARTS
> 
> Patrick Delaunay (7):
>   fdt_support: include dm/ofnode.h
>   fdt_support: add fdt_copy_fixed_partitions function
>   dfu: mtd: remove direct call of mtdparts_init function
>   arm: dts: stm32: Align stm32mp15xx-*-scmi-u-boot.dtsi file
>   board: stm32mp1: use fdt_copy_fixed_partitions
>   board: st: remove board_mtdparts_default
>   arm: dts: stm32: Add partitions in flash0 and nand node for
>     stm32mp15xx-dhcom/dhcor
> 
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      |   1 +
>  arch/arm/dts/stm32mp157c-dk2-scmi-u-boot.dtsi |   7 +
>  arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi | 125 +++++++++++++
>  arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi      |  98 +++++++++-
>  arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi    |  27 +++
>  arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi    |  27 +++
>  .../cmd_stm32prog/cmd_stm32prog.c             |   9 -
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    |  53 ++----
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |   3 -
>  .../arm/mach-stm32mp/include/mach/stm32prog.h |   4 -
>  board/st/common/Kconfig                       |  66 -------
>  board/st/common/Makefile                      |   1 -
>  board/st/common/stm32mp_mtdparts.c            | 177 ------------------
>  board/st/stm32mp1/stm32mp1.c                  |  16 +-
>  common/fdt_support.c                          |  75 +++++++-
>  configs/stm32mp13_defconfig                   |   3 -
>  configs/stm32mp15_basic_defconfig             |   3 -
>  configs/stm32mp15_defconfig                   |   7 +-
>  configs/stm32mp15_dhcom_basic_defconfig       |   3 -
>  configs/stm32mp15_dhcor_basic_defconfig       |   3 -
>  configs/stm32mp15_trusted_defconfig           |   3 -
>  drivers/dfu/Kconfig                           |   1 -
>  drivers/dfu/dfu_mtd.c                         |  34 ++--
>  include/fdt_support.h                         |   8 +
>  24 files changed, 407 insertions(+), 347 deletions(-)
>  delete mode 100644 board/st/common/stm32mp_mtdparts.c
> 
For the whole series:

Applied to u-boot-stm/next

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
