Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C84189856
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:46:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F0C9C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:46:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CFD6C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 09:46:44 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I9fcvW019112; Wed, 18 Mar 2020 10:46:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=wQkVoWN65rgc0QlY87bJ/NxBdXycvrbhzb1aq9J+YWY=;
 b=B/iHwcIXV3EAV0VRuUMHqcUNcxGC3ooUEtVQ4eEPB3T2+cH0xInmXZK2phe3gHUdLpTt
 /qpGc2cecISU8fneKscRGksoh9krzK3BK/6aEFhhKWp1xFnnejSJUjM2j2LkNuYV34Q0
 Sg2JlCyaaWqoHY0N0xZ7c+z5NcgRpfi8YY1ELGoyYVqxLECY+7tKFn6yqy7tuSgMWLGY
 XQhp+UBcT72HSyGnsob8vGxhb7sW8tDD7mClRd8QRhXA9HXbhhK5pqNTwvZIpQ0UL3Kw
 6iTSbyGSnQaJiYGC0odjjx7LIyqyl/m0qtoWwNRTYiTd3Yh8RPxgMoVcU4Uf9o541XXt Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu8etarp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 10:46:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB363100038;
 Wed, 18 Mar 2020 10:46:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C235621FE8F;
 Wed, 18 Mar 2020 10:46:39 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 18 Mar
 2020 10:46:39 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 10:46:39 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 8/9] ram: stm32mp1: reduce delay after BIST reset for
 tuning
Thread-Index: AQHV86AJ7aF+O1aJ5Uu0fItgihs606hOHDiA
Date: Wed, 18 Mar 2020 09:46:39 +0000
Message-ID: <d518b81d-48ae-5952-cb65-57ccef1ed5f3@st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
 <20200306111355.8.I2ed443e2c15db6b007f836254b3753da9b06e76d@changeid>
In-Reply-To: <20200306111355.8.I2ed443e2c15db6b007f836254b3753da9b06e76d@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <B7A5AACF8757D04C8B74C9C2395F29EA@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 8/9] ram: stm32mp1: reduce delay after
 BIST reset for tuning
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


On 3/6/20 11:14 AM, Patrick Delaunay wrote:
> Reduce the delay after BIST delay, from 1ms to 10us
> which is enough accoriding datasheet.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/ram/stm32mp1/stm32mp1_tuning.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/ram/stm32mp1/stm32mp1_tuning.c b/drivers/ram/stm32mp1/stm32mp1_tuning.c
> index 07d57d496c..3013b7b667 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_tuning.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_tuning.c
> @@ -402,7 +402,7 @@ run:
>  		writel(rand(), &phy->bistlsr);
>  
>  	/* some delay to reset BIST */
> -	mdelay(1);
> +	udelay(10);
>  
>  	/*Perform BIST Run*/
>  	clrsetbits_le32(&phy->bistrr,

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
