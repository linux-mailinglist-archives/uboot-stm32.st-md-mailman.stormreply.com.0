Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C2E3982D3
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Jun 2021 09:19:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B589C57B6F;
	Wed,  2 Jun 2021 07:19:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9549DC32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 07:19:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 152788Sp018941; Wed, 2 Jun 2021 09:18:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=gb2KoSThmB6lDKP3ApDRFIDZ3Tk0Dis75L6mOT2QKYk=;
 b=cXSZltxvrjx4DfvQteobaEIiLI7wqXZ/PDyVta2d50jSi70iHwE0fxihb7gOjeaqqG7y
 zuAnpI9Uyzs0aFcfDI+KYueDxpjcxhH1N3uHIYMl+i8OiPgp3OYeoRCEH+T3UmoPekFc
 AU6vUw8N0fRLDtZS/J+A+0BYAZTX7RQjGDc4gV+efMbt6VunHk57LTFvURxuDRUCWvva
 RupG3Yx/WW2w7DaE2jHA+Lq9pUZa0ULLJ9djW6heFzVeQfV5xOW++TH/5y8y+ZZd8Ye/
 OwAawSeHbzPHUZkDz58VnahMotZwniZDVYjLnHRdXG7jc12FRMV2hdtXGpviUZwu097l Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38x3gvhdeu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 09:18:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A98FB100053;
 Wed,  2 Jun 2021 09:18:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9C66F2128B6;
 Wed,  2 Jun 2021 09:18:58 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 2 Jun
 2021 09:18:58 +0200
To: <u-boot@lists.denx.de>, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <cover.1622220270.git.gszymaszek@short.pl>
 <14a9a4a33f349059fc1d3f2f999f27c545f721f2.1622220270.git.gszymaszek@short.pl>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <53b5b3a8-0f67-9e99-051b-ee2d176d1b1c@foss.st.com>
Date: Wed, 2 Jun 2021 09:18:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <14a9a4a33f349059fc1d3f2f999f27c545f721f2.1622220270.git.gszymaszek@short.pl>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-02_02:2021-06-01,
 2021-06-02 signatures=0
Subject: Re: [Uboot-stm32] [PATCH 3/5] arm: dts: stm32mp157c-odyssey-som:
 set the SDMMC2 VQMMC supply
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

Hi Grzegorz

On 5/28/21 6:54 PM, Grzegorz Szymaszek wrote:
> Set the SDMMC2 VQMMC supply to vdd (buck3). Note that in the
> corresponding Linux kernel device tree, the supply is set to v3v3
> (buck4), which is wrong.

Do you intend to send similar patch to kernel mailing list to fix it ?

> 
> Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>  arch/arm/dts/stm32mp157c-odyssey-som.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/dts/stm32mp157c-odyssey-som.dtsi b/arch/arm/dts/stm32mp157c-odyssey-som.dtsi
> index 5801b7a968..76a364d4ca 100644
> --- a/arch/arm/dts/stm32mp157c-odyssey-som.dtsi
> +++ b/arch/arm/dts/stm32mp157c-odyssey-som.dtsi
> @@ -269,6 +269,7 @@
>  	st,neg-edge;
>  	bus-width = <8>;
>  	vmmc-supply = <&v3v3>;
> +	vqmmc-supply = <&vdd>;
>  	status = "okay";
>  };
>  
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
