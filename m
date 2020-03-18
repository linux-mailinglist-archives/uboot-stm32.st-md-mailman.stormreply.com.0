Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6778A18981E
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:43:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CE1FC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:43:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11EC6C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 09:43:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I9cRPx016717; Wed, 18 Mar 2020 10:43:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=9xsexZkpGT5r7oYzrC41/YV+5RUlldiE7XgWFVWLhNQ=;
 b=mEaupdOkyUcvcAKcQE/5p7M3abe8q+n7TLJRXE20KySFSRp5C8DNLfWbiM95N/w5nh3o
 nPKHiphCfNx0AjGFgwbD5rY0GAHHEIVhAYi3HHfCXRo48pLMPHH7ARk9MBgnVOtwG2k4
 QW2H/YuZPBnRGnHb0go2oPbK7GKBjjzUGmhiJyliA7QSnZ6Zx496BnUyGhzRvwiHsrzi
 5X1NCIV+ME+Wh3+v6P2TX51CaOsMGw8WHQMjho+N84ZviqjVQ1dkfnHmXHY9k1FeVJWp
 B1zzQ6Ke40tNUgnZicTNuHBPp2mAzA6MDSBhyfwvkoQLz7jh55Dx+KgfbGfHcq2QBkYP Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95ujjnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 10:43:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 05D57100039;
 Wed, 18 Mar 2020 10:43:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE9B821FEA1;
 Wed, 18 Mar 2020 10:43:43 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 18 Mar
 2020 10:43:43 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 10:43:43 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 5/9] ram: stm32mp1: tuning: deactivate derating during
 BIST test
Thread-Index: AQHV86AIYxmcvNxycEGY6qADjJBudahOG2iA
Date: Wed, 18 Mar 2020 09:43:43 +0000
Message-ID: <39b0be3b-8587-e69e-373d-d38bb9328cca@st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
 <20200306111355.5.I2f3d97c071fc1de6dae7e15ee0bbc1df0f16fd9a@changeid>
In-Reply-To: <20200306111355.5.I2f3d97c071fc1de6dae7e15ee0bbc1df0f16fd9a@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <E541F73A03B101458C37D1F2E2043993@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 5/9] ram: stm32mp1: tuning: deactivate
 derating during BIST test
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
> The derating (timing parameter derating using MR4 read value)
> can't be activated during BIST test, as the MR4 read answer will
> be not understood by BIST (BISTGSR.BDONE bit stay at 0,
> BISTWCSR.DXWCNT = 0x206 instead of BISTWCR.BWCNT = 0x200).
>
> This patch only impacts the tuning on LPDDR2/LPDDR3,
> if derateen.derate_enable = 1.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/ram/stm32mp1/stm32mp1_tuning.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/ram/stm32mp1/stm32mp1_tuning.c b/drivers/ram/stm32mp1/stm32mp1_tuning.c
> index cab6cf087a..37d3ec8fef 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_tuning.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_tuning.c
> @@ -1288,11 +1288,16 @@ static enum test_result do_read_dqs_gating(struct stm32mp1_ddrctl *ctl,
>  {
>  	u32 rfshctl3 = readl(&ctl->rfshctl3);
>  	u32 pwrctl = readl(&ctl->pwrctl);
> +	u32 derateen = readl(&ctl->derateen);
>  	enum test_result res;
>  
> +	writel(0x0, &ctl->derateen);
>  	stm32mp1_refresh_disable(ctl);
> +
>  	res = read_dqs_gating(ctl, phy, string);
> +
>  	stm32mp1_refresh_restore(ctl, rfshctl3, pwrctl);
> +	writel(derateen, &ctl->derateen);
>  
>  	return res;
>  }
> @@ -1303,11 +1308,16 @@ static enum test_result do_bit_deskew(struct stm32mp1_ddrctl *ctl,
>  {
>  	u32 rfshctl3 = readl(&ctl->rfshctl3);
>  	u32 pwrctl = readl(&ctl->pwrctl);
> +	u32 derateen = readl(&ctl->derateen);
>  	enum test_result res;
>  
> +	writel(0x0, &ctl->derateen);
>  	stm32mp1_refresh_disable(ctl);
> +
>  	res = bit_deskew(ctl, phy, string);
> +
>  	stm32mp1_refresh_restore(ctl, rfshctl3, pwrctl);
> +	writel(derateen, &ctl->derateen);
>  
>  	return res;
>  }
> @@ -1318,11 +1328,16 @@ static enum test_result do_eye_training(struct stm32mp1_ddrctl *ctl,
>  {
>  	u32 rfshctl3 = readl(&ctl->rfshctl3);
>  	u32 pwrctl = readl(&ctl->pwrctl);
> +	u32 derateen = readl(&ctl->derateen);
>  	enum test_result res;
>  
> +	writel(0x0, &ctl->derateen);
>  	stm32mp1_refresh_disable(ctl);
> +
>  	res = eye_training(ctl, phy, string);
> +
>  	stm32mp1_refresh_restore(ctl, rfshctl3, pwrctl);
> +	writel(derateen, &ctl->derateen);
>  
>  	return res;
>  }

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
