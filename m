Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A00419A64C
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 09:34:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA3FAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 07:34:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7335C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 07:34:34 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0317Rx0j026130; Wed, 1 Apr 2020 09:34:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=16fSZMCO6G1PpDAsBBCSvZiR38uiY04wGm9WCBQS/z4=;
 b=Qf51QFOWtsCIyfwvczARjbnyDl4+SuAY9GJFv4Zb6uqve3SlYkekbAhYFGLL0VeQ8bFg
 j5nBouYd0sNvg/YLbVFPQJEkIcPQ2WKhTnqq2sYL/q/gffdaE5W4TVxxJPqbpYFyPbD5
 yhzX+Cd5b2hRwLjESjuRtM3KTeowbj1WcfCsBV4UfR2kdyDDFEN2ZdsQKB5VLLYpFcNr
 6M45nTTKn98LobwfBIhPkpP1mCcfF5G+56ghwm6kWY+Z3ExL/7ajs3CWV+zFO+YeZZFY
 B21YQ2OyCb+u8EXIgqFQjuu+kFqRAhcEFEtm4eVMdWIamZS2GPq7eDEmxqAO1+XdGaFE 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301w813fmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 09:34:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BC690100034;
 Wed,  1 Apr 2020 09:34:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A5E3D2126CE;
 Wed,  1 Apr 2020 09:34:31 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Apr
 2020 09:34:31 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 1 Apr 2020 09:34:31 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 05/16] arm: stm32mp: spl: add bsec driver in SPL
Thread-Index: AQHWB3YgX+yesTIry0uPAprQZtO9I6hjv4IA
Date: Wed, 1 Apr 2020 07:34:31 +0000
Message-ID: <5d27247c-c965-93ae-0129-e6a98ea5d275@st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.5.I7a042a9ffbb5c2668034eddf5ace91271bb53c5f@changeid>
In-Reply-To: <20200331180330.5.I7a042a9ffbb5c2668034eddf5ace91271bb53c5f@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <82FA26497C5AD7498B36888785FCA019@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 05/16] arm: stm32mp: spl: add bsec driver
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

Hi Patrick

On 3/31/20 6:04 PM, Patrick Delaunay wrote:
> Add the bsec driver in SPL, as it is needed by SOC part number detection.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/dts/stm32mp15-u-boot.dtsi | 2 +-
>  arch/arm/mach-stm32mp/Makefile     | 2 +-
>  arch/arm/mach-stm32mp/bsec.c       | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
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
> index 3b923f088e..1bd287e8bf 100644
> --- a/arch/arm/mach-stm32mp/bsec.c
> +++ b/arch/arm/mach-stm32mp/bsec.c
> @@ -473,7 +473,7 @@ static int stm32mp_bsec_ofdata_to_platdata(struct udevice *dev)
>  	return 0;
>  }
>  
> -#ifndef CONFIG_STM32MP1_TRUSTED
> +#if !defined(CONFIG_STM32MP1_TRUSTED) && !defined(CONFIG_SPL_BUILD)
>  static int stm32mp_bsec_probe(struct udevice *dev)
>  {
>  	int otp;
> @@ -500,7 +500,7 @@ U_BOOT_DRIVER(stm32mp_bsec) = {
>  	.ofdata_to_platdata = stm32mp_bsec_ofdata_to_platdata,
>  	.platdata_auto_alloc_size = sizeof(struct stm32mp_bsec_platdata),
>  	.ops = &stm32mp_bsec_ops,
> -#ifndef CONFIG_STM32MP1_TRUSTED
> +#if !defined(CONFIG_STM32MP1_TRUSTED) && !defined(CONFIG_SPL_BUILD)
>  	.probe = stm32mp_bsec_probe,
>  #endif
>  };

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
