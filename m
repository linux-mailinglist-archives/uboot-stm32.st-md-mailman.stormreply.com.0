Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1869230C0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 16:09:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0185C36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 14:09:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 227A3C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 14:09:32 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SE7ik7008740; Tue, 28 Jul 2020 16:09:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=3H6FmMyTUS144Rd96nW3i3IWFj8hgXmO9+Gbi7S321o=;
 b=D7ue0iJli+qlt+m6BY5rRWTKFiY45XAYZ5yGNs4vRUvKUQRBb1PWxRbZ0C342tXHAE8F
 d5IKYhUXxvogmdC8sK6Z6wrQLI+RGClE+U8Hsz40xpuKyAuHO+/YbXxaAjSwst8jm7Em
 VeapdPJhw/DHk2a4nXlBilOcXYoK33iZsekrK6GRbRCgj5EGJtdTkCM3gQGzJDxPAhm9
 G1uKP1tO+s1FNftY5tq39mYELISJPkXXOkNa2N+PDsb841IyyXlgsA0xQvSipcwEOwC9
 eF/IVjlvvVDIKhRghaHX1wXEr5GLj5zJzGZOK22hvAqqeIIjbp2Meod4YUAdPVdLIw+V Cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gagv6jyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 16:09:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 72A3C10002A;
 Tue, 28 Jul 2020 16:09:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67C932C38D1;
 Tue, 28 Jul 2020 16:09:28 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 16:09:28 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 16:09:28 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH v2] Revert "ARM: dts: stm32: Reinstate card
 detect behavior on DHSOM"
Thread-Index: AQHWZOi0qFOfVLAwDUChRY34zg4Yvg==
Date: Tue, 28 Jul 2020 14:09:27 +0000
Message-ID: <abf47444-54cb-a4e8-429d-32651965e1b0@st.com>
References: <20200707164608.20056-1-patrick.delaunay@st.com>
In-Reply-To: <20200707164608.20056-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <11D4F9B0BC7B324BA47F911C58E2969D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_11:2020-07-28,
 2020-07-28 signatures=0
Cc: Marek Vasut <marex@denx.de>, "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2] Revert "ARM: dts: stm32: Reinstate
 card detect behavior on DHSOM"
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


On 7/7/20 6:46 PM, Patrick Delaunay wrote:
> Since commit f13ff88b61c3 ("gpio: stm32: add ops set_dir_flags")
> the gpio flags are supported by stm32 pinctrl driver.
>
> The cd-gpios is correctly handle in U-Boot and the patch on the
> device tree can be removed.
>
> This reverts commit 3c2e2a1a79608c5e046313a8c47586d9a734e2a3.
>
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - correct commit message
>
>  arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> index 69c5af4241..f96de9e7a3 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> @@ -264,9 +264,6 @@
>  
>  &sdmmc1 {
>  	u-boot,dm-spl;
> -	broken-cd;
> -	/delete-property/ cd-gpios;
> -	/delete-property/ disable-wp;
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
