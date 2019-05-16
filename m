Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A98200A5
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 May 2019 09:50:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FF62C35E04
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 May 2019 07:50:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FECFC35E03
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2019 07:50:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4G7msYs026100; Thu, 16 May 2019 09:50:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=F6R2niiB0rWFnww22Acowen8pt1MOU8musx0TvAZ8s8=;
 b=eA6FylmWwSJLvbUhsJMlnj8jLoHn9HyrLzmV7Qhq08adHIw9/dzkmSd+yJl2oV4XtJPE
 YOVFAvzACB+OlbriwFYLS5sudTsiQJImd+eZrWxmVU03jgZc//j1V+8oqH6UnI0Bg1de
 TctbamLjPoozy5pK6KKvjARojW7rUh/7ScuG/BMXNiwwQ5QGtymfV3HsDzDh4l141Xu/
 p/C2ZKiWFZCZfnUC4utwN1bf52DWGQ8Nr17A6ap92syiJhyXTm8S2lzTw/h3OhjZGZq0
 zgXnljx31Bsv/oMSi3T8aFzz0quF/XM0KunDq1ohS2+0S5Rrea+M0E6FX+0nC7+8zMQH 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sek5aqt72-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 16 May 2019 09:50:18 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B573B31;
 Thu, 16 May 2019 07:50:16 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 48D50127B;
 Thu, 16 May 2019 07:50:16 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 16 May
 2019 09:50:15 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Thu, 16 May 2019 09:50:15 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Fabien DESSENNE <fabien.dessenne@st.com>, Patrick DELAUNAY
 <patrick.delaunay@st.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Christophe KERELLO <christophe.kerello@st.com>, Heinrich Schuchardt
 <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>, Alexander Graf
 <agraf@suse.de>, Stefan Roese <sr@denx.de>, Mario Six <mario.six@gdsys.cc>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, "Andrew F . Davis"
 <afd@ti.com>, Michal Simek <michal.simek@xilinx.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Ryder Lee <ryder.lee@mediatek.com>, Liviu Dudau
 <Liviu.Dudau@foss.arm.com>, Eugen Hristev <eugen.hristev@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, York Sun <york.sun@nxp.com>,
 "Andreas Dannenberg" <dannenberg@ti.com>,
 Loic PALLARDY <loic.pallardy@st.com>, "Lokesh Vutla" <lokeshvutla@ti.com>
Thread-Topic: [PATCH 4/4] ARM: dts: stm32: Add ipcc mailbox support on stm32mp1
Thread-Index: AQHVCjZViI2UsYO5UkGvSXEtu8ioXqZtQgkA
Date: Thu, 16 May 2019 07:50:15 +0000
Message-ID: <8d03a6bb-2a04-0ea4-a1f9-c6bcbbf7b94c@st.com>
References: <1557825637-25153-1-git-send-email-fabien.dessenne@st.com>
 <1557825637-25153-5-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1557825637-25153-5-git-send-email-fabien.dessenne@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <E39494DE9AE53F49B30A50C7AB8EFCF7@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-16_06:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 4/4] ARM: dts: stm32: Add ipcc mailbox
	support on stm32mp1
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



On 5/14/19 11:20 AM, Fabien Dessenne wrote:
> Add IPCC mailbox support on stm32mp157 eval and disco boards.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  arch/arm/dts/stm32mp157a-dk1.dts |  4 ++++
>  arch/arm/dts/stm32mp157c-ed1.dts |  4 ++++
>  arch/arm/dts/stm32mp157c.dtsi    | 13 +++++++++++++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/arch/arm/dts/stm32mp157a-dk1.dts b/arch/arm/dts/stm32mp157a-dk1.dts
> index e36773d..b8dd4ba 100644
> --- a/arch/arm/dts/stm32mp157a-dk1.dts
> +++ b/arch/arm/dts/stm32mp157a-dk1.dts
> @@ -228,6 +228,10 @@
>  	};
>  };
>  
> +&ipcc {
> +	status = "okay";
> +};
> +
>  &iwdg2 {
>  	timeout-sec = <32>;
>  	status = "okay";
> diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
> index b10208f..ab11c83 100644
> --- a/arch/arm/dts/stm32mp157c-ed1.dts
> +++ b/arch/arm/dts/stm32mp157c-ed1.dts
> @@ -318,6 +318,10 @@
>  	};
>  };
>  
> +&ipcc {
> +	status = "okay";
> +};
> +
>  &iwdg2 {
>  	timeout-sec = <32>;
>  	status = "okay";
> diff --git a/arch/arm/dts/stm32mp157c.dtsi b/arch/arm/dts/stm32mp157c.dtsi
> index 9463433..d90028a 100644
> --- a/arch/arm/dts/stm32mp157c.dtsi
> +++ b/arch/arm/dts/stm32mp157c.dtsi
> @@ -849,6 +849,19 @@
>  			status = "disabled";
>  		};
>  
> +		ipcc: mailbox@4c001000 {
> +			compatible = "st,stm32mp1-ipcc";
> +			#mbox-cells = <1>;
> +			reg = <0x4c001000 0x400>;
> +			st,proc-id = <0>;
> +			interrupts-extended =
> +				<&intc GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +				<&intc GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "rx", "tx";
> +			clocks = <&rcc IPCC>;
> +			status = "disabled";
> +		};
> +
>  		rcc: rcc@50000000 {
>  			compatible = "st,stm32mp1-rcc", "syscon";
>  			reg = <0x50000000 0x1000>;
> 

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
