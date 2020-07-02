Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A859211DBF
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 10:06:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63AB1C36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 08:06:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2C0DC36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 08:06:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06284xMg023698; Thu, 2 Jul 2020 10:06:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=hSSI6VfhMN/trOq9yqSqKnE+cgPMRo5A2HzhFBkCKjo=;
 b=DJOwvdGUeikQ+evVY0hxdAeDgdrMVeZIXLnyHqjea5oaCeS+fZCWLNRkGfKSAWLFn2e6
 qw6e5/i54Y4RFJirTD8O7836PgIrgDRmwNRwLB1Iif30guNCMDnjPIaXrI8FdN08Dzck
 ASAKR6lQz9f6cozE6IPe0nDTrT1iE2UK2KSZPNaIpc1yUH2up/nmXoeocOfuZQPcLzR2
 WYTkA8GqIyUyiUVqpTg5UL4cSCX8uxRmAH4HbH/NA5IukGw4AXCaKnJppMu6KBmMBeXG
 64psfka6jSrVqelaQO+jqpAgiqFeSgIpjIcZ1jzTi+xmskXnUZfUff9gniFz+AAOMin1 Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0geqnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 10:06:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 81BBD10003E;
 Thu,  2 Jul 2020 10:06:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 76BEC21FE84;
 Thu,  2 Jul 2020 10:06:29 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 Jul
 2020 10:06:29 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 10:06:28 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 1/9] arm: stm32mp: spl: add bsec driver in SPL
Thread-Index: AQHWMn4IJnwlcpR0XkCiBMT9eQCAz6j0CNwA
Date: Thu, 2 Jul 2020 08:06:28 +0000
Message-ID: <c6f22f1b-2ec8-f31a-c295-7da940cd6bc0@st.com>
References: <20200525101949.15944-1-patrick.delaunay@st.com>
 <20200525101949.15944-2-patrick.delaunay@st.com>
In-Reply-To: <20200525101949.15944-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <3070B17541E7FB40AAEFC65AB428ABA4@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/9] arm: stm32mp: spl: add bsec driver
	in SPL
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

HI Patrick

On 5/25/20 12:19 PM, Patrick Delaunay wrote:
> Add the bsec driver in SPL, as it is needed by SOC part number detection
> to found the supported OPP.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
> Changes in v2: None
>
>  arch/arm/dts/stm32mp15-u-boot.dtsi |  2 +-
>  arch/arm/mach-stm32mp/Makefile     |  2 +-
>  arch/arm/mach-stm32mp/bsec.c       | 11 ++++++-----
>  3 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
> index 1279589a56..a0d971ad88 100644
> --- a/arch/arm/dts/stm32mp15-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
> @@ -65,7 +65,7 @@
>  };
>  
>  &bsec {
> -	u-boot,dm-pre-proper;
> +	u-boot,dm-pre-reloc;
>  };
>  
>  &clk_csi {
> diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
> index 66bb8cf92f..c8aa24d489 100644
> --- a/arch/arm/mach-stm32mp/Makefile
> +++ b/arch/arm/mach-stm32mp/Makefile
> @@ -6,12 +6,12 @@
>  obj-y += cpu.o
>  obj-y += dram_init.o
>  obj-y += syscon.o
> +obj-y += bsec.o
>  
>  ifdef CONFIG_SPL_BUILD
>  obj-y += spl.o
>  else
>  obj-$(CONFIG_CMD_STM32PROG) += cmd_stm32prog/
> -obj-y += bsec.o
>  obj-$(CONFIG_CMD_STM32KEY) += cmd_stm32key.o
>  obj-$(CONFIG_ARMV7_PSCI) += psci.o
>  obj-$(CONFIG_TFABOOT) += boot_params.o
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
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
