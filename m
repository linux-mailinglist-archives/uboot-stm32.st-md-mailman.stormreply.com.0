Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6471CDBB6
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 15:48:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0BAAC36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2020 13:48:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54E8AC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 13:48:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BDQbdB032453; Mon, 11 May 2020 15:48:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=/lJtzieYhzSe9cv8OdwNrt3eKlvdNXkHkmN1H1RVFCs=;
 b=XNFfmfzx7E9RBsWZdIvP7r/b1wCzsTqCt4jrlOPNKaiVBrZ6rYpht4RcocvoE/OiYYtq
 XvdOaw/fHG0qEK7lrfd2UtzDfS8daqfviznCTTZNMutw+Rna47rYcVD5jwIjEkMh124h
 RqIabMKVN2SRE4oyQKhr6R297vQ3/7rpExL+C9YzpbhK8K4QOCJO7wYd937M9AkkviYj
 aB17HXHbclMcyqS1xOHVQJPGtf3K/07eJzZWemqE+GBQBulw6GrAROCwttCdicv7oFiy
 zRUgnBSMSTqIhZAB+ArkvDetOgZonVdb8ivEXnN+ioybh9bOD+lYnCf6kg9rz4LTdjsm Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wkdgtd3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 15:48:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F57D10002A;
 Mon, 11 May 2020 15:48:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8949B2A657A;
 Mon, 11 May 2020 15:48:38 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 11 May
 2020 15:48:38 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 11 May 2020 15:48:38 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/9] arm: stm32mp: spl: add bsec driver in SPL
Thread-Index: AQHWF+8sdE1SHoLxu0mGjKzArIHzaaii5FiA
Date: Mon, 11 May 2020 13:48:38 +0000
Message-ID: <2fb04e16-ff9d-a793-9db0-5945c8f11a0f@st.com>
References: <20200421151128.18072-1-patrick.delaunay@st.com>
 <20200421171123.1.I7a042a9ffbb5c2668034eddf5ace91271bb53c5f@changeid>
In-Reply-To: <20200421171123.1.I7a042a9ffbb5c2668034eddf5ace91271bb53c5f@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <F987BAF06EEBC347AB806D68779A51A9@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_06:2020-05-11,
 2020-05-11 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/9] arm: stm32mp: spl: add bsec driver in
	SPL
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

On 4/21/20 5:11 PM, Patrick Delaunay wrote:
> Add the bsec driver in SPL, as it is needed by SOC part number detection
> to found the supported OPP.
>
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> I already sent in unrelated serie
>
> http://patchwork.ozlabs.org/patch/1264829/
>
> Patrick
>
>
>  arch/arm/dts/stm32mp15-u-boot.dtsi |  2 +-
>  arch/arm/mach-stm32mp/Makefile     |  2 +-
>  arch/arm/mach-stm32mp/bsec.c       | 11 ++++++-----
>  3 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
> index 8f9535a4db..e0b1223de8 100644
> --- a/arch/arm/dts/stm32mp15-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
> @@ -40,7 +40,7 @@
>  };
>  
>  &bsec {
> -	u-boot,dm-pre-proper;
> +	u-boot,dm-pre-reloc;
>  };
>  
>  &clk_csi {
> diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
> index eee39c27c3..f29d6f795f 100644
> --- a/arch/arm/mach-stm32mp/Makefile
> +++ b/arch/arm/mach-stm32mp/Makefile
> @@ -6,11 +6,11 @@
>  obj-y += cpu.o
>  obj-y += dram_init.o
>  obj-y += syscon.o
> +obj-y += bsec.o
>  
>  ifdef CONFIG_SPL_BUILD
>  obj-y += spl.o
>  else
> -obj-y += bsec.o
>  obj-$(CONFIG_CMD_STM32KEY) += cmd_stm32key.o
>  obj-$(CONFIG_ARMV7_PSCI) += psci.o
>  endif
> diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
> index 0d5850b4a9..98a950c640 100644
> --- a/arch/arm/mach-stm32mp/bsec.c
> +++ b/arch/arm/mach-stm32mp/bsec.c
> @@ -473,20 +473,23 @@ static int stm32mp_bsec_ofdata_to_platdata(struct udevice *dev)
>  	return 0;
>  }
>  
> -#ifndef CONFIG_TFABOOT
>  static int stm32mp_bsec_probe(struct udevice *dev)
>  {
> +#if !defined(CONFIG_TFABOOT) && !defined(CONFIG_SPL_BUILD)
>  	int otp;
>  	struct stm32mp_bsec_platdata *plat = dev_get_platdata(dev);
>  
> -	/* update unlocked shadow for OTP cleared by the rom code */
> +	/*
> +	 * update unlocked shadow for OTP cleared by the rom code
> +	 * only executed in U-Boot proper when TF-A is not used
> +	 */
>  	for (otp = 57; otp <= BSEC_OTP_MAX_VALUE; otp++)
>  		if (!bsec_read_SR_lock(plat->base, otp))
>  			bsec_shadow_register(plat->base, otp);
> +#endif
>  
>  	return 0;
>  }
> -#endif
>  
>  static const struct udevice_id stm32mp_bsec_ids[] = {
>  	{ .compatible = "st,stm32mp15-bsec" },
> @@ -500,7 +503,5 @@ U_BOOT_DRIVER(stm32mp_bsec) = {
>  	.ofdata_to_platdata = stm32mp_bsec_ofdata_to_platdata,
>  	.platdata_auto_alloc_size = sizeof(struct stm32mp_bsec_platdata),
>  	.ops = &stm32mp_bsec_ops,
> -#ifndef CONFIG_TFABOOT
>  	.probe = stm32mp_bsec_probe,
> -#endif
>  };

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
