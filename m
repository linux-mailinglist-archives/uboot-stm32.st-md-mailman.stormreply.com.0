Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4284230B72
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 15:28:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AE71C36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 13:28:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F78EC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 13:28:46 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SDSNPH022515; Tue, 28 Jul 2020 15:28:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=VxL8VkTfHWCivpAYuNm14x+TGRkiRuvYK2OmM4Vj9VA=;
 b=rcM0chGYPRiQUbQw0kFZwSY+/ysmPoDD4AfbRYyFEy2E1XTOs0Oxary6RtXvA1L1btl5
 JoVP5lEjasPKgtZVCf3sMZ7ibddNT68oaOangtjKHXNisEn1BWKfkalOzu1s15Wx/KE3
 17Jav81nW789MzajpDLj1VMPUAFesGDfzYoslZjv5OiejwU49XtHosBgT46gsqfLleDR
 g+VKk1aher1fVISlODcgli82az0yBXxRCm4iwqBFkoGPMSp3MoGN0Ba1xGRcB0yaxQPq
 61K3CZVBwRwY6BjqOAE8nQNTEARQRU3N7wdw51lP3BUZxjq37/rGz2yL0pJD5stpqG99 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga71xf3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 15:28:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E65CF10002A;
 Tue, 28 Jul 2020 15:28:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCA082B8A1E;
 Tue, 28 Jul 2020 15:28:42 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 15:28:42 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 15:28:42 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] phy: usbphyc: use regulator_set_enable_if_allowed for
 disabling vdd supply
Thread-Index: AQHWUV02NvmUFP8nLkGQGTTzgK32qqkdAcMA
Date: Tue, 28 Jul 2020 13:28:42 +0000
Message-ID: <6e94f420-1039-0e87-770e-f04cdbc6dfd7@st.com>
References: <20200703191239.1.I230b778f5bf092459aaadca7d51fecbc808d417d@changeid>
In-Reply-To: <20200703191239.1.I230b778f5bf092459aaadca7d51fecbc808d417d@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <5A3655C77907AB43AE324248A51E0651@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_11:2020-07-28,
 2020-07-28 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] phy: usbphyc: use
 regulator_set_enable_if_allowed for disabling vdd supply
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


On 7/3/20 7:13 PM, Patrick Delaunay wrote:
> Use regulator_set_enable_if_allowed() api instead of regulator_set_enable()
> while disabling vdd supply. This way the driver doesn't see an error
> when disabling an always-on regulator.
>
> This patch is needed since the commit f93fab312615 ("Revert 'power:
> regulator: Return success on attempt to disable an always-on regulator'")
> and use the API introduced by commit cc4a224af226 ("power: regulator:
> Introduce regulator_set_enable_if_allowed api").
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/phy/phy-stm32-usbphyc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
> index 464b0735e8..c6d3048602 100644
> --- a/drivers/phy/phy-stm32-usbphyc.c
> +++ b/drivers/phy/phy-stm32-usbphyc.c
> @@ -263,7 +263,7 @@ static int stm32_usbphyc_phy_power_off(struct phy *phy)
>  		return 0;
>  
>  	if (usbphyc_phy->vdd) {
> -		ret = regulator_set_enable(usbphyc_phy->vdd, false);
> +		ret = regulator_set_enable_if_allowed(usbphyc_phy->vdd, false);
>  		if (ret)
>  			return ret;
>  	}

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
