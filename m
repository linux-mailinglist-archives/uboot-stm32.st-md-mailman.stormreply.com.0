Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 227EE294CCE
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 14:37:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBB98C3FAE0;
	Wed, 21 Oct 2020 12:37:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42588C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 12:37:13 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LCS5aT019779; Wed, 21 Oct 2020 14:37:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=0VBldf2vR3042OJEPCTv0sPsgBHFjBxfMyy25ASnNks=;
 b=goZHLr6CRSEOLDHhWk3X/xiX1rs9cDko0KDmHtcgix/TCXyS4ukuq3DUUHvT9Fl9H9sB
 xOFhS5lrjqVaLRX0VUGNY8lH4mc5d6DggzPASq9O4lc7iFs4aBDzSu1SM41s5PceFiDL
 lv4QuMPpxJt5M0xzjNp/6WSp53ThaWcqI6unR1+2PLr+BFQ6/RyZwlglPrdt387xyRbZ
 k006l/DJbWaY9KciVwrRBQOMWfpjiF+ZGZg3Jt2mDe3nYhk+GKPI7a0G7C03qNr1Leq3
 Ye8z30oxclMrPVU4zzQ7Bsiii50LpI/FsRJwZ29BdykafP3B8yhuPiGh6GJL/TA8u0EQ LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347pcx21gm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 14:37:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 42A8410002A;
 Wed, 21 Oct 2020 14:37:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 387CF2E9C99;
 Wed, 21 Oct 2020 14:37:12 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 14:37:11 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 14:37:11 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 33/33] configs: stm32mp15: enable LOG
 features
Thread-Index: AQHWogrZT/vQLaFPIkys6AOKHeDTdKmh6CuA
Date: Wed, 21 Oct 2020 12:37:11 +0000
Message-ID: <c898314e-f251-04c7-99b2-e3829f43304a@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <20201014091646.4233-34-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-34-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <432C3B67A4887B4AA6D7E54983156A00@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 33/33] configs: stm32mp15: enable LOG
 features
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

Hi Patrick

On 10/14/20 11:16 AM, Patrick Delaunay wrote:
> Activate the logging features in SPL and U-Boot
> (CONFIG_LOG and CONFIG_SPL_LOG) and the command 'log' with
> CONFIG_CMD_LOG.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/stm32mp15_basic_defconfig   | 2 ++
>  configs/stm32mp15_trusted_defconfig | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index a8c4112dbe..6f9ad7c95e 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -19,6 +19,7 @@ CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
>  CONFIG_DISTRO_DEFAULTS=y
>  CONFIG_FIT=y
>  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
> +CONFIG_SPL_LOG=y
>  CONFIG_BOARD_EARLY_INIT_F=y
>  CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
>  CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3
> @@ -57,6 +58,7 @@ CONFIG_CMD_PMIC=y
>  CONFIG_CMD_REGULATOR=y
>  CONFIG_CMD_EXT4_WRITE=y
>  CONFIG_CMD_MTDPARTS=y
> +CONFIG_CMD_LOG=y
>  CONFIG_CMD_UBI=y
>  # CONFIG_SPL_DOS_PARTITION is not set
>  CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 0792884a9d..2435ed1bff 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -41,6 +41,7 @@ CONFIG_CMD_PMIC=y
>  CONFIG_CMD_REGULATOR=y
>  CONFIG_CMD_EXT4_WRITE=y
>  CONFIG_CMD_MTDPARTS=y
> +CONFIG_CMD_LOG=y
>  CONFIG_CMD_UBI=y
>  CONFIG_ENV_IS_NOWHERE=y
>  CONFIG_ENV_IS_IN_MMC=y

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
