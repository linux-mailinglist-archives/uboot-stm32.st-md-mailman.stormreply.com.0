Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DB12004EC
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 11:23:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7702C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 09:23:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ADD3C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 09:23:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05J9MLec021843; Fri, 19 Jun 2020 11:23:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=alZu5+ie/HKp9TEzOOCRAhDf/BlF8y6iCYB0ESgyq2I=;
 b=uBfpTwoL6KgIFnPQpRHhZRB1alEEMLWdQX4c5DcEkQPLf4PsLtN1j8uI6PCJiq5JO111
 b36t+ygsEOpVegc0ws+Pmc/V8E1LJIPWs29V79ML8fmOubjr7bLWfO5K01h8vu8dJajg
 quQR5vnfpPT8yPVp+GjL0ni0IxvxT1lDgp0gHrkFWxSjFvVkalJ0T9WHrEoiDINbfZGk
 +JnqzicLydYt7lEQWAbN1+r9yptmRFrq+as0bC+1eBoKzIG2DujLkSMwFXjt2IWufZrd
 aAMpi3gjLqQYWC9snL9lQstWQwrdTUu/yLiappmw6FzgXGq36RIjIZ0wQKPydRpQZkop qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31q64aquy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 11:23:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 56CDE10002A;
 Fri, 19 Jun 2020 11:23:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 49D4E2B0F7C;
 Fri, 19 Jun 2020 11:23:31 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Jun
 2020 11:23:31 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 19 Jun 2020 11:23:30 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] ARM: dts: stm32: Reinstate card detect behavior on ST
 boards
Thread-Index: AQHWRhrPVl0S5gfREUSEwn6OsnoyGajfiNoA
Date: Fri, 19 Jun 2020 09:23:30 +0000
Message-ID: <05cf0cf8-0bb7-0659-2f44-2d6ca6b21edc@st.com>
References: <20200619091945.11656-1-patrick.delaunay@st.com>
In-Reply-To: <20200619091945.11656-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <AD7201510A28FE499BE4E90F26AAD451@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_05:2020-06-18,
 2020-06-19 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Reinstate card detect
 behavior on ST boards
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

On 6/19/20 11:19 AM, Patrick Delaunay wrote:
> The cd-gpios with (GPIO_ACTIVE_LOW | GPIO_PULL_UP) gpio is thus far
> unsupported, reinstate the old cd-gpios behavior until this handling
> is fully implemented. This avoid potential issue for SDCard boot:
> the card detect fails with floating gpio.
>
> Hi,
>
> I don't have boot issue on my boards (DK2 and EV1) but this
> patch avoids potential issue with floating gpio as issue see
> by Marek on DHSOM.
>
> To be reverted in v2020.10 when the serie [1] is accepted.
>
> The generic impacts in gpio uclass [2] is already accepted
> for V2020.07 and merged in master branch.
>
> [1] stm32mp1: activate gpio hog support and add new pinctrl ops
> http://patchwork.ozlabs.org/project/uboot/list/?series=181294
>
> [2] dm: add support of new binding in gpio and pincontrol
> http://patchwork.ozlabs.org/project/uboot/list/?series=152777&state=*
>
> Patrick
>
> END
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 2 ++
>  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> index 3fedb6f1e1..e13dade463 100644
> --- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> @@ -171,6 +171,8 @@
>  
>  &sdmmc1 {
>  	u-boot,dm-spl;
> +	broken-cd;
> +	/delete-property/ cd-gpios;
>  };
>  
>  &sdmmc1_b4_pins_a {
> diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> index a07c585415..b16dc28d47 100644
> --- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> @@ -167,6 +167,8 @@
>  
>  &sdmmc1 {
>  	u-boot,dm-spl;
> +	broken-cd;
> +	/delete-property/ cd-gpios;
>  };
>  
>  &sdmmc1_b4_pins_a {

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
