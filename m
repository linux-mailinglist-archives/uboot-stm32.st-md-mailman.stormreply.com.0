Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CC8527C4
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 11:18:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65856C5EC7F
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 09:18:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9315C5E2AC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2019 09:18:40 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P9Fo0i030909; Tue, 25 Jun 2019 11:18:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=diFTaHwsgL5+HwmBh8OASmC33h68yhPVGzEPeq30GZY=;
 b=UGjsM4PveeuzF7YxuoYhiTD3ZEU4VaUx+MejgVPkNhlbd5mnmGzepTpS54jkvp+liT/X
 VuHo/0hjyCaRbMeH7DlnXFPtoAKPDuR+v7piTYBzIOTZowNWDmLRCjGBn3scEHdaqfS7
 fnvKEPM8w2ilSfgDUlAc4MKdq3nu7Bw0QsTrGB3s/RpLY3jkoz90IozVNt2qH51qdGqP
 ZnH4SS6cWTa3klTMxC2BaooG2INvTk+jMH5b4DW4qyiBYBt6N/5b2Yh+xdZLCrWA+zC7
 eWg6k3nMaYDauqNuHgH3eIMUlW3y5GvRDbummTZ+vd0e2xwa0LGMikf1czXtyvVIALnX Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t9d2g881s-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 25 Jun 2019 11:18:35 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1182731;
 Tue, 25 Jun 2019 09:18:34 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EAA4224DD;
 Tue, 25 Jun 2019 09:18:33 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 25 Jun
 2019 11:18:33 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 25 Jun 2019 11:18:33 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] mach-stm32: Fix MPU region size dedicated to SDRAM for
 STM32F4
Thread-Index: AQHVKy0UbrFypR5q6k+/vx9qFBvmDaasFb7w
Date: Tue, 25 Jun 2019 09:18:33 +0000
Message-ID: <3c271bb781a348ea9ebc40c465671561@SFHDAG6NODE3.st.com>
References: <20190625080745.21813-1-patrice.chotard@st.com>
In-Reply-To: <20190625080745.21813-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH] mach-stm32: Fix MPU region size dedicated
 to SDRAM for STM32F4
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

Hi Patrice,

> -----Original Message-----
> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: mardi 25 juin 2019 10:08
> To: u-boot@lists.denx.de
> Cc: Patrice CHOTARD <patrice.chotard@st.com>; Patrick DELAUNAY
> <patrick.delaunay@st.com>; U-Boot STM32 <uboot-stm32@st-md-
> mailman.stormreply.com>; Albert Aribaud <albert.u.boot@aribaud.net>; Vikas
> MANOCHA <vikas.manocha@st.com>
> Subject: [PATCH] mach-stm32: Fix MPU region size dedicated to SDRAM for
> STM32F4
> Importance: High
> 
> The MPU region dedicated for SDRAM for STM32F4 SoCs family was set to
> 16MB, but STM32F429 Evaluation board have 32MB of SDRAM.
> 
> When kernel starts, only first 16MB of SDRAM are configured with XN (eXecute
> Never) bit disabled, whereas kernel is using 32MB.
> 
> It fixes the following user land exception on STM32F429 Evaluation board :
> 
> [    1.713002] VFS: Mounted root (ext4 filesystem) readonly on device 179:2.
> [    1.722605] devtmpfs: mounted
> [    1.733057] Freeing unused kernel memory: 72K
> [    1.737622] This architecture does not have kernel memory protection.
> [    1.744070] Run /sbin/init as init process
> [    1.906850]
> [    1.906850] Unhandled exception: IPSR = 00000004 LR = fffffffd
> [    1.914282] CPU: 0 PID: 1 Comm: init Not tainted 5.1.0-00002-gcf9ca5719954 #6
> [    1.921433] Hardware name: STM32 (Device Tree Support)
> [    1.926601] PC is at 0x1a00b64
> [    1.929642] LR is at   (null)
> [    1.932669] pc : [<01a00b64>]    lr : [<00000000>]    psr: 01000000
> [    1.938993] sp : 01a5cfb0  ip : 00000000  fp : 00000000
> [    1.944269] r10: 01a43b00  r9 : 00000000  r8 : 00000000
> [    1.949564] r7 : 00000000  r6 : 00000000  r5 : 00000000  r4 : 00000000
> [    1.956168] r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000000
> [    1.962701] xPSR: 01000000
> [    1.965506] CPU: 0 PID: 1 Comm: init Not tainted 5.1.0-00002-gcf9ca5719954 #6
> [    1.972658] Hardware name: STM32 (Device Tree Support)
> [    1.978132] [<0000c009>] (unwind_backtrace) from [<0000b24f>]
> (show_stack+0xb/0xc)
> [    1.986024] [<0000b24f>] (show_stack) from [<0000b947>]
> (__invalid_entry+0x4b/0x4c)
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
> 
>  arch/arm/mach-stm32/soc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32/soc.c b/arch/arm/mach-stm32/soc.c index
> 6ae31d3a1f..77bb18638f 100644
> --- a/arch/arm/mach-stm32/soc.c
> +++ b/arch/arm/mach-stm32/soc.c
> @@ -18,7 +18,7 @@ int arch_cpu_init(void)
>  		 */
>  #if defined(CONFIG_STM32F4)
>  		{ 0x00000000, REGION_0, XN_DIS, PRIV_RW_USR_RW,
> -		O_I_WB_RD_WR_ALLOC, REGION_16MB },
> +		O_I_WB_RD_WR_ALLOC, REGION_32MB },

For these boards, SYSCFG_MEMRMP.MEM_MODE = 0x4

./arch/arm/dts/stm32429i-eval-u-boot.dtsi:41:			st,mem_remap = <4>;
./arch/arm/dts/stm32f469-disco-u-boot.dtsi:41:			st,mem_remap = <4>;

=> 100: FMC/SDRAM Bank 1 mapped at 0x0000 0000

So size when remap shoul be 512MB here to be ready with greter SDRAM size ?
And only if remap is requested ?

Else internal FLASH is used (000: Main Flash memory mapped at 0x0000 0000)
=> max Size is 2MB  ?

>  #endif
> 
>  		{ 0x90000000, REGION_1, XN_DIS, PRIV_RW_USR_RW,
> --
> 2.17.1

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
