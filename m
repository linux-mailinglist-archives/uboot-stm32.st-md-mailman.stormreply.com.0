Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E2C19A6A1
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 09:53:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 580E2C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 07:53:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9801BC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 07:53:28 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0317ltL0015963; Wed, 1 Apr 2020 09:53:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=0Hko/Wav1UcfinhyJFitlad4JSrsKg3Ohei9kJE/+ho=;
 b=Pgg7x2NWwamej08r3i1Nj03ZaoKMszIvMsjES/FpgrlaZ/Hog9LlANVQVr+09PHLV7Ry
 fyAoNoDRzqnD2tgQURjfB8txLZciCRGkykjRVja/0PikGTQJ2yFWbDgp3cz2B38uEr13
 FogBJUvUoQiQMAgrrN/dCEfE2v3ZP84d9u0MrUx+2E5t+bbBrT0ZyGPBTc/fky53w8xH
 d4KIW/RnKYzzvaiEYrzPpZE/l1d8tlwNJymsvHlmyw8/I9ZPyQumtHnF8CjShX5HSIh6
 n5ST25U/SKKAa6FFIoLweTPIWsM804gMGTTcDjcJXqJjwpAoVr7g4jf2I7Vqdd9PYhoO Hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301w813k1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 09:53:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DDC1100034;
 Wed,  1 Apr 2020 09:53:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 73C1721BA85;
 Wed,  1 Apr 2020 09:53:25 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Apr
 2020 09:53:15 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 1 Apr 2020 09:53:15 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 09/16] board: stm32mp1: gt9147 IRQ before
 reset on EV1
Thread-Index: AQHWB/qZsxAkhZ/uck+VpSJJwZJS7w==
Date: Wed, 1 Apr 2020 07:53:15 +0000
Message-ID: <8b9203a7-696b-f7e7-da4e-5c006e997d08@st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.9.I5d296f8fd82b60a592b51029e7e420672d0e855b@changeid>
In-Reply-To: <20200331180330.9.I5d296f8fd82b60a592b51029e7e420672d0e855b@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <CD0E214994BDB640BD38B14538243623@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 09/16] board: stm32mp1: gt9147 IRQ before
 reset on EV1
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

On 3/31/20 6:04 PM, Patrick Delaunay wrote:
> Software workaround for I2C issue on EV1 board,
> configure the IRQ line for touchscreen before LCD reset
> to fix the used I2C address.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/stm32mp1/stm32mp1.c | 41 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 6ca47509b3..52881adef7 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -626,6 +626,44 @@ static bool board_is_dk2(void)
>  }
>  #endif
>  
> +static bool board_is_ev1(void)
> +{
> +	if (CONFIG_IS_ENABLED(TARGET_ST_STM32MP15x) &&
> +	    (of_machine_is_compatible("st,stm32mp157a-ev1") ||
> +	     of_machine_is_compatible("st,stm32mp157c-ev1") ||
> +	     of_machine_is_compatible("st,stm32mp157d-ev1") ||
> +	     of_machine_is_compatible("st,stm32mp157f-ev1")))
> +		return true;
> +
> +	return false;
> +}
> +
> +/* touchscreen driver: only used for pincontrol configuration */
> +static const struct udevice_id goodix_ids[] = {
> +	{ .compatible = "goodix,gt9147", },
> +	{ }
> +};
> +
> +U_BOOT_DRIVER(goodix) = {
> +	.name		= "goodix",
> +	.id		= UCLASS_NOP,
> +	.of_match	= goodix_ids,
> +};
> +
> +static int board_ev1_init(void)
> +{
> +	struct udevice *dev;
> +	int ret;
> +
> +	/* configure IRQ line on EV1 for touchscreen before LCD reset */
> +	ret = uclass_get_device_by_driver(UCLASS_NOP, DM_GET_DRIVER(goodix),
> +					  &dev);
> +	if (ret)
> +		debug("goodix init failed: %d\n", ret);
> +
> +	return ret;
> +}
> +
>  /* board dependent setup after realloc */
>  int board_init(void)
>  {
> @@ -643,6 +681,9 @@ int board_init(void)
>  
>  	board_key_check();
>  
> +	if (board_is_ev1())
> +		board_ev1_init();
> +
>  #ifdef CONFIG_DM_REGULATOR
>  	if (board_is_dk2())
>  		dk2_i2c1_fix();

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
