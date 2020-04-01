Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A89B919A66C
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 09:43:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DCBFC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 07:43:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30EC5C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 07:43:41 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0317go3C027104; Wed, 1 Apr 2020 09:43:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=vyVCKPSzqUut/3JcQD28z1asEmNU2ls2vnrOHye1OFo=;
 b=CJrsPhCAlwWFrSIj6yor38RW+LEZcmiEOICIXTQtNtVbvvrQuyUxQiJe5SyfpkRzZZ/9
 VYF3J3t+tMYVIkINFGgcU9GjzAw22ZCyRsc437whaVGJOUcdDLF4XYQsc/iNSBIIv+eW
 n4GIc18XRU7fEWoa071BWrO3LepP+njMuSYq5iLJJnSYEecNE/Ciqek2cCvi+I1cW9tY
 SzKbNN9JtH/yfYBJhO8jqWObSjBtUGAOCAGywP1Xfsz/zMaP1swl3a6lIz4kEaX292dr
 yxDPd4BJMbIGlEHm7vZSVKYfE8N2YsJuRHOqbxrVskbxjLxepfUbWXUGA8p+hkExwWSA zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y53wp5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 09:43:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8229710002A;
 Wed,  1 Apr 2020 09:43:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6BC9F21BA65;
 Wed,  1 Apr 2020 09:43:36 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Apr
 2020 09:43:36 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 1 Apr 2020 09:43:36 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 06/16] arm: stm32mp: spl: display error in board_init_f
Thread-Index: AQHWB3Yg1BGMsX8iukKDpC4bwDSP5KhjwguA
Date: Wed, 1 Apr 2020 07:43:35 +0000
Message-ID: <c44ae254-8063-783c-8543-24328d40f18a@st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.6.I41a641a07fd12da45b392920fc3407e608926396@changeid>
In-Reply-To: <20200331180330.6.I41a641a07fd12da45b392920fc3407e608926396@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <E121B1540051C64FB2FA489F24642116@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 06/16] arm: stm32mp: spl: display error in
	board_init_f
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
> Update board_init_f and try to display error message
> when console is available.
>
> This patch adds trace to debug a spl boot issue when DEBUG
> and DEBUG_UART is not activated, after uart probe.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/spl.c | 33 ++++++++++++++++-----------------
>  1 file changed, 16 insertions(+), 17 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
> index ca4231cd0d..dfdb5bb7e9 100644
> --- a/arch/arm/mach-stm32mp/spl.c
> +++ b/arch/arm/mach-stm32mp/spl.c
> @@ -79,37 +79,36 @@ void spl_display_print(void)
>  void board_init_f(ulong dummy)
>  {
>  	struct udevice *dev;
> -	int ret;
> +	int ret, clk, reset, pinctrl;
>  
>  	arch_cpu_init();
>  
>  	ret = spl_early_init();
>  	if (ret) {
> -		debug("spl_early_init() failed: %d\n", ret);
> +		debug("%s: spl_early_init() failed: %d\n", __func__, ret);
>  		hang();
>  	}
>  
> -	ret = uclass_get_device(UCLASS_CLK, 0, &dev);
> -	if (ret) {
> -		debug("Clock init failed: %d\n", ret);
> -		return;
> -	}
> +	clk = uclass_get_device(UCLASS_CLK, 0, &dev);
> +	if (clk)
> +		debug("%s: Clock init failed: %d\n", __func__, clk);
>  
> -	ret = uclass_get_device(UCLASS_RESET, 0, &dev);
> -	if (ret) {
> -		debug("Reset init failed: %d\n", ret);
> -		return;
> -	}
> +	reset = uclass_get_device(UCLASS_RESET, 0, &dev);
> +	if (reset)
> +		debug("%s: Reset init failed: %d\n", __func__, reset);
>  
> -	ret = uclass_get_device(UCLASS_PINCTRL, 0, &dev);
> -	if (ret) {
> -		debug("%s: Cannot find pinctrl device\n", __func__);
> -		return;
> -	}
> +	pinctrl = uclass_get_device(UCLASS_PINCTRL, 0, &dev);
> +	if (pinctrl)
> +		debug("%s: Cannot find pinctrl device: %d\n",
> +		      __func__, pinctrl);
>  
>  	/* enable console uart printing */
>  	preloader_console_init();
>  
> +	if (clk || reset || pinctrl)
> +		printf("%s: probe failed clk=%d reset=%d pinctrl=%d\n",
> +		       __func__, clk, reset, pinctrl);
> +
>  	ret = uclass_get_device(UCLASS_RAM, 0, &dev);
>  	if (ret) {
>  		printf("DRAM init failed: %d\n", ret);

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
